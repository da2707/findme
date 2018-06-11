<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>secondWeb_hireInfo</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/styles.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/mainpage.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/Navigation-with-Button.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!-- 각자 folder 위치에 맞게 수정하세요 -->
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
                <h1 class="text-center" style="width:190px;margin-left:-16px;">채용 정보</h1>
                <div id="keyword" style="margin-top:32px;padding-top:10px;">
                	<a href="${pageContext.request.contextPath}/recruiting/manageKey.do" id="keywordmng" style="margin:8px;font-size:20px;margin-left:27px;">키워드 관리</a>
                    <div id="keyword" style="margin-top:7px;padding-top:10px;"></div>
                </div>
            </div>
            <div class="col-md-10" id="content">
                <div class="table-responsive" style="width:957px;margin-left:-18px;margin-top:56px;">
                    <table class="table">
                        <thead>
                            <tr id="tabletitle">
                                <th style="width:90px;">매칭률</th>
                                <th style="width:90px;">수정일</th>
                                <th style="width:200px;">회사명</th>
                                <th>채용정보</th>
                                <th style="width:90px;">마감일</th>
                            </tr>
                        </thead>
                        <tbody>
                           
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="modal fade" id="myModal" role="dialog" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                    	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                        <h4 class="modal-title">요약보기</h4>
                    </div>
                    <div class="modal-body" style="padding: 0px">
                        <div class="col-md-12" style="height:440px;">
                            <div style="height:40px;">
                                <p style="width:345px;">채용정보 : &nbsp;(주)씨퍼스트코리아</p>
                                <p style="width:345px;">모집직종 : &nbsp;경영분석.컨설턴트</p>
                                <p style="width:345px;">지역 : &nbsp;강원 > 원주시</p>
                                <p style="width:345px;">학력 : &nbsp;학력무관</p>
                                <p style="width:345px;">경력 : &nbsp;경력무관</p>
                                <p style="width:345px;">급여조건 : &nbsp;면접후 결정</p>
                                <p style="width:345px;">모집인원 : &nbsp;3명</p>
                                <p style="width:345px;">접수기간 : &nbsp;2018-05-29부터 2018-07-28까지</p>
                                <p style="width:345px;">마감형식 : &nbsp;접수마감일</p>
                                <p style="width:345px;">근무형태 : &nbsp;정규직, 계약직, 프리랜서</p>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer"><button class="btn btn-default" type="button" data-dismiss="modal">Close</button><button class="btn btn-primary" type="button">채용상세 내용보기</button><button class="btn btn-primary" type="button">기업소개 보기</button></div>
                </div>
            </div>
        </div>
    </div>

<script>
var sessionId = '${sessionScope.id}';

	$(document).ready(function(){
		$.ajax({
			url: "makeHireInfo.json",
			data: {id:sessionId}
		}).done(function(result){
			console.log(result);
			makeHireList(result);
		});
	});

	function makeHireList(result){
		var html="";
		for(var i=0; i<result.length; i++){
			html += '<tr style="padding-top:0px;">';
			html += '<td style="padding-top:35px;">'+result[i].matchs+'%</td>';
			html += '<td style="padding-top:35px;">'+result[i].moditimes+'</td>';
			html += '<td style="padding-top:35px;">'+result[i].companies+'</td>';
			html += '<td><br><a href="">'+result[i].positions+'</a>&nbsp;<a data-toggle="modal" data-target="#myModal"></a>';
			html += '   &gt; <br><br></td>';
			html += '<td style="padding-top:35px;">'+result[i].expitimes+'</td>';
			html += '</tr>';
		}
		$("table > tbody:last").append(html);
		
		$(window).scroll(function () {
			var sTop = $(window).scrollTop();
			var min = $(document).height() - $(window).height();
			
			console.log(sTop, min);
			
    		if ($(window).scrollTop() > $(document).height() - $(window).height() - 0.21) {
    			$.ajax({
    				url: "makeHireInfo.json",
    				data: {id:sessionId}
    			}).done(function(data){
    				console.log(data);
    				remakeHireList(data);
    			});
    		}
		});
	}
	
	function remakeHireList(data) {
		var html="";
		for(var i=0; i<data.length; i++){
			html += '<tr style="padding-top:0px;">';
			html += '<td style="padding-top:35px;">'+data[i].matchs+'%</td>';
			html += '<td style="padding-top:35px;">'+data[i].moditimes+'</td>';
			html += '<td style="padding-top:35px;">'+data[i].companies+'</td>';
			html += '<td><br><a href="">'+data[i].positions+'</a>&nbsp;<a data-toggle="modal" data-target="#myModal"></a>';
			html += '   &gt; <br><br></td>';
			html += '<td style="padding-top:35px;">'+data[i].expitimes+'</td>';
			html += '</tr>';
		}
		$("table > tbody:last").append(html);
	}

</script>

</body>

</html>