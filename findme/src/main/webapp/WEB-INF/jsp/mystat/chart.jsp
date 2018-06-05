<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>취업 정보 및 관리는 이제 여기에서. FindMe!</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main/styles.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"
	charset="utf-8"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>	
</head>

<body>
	<div>
		<nav class="navbar navbar-default navigation-clean-button">
			<div class="container">
				<div class="navbar-header">
					<a class="navbar-brand"
						href="${pageContext.request.contextPath}/main.do">FindMe</a>
					<button class="navbar-toggle collapsed" data-toggle="collapse"
						data-target="#navcol-1">
						<span class="sr-only">Toggle navigation</span><span
							class="icon-bar"></span><span class="icon-bar"></span><span
							class="icon-bar"></span>
					</button>
				</div>
				<div class="collapse navbar-collapse" id="navcol-1">
					<ul class="nav navbar-nav">
						<li class="" role="presentation"><a
							href="${pageContext.request.contextPath}/board/list.do">Community</a></li>
						<li class="" role="presentation"><a
							href="${pageContext.request.contextPath}/calendar/calendar.do">MyCalendar</a></li>
						<li class="" role="presentation"><a
							href="${pageContext.request.contextPath}/resume/list.do">MyResume</a></li>
						<li class="" role="presentation"><a
							href="${pageContext.request.contextPath}/mystat/chart.do">MyStat</a></li>
						<li class="" role="presentation"><a
							href="${pageContext.request.contextPath}/studyroom/video.do">StudyRoom</a></li>
						<li class="" role="presentation"><a
							href="${pageContext.request.contextPath}/recruiting/hireInfo.do">Recruiting</a></li>
					</ul>
					<p class="navbar-text navbar-right actions">
						<a data-toggle="modal" href="#login" class="navbar-link login"
							data-target="#login">Log In</a> <a
							href="${pageContext.request.contextPath}/view/user/signup.jsp"
							class="navbar-link signup btn btn-default action-button">Sign
							Up</a>
					</p>
				</div>
			</div>
		</nav>
	</div>
	<div class="container" id="container" style="margin-top: 20px;">
		<div>
			<select onchange="window.open(value,'_self');">
				<optgroup label="월별 Graph">
					<option value="">월별 Graph</option>
					<option value="${pageContext.request.contextPath}/mystat/graph.do">2018
						상반기</option>
					<option value="13">2018 하반기</option>
					<option value="14">2019 상반기</option>
				</optgroup>
			</select>
		</div>
		<div style="line-height: 190px;">
			<div class="col-lg-4 col-md-4" style="text-align: center;">
					<div id="piechart1" style="width: 400px; height: 400px;"></div>
			</div>
			<div class="col-lg-4 col-md-4" style="text-align: center;">
					<div id="piechart2" style="width: 400px; height: 400px;"></div>
			</div>
<!-- 			<div class="col-lg-3 col-md-3"> -->
<!-- 				<i class="glyphicon glyphicon-arrow-right" -->
<!-- 					style="font-size: 50px; margin-left: 23px;"></i><i -->
<!-- 					class="glyphicon glyphicon-arrow-right" -->
<!-- 					style="font-size: 50px; margin-left: 23px;"></i><i -->
<!-- 					class="glyphicon glyphicon-arrow-right" -->
<!-- 					style="font-size: 50px; margin-left: 23px;"></i> -->
<!-- 			</div> -->
			<div class="col-lg-4 col-md-4" style="text-align: center;">
					<div id="piechart3" style="width: 500px; height: 500px;"></div>
			</div>
		</div>
		
	</div>
		
	<div class="container" id="container" style="margin-top: 20px;">
		<div>
			<p id="summary">
				2018년 5월 29일 기준<br>총 10개 기업에 지원, <br>최종 발표 결과 0개,<br>미발표
				10개.<br>
				<br>
				<br>CONTROL WHAT YOU CAN, CONFRONT WHAT YOU CAN'T<br>
				<br>
			</p>
		</div>
		<div>
			<button class="btn btn-default" type="button" id="detail"
				onclick="location.href='${pageContext.request.contextPath}/mystat/detail.do'">지원
				목록 상세보기</button>
		</div>
	</div>
	

<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart1);
      google.charts.setOnLoadCallback(drawChart2);
      google.charts.setOnLoadCallback(drawChart3);

      function drawChart1() {

        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['Work',     11],
          ['Eat',      2],
          ['Commute',  2],
          ['Watch TV', 2],
          ['Sleep',    7]
        ]);

        var options = {
          title: 'My Daily Activities'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart1'));

        chart.draw(data, options);
      }

      function drawChart2() {

        var data = google.visualization.arrayToDataTable([
          ['a', 'Hours per Day'],
          ['b',     11],
          ['c',      2],
          ['d',  2],
          ['e', 2],
          ['f',    7]
        ]);

        var options = {
          title: 'My Daily Activities'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart2'));

        chart.draw(data, options);
      }

      function drawChart3() {

        var data = google.visualization.arrayToDataTable([
          ['a111', 'Hours per Day'],
          ['11b',     11],
          ['11c',      2],
          ['d11',  2],
          ['e111', 2],
          ['f11',    7]
        ]);

        var options = {
          title: 'Final Result'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart3'));

        chart.draw(data, options);
      }
    </script>
</body>

</html>