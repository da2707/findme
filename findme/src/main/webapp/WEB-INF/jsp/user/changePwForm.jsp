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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user/userpage.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>

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
                      <p class="navbar-text navbar-right actions" id="member">
                    ${sessionScope.id}<span id="welcome" style="color:red;"> 님 환영합니다</span>&nbsp;&nbsp;&nbsp;
                    <a href="${pageContext.request.contextPath}/user/logout.do" id="logout"
                    	   class="navbar-link login">Log out</a>
                    	<a href="${pageContext.request.contextPath}/user/changePwForm.do"
                    	   class="navbar-link signup btn btn-default action-button">My Page</a>
                    </p>
            	</div>
    		</div>
    	</nav>
    </div>
    
    <!-- 비번변경 파트 시작 -->
<form name="mForm" class="form-horizontal" method="POST" 
	  action="${pageContext.request.contextPath}/user/changePw.do"
	  onsubmit="return doAction()">
    <div class="container" id="container" style="width: 70%" >
    <div class="container small">
    	<br><br><br><br><br><br><br><br>
	    <h1>비밀번호 변경</h1><br><br><br>
	    <div>
	    	<input type="hidden" id="id" name="id" value="${sessionScope.id}">
	    	<input type="hidden" id="name" name="name" value="${sessionScope.name}">
	    	<input type="hidden" id="email" name="email" value="${sessionScope.email}">
		    <input class="form-control" id="pw" name="pw" type="password" placeholder="Password"><br><br>
		    <input class="form-control" id="pw-check" type="password" placeholder="Re-type Password"><br><br>
			<button id="changePwBtn" class="btn btn-primary btn-block" type="submit">비밀번호 변경</button>
		</div>
    </div>
	</div>
</form>    

<script>

	$("#changePwBtn").click(function doAction() {
		if ($("#pw").val()==''){
			alert("비밀번호를 입력하세요.")
			return false;
		} else if ($("#pw-check").val()==''){
			alert("비밀번호를 다시 입력하세요.")
			return false;
		} else if($("#pw").val()!=$("#pw-check").val()){
			alert("비밀번호를 똑같이 입력해주세요.")
			return false;
		} else {
			alert("비밀번호가 성공적으로 변경되었습니다.")
			return true;	
		}
	});
	
	$("document").ready(function () {
		console.log("${id}, ${name}, ${email}");
	});
</script>

</body>

</html>



















