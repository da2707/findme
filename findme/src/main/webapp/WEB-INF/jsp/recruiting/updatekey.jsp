<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>secondWeb_update</title>
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
                <h1 class="text-center">키워드</h1>
                <h1 class="text-center">수정/삭제</h1>
                <div id="keyword" style="margin-top:32px;padding-top:10px;"><a href="${pageContext.request.contextPath}/recruiting/manageKey.do" id="keywordmng" style="margin:8px;font-size:20px;margin-left:27px;">키워드 관리</a>
                    <div id="keyword" style="margin-top:7px;padding-top:10px;"><a href="${pageContext.request.contextPath}/recruiting/insertKey.do" id="keywordmng" style="margin:8px;font-size:19px;margin-top:5px;margin-left:29px">키워드 등록</a></div>
                </div>
            </div>
            <div class="col-md-10" id="content">
                <div><button class="btn btn-default" type="button" style="margin-left:21px;">전체 선택</button><button class="btn btn-default" type="button" data-toggle="modal" data-target="#myModal" type="button" style="margin-left:10px;">수정</button><button class="btn btn-default" type="button" style="margin-left:10px;">삭제</button></div>
                <div
                    class="table-responsive" style="margin-top:24px;">
                    <table class="table">
                        <thead>
                            <tr style="margin-top:-13px;">
                                <th>근무지 / 지역</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><input type="checkbox">&nbsp;서울 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<input type="checkbox">&nbsp;경기</td>
                            </tr>
                            <tr></tr>
                        </tbody>
                    </table>
            </div>
            <div class="table-responsive" style="margin-top:24px;">
                <table class="table">
                    <thead>
                        <tr style="margin-top:-13px;">
                            <th>직종</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                            	<input type="checkbox">&nbsp;기획 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                            	<input type="checkbox">&nbsp;개발 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                            	<input type="checkbox">&nbsp;QA &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                            </td>
                        </tr>
                        <tr></tr>
                    </tbody>
                </table>
            </div>
            <div class="table-responsive" style="margin-top:24px;">
                <table class="table">
                    <thead>
                        <tr style="margin-top:-13px;">
                            <th>학력</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><input type="checkbox">&nbsp;4년제졸 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</td>
                        </tr>
                        <tr></tr>
                    </tbody>
                </table>
            </div>
            <div class="table-responsive" style="margin-top:24px;">
                <table class="table">
                    <thead>
                        <tr style="margin-top:-13px;">
                            <th>경력</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><input type="checkbox">&nbsp;2년 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</td>
                        </tr>
                        <tr></tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="modal fade" id="myModal" role="dialog" tabindex="-1">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h4 class="modal-title">수정할 키워드를 입력하세요</h4>
                </div>
                <div class="modal-body" style="height:236px;">
                    <div class="col-md-12" style="height:195px;">
                        <div style="width:539px;"><input type="text" value="서울" disabled="" id="ip" style="margin-left:60px;margin-top:-68px;"><i class="glyphicon glyphicon-arrow-right" style="font-size:20px;margin-left:23px;"></i><input type="text" disabled="" id="ip" style="margin-left:21px;margin-top:-68px;"></div>
                        <div
                            style="width:539px;"><input type="text" value="경기" disabled="" id="ip" style="margin-left:60px;margin-top:-68px;"><i class="glyphicon glyphicon-arrow-right" style="font-size:20px;margin-left:23px;"></i><input type="text" disabled="" id="ip" style="margin-left:21px;margin-top:-68px;"></div>
                    <div
                        style="width:539px;"><input type="text" value="기획" disabled="" id="ip" style="margin-left:60px;margin-top:-68px;"><i class="glyphicon glyphicon-arrow-right" style="font-size:20px;margin-left:23px;"></i><input type="text" disabled="" id="ip" style="margin-left:21px;margin-top:-68px;"></div>
            </div>
        </div>
        <div class="modal-footer"><button class="btn btn-default" type="button" data-dismiss="modal">Close</button><button class="btn btn-primary" type="button">수정</button></div>
    </div>
    </div>
    </div>
    </div>
</body>

</html>