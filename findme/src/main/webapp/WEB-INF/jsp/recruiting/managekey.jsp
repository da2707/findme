<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script>
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
                <div id="keyword" style="margin-top:32px;padding-top:10px;"><button class="btn btn-default" type="button" data-toggle="modal" data-target="#myModal" style="margin-left:34px;">키워드 등록</button>
                    <div id="keyword" style="margin-top:7px;padding-top:10px;"><a href="${pageContext.request.contextPath}/recruiting/updateKey.do" id="keywordmng" style="margin:8px;font-size:19px;margin-top:5px;">키워드 수정/삭제</a></div>
                </div>
            </div>
            
            <c:forEach items="${recruitingList}" var="recruiting">
            <div class="col-md-10" id="content">
                <div class="table-responsive" style="width:700px;margin-left:24px;margin-top:26px;">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>직종</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>-${recruiting.jobType1} &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;-${recruiting.jobType2}</td>
                            </tr>
                            <tr></tr>
                        </tbody>
                    </table>
                </div>
                <div class="table-responsive" style="width:700px;margin-left:24px;margin-top:26px;">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>근무지/지역</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>-${recruiting.location1} &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;-${recruiting.location2}</td>
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
                                <td>-${recruiting.education}</td>
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
                                <td>-${recruiting.career}</td>
                            </tr>
                            <tr></tr>
                        </tbody>
                    </table>
                </div>
                <div class="table-responsive" style="width:700px;margin-left:24px;margin-top:26px;">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>급여</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>-${recruiting.salary}</td>
                            </tr>
                            <tr></tr>
                        </tbody>
                    </table>
                </div>
                <div class="table-responsive" style="width:700px;margin-left:24px;margin-top:26px;">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>근무형태</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>-${recruiting.position}</td>
                            </tr>
                            <tr></tr>
                        </tbody>
                    </table>
                </div>
            </div>
            </c:forEach>
           </div>
                <div class="modal fade" id="myModal" role="dialog" tabindex="-1">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                        <h4 class="modal-title">등록할 키워드를 입력하세요</h4>
                    </div>
                    <div class="modal-body" style="height:170px;">
                        <div class="col-md-12" style="height:195px;">
                            <div style="width:539px;margin-top:60px;"><select style="margin-left:104px;"><optgroup label="This is a group"><option value="12" selected="">근무지 / 지역</option><option value="13">학력</option><option value="14">직종</option></optgroup></select>
                                <input
                                    type="text" style="margin-left:85px;"></div>
                        </div>
                    </div>
                    <div class="modal-footer"><button class="btn btn-default" type="button" data-dismiss="modal">Close</button><button class="btn btn-primary" type="button">등록</button></div>
                </div>
            </div>
        </div>
    </div>
    </div>
</body>

</html>