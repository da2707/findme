<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/mainpage.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user/userpage.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>

     <div>
        <nav class="navbar navbar-default navigation-clean-button">
            <div class="container">
                <div class="navbar-header">
                	<a class="navbar-brand" href="${pageContext.request.contextPath}/main.do">FindMe</a>
                	<button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navcol-1">
               			<span class="sr-only">Toggle navigation</span>
               			<span class="icon-bar"></span>
               			<span class="icon-bar"></span>
               			<span class="icon-bar"></span>
                	</button>
                </div>
                <div class="collapse navbar-collapse" id="navcol-1">
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
                    	<a href="${pageContext.request.contextPath}/user/changePwForm.do"
                    	   class="navbar-link signup btn btn-default action-button">My Page</a>
                    </p>
            	</div>
            </div>
    	</nav>
    </div>
    
<div class="container" id="container">
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<h1>취업 정보 나눔 게시판</h1>
			<hr />
				번호 :  ${board.no}<br>
				글쓴이 : <c:out value="${board.id}" /><br>
				제목 : <c:out value="${board.title}" /><br>
				내용 : <c:out value="${board.content}" /><br>
				등록일 : <fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd HH:mm:ss" /><br><br>
				조회수 : ${board.viewCnt}<br>
				추천수 : ${board.likeCnt}
				 <hr>
				 <c:if test="${sessionScope.id eq board.id}">
					 <a href='updateForm.do?no=${board.no}' id="mod">수정</a>
					 <a href='delete.do?no=${board.no}' id="del">삭제</a>
				 </c:if>
				 <a href='list.do'>목록</a>
				 <p>
		</div>
	</div>
	
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			 <%--  댓글 파트입니다.  --%>	
			 <form action="commentUpdate.do" method="post">
				<input type="hidden" name="no" value="${board.no}" />
				<input type="hidden" name="cmtNo" value="${cmtNo}" />
				
				<%-- 댓글 목록 --%>
				<div id="commentList"></div>
			 </form>
				
			 <%-- 댓글 관련 파트 시작 --%>		
			 <form id="rForm" class="form-inline">
				<div id="comment">
				    <div class="form-group">
					    <input type="text" name="id" readonly value="${sessionScope.id}"class="form-control" width="30%">
				    </div>
				    <div class="form-group">
					    <input type="text" name="content" class="form-control input-wp1" placeholder="내용을 입력하세요">
				    </div>
				  	<button class="btn btn-primary">등록</button>
				</div>
			 </form>
		</div>
	</div>
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
			    <a href="#" class="forgot">Forgot your email or password?</a><br><br>
		  	</div>
	    </div>
	  </div>
	</div>
   	</form>
		
<script>

$("#del").click(function () {
	if(confirm("정말로 삭제하시겠습니까?")){
		return true;
	}
	return false;
});

var sessionId = '${id}';
console.log(sessionId);

$(document).ready(function() {
	hideNav();
	guestAndMember();
	comment();
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

function comment() {
	if(sessionId == ''){
		$("#rForm").hide();
	}
}

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

	
	function commentDelete(cmtNo) {
		$.ajax({
			url: "<c:url value='/board/commentDelete.json'/>",
			data: {
				no: "${board.no}",
				cmtNo: cmtNo
			},
			dataType: "json",
			success: makeCommentList
		});
	}
	
	function commentUpdateForm(cmtNo, id) {
		
		$("#commentList tr[id^=row]").show();
		$("#commentList tr[id^=modRow]").remove();
		
		var modId = $("#row" + cmtNo + " > td:eq(0)").text();
		var modContent = $("#row" + cmtNo + " > td:eq(1)").text();
		
		var html = '';
		html += '<tr id="modRow' + cmtNo + '">';
		html += '	<td>' + modId + '</td>';
		html += '	<td>';
		html += '		<div class="form-group">';
		html += '			<input type="text" name="content" value="' + modContent + '" class="form-control input-wp2" placeholder="내용을 입력하세요">';
		html += '		</div>';
		html += '	</td>';
		html += '	<td colspan="2">'; 
		html += '		<a href="javascript:commentUpdate(' + cmtNo + ');" id="cmtOk" class="btn btn-success btn-sm" role="button">확인</a>';
		html += '		<a href="javascript:commentCancel(' + cmtNo + ');" id="cmtCancel" class="btn btn-warning btn-sm" role="button">취소</a>';
		html += '	</td>';
		html += '</tr>';
		$("#row" + cmtNo).after(html);	
		$("#row" + cmtNo).hide();
	}
	
	function commentUpdate(cmtNo) {
		$.ajax({
			url: "<c:url value='/board/commentUpdate.json'/>",
			type: "POST",
			data: {
				no: "${board.no}", 
				content: $("#modRow" + cmtNo + " input[name=content]").val(), 
				cmtNo: cmtNo
			},
			dataType: "json",
			success: function (result) {
				makeCommentList(result);
			} 
		});
	}
	
	function commentCancel(cmtNo) {
		$("#row" + cmtNo).show();
		$("#modRow" + cmtNo).remove();
	}
	
	// 댓글 등록 처리
	$("#rForm").submit(function (e) {
		e.preventDefault();
		
		$.ajax({
			url: "<c:url value='/board/commentRegist.json'/>",
			type: "POST",
			data: {
				no: "${board.no}", 
				content: $("#rForm input[name='content']").val(), 
				id: $("#rForm input[name='id']").val()
			},
			dataType: "json"
		})
		.done(function (result) {
			if (!'${board.id}') {
				$("#rForm input[name='id']").val("");
			}
			$("#rForm input[name='content']").val("");
			
			makeCommentList(result);
		});
	});	
	
	// 댓글 목록 만드는 공통 함수
	function makeCommentList(result) {
		var html = "";
		html += '<table class="table table-bordered">';
		html += '	<colgroup>'; 
		html += '		<col width="10%">'; 
		html += '		<col width="*">'; 
		html += '		<col width="17%">'; 
		html += '		<col width="13%">'; 
		html += '	</colgroup>'; 
		  
		for (var i = 0; i < result.length; i++) {
			var comment = result[i];
			html += '<tr id="row' + comment.cmtNo + '">';
			html += '	<td>' + comment.id + '</td>';
			html += '	<td>' + comment.content + '</td>';
			var date = new Date(comment.regDate);
			var id = comment.id;
			var time = date.getFullYear() + "-" 
			         + (date.getMonth() + 1) + "-" 
			         + date.getDate() + " "
			         + date.getHours() + ":"
			         + date.getMinutes() + ":"
			         + date.getSeconds();
			html += '	<td>' + time + '</td>';  
			html += '	<td>';
			if(sessionId==id){
				html += '		<a href="javascript:commentUpdateForm(' + comment.cmtNo + ')" id="cmtMod" class="btn btn-success btn-sm" role="button">수정</a>';    
				html += '		<a href="javascript:commentDelete(' + comment.cmtNo + ')" id="cmtDel"class="btn btn-danger btn-sm" role="button">삭제</a>';    
			}
			html += '	</td>';    
			html += '</tr>';
		}
		if (result.length == 0) {
			html += '<tr><td colspan="4">댓글이 존재하지 않습니다.</td></tr>';
		}
		html += "</title>";
		$("#commentList").html(html);
	}
	
	// 댓글 목록 조회
	function commentList() {
		$.ajax({
			url: "<c:url value='/board/commentList.json'/>",
			data: {no: "${board.no}"},
			dataType: "json", 
			success: makeCommentList
		});
	}
	
	// 상세 페이지 로딩시 댓글 목록 조회 ajax 호출
	commentList();	

	</script>	
		
</body>
</html>