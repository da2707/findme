<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>취업 정보 및 관리는 이제 여기에서. FindMe!</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/styles.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/fullcalendar/moment.min.js"></script>
</head>

<body>
    <div>
        <nav class="navbar navbar-default navigation-clean-button">
            <div class="container">
                <div class="navbar-header"><a class="navbar-brand" href="${pageContext.request.contextPath}/main.do">FindMe</a><button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button></div>
                <div
                    class="collapse navbar-collapse" id="navcol-1">
                    <ul class="nav navbar-nav">
                        <li class="" role="presentation"><a href="${pageContext.request.contextPath}/board/list.do">Community</a></li>
                        <li class="" role="presentation"><a href="${pageContext.request.contextPath}/schedule/schedule.do">MyCalendar</a></li>
                        <li class="" role="presentation"><a href="${pageContext.request.contextPath}/resume/list.do">MyResume</a></li>
                        <li class="" role="presentation"><a href="${pageContext.request.contextPath}/mystat/chart.do">MyStat</a></li>
                        <li class="" role="presentation"><a href="${pageContext.request.contextPath}/studyroom/video.do">StudyRoom</a></li>
                        <li class="" role="presentation"><a href="${pageContext.request.contextPath}/recruiting/hireInfo.do">Recruiting</a></li>
                    </ul>
                    <p class="navbar-text navbar-right actions" id="guest">
	                    <a data-toggle="modal" href="#login" class="navbar-link login" data-target="#login">Log In</a>
	                    <a href="${pageContext.request.contextPath}/user/signup.do" 
	                       class="navbar-link signup btn btn-default action-button">Sign Up</a>
                    </p>
                    <p class="navbar-text navbar-right actions" id="member">
                    	${id}<span id="welcome" style="color:red;"> 님 환영합니다</span>&nbsp;&nbsp;&nbsp;
                    	<a href="${pageContext.request.contextPath}/user/logout.do" id="logout"
                    	   class="navbar-link login">Log out</a>
                    	<a href="${pageContext.request.contextPath}/user/mypage.do"
                    	   class="navbar-link signup btn btn-default action-button">My Page</a>
                    </p>
            </div>
    </div>
    </nav>
    </div>
    <div class="container" id="container">
            <div>
        	<select onchange="window.open(value,'_self');">
	        	<optgroup label="월별 Graph">
    	    	<option value="${pageContext.request.contextPath}/mystat/graph.do" selected="">2018 상반기</option>
        		<option value="${pageContext.request.contextPath}/mystat/noneGraph.do">2018 하반기</option>
        		<option value="${pageContext.request.contextPath}/mystat/noneGraph.do">2019 상반기</option>
        		</optgroup>
        	</select>
        </div>
        <div id="chart_div" style="width: 1100px; height: 700px;"></div>
        <div>
			<button class="btn btn-default" type="button" id="detail" onclick="location.href='${pageContext.request.contextPath}/mystat/detail.do'">지원 목록 상세보기</button>
		</div>
<!--         <div> -->
<!-- 			<button class="btn btn-default" type="button" id="updateChart">차트 새로고침하기</button> -->
<!-- 		</div> -->
    </div>
    
 <script>
	var sessionId = '${id}';
	console.log(sessionId);
	
	$(document).ready(function() {
		guestAndMember();
	});
	
	function hideNav() {
		if(sessionId == ''){
			$('.mynavbar').hide();
		} else {
			$('.mynavbar').show();
		}
	};
	
	function guestAndMember() {
		if(sessionId == ''){
			$("#member").hide();
		} else {
			$("#guest").hide();
		}
	};
	
    google.charts.load('current', {'packages':['corechart']});
//     google.charts.setOnLoadCallback(drawVisualization);
    google.charts.setOnLoadCallback(chart11);

    function chart11() {
    	$.ajax({
    		url : `${pageContext.request.contextPath}/mystat/chartList.json`,
    		success: drawVisualization
    	});
    }
    function drawVisualization(chartResult) {
    	console.log(chartResult);
    	var header = ['Month', '서류 합격 개수', '1차 면접 합격 개수', '2차 면접 합격 개수', '3차 면접 합격 개수', '4차 면접 합격 개수', '5차 면접 합격 개수', '최종 합격 개수'];
        var chartData = [];
        for (var i=0; i<chartResult.length; i++) {
        	var temp = [];
        	var rawDate = chartResult[i].regDate;
			var regDate = moment(rawDate).format("YYYY/MM");
// 			if(regDate.startsWith("1970")) {
// 			}
        	temp.push(regDate);
        	temp.push(chartResult[i].appCnt);
        	temp.push(chartResult[i].firstCnt);
        	temp.push(chartResult[i].secondCnt);
        	temp.push(chartResult[i].thirdCnt);
        	temp.push(chartResult[i].fourthCnt);
        	temp.push(chartResult[i].fifthCnt);
        	temp.push(chartResult[i].result);
        	chartData.push(temp);
        	};
    		var arr=[];
    		arr.push(header);
    		 for (var i = 0; i < chartData.length; i++) {
    		      arr.push(chartData[i]);
    		  }
    		var data = new google.visualization.arrayToDataTable(arr);
    		
//     	var data = google.visualization.arrayToDataTable([
//     		header
//     		,['2018/06', 2, 3, 4, 5, 6, 7, 8]
//     	]);
      // Some raw data (not necessarily accurate)
//       var data = google.visualization.arrayToDataTable([
//        ['Month', 'Bolivia', 'Ecuador', 'Madagascar', 'Papua New Guinea', 'Rwanda', 'Average'],
//        ['2004/05',  165,      938,         522,             998,           450,      614.6],
//        ['2005/06',  135,      1120,        599,             1268,          288,      682],
//        ['2006/07',  157,      1167,        587,             807,           397,      623],
//        ['2007/08',  139,      1110,        615,             968,           215,      609.4],
//        ['2008/09',  136,      691,         629,             1026,          366,      569.6]
//     ]);

	  var options = {
	    title : '월별 상반기 취업 준비 합격률',
	    vAxis: {title: '개수'},
	    hAxis: {title: '월'},
	    seriesType: 'bars',
	    series: {6: {type: 'line'}}
	  };
	
	  var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
	  chart.draw(data, options);
	}
    
//     $("#updateChart").click(function () {
    	
//     });
    
 </script>
 
    
</body>

</html>