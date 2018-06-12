<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>취업 정보 및 관리는 이제 여기에서. FindMe!</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/styles.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board/board.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
                        <li class="mynavbar" role="presentation"><a href="${pageContext.request.contextPath}/schedule/schedule.do">MyCalendar</a></li>
                        <li class="mynavbar" role="presentation"><a href="${pageContext.request.contextPath}/resume/list.do">MyResume</a></li>
                        <li class="mynavbar" role="presentation"><a href="${pageContext.request.contextPath}/mystat/chart.do">MyStat</a></li>
                        <li class="mynavbar" role="presentation"><a href="${pageContext.request.contextPath}/studyroom/video.do">StudyRoom</a></li>
                        <li class="mynavbar" role="presentation"><a href="${pageContext.request.contextPath}/recruiting/hireInfo.do">Recruiting</a></li>
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
<h1>취업 정보 나눔 게시판</h1><br><br>
<form action='${pageContext.request.contextPath}/board/update.do' method='post'>
	   <input type='hidden' name='no' value='${board.no}' />
	    제목 : <input type='text' name='title' value='${board.title}' /><br>
	    글쓴이 : <input type='text' name='writer' readonly value='${board.id}' /><br>
	    내용 : <br>
	   <textarea name='content' rows='5' cols='70'>${board.content}</textarea><br>
	   <button type='submit'>수정</button>
	 </form>
	 <a href='list'>목록</a>
</div>

<!-- Login -->
   	<form name="mForm">
	<div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">Log in</h4>
	      </div>
	      <div class="modal-body">
		    <input class="form-control" id="id" name="id" type="text" placeholder="ID"><br>
		    <input class="form-control" id="pw" name="pw" type="password" placeholder="Password"><br>
		    <button class="btn btn-primary btn-block" id="loginBtn" type="button">Log In</button>
		  </div>
		  	<div class="naverimg">
			    <a href="#" class="forgot">Forgot your email or password?</a><br>
				<a id="naverIdLogin_loginButton" href="#" role="button">
					<img id="naverimg" src="https://static.nid.naver.com/oauth/big_g.PNG" width=200>
				</a><br>
		  	</div>
	    </div>
	  </div>
	</div>
   	</form>

</body>

<script>

var sessionId = '${id}';

$(document).ready(function() {
	hideNav();
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

$("#loginBtn").click(function () {
	var id = $(this).siblings("input[name='id']").val();
	var pw = $(this).siblings("input[name='pw']").val();
	
	if(id=='') {
 		alert(sessionId);
 		
 		return false;
 	}  	
 	if(pw=='') {
 		alert("비밀번호를 입력하세요");
 		return false;
 	}
	
 	$.ajax({
 		url: `${pageContext.request.contextPath}/user/loginPost.json`,
 		data: {id : id, pw: pw},
 		type: "POST",
 		success: function(result){
 			if (result.startsWith("/")){
 				location.href = `${pageContext.request.contextPath}` + result;
 				return;
 			}
 			alert(result);
 		}
 		
 	});
});
</script>
</html>



