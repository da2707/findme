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
<!-- 최상단 이용을 위한 a 태그 -->
<a role="button" href="#" class="btn btn-primary top">맨위로 가기</a>
    <div>
        <nav class="navbar navbar-default navigation-clean-button">
            <div class="container">
                <div class="navbar-header"><a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">FindMe</a><button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button></div>
                <div
                    class="collapse navbar-collapse" id="navcol-1">
                    <ul class="nav navbar-nav">
                        <li class="" role="presentation"><a href="${pageContext.request.contextPath}/board/list.do">Community</a></li>
                        <li class="" role="presentation"><a href="${pageContext.request.contextPath}/schedule/schedule.do">MyCalendar</a></li>
                        <li class="" role="presentation"><a href="${pageContext.request.contextPath}/mystat/chart.do">MyStat</a></li>
                        <li class="" role="presentation"><a href="${pageContext.request.contextPath}/studyroom/video.do">StudyRoom</a></li>
                        <li class="" role="presentation"><a href="${pageContext.request.contextPath}/recruiting/hireInfo.do">Recruiting</a></li>
                    </ul>
                    <p class="navbar-text navbar-right actions" id="member">
                    ${sessionScope.id}<span id="welcome" style="color:red;"> 님 환영합니다</span>&nbsp;&nbsp;&nbsp;
                    <a href="${pageContext.request.contextPath}/user/logout.do" id="logout"
                    	   class="navbar-link login">Log out</a>
                    	<a href="${pageContext.request.contextPath}/user/mypage.do"
                    	   class="navbar-link signup btn btn-default action-button">My Page</a>
                    </p>
                    
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
                    <div class="modal-header" style="margin-bottom:15px">
                    	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                        <h4 class="modal-title">요약보기</h4>
                    </div>
                    <div class="modal-body" style="height:440px;">


                    </div>
                    <div class="modal-footer" style="height:70px">

					</div>
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
		var color="";
		for(var i=0; i<result.length; i++){
			if(result[i].matchs>=80) color="background-image: linear-gradient(to right, #43e97b 0%, #38f9d7 100%);";
			else if(result[i].matchs<80 && result[i].matchs>=60) color="background-image: linear-gradient(to top, #00c6fb 0%, #005bea 100%);";
			else if(result[i].matchs<60 && result[i].matchs>=40) color="background-image: linear-gradient(to right, #4facfe 0%, #00f2fe 100%);";
			else if(result[i].matchs<40 && result[i].matchs>=20) color="background-image: linear-gradient(to top, #a8edea 0%, #fed6e3 100%);";
			else if(result[i].matchs<20 && result[i].matchs>=0) color="background-image: linear-gradient(to right, #6a11cb 0%, #2575fc 100%);";
			html += '<tr style="padding-top:0px;">';
			html += '<td style="padding-top:35px; '+color+';">'+result[i].matchs+'%</td>';
			html += '<td style="padding-top:35px;">'+result[i].moditimes+'</td>';
			html += '<td style="padding-top:35px;">'+result[i].companies+'</td>';
			html += '<td><br><a id="hireclick" data-toggle="modal" data-target="#myModal">'+result[i].positions+'</a>';
			html += '   &gt; <br><br></td>';
			html += '<td style="padding-top:35px;">'+result[i].expitimes+'</td>';
			html += '<td style="display:none;">';
			html += '<span>'+result[i].moditimes+'</span>';
			html += '<span>'+result[i].expitimes+'</span>'
			html += '<span>'+result[i].apiJob1+'</span>'
			html += '<span>'+result[i].apiLoc+'</span>'
			html += '<span>'+result[i].apiPos+'</span>'
			html += '<span>'+result[i].apiExpLev+'</span>'
			html += '<span>'+result[i].apiEduLev+'</span>'
			html += '<span>'+result[i].apiUrl1+'</span>'
			html += '<span>'+result[i].apiUrl2+'</span>'
			html += '</td>';
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
    		
    		if ($(this).scrollTop() > 200) {
    		    $('.top').fadeIn();
    		} else {
    			$('.top').fadeOut();
    		}
    		
		});
		
		$("table").on("click", "a#hireclick", function(){
// 			$(".modal_body").html('');
// 			console.log($(this));
// 			console.log($(this).parent());
// 			console.log($(this).parent().parent());
			var tr = $(this).parent().parent().children();
			console.log(tr);
			console.log(tr.last());
			var span = tr.last().children();
// 			console.log(span);
// 			console.log(span.eq(0));
// 			console.log(span.length);
			
			for(var i=0; i<span.length; i++){
				console.log(span.eq(i).text());
			}
			var html2 = "";
			
            html2+= '<div class="col-md-12">';
            html2+= '<div id="infodetail" style="height:40px;">';
            html2+= '    <p style="width:345px;">모집직종 : &nbsp;'+span.eq(2).text()+'</p>';
            html2+= '    <p style="width:345px;">지역 : &nbsp;'+span.eq(3).text()+'</p>';
            html2+= '    <p style="width:345px;">학력 : &nbsp;'+span.eq(6).text()+'</p>';
            html2+= '    <p style="width:345px;">경력 : &nbsp;'+span.eq(5).text()+'</p>';
            html2+= '    <p style="width:500px;">접수기간 : &nbsp;'+span.eq(0).text()+' ~ '+span.eq(1).text()+'까지</p>';
            html2+= '    <p style="width:500px;">근무형태 : &nbsp;'+span.eq(4).text()+'</p>';
            html2+= '</div>';
            html2+= '</div>';
            
            var html3 = '';
            html3 += '<button class="btn btn-default" type="button" data-dismiss="modal">Close</button>';
            html3 += '<a role="button" class="btn btn-primary" target="_blank" href="' + span.eq(7).text() + '">채용상세 내용보기</a>';
            html3 += '<a role="button" class="btn btn-primary" target="_blank" href="' + span.eq(8).text() + '">기업소개 보기</a>';
            
//             html3 += '<button class="btn btn-default" type="button" data-dismiss="modal">Close</button>';
//             html3 += '<button class="btn btn-primary" type="button"><a href="'+span.eq(7).text()+'"></a>채용상세 내용보기</button>';
//             html3 += '<button class="btn btn-primary" type="button"><a href="'+span.eq(8).text()+'"></a>기업소개 보기</button>';
			
            $(".modal-body").html(html2);
			$(".modal-footer").html(html3);
		})
		
	};
	
		$('.top').click(function() {
   			$('html, body').animate({scrollTop : 0}, 400);
   			return;
   		});
	
	function remakeHireList(data) {
		var html="";
		var color="";
		for(var i=0; i<data.length; i++){
			if(data[i].matchs>=80) color="background-image: linear-gradient(to right, #43e97b 0%, #38f9d7 100%);";
			else if(data[i].matchs<80 && data[i].matchs>=60) color="background-image: linear-gradient(to top, #00c6fb 0%, #005bea 100%);";
			else if(data[i].matchs<60 && data[i].matchs>=40) color="background-image: linear-gradient(to right, #4facfe 0%, #00f2fe 100%);";
			else if(data[i].matchs<40 && data[i].matchs>=20) color="background-image: linear-gradient(to top, #a8edea 0%, #fed6e3 100%);";
			else if(data[i].matchs<20 && data[i].matchs>=0) color="background-image: linear-gradient(to right, #6a11cb 0%, #2575fc 100%);";
			html += '<tr style="padding-top:0px;">';
			html += '<td style="padding-top:35px; '+color+';">'+data[i].matchs+'%</td>';
			html += '<td style="padding-top:35px;">'+data[i].moditimes+'</td>';
			html += '<td style="padding-top:35px;">'+data[i].companies+'</td>';
			html += '<td><br><a id="hireclick" data-toggle="modal" data-target="#myModal">'+data[i].positions+'</a>';
			html += '   &gt; <br><br></td>';
			html += '<td style="padding-top:35px;">'+data[i].expitimes+'</td>';
			html += '<td style="display:none;"><span>'+data[i].moditimes+'</span>';
			html += '<span>'+data[i].expitimes+'</span>'
			html += '<span>'+data[i].apiJob1+'</span>'
			html += '<span>'+data[i].apiLoc+'</span>'
			html += '<span>'+data[i].apiPos+'</span>'
			html += '<span>'+data[i].apiExpLev+'</span>'
			html += '<span>'+data[i].apiEduLev+'</span>'
			html += '<span>'+data[i].apiUrl1+'</span>'
			html += '<span>'+data[i].apiUrl2+'</span>'
			html += '</td>';
			html += '</tr>';
		}
		$("table > tbody:last").append(html);
	}
	

</script>

</body>

</html>