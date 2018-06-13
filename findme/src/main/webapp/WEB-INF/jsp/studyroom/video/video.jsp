<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Awesome videos!" />

<title>취업 정보 및 관리는 이제 여기에서. FindMe!</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/video/video.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/styles.min.css">
<script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/resources/js/video/youtubeSearch.js"></script>
<script src="https://apis.google.com/js/client.js?onload=init"></script>
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
							href="${pageContext.request.contextPath}/schedule/schedule.do">MyCalendar</a></li>
						<li class="" role="presentation"><a
							href="${pageContext.request.contextPath}/resume/list.do">MyResume</a></li>
						<li class="" role="presentation"><a
							href="${pageContext.request.contextPath}/mystat/chart.do">MyStat</a></li>
						<li class="" role="presentation"><a
							href="${pageContext.request.contextPath}/studyroom/video.do">StudyRoom</a></li>
						<li class="" role="presentation"><a
							href="${pageContext.request.contextPath}/recruiting/hireInfo.do">Recruiting</a></li>
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
	<div id="container" class="container">
		<ul class="nav nav-tabs">
			<li class="active"
				onclick="location.href='${pageContext.request.contextPath}/studyroom/video.do'"><a
				href="#tab-1" role="tab" data-toggle="tab">video</a></li>
			<li class=""
				onclick="location.href='${pageContext.request.contextPath}/studyroom/link.do'"><a
				href="#tab-2" role="tab" data-toggle="tab">link</a></li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane active" role="tabpanel" id="tab-1">
				<div class="container">
						<div class="col-md-4"> 
							<h1 class="text-center" id="playlist">My PlayList</h1>
							<div id="videoList">
							</div>
							<div class="btn-group" role="group" id="statusbtn" style="margin-top: 100px;">
								<!-- Button trigger modal -->
								<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">등록</button>
							</div>
						</div>

						<div class="col-md-8">
							<header>
								<h1 class="w100 text-center">YouTube Search</h1>
							</header>
							<form id="youtubeForm" style="text-align:center;">
								<p>
									<input type="text" id="search"
										placeholder="Type something..." autocomplete="off"
										 style="text-align:center; width:400px;height:30px;"/>
								</p>
								<p>
									<input type="submit" value="Search"
										class="form-control btn btn-primary w100">
								</p>
							</form>
<!-- 							<div id="results"></div> -->
							
							<div class="row" id="mCarousel" style="width:750px;margin:10px;">
								<div class="carousel slide" data-ride="carousel" id="carousel-1" data-interval="false" style="width:750px; margin:10px;">
									<div class="carousel-inner" role="listbox" id="results" style="width:730px; margin:auto;">
									</div>
									<div>
										<a class="left carousel-control" href="#carousel-1"
											role="button" data-slide="prev" style="width: 5px;"><i
											class="glyphicon glyphicon-chevron-left"></i><span
											class="sr-only">Previous</span></a><a
											class="right carousel-control" href="#carousel-1"
											role="button" data-slide="next" style="width: 5px;"><i
											class="glyphicon glyphicon-chevron-right"></i><span
											class="sr-only">Next</span></a>
									</div>
