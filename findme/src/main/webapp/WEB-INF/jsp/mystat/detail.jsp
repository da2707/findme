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
                        <th>no</th>
                        <th>Company</th>
                        <th>지원날짜</th>
                        <th>지원현황</th>
                        <th>최종발표</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
<!--                         <td><input type="text" name="no" value=""/></td> 수정 삭제 시--> 
                        <td>회사1</td>
                        <td>2018-05-23</td>
                        <td>서류제출완료</td>
                        <td>미발표</td>
                        <td id="statustd" style="width:150px;">
                            <div class="btn-group" role="group" id="statusbtn"><button class="btn btn-default" type="button">수정</button><button class="btn btn-default" type="button">삭제</button></div>
                        </td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>회사2<br></td>
                        <td>2018-05-23<br></td>
                        <td>1차면접완료</td>
                        <td>미발표</td>
                        <td id="statustd">
                            <div class="btn-group" role="group" id="statusbtn"><button class="btn btn-default" type="button">수정</button><button class="btn btn-default" type="button">삭제</button></div>
                        </td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>회사3<br></td>
                        <td>2018-05-23<br></td>
                        <td>2차면접완료</td>
                        <td>발표</td>
                        <td id="statustd">
                            <div class="btn-group" role="group" id="statusbtn"><button class="btn btn-default" type="button">수정</button><button class="btn btn-default" type="button">삭제</button></div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</body>

</html>