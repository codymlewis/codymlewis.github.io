{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

  outputs = { self, nixpkgs }:
    let
      supportedSystems = [ "x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin" ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
      nixpkgsFor = forAllSystems(system: import nixpkgs { inherit system; });
    in
    {
      packages = forAllSystems(system:
        let
          pkgs = nixpkgsFor.${system};
          tex = (pkgs.texlive.combine {
            inherit (pkgs.texlive) scheme-basic
                titlesec geometry url hyperref etoolbox fontawesome nopageno parskip ieeetran;
          });
        in
        {
          default = pkgs.stdenvNoCC.mkDerivation {
            name = "codymlewis-resume-build";
            src = self;
            buildInputs = [ tex ];
            buildPhase = ''
                cd resume
                pdflatex resume.tex
                bibtex resume
                pdflatex resume.tex
                pdflatex resume.tex
            '';
            installPhase = ''
                mkdir -p $out
                mv resume.pdf $out/
            '';
          };
        }
      );

    };
}
