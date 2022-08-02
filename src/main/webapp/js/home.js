$(document).ready(function() {
    var today = new Date();
    $("#today-day").text(today.getDate());

    var dayofweek_kor = new Array('일', '월', '화', '수', '목', '금', '토');
    var today_kor_month = today.getMonth() + 1;
    var today_kor_date = today.getDate();
    var today_kor_day = dayofweek_kor[today.getDay()];

    $("#today-full-date").text(today_kor_month + "월 " + today_kor_date + "일 " + today_kor_day + "요일");

    $.ajax({
        url: "http://pc-24.local:5000/getnews",
        type: "GET",
        dataType: "json",
        success: function(data) {
            let title = data["title"];
            let subtitle = data["subtitle"];
            let image = data["image"];
            let date = data["date"];
            // let contentHTML = data["contentHTML"];
            $("#headline_title").text(title);
            $("#headline_subtitle").text(subtitle);
            $("#headline_image").css("background-image", "url(" + image + ")");

            $("#headline_card").on("click", function() {
                window.location.href = "./news.jsp";
            });
        }
    });
});