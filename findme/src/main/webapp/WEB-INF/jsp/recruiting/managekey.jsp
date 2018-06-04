<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>secondWeb_keywordM</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/styles.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/mainpage.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/Navigation-with-Button.css">
    <script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>
    <div>
        <nav class="navbar navbar-default navigation-clean-button">
            <div class="container">
                <div class="navbar-header"><a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">FindMe</a><button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button></div>
                <div
                    class="collapse navbar-collapse" id="navcol-1">
                    <ul class="nav navbar-nav">
                        <li class="" role="presentation"><a href="${pageContext.request.contextPath}/board/list.do">Community</a></li>
                        <li class="" role="presentation"><a href="${pageContext.request.contextPath}/calendar/calendar.do">MyCalendar</a></li>
                        <li class="" role="presentation"><a href="${pageContext.request.contextPath}/resume/list.do">MyResume</a></li>
                        <li class="" role="presentation"><a href="${pageContext.request.contextPath}/mystat/chart.do">MyStat</a></li>
                        <li class="" role="presentation"><a href="${pageContext.request.contextPath}/studyroom/video.do">StudyRoom</a></li>
                        <li class="" role="presentation"><a href="${pageContext.request.contextPath}/recruiting/hireInfo.do">Recruiting</a></li>
                    </ul>
                    <p class="navbar-text navbar-right actions"><a class="navbar-link login" href="#">Log In</a> <a class="btn btn-default action-button" role="button" href="#">Sign Up</a></p>
            </div>
    </div>
    </nav>
    </div>
    <div class="container" id="container">
        <div>
            <div class="col-md-2">
                <h1 class="text-center" style="width:190px;margin-left:-16px;">키워드 관리</h1>
                <div id="keyword" style="margin-top:32px;padding-top:10px;"><a href="${pageContext.request.contextPath}/recruiting/insertKey.do" id="keywordmng" style="margin:8px;font-size:20px;margin-left:27px;">키워드 등록</a>
                    <div id="keyword" style="margin-top:7px;padding-top:10px;"><a href="${pageContext.request.contextPath}/recruiting/updateKey.do" id="keywordmng" style="margin:8px;font-size:19px;margin-top:5px;">키워드 수정/삭제</a></div>
                </div>
            </div>
            <div class="col-md-10" id="content">
                <div class="table-responsive" style="width:700px;margin-left:24px;margin-top:26px;">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>근무지 / 지역</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>-서울 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;-경기</td>
                            </tr>
                            <tr></tr>
                        </tbody>
                    </table>
                </div>
                <div class="table-responsive" style="width:700px;margin-left:24px;margin-top:26px;">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>직종</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>-기획 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;-개발 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;-QA</td>
                            </tr>
                            <tr></tr>
                        </tbody>
                    </table>
                </div>
                <div class="table-responsive" style="width:700px;margin-left:24px;margin-top:26px;">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>학력</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>-4년제졸</td>
                            </tr>
                            <tr></tr>
                        </tbody>
                    </table>
                </div>
                <div class="table-responsive" style="width:700px;margin-left:24px;margin-top:26px;">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>경력</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>-2년</td>
                            </tr>
                            <tr></tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>

</html>