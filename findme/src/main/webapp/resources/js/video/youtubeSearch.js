function tplawesome(e, t) {
	res = e;
	for (var n = 0; n < t.length; n++) {
		res = res.replace(/\{\{(.*?)\}\}/g, function(e, r) {
			return t[n][r]
		})
	}
	return res
}

$(function() {
    $("#youtubeForm").on("submit", function(e) {
       e.preventDefault();
       // prepare the request
       var request = gapi.client.youtube.search.list({
            part: "snippet",
            type: "video",
//            q: encodeURIComponent(encodeURIComponent($("#search").val().replace(/%20/g, "+"))),
            q: $("#search").val().replace(/%20/g, "+"),
            maxResults: 15,
            order: "viewCount",
            publishedAfter: "2014-01-01T00:00:00Z"
       }); 
       // execute the request
       request.execute(function(response) {
    	  console.log(response);
          var results = response.result;
          $("#results").html("");
          $.each(results.items, function(index, item) {
        	console.log(item.snippet.title);
        	console.log(item.id.videoId);
        	var html = '';
        	if (index == 0) {
        		html += '<div class="item active">';
        	} else {
        		html += '<div class="item">';
        	}
        	html += '<iframe class="video w100" width="750" height="400"';
        	html += 'src="//www.youtube.com/embed/'+ item.id.videoId + '"';
        	html += ' frameborder="0" allowfullscreen></iframe>';
        	html += '</div>';
        	$("#results").append(html);
//            $.get("item.html", function(data) {
////            	$("#results").append(data);
//            	$("#results").append(tplawesome(data, [{"title":item.snippet.title, "videoid":item.id.videoId}]));
//            });
          });
//          resetVideoHeight();
       });
    });
    
//    $(window).on("resize", resetVideoHeight);
});

function resetVideoHeight() {
    $(".video").css("height", $("#results").width() * 9.5/16);
}

function init() {
    gapi.client.setApiKey("Key");
    gapi.client.load("youtube", "v3", function() {
    });
};
