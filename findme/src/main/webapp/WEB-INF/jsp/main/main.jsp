<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>취업 정보 및 관리는 이제 여기에서. FindMe!</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/styles.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/mainpage.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
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
                        <li class="mynavbar" role="presentation"><a href="${pageContext.request.contextPath}/schedule/schedule.do" >MyCalendar</a></li>
                        <li class="mynavbar" role="presentation"><a href="${pageContext.request.contextPath}/mystat/chart.do" >MyStat</a></li>
                        <li class="mynavbar" role="presentation"><a href="${pageContext.request.contextPath}/studyroom/video.do" >StudyRoom</a></li>
                        <li class="mynavbar" role="presentation"><a href="${pageContext.request.contextPath}/recruiting/hireInfo.do" >Recruiting</a></li>
                    </ul>
					<form class="navbar-form navbar-left" role="search">
						<div class="form-group">
							<input type="text" id="search" class="form-control" placeholder="동영상 강의 검색">
						</div>
						<button type="submit" value="Search" class="btn btn-default">Submit</button>
					</form>
                    
                    <p class="navbar-text navbar-right actions" id="guest">
	                    <a data-toggle="modal" href="#login" class="navbar-link login" data-target="#login">Log In</a>
	                    <a href="${pageContext.request.contextPath}/user/signupForm.do" 
	                       class="navbar-link signup btn btn-default action-button">Sign Up</a>
                    </p>
                    <p class="navbar-text navbar-right actions" id="member">
                    ${sessionScope.id}<span id="welcome" style="color:red;"> 님 환영합니다</span>&nbsp;&nbsp;&nbsp;
                    <a href="${pageContext.request.contextPath}/user/logout.do" id="logout"
                    	   class="navbar-link login">Log out</a>
                    	<a href="#"
                    	   class="navbar-link signup btn btn-default action-button">My Page</a>
                    </p>
                    
            </div>
    </div>
    </nav>
    </div>
    <div class="container" id="container">
        <div class="row" id="mCarousel">
            <div class="col-md-5">
                <div class="carousel slide" data-ride="carousel" id="carousel-1" data-interval="false">
                    <div class="carousel-inner" role="listbox" id="results">
                        <div class="item active"><img class="slide" src="${pageContext.request.contextPath}/resources/images/leg1.jpg" alt="Slide Image"></div>
                        <div class="item"><img class="slide" src="${pageContext.request.contextPath}/resources/images/leg2.jpg" alt="Slide Image"></div>
                        <div class="item"><img class="slide" src="${pageContext.request.contextPath}/resources/images/leg3.jpg" alt="Slide Image"></div>
                    </div>
                    <div><a class="left carousel-control" href="#carousel-1" role="button" data-slide="prev" style="width:5px;"><i class="glyphicon glyphicon-chevron-left"></i><span class="sr-only">Previous</span></a><a class="right carousel-control" href="#carousel-1" role="button"
                            data-slide="next" style="width:5px;"><i class="glyphicon glyphicon-chevron-right"></i><span class="sr-only">Next</span></a></div>
                    <ol class="carousel-indicators">
                        <li data-target="#carousel-1" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-1" data-slide-to="1"></li>
                        <li data-target="#carousel-1" data-slide-to="2"></li>
                    </ol>
                </div>
            </div>
            <div class="col-md-5">
				<div id="blogSearchList">
                    <div id="blogTitle"><span class="btitle">&nbsp;&nbsp;■ 취업 관련 블로그 정보 - </span><span class="btitle" id="newsFlash"></span></div>
                    <div id="blogContent"></div>
                </div>
            </div>
            <div class="col-md-2"> 
            	<div id="list_realtime_ranking">
	            	<div class="tit"><span>실시간 인기 공채 속보</span></div>
	            	<ol class="list"></ol>
            	</div>
            </div>
        </div>
        <div class="row" id="boardList">
            <div class="col-md-6" id="shareList">
                <div id="shareListTitle">
                    <div id="leftTitle"><span>취업 정보 나눔 게시판</span></div>
                    <div id="leftLink"><span><a role="button" href="${pageContext.request.contextPath}/board/list.do">전체 보기</a></span></div>
                </div>
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr></tr>
                        </thead>
                        <tbody>
                        <c:forEach var="board" items="${list}" begin="1" end="5">
                            <tr>
                                <td><a href="board/detail.do?no=${board.no}">${board.title}</a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col-md-6" id="recruitList">
                <div id="recruitListTitle">
                    <div id="rightTitle"><span>최근 채용 정보</span></div>
                    <div id="rightLink"><span><a role="button">전체 보기</a></span></div>
                </div>
                <div class="table-responsive">
                    <table class="table" id="hirelist">
                        <thead>
                            <tr></tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                </div>
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

	var sessionId = '${id}';
	console.log(sessionId);
	
	$(document).ready(function() {
		hideNav();
		guestAndMember();
		
		realTimeRanking();
		callApi();
	});
	
	// 네비게이션 바 로그인 여부에 따른 노출 처리
	function hideNav() {
		if(sessionId == ''){
			$('.mynavbar').hide();
		} else {
			$('.mynavbar').show();
		}
	};
	
	// 로그인 시 로그 아웃 및 내 정보 영역 노출 처리
	function guestAndMember() {
		if(sessionId == ''){
			$("#member").hide();
		} else {
			$("#guest").hide();
		}
	};
	
	// 로그인 버튼 클릭 시 처리
	$("#loginBtn").click(function () {
		var id = $(this).siblings("input[name='id']").val();
		var pw = $(this).siblings("input[name='pw']").val();
		
		if(id=='') {
	 		alert("아이디를 입력하세요");
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
	
	
	// 실시간 공채 속보 노출 처리
	function realTimeRanking() {
		$.ajax({
			url: "loadRanking.json"
		}).done(function(result) {
			$(".list").html(result);
			// 실시간 공채 속보 로딩 후 바로 네이버 검색 API 호출 처리
			loadBlogSearch();
		});
	}
	
	// 실시간 공채 속보 1위 기준 네이버 블로그 검색 처리
	function loadBlogSearch() {
		var query = $(".n1").children("a").text();
		console.log(query);
		$.ajax({
			url: "loadBlogSearch.json",
			data: {query : query}
		}).done(function (result) {
			console.log(result);
			$("#newsFlash").text(query);
			makeBlogList(result);
		});
	}

	// 블로그 검색 결과 테이블 생성 
	function makeBlogList(result) {
		var html = '';
		html += '<table class="table table-hover">';
		for (var i = 0; i < result.length; i++ ){
		html += '	<tr>';
		html += '		<td>';
		html += '			<a href="'+ result[i].link +'" target="_blank">' + result[i].title + '</a>';
		html += '		</td>';
		html += '	</tr>';
		}
		html += '</table>';
		$("#blogContent").html(html);
	}
	
	function callApi(){
		$.ajax({
			url: `${pageContext.request.contextPath}/recruiting/makeHireInfo.json`,
		}).done(function(result){
			console.log(result[0].apiUrl1);
			console.log(result[0].apiTitle);
			makeHireInfo(result);
		});
	}
	
	
	function makeHireInfo(result){
		var html = "";
		for(var i=0; i<5; i++){
		    html+='<tr>';
		    html+='<td><a href="'+result[i].apiUrl1+'" target="_blank">'+result[i].apiTitle+'</a></td>';
		    html+='</tr>';			
		}

    $("#hirelist > tbody:last").append(html);
	}
	
	$("#rightLink").click(function(){
		console.log(typeof(sessionId));
		if(sessionId == ''){
			alert("로그인 후 이용하세요");
			return;
		}
		else{
			
			location.href=`${pageContext.request.contextPath}/recruiting/hireInfo.do`;
			return;
		}
	});
	
</script>
<script src="${pageContext.request.contextPath}/resources/js/youtube.js"></script>
<script src="https://apis.google.com/js/client.js?onload=init"></script>
</body>
</html>