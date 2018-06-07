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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/resources/js/video/video.js"></script>
<!-- <script src="https://apis.google.com/js/client.js?onload=init"></script> -->
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
							class="navbar-link signup btn btn-default action-button">Sign Up</a>
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
					<div class="row">
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
							<div class="row">
								<div class="col-md-6 col-md-offset-3">
									<form action="#">
										<p>
											<input type="text" id="search" placeholder="Type something..." autocomplete="off" class="form-control" />
										</p>
										<p>
											<input type="submit" value="Search" id="searchBtn" class="form-control btn btn-primary w100">
										</p>
									</form>
									<div id="results"></div>
								</div>
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
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
<!-- 												<span aria-hidden="true">&times;</span> -->
											</button>
											<h4 class="modal-title" id="myModalLabel">Youtube Shelf</h4>
										</div>
										<div class="modal-body">
											<form action="" method="post" id="vidForm">
<!-- 													<input type='hidden' name='id' value='id2' /> -->
													<input type='hidden' name='id' value='${sessionScope.id}' />
													Youtube Title : <input type="text" name="title" size="70" /> <br> 
													<br> 
													Youtube URL : <textarea name='url' rows='5' cols='70'></textarea><br>
													<br>
											</form>
										</div>
										<div class="modal-footer">
											<button type="button" id="closeModal" class="btn btn-default" data-dismiss="modal">Close</button>
											<input type="submit" value="Save changes" id="save" class="btn btn-primary">
										</div>
									</div>
								</div>
							</div>
<script>

	function makeVideoList(result) {
		var html = '';
		html = '<br>';
		html += '<strong>등록된 리스트는 ' + result.length + '개입니다.</strong>';
		html += '<table class="tg">';
		for (var i = 0; i<result.length; i++) {
		html += '	<tr>';
		html += '		<th class="tg-3mv2" style="font-size:15px;">' + result[i].no + '</th>';
		html += '		<th class="tg-qvqz" colspan="2" style="font-size:15px;">' + result[i].title + '</th>';
		html += '		<th id="videoLink" style="background:white; width:70px;font-size:15px;"><a href="'+result[i].url+'"> 링크 </a></th> <br>';
		html += '	</tr>';
		}
		html += '</table>';
		$("#videoList").html(html);
		
	}
	
	function videoList() {
		$.ajax({
			url: `${pageContext.request.contextPath}/studyroom/vList.json`,
			success: makeVideoList
		});
	}	
	videoList();
	
	$("#save").click(function () {
			$.ajax({
				url: `${pageContext.request.contextPath}/studyroom/vInsert.json`,
				type: "post",
				data: $("#vidForm").serialize(),
				dataType: "json",
				success: function (result) {
					console.dir(result);
					$("#closeModal").trigger("click");
					makeVideoList(result);
				}
			});
	});

</script>
</body>

</html>