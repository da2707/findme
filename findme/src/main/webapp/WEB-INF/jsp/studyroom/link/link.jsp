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
                        <li class="" role="presentation"><a href="${pageContext.request.contextPath}/calendar/calendar.do">MyCalendar</a></li>
                        <li class="" role="presentation"><a href="${pageContext.request.contextPath}/resume/list.do">MyResume</a></li>
                        <li class="" role="presentation"><a href="${pageContext.request.contextPath}/mystat/chart.do">MyStat</a></li>
                        <li class="" role="presentation"><a href="${pageContext.request.contextPath}/studyroom/video.do">StudyRoom</a></li>
                        <li class="" role="presentation"><a href="${pageContext.request.contextPath}/recruiting/recruit/recuit.do">Recruiting</a></li>
                    </ul>
                    <p class="navbar-text navbar-right actions">
	                    <a data-toggle="modal" href="#login" class="navbar-link login" data-target="#login">Log In</a>
	                    <a href="${pageContext.request.contextPath}/view/user/signup.jsp" 
	                       class="navbar-link signup btn btn-default action-button">Sign Up</a>
                    </p>
            </div>
    </div>
    </nav>
    </div>
		<div id="container" class="container">
			<ul class="nav nav-tabs">
                <li class="active"  onclick="location.href='${pageContext.request.contextPath}/studyroom/video.do'"><a href="#tab-1" role="tab" data-toggle="tab">video</a></li>
                <li class="" onclick="location.href='${pageContext.request.contextPath}/studyroom/link.do'"><a href="#tab-2" role="tab" data-toggle="tab">link</a></li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane active" role="tabpanel" id="tab-2">
				<div class="container">
				<div class="row">
					<div class="col-md-4">
						<h1 id="status">Usefuuuuull Link</h1>
					</div>
					<div class="col-md-8"></div>
					<div class="col-md-12">
						<select
							style="width: 150px; margin: 20px; margin-right: 0px; margin-left: 25px; margin-top: 20px;">
							<optgroup label="Category Sort">
								<option value="12" selected="">Programming</option>
								<option value="13">Languages</option>
								<option value="14">etc.</option>
							</optgroup>
						</select>
						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th style="width: 50px;">no</th>
										<th style="width: 135px;">title</th>
										<th style="width: 300px;">link</th>
										<th style="width: 200px;">category</th>
										<th style="width: 130px;">memo</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>네이버개발자센터</td>
										<td>https://developers.naver.com/</td>
										<td>Programming</td>
										<td>API 공부</td>
										<td id="statustd" style="width: 100px;">
											<div class="btn-group" role="group" id="statusbtn">
												<button class="btn btn-default" type="button">수정</button>
												<button class="btn btn-default" type="button">삭제</button>
											</div>
										</td>
									</tr>
									<tr>
										<td>2</td>
										<td>Spring</td>
										<td>https://spring.io/</td>
										<td>Programming</td>
										<td>스프링</td>
										<td id="statustd">
											<div class="btn-group" role="group" id="statusbtn">
												<button class="btn btn-default" type="button">수정</button>
												<button class="btn btn-default" type="button">삭제</button>
											</div>
										</td>
									</tr>
									<tr>
										<td>3</td>
										<td>Bootstrap Studio<br></td>
										<td>https://bootstrapstudio.io/</td>
										<td>Programming</td>
										<td>부트스트랩 스튜디오</td>
										<td id="statustd">
											<div class="btn-group" role="group" id="statusbtn">
												<button class="btn btn-default" type="button">수정</button>
												<button class="btn btn-default" type="button">삭제</button>
											</div>
										</td>
									</tr>
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td id="statustd">
											<div class="btn-group" role="group" id="statusbtn">
												<button class="btn btn-default" type="button">링크등록</button>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				</div>
				</div>
			</div>
		</div>
</body>
</html>