<!-- 									<div style="margin:10px;"> -->
<!-- 									<ol class="carousel-indicators"> -->
<!-- 										<li data-target="#carousel-1" data-slide-to="0" class="active"></li> -->
<!-- 										<li data-target="#carousel-1" data-slide-to="1"></li> -->
<!-- 										<li data-target="#carousel-1" data-slide-to="2"></li> -->
<!-- 									</ol> -->
<!-- 									</div> -->
								</div>
							</div>
						</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
					<h4 class="modal-title" id="myModalLabel">Youtube Shelf</h4>
				</div>
				<div class="modal-body">
					<form id="vidForm">
							<input type='hidden' name='id' value='${sessionScope.id}' />
							Youtube Title : <input type="text" name="title" size="70" /> <br> 
							<br> 
							Youtube URL : <textarea name='url' rows='5' cols='70'></textarea><br>
							<br>
					</form>
				</div>
				<div id="modalFooter" class="modal-footer">
					<button type="button" id="closeModal" class="btn btn-default" data-dismiss="modal">Close</button>
					<input type="submit" value="Save changes" id="save" class="btn btn-primary">
				</div>
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
	
	function videoList() {
		$.ajax({
			url: `${pageContext.request.contextPath}/studyroom/vList.json`,
			success: makeVideoList
		});
	}	
	videoList();
	
	function makeVideoList(result) {
		console.log(result);
		var html = '';
		html += '<br>';
		html += '<strong>등록된 리스트는 ' + result.length + '개입니다.</strong>';
		html += '<table class="tg">';
		for (var i = 0; i<result.length; i++) {
		html += '	<tr>';
		html += '		<th class="tg-qvqz" colspan="2" style="font-size:15px;"><a href="'+result[i].url+'" target="_blank">' +  result[i].title +  '</a></th>';
		html += '		<th class="tg-3mv2" style="font-size:10px;color:black;"><button id="update" type="button" data-toggle="modal" data-target="#myModal" onclick="updateForm(' + result[i].no + ')">수정</button></th>';
		html += '		<th class="tg-3mv2" style="font-size:10px;color:black;"><button id="delete" type="button" onclick="deleteVideo(' + result[i].no + ')">삭제</button></th>';
		html += '	</tr>';
		}
		html += '</table>';
		$("#videoList").html(html);
	}
	
	$("#save").click(function () {
		var serial = $("#vidForm").serialize();
		serial = decodeURIComponent((serial + '').replace(/\+/g, '%20'));
			$.ajax({
				url: `${pageContext.request.contextPath}/studyroom/vInsert.json`,
				type: "POST",
				data: serial,
				dataType: "json",
				success: function (result) {
					$("#closeModal").trigger("click");
					makeVideoList(result);
				}
			});
	});
	
	
	function updateForm(no) {
		
		$.ajax({
			url: `${pageContext.request.contextPath}/studyroom/vUpdateForm.json`,
			data: {id : sessionId, no : no},
			dataType: "json",
			success: function(result) {
				makeUpdate(result);
			}
		});
	}
	
	function makeUpdate(result) {
		
		var html ='';
		html += '<input type="hidden" name="id" value="' + result[0].id + '" />';
		html += '<input type="hidden" name="no" value="' + result[0].no + '" />';
		html += 'Youtube Title : <input type="text" name="title" size="70" value="' + result[0].title + '"/> <br>';
		html += '<br>';
		html += 'Youtube URL : <textarea name="url" rows="5" cols="70">' + result[0].url + '</textarea><br>';
		html += '<br>';
		
		var htmlpart = '';
		htmlpart += '<div id="modalFooter" class="modal-footer">';
		htmlpart += '	<button type="button" id="closeModal" class="btn btn-default" data-dismiss="modal">Close</button>';
		htmlpart += '	<input type="submit" value="Save changes" id="updateVideo" class="btn btn-primary">';
		htmlpart += '</div>';
		
		$("#vidForm").html(html);
		$("#modalFooter").html(htmlpart);
		
		$("#updateVideo").click(function () { 
				console.dir("1 : " + $("#vidForm").serialize());

				var serial = $("#vidForm").serialize();
				serial = decodeURIComponent((serial + '').replace(/\+/g, '%20'));
					$.ajax({
						url: `${pageContext.request.contextPath}/studyroom/vUpdate.json`,
						type: "POST",
						data: serial,
						dataType: "json",
						success: function (result) {
							$("#closeModal").trigger("click");
							makeVideoList(result);
						}
					});
		});
	}
	
	function deleteVideo(no) {
		$.ajax({
			url : `${pageContext.request.contextPath}/studyroom/vDelete.json`,
			data : {
				id : sessionId,
				no : no
			},
			dataType : "json",
			success : function(result) {
				makeVideoList(result);
			}
		});
	};
</script>
</body>

</html>