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
                        <li class="" role="presentation"><a href="${pageContext.request.contextPath}/recruiting/recruit/recuit.do">Recruiting</a></li>
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
    <div class="container">
        <div class="col-md-9">
            <h1 id="status">Application Status</h1>
        </div>
    </div>
    <div id="container">
        <div class="table-responsive container" id="container">
            <table class="table">
                <thead>
                    <tr>
                        <th>지원날짜</th>
                        <th>채용공고번호</th>
                        <th>Company</th>
                        <th>지원현황</th>
                        <th>최종발표</th>
                    </tr>
                </thead>
                <tbody id="detailResult">
                </tbody>
            </table>
	        <div>
				<button class="btn btn-default" type="button" id="detail"
					onclick="location.href='${pageContext.request.contextPath}/mystat/chart.do'">차트로 돌아가기</button>
			</div>
        </div>
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
	
	function detailList() {
		$.ajax({
			url: `${pageContext.request.contextPath}/mystat/detailList.json`,
			success: makeDetailList
		});
	}
	
	detailList();
	
	function makeDetailList(data) {

	console.dir(data.length);
		var html = '';
		for (var i = 0; i < data.length; i++) {
			html += '<tr>';
			var rawDate = data[i].regDate;
			var regDate = moment(rawDate).format("YYYY-MM-DD");
			if (regDate.startsWith("1970")) {
				regDate = "미지원";
			}
			
			html += '	<td>' + regDate + '</td>';
			html += '	<td>' + data[i].recruitNo + '</td>';
			html += '	<td>' + data[i].name + '</td>';
			var code = data[i].codeNo;
			console.log(code);
			var codeMsg = '';
			switch (code) {
			case "2000": codeMsg = "서류 접수 완료"; break;
			case "2001": codeMsg = "1차 면접"; break;
			case "2002": codeMsg = "2차 면접"; break;
			case "2003": codeMsg = "3차 면접"; break;
			case "2004": codeMsg = "4차 면접"; break;
			case "2005": codeMsg = "5차 면접"; break;
			}
			html += '	<td>' + codeMsg + '</td>';
			var result = data[i].result;
			var resultMsg = '';
			switch (result) {
			case 'P':
				resultMsg = "진행 중";
				break;
			case 'Y':
				resultMsg = "최종 합격";
				break;
			case 'N':
				resultMsg = "최종 불합격";
				break;
			}
			html += '	<td>' + resultMsg + '</td>';
			html += '</tr>';
		}
		$("#detailResult").html(html);
					}
				</script>
</body>

</html>