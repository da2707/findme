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
                <div class="tab-pane active" role="tabpanel" id="tab-1">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-4">
                                <h1 class="text-center" id="playlist">My PlayList</h1>
                                <div><img src="${pageContext.request.contextPath}/resources/images/playlist.png" width="300px"></div>
									<div class="btn-group" role="group" id="statusbtn" style="margin-top:100px;">
										<button class="btn btn-default" type="button">등록</button>
									</div>
                            </div>
                            <div class="col-md-8">
                                <div>
                                    <h1 class="text-center">Youtube Search</h1>
                                    <form class="search-form">
                                        <div class="input-group">
                                            <div class="input-group-addon"><span><i class="glyphicon glyphicon-search"></i></span></div><input class="form-control" type="text" placeholder="I am looking for..">
                                            <div class="input-group-btn"><button class="btn btn-default" type="button">Search </button></div>
                                        </div>
                                    </form>
                                </div>
                                <div><img src="${pageContext.request.contextPath}/resources/images/vid.png" width="600px"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</body>

</html>