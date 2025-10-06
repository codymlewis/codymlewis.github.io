let TextWriter = {
	splitTitle: "Cody M. Lewis".split(''),
	titleText: "",
	iteration: 0,
	previousIntervalId: null,

	animate: function () {
		this.previousIntervalId = setInterval(
			() => {
				this.titleText += this.splitTitle[this.iteration];
				document.getElementById("title").innerText = this.titleText + "|";
				this.iteration++;

				if (this.iteration >= this.splitTitle.length) {
		    			document.getElementById("title").innerText = this.titleText;
		    			clearInterval(this.previousIntervalId);
				}
	    		},
			100
		)
	},
}


TextWriter.animate();
