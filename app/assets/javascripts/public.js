$(document).ready(function() {
    var backgrounds = ["medium2-doge-hannibal.jpg", "dog_bone_wide.jpg", "water_sports_medium.jpg"];

    function nextBackground() {

        var rand = Math.floor(Math.random() * backgrounds.length);
        $(".public-content").fadeOut(300, function () {
            $(".public-content").css("background", "url(asset-path("+backgrounds[rand]+" ))");
            $(".public-content").fadeIn(300, function () {
                setTimeout(nextBackground, 3000)
            });
        });
    }
    nextBackground();
});
