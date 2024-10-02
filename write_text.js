const splitTitle = "Cody M. Lewis".split('');
var titleText = "";
var i = 0;

var intervalId = setInterval(
    () => {
        titleText += splitTitle[i];
        document.getElementById("video-overlay").innerText = titleText + "|";
        i++;

        if (i >= splitTitle.length) {
            document.getElementById("video-overlay").innerText = titleText;
            clearInterval(intervalId);
        }
    },
    100
)
