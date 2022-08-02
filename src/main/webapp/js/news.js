$(document).ready(function () {
    // ajax get request
    $.ajax({
        url: "http://pc-24.local:5000/getnews",
        type: "GET",
        dataType: "json",
        success: function (data) {
            let title = data["title"];
            let subtitle = data["subtitle"];
            let image = data["image"];
            let contentHTML = data["contentHTML"];
            $("#ajax-news-headline").empty();
            $("#ajax-news-headline").append(`<h1>${title}</h1>`);
            // $("#ajax-news-headline").append(`<h2>${subtitle}</h2>`);
            $("#ajax-news-headline").append($("<div></div>").html(contentHTML));
        }
    });


    $.ajax({
        url: "https://api.rss2json.com/v1/api.json?rss_url=https%3A%2F%2Fwww.boannews.com%2Fmedia%2Fnews_rss.xml",
        type: "GET",
        dataType: "json",
        success: function (data) {
            newsdata = data["items"];
            for (let i = 0; i < newsdata.length; i++) {
                let news = newsdata[i];
                let news_title = news["title"];
                let news_link = news["link"];
                let news_pubDate = news["pubDate"];
                // add 9 hours and change style to YYYY-MM-DD
                let news_pubDate_utc9 = news_pubDate.substring(0, 16) + " +0900";
                news_pubDate = news_pubDate_utc9.substring(0, 10);
                // let news_description = news["description"];
                // let news_thumbnail = news["thumbnail"];
                let news_author = news["author"].substr(1, 3) + " 기자";

                let news_tr = $("<tr>");
                // append td tag with an a tag
                news_tr.append($("<td>").append($("<a>").attr({ "href": news_link, "target": "_blank" }).text(news_title)));
                news_tr.append($("<td>").text(news_pubDate));
                news_tr.append($("<td>").addClass("writer").text(news_author));
                $("#news-table > tbody").append(news_tr);
            }
        }
    });
});