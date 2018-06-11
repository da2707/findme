<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>secondWeb_calendar</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap-theme.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/styles.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/mainpage.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/Navigation-with-Button.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.css">
	
	<script src='${pageContext.request.contextPath}/resources/js/fullcalendar/moment.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.js'></script>
	<script src='${pageContext.request.contextPath}/resources/js/fullcalendar/locale-all.js'></script>
	<script src='${pageContext.request.contextPath}/resources/js/fullcalendar/jquery-ui.min.js'></script>
</head>
<body>
<!-- 최상단 이용을 위한 a 태그 -->
<a role="button" href="#" class="btn btn-primary top">맨위로 가기</a>
    <div>
        <nav class="navbar navbar-default navigation-clean-button">
            <div class="container">
                <div class="navbar-header"><a class="navbar-brand" href="${pageContext.request.contextPath}/main.do">FindMe</a><button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button></div>
                <div
                    class="collapse navbar-collapse" id="navcol-1">
                    <ul class="nav navbar-nav">
                        <li class="" role="presentation"><a href="${pageContext.request.contextPath}/view/community/list.jsp">Community</a></li>
                        <li class="active" role="presentation"><a href="${pageContext.request.contextPath}/view/calendar/calendar.jsp">MyCalendar</a></li>
                        <li class="" role="presentation"><a href="${pageContext.request.contextPath}/view/resume/resumelist.jsp">MyResume</a></li>
                        <li class="" role="presentation"><a href="${pageContext.request.contextPath}/view/mystat/main.jsp">MyStat</a></li>
                        <li class="" role="presentation"><a href="${pageContext.request.contextPath}/view/studyroom/video.jsp">StudyRoom</a></li>
                        <li class="" role="presentation"><a href="${pageContext.request.contextPath}/view/recruiting/hireinfo.jsp">Recruiting</a></li>
                    </ul>
                    <p class="navbar-text navbar-right actions"><a class="navbar-link login" href="#">Log In</a> <a class="btn btn-default action-button" role="button" href="#">Sign Up</a></p>
            </div>
    </div>
    </nav>
    </div>
    <div class="container" id="container">
    	<div class="row">
	    	<div class="col-md-7">
		        <div class="panel-group" role="tablist" aria-multiselectable="true" id="calendar">
		            <div class="panel panel-default">
		                <div class="panel-heading" role="tab">
		                    <h4 class="panel-title"><a role="button" data-toggle="collapse" data-parent="#calendar" aria-expanded="false" href="#calendar .item-1">캘린더 보기</a></h4>
		                </div>
		                <div class="panel-collapse collapse in item-1" role="tabpanel" id="calendarContent">
		                    <div class="panel-body"><div id='cal'></div></div>
		                </div>
		            </div>
		        </div>
	    	</div>
    	</div>
    	<form id="spForm">
    		<div class="row search-wrapper">
    			<div class="col-md-12">
    				<span>※선택하지 않은 조건은</span>
    				<span id="condition">'전체'</span>
    				<span>로 검색됩니다.</span>
    			</div>
    		</div>
			<div class="row search-wrapper">
				<div class="col-md-1"><span>▶ 지역</span></div>
				<div class="col-md-10" id="search-area"></div>
			</div> <!-- 지역 -->
			<div class="row search-wrapper">
				<div class="col-md-1"><span>▶ 학력</span></div>
				<div class="col-md-11" id="search-graduate"></div>
			</div><!-- 학력 -->
			<div class="row search-wrapper" style="height: 100px;">
				<div class="col-md-1"><span>▶ 근무</span></div>
				<div class="col-md-11" id="search-jobtype"></div>
			</div><!-- 근무형태 -->
			<div class="row search-wrapper" >
				<div class="col-md-1"><span>▶ 업종</span></div>				
				<div class="col-md-2" id="search-ind"></div>
				<div class="col-md-1"><span>▶ 직종</span></div>
				<div class="col-md-2" id="search-jobcategory"></div>
			</div>
			<div class="row" id="searchbutton">
				<div class="col-md-12" align="center">
					<div id="findjob">
						<a class="btn btn-default" id="jobsearch">
							<span class="glyphicon glyphicon-search"></span>
							<span id="condition">선택한 조건</span>
							<span>으로 검색</span>
						</a>
					</div>
				</div>
			</div>
		</form>
		<br><br>
		<form id="jobForm">
			<div class="row">
				<div class="col-md-12" id="resultList">
				</div>
			</div>
		</form>
	</div><!-- body 영역 -->
	
	<!-- Button trigger modal -->
	<button id="schedule" type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" style="display: none;">
	  Launch demo modal
	</button>
	
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content container_fluid">
	      <div class="modal-header">
	        <button id='closeDetail' type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">구직 일정 관리</h4>
	      </div>
	      <div id="schedulebody" class="modal-body">
	      </div>
	      <div class="modal-footer">
	        <button type="button" id='modalClose' class="btn btn-default" data-dismiss="modal">Close</button>
	        <button type="button" id='removeSchedule' class="btn btn-danger">일정 삭제</button>
	      </div>
	    </div>
	  </div>
	</div>
    
    <script>
    	var sessionId = '${sessionScope.id}';
    	console.log(sessionId);
    	
		$(document).ready(function() {
			makeCalendar();
			loadArea();
			loadGraduate();
			loadJobType();
			loadind();
			loadJobCategory();
		});
    
		function remakeCalendar() {
			$.ajax({
    			url: "list.json",
    			data: {userId : sessionId}
    		}).done(function(result) {
                //remove old data
                $('div#cal').fullCalendar('removeEvents');
                //Getting new event json data
                $('div#cal').fullCalendar('addEventSource', result);
                //Updating new events
                $('div#cal').fullCalendar('rerenderEvents');
                //getting latest Events
                $('#fullCalendar').fullCalendar( 'refetchEvents' );
                //getting latest Resources
//              $('div#cal').fullCalendar( 'refetchResources' );
    		});
		};
		
    	// 데이터 갱신 후 모달 닫으면 캘린더 갱신
    	$("#modalClose").on("click",function() {
    		remakeCalendar();
    	});
    	
    	// 서류 접수 여부 라디오 버튼 클릭 시 정보 실시간 수정
    	function apply(calEvent, val) {
    		$.ajax({
    			url: 'updateApply.json',
    			type: 'POST',
    			data: { userId: calEvent.userId , recruitNo: calEvent.recruitNo, apply: val },
    			success: function (result) {
					$("#applyArea").text(result.apply);
					applyDate(result);
    			}
    		});
    	};
    	
    	// 서류 접수 여부에 따른 지원 일자 표기 방식 수정
    	function applyDate(result) {
    		var date = moment(result.regDate).format("YYYY-MM-DD");
    		if (date.startsWith('1970')) {
    			$('#applyDay').text("지원 안 함");
    			$('span#conditionText').text(result.codeNo);
    		} else {
    			$('#applyDay').text(date);
    			$('span#conditionText').text(result.codeNo);
    		}
    	};
    	
    	
    	// 합격, 불합격 처리
    	function result(calEvent, val) {
    		$.ajax({
    			url: 'resultSelect.json',
    			type: 'POST',
    			data: { userId : calEvent.userId , recruitNo: calEvent.recruitNo, result: val },
    			success: function (result) {
					if (result.result === 'Y') {
						$("#passText").text("합격"); 
					} else if (result.result === 'N') {
						$("#passText").text("불합격"); 
					} else {
						$("#passText").text("진행중");
						$("#conditionSelect").attr("disabled", "disabled");
						$("#finalRound").attr("disabled", "disabled");
					}			
    			}
    		});
    	}
    	
    	// 캘린더 이벤트 클릭 시 상세 데이터 출력
    	function eventDetail(calEvent) {  
    		var title = calEvent.title + " : " + calEvent.name;
    		var regDate = moment(calEvent.regDate).format("YYYY-MM-DD");
   		
    		$("#myModalLabel").text(title);

    		var html = "";
    		html += "<form id='scheduleForm'>";
			html += "		<div class='row'>";
			html += "			<div class='col-md-3'>";
			html += "				<strong>접수 시작 / 마감일</strong>";
			html += "			</div>";
			html += "			<div class='col-md-9'>";
			html += "				<span>";
			html += 					moment(calEvent.start).format('YYYY-MM-DD');
			html += "</span>";
			html += "				<span> ~ </span>";
			html += "				<span>";
			html += 					moment(calEvent.end).format('YYYY-MM-DD');
			html += "</span>";
			html += "			</div>";
			html += "		</div>";
			html += "		<div class='row'>";
			html += "			<div class='col-md-3'>";
			html += "				<strong>서류 접수</strong>";
			html += "			</div>";
			html += "			<div class='col-md-4'>";
			html += "				<span id='applyArea'>";
			html += 					calEvent.apply;
			html += "</span>";
			html += "			</div>";
			html += "			<div class='col-md-5'>";
			if (calEvent.apply === 'Y') {
				html += "				<input type='radio' name='apply' id='apply1' value='Y' checked />접수";			
				html += "				<input type='radio' name='apply' id='apply2' value='N' />미접수";			
			} else {
				html += "				<input type='radio' name='apply' id='apply1' value='Y' />접수";			
				html += "				<input type='radio' name='apply' id='apply2' value='N' checked />미접수";			
			}
			html += "			</div>";
			html += "		</div>";
			html += "		<div class='row'>";
			html += "			<div class='col-md-3'>";
			html += "				<strong>지원 일자</strong>";
			html += "			</div>";
			html += "			<div class='col-md-9'>";
			html += "				<span id='applyDay'>";
			if (calEvent.apply === 'Y') {
				html += regDate;			
			} else {
				html += "지원 안 함";			
			}
			html += "</span>";
			html += "			</div>";
			html += "		</div>";
			html += "		<div class='row'>";
			html += "			<div class='col-md-3'>";
			html += "				<strong>현재 상태</strong>";
			html += "			</div>";
			html += "			<div class='col-md-4'>";
			html += "				<span id='conditionText'>";
			html += 					calEvent.codeNo;
			html += "</span>";
			html += "			</div>";
			html += "			<div class='col-md-5'>";
			html += "				<select id='conditionSelect' name='codeNo'>";
			html += "					<option value=''>선택</option>";
			html += "				</select>";
			html += "			</div>";
			html += "		</div>";
			html += "		<div class='row'>";
			html += "			<div class='col-md-3'>";
			html += "				<strong>최종 단계</strong>";
			html += "			</div>";
			html += "			<div class='col-md-4'>";
			html += "				<span id='finalRoundCode'>";
			html += 					calEvent.finalRound;
			html += "</span>";
			html += "			</div>";
			html += "			<div class='col-md-5'>";
			html += "				<select id='finalRound' name='finalRound'>";
			html += "					<option value=''>선택</option>";
			html += "				</select>";
			html += "			</div>";
			html += "		</div>";
			html += "		<div class='row'>";
			html += "			<div class='col-md-3'>";
			html += "				<strong>합격 여부</strong>";
			html += "			</div>";
			html += "			<div class='col-md-4'>";
			html += "				<span id='passText'>";
			if (calEvent.result === 'Y')      html += "				합격";			
			else if (calEvent.result === 'N') html += "				불합격";			
			else                              html += "				진행중";			
			html += "</span>";
			html += "			</div>";
			html += "			<div class='col-md-5'>";
			if (calEvent.result === 'Y') {
				html += "				<input type='radio' name='result' id='result1' value='Y' checked />합격";			
				html += "				<input type='radio' name='result' id='result2' value='N' />불합격";			
			} else if (calEvent.result === 'N'){
				html += "				<input type='radio' name='result' id='result1' value='Y' />합격";			
				html += "				<input type='radio' name='result' id='result2' value='N' checked />불합격";			
			} else {
				html += "				<input type='radio' name='result' id='result1' value='Y' />합격";			
				html += "				<input type='radio' name='result' id='result2' value='N' />불합격";			
			}
			html += "			</div>";
			html += "		</div>";
			html += "		<div class='row'>";
			html += "			<div class='col-md-3'>";
			html += "				<strong>공고 링크</strong>";
			html += "			</div>";
			html += "			<div class='col-md-9'>";
			html += "				<span>";
			html += "					<a href='" + calEvent.lingk + "'>바로가기</a>";
			html += "</span>";
			html += "			</div>";
			html += "		</div>";
			html += "</form>";
			
			$("#schedulebody").html(html);
			
			// 서류 접수 여부 라디오 버튼 클릭 시 이벤트 처리
	    	$("input[name='apply']").click(function () {
	    		var val = $(this).val();
	    		apply(calEvent, val);
	    	});
			
	    	
	    	// 모달 내 최종 단계 select 마우스 오버 이벤트 처리
	    	$("#finalRound").one("mouseenter", function() {
	    		$.ajax({
	    			url: "loadCodeFR.json",
	    		}).done(function(value) {
	    			for (var i = 0; i < value.length; i++) {
	    				var option = $("<option value=" + value[i].codeNo + ">" + value[i].codeName + "</option>");
	    				$("#finalRound").append(option);
	    			}
	    		});
	    	});
	    	
	    	// 모달 내 select 버튼 선택 시 최종 단계 내용 변경
	    	$("#finalRound").change(function() {
	    		var val = $(this).val();
	    		$.ajax({
	    			url: "registFR.json",
	    			data: { userId: calEvent.userId, finalRound : val, recruitNo: calEvent.recruitNo}
	    		}).done(function(value) {
	    			console.log(value.finalRound);
					$("span#finalRoundCode").text(value.finalRound);
	    		});
	    	});
	    	
	    	// 모달 내 현재 상태 select 마우스 오버 이벤트 처리
	    	$("#conditionSelect").one("mouseenter", function() {
	    		$.ajax({
	    			url: "loadCodeFR.json",
	    		}).done(function(value) {
	    			for (var i = 0; i < value.length; i++) {
	    				var option = $("<option value=" + value[i].codeNo + ">" + value[i].codeName + "</option>");
	    				$("#conditionSelect").append(option);
	    			}
	    		});
	    	});
	    	
	    	// 모달 내 select 버튼 선택 시 현재 단계 내용 변경
	    	$("#conditionSelect").change(function() {
	    		var val = $(this).val();
	    		$.ajax({
	    			url: "registCondition.json",
	    			data: {userId : calEvent.userId, codeNo : val, recruitNo: calEvent.recruitNo}
	    		}).done(function(value) {
// 	    			console.log(value.codeNo);
					$("span#conditionText").text(value.codeNo);
	    		});
	    	});
	    	
			// 합격, 불합격 여부 라디오 버튼 클릭 시 이벤트 처리
			$("input[name='result']").click(function () {
	    		var val = $(this).val();
				result(calEvent,val);				
			});
			
			// 일정 삭제 버튼 클릭 시 캘린더 새로 고침
			$("#removeSchedule").click(function () {
				deleteSchedule(calEvent);
			});
	    	
    	};
    	
    	// 일정 삭제 함수
    	function deleteSchedule(calEvent) {
    		console.log(calEvent);
    		$.ajax({
    			url: "deleteSchedule.json",
    			type: "POST",
    			data: {userId : calEvent.userId, recruitNo : calEvent.recruitNo}
       		}).done(function () {
       			console.log("삭제가 완료되었습니다.");
	    		$("#modalClose").trigger("click", function() {
	   	    		remakeCalendar();
	   	    	});
       		});
    	};
    	
    	
    	// 드래그로 날짜 일괄 업데이트 함수
    	function batchModifyDate(event, day) {
    		$.ajax({
    			url: "updateBatchDate.json",
    			type: "POST",
    			data: { userId : event.userId, recruitNo : event.recruitNo, days : day},
    			success: function() {
    				alert("일정이 정상 수정되었습니다.");
    			}
    		});
    	};
    	
    	// 캘린더 생성
    	function makeCalendar() {
    		$('div#cal').fullCalendar({
	            header: {
	                left: 'prev,next today',
	                center: 'title',
// 	                right: 'month,agendaWeek,agendaDay'
	                right: 'month'
	            },
	            monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
	            monthNamesShort: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
	            dayNames: ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"],
	            dayNamesShort: ["일","월","화","수","목","금","토"],
	            editable: true, // 수정 가능 여부
				events: "list.json?userId=" + sessionId,
    			timeFormat: '(YYYY-MM-DD)', // 날짜 정보 설정

	            eventDrop: function( event, delta, revertFunc, jsEvent, ui, view ) {
	            	if (delta._days != 0) {
						batchModifyDate(event, delta._days);
	            	}
	            },
	            
	            eventResize: function(event, delta, revertFunc, jsEvent, ui, view) {
	            	console.log(event);
	            },
	            
    			eventClick: function(calEvent, jsEvent, view) {
    				eventDetail(calEvent);
    				
    				// 캘린더 일정 클릭 시 자동 버튼 클릭 이벤트 발생
    				$("#schedule").trigger("click", function() {
    					console.log($("#myModal").attr("class"));
    				});
	   			}
	            
    		});
    	};
    	
    	//----------------------------------------------------------------------
    	
    	// 검색 버튼 클릭 시 ajax 처리
    	$("#jobsearch").click(function() {
    		var sKey = $("#spForm").serialize();
    		$.ajax({
    			url: "jobSearch.json",
    			data: sKey
    		}).done(function (result) {
    			makeJobList(result);
    		});
    	});
    	
    	function makeJobList(result) {
    		var html = '';
    		html += '<table class="table table-hover" id="calTable">';
			html += '<tr class="info">';
			html += '	<th>기업명</th>';
			html += '	<th>제목</th>';	
			html += '	<th>지원자격</th>';
			html += '	<th style="width: 120px;">근무조건</th>';
			html += '	<th>등록일/마감일</th>';
			html += '	<th>캘린더 등록</th>';
			html += '</tr>';
						
			for (var i = 0; i < result.length; i++) {
				var start = result[i].startDate;
				var end = result[i].endDate;
			html += '<tr class="trBody">';
			html += '<td><span style="display:none">'+ result[i].recruitNo +'</span><span>'+ result[i].company +'</span></td>';
			html += '<td><a href="'+ result[i].link +'">'+ result[i].title +'</a></td>';
			html += '<td><span>'+ result[i].expLv + '</span><br><span>' + result[i].eduLv +'</span></td>';
			html += '<td>'+ result[i].jobType +'</td>';
			html += '<td><span style="display:none">'+ start + '</span><span style="display:none">' + end + '</span>'; 
			html += '<span>' + moment(start).format("YYYY-MM-DD") + '</span><br>';
			html += '</span>'+ moment(end).format("YYYY-MM-DD") +'</span></td>';
			html += '<td><a role="button" id="insertCal">캘린더 등록</a></td>';
			html += '</tr>';				
			}
			html += '</table>';
			$("#resultList").html(html);
			
			// 새로 생성되는 태그에 클릭 이벤트 자동 적용
			$("#resultList").on("click", "#insertCal", function() {
				insertCalendar($(this).parent().parent());
			});
			
	    	// 스크롤 페이징 처리
			$(window).scroll(function () {
	    		if ($(window).scrollTop() == $(document).height() - $(window).height()) {
					var sKey = $("#spForm").serialize();
		    		$.ajax({
		    			url: "jobSearch.json",
		    			data: sKey
		    		}).done(function (data) {
		    			scrollJobList(data);
		    			$("#resultList").append("</table>");
		    		});
	    		}
	    		
	    		if ($(this).scrollTop() > 200) {
	    		    $('.top').fadeIn();
	    		} else {
	    			$('.top').fadeOut();
	    		}
	    		
			});
	   	};

   		$('.top').click(function() {
   			$('html, body').animate({scrollTop : 0}, 400);
   			return;
   		});
    	
    	function scrollJobList(data) {
    		var html = '';
    		
    		for (var i = 0; i < data.length; i++) {
				var start = data[i].startDate;
				var end = data[i].endDate;
			html += '<tr class="trBody">';
			html += '<td><span style="display:none">'+ data[i].recruitNo +'</span><span>'+ data[i].company +'</span></td>';
			html += '<td><a href="'+ data[i].link +'">'+ data[i].title +'</a></td>';
			html += '<td><span>'+ data[i].expLv + '</span><br><span>' + data[i].eduLv +'</span></td>';
			html += '<td>'+ data[i].jobType +'</td>';
			html += '<td><span style="display:none">'+ start + '</span><span style="display:none">' + end + '</span>'; 
			html += '<span>' + moment(start).format("YYYY-MM-DD") + '</span><br>';
			html += '</span>'+ moment(end).format("YYYY-MM-DD") +'</span></td>';
			html += '<td><a role="button" id="insertCal">캘린더 등록</a></td>';
			html += '</tr>';				
			}
    		$("#calTable > tbody:last").append(html);
    	};
    	

    	// DB에 테이블에 있는 채용 정보 데이터 일부를 꺼내어 저장
    	function insertCalendar(data) {
    		var td = data.children();
    		
    		var recruitNo = td.eq(0).children("span").eq(0).text();
    		var name = td.eq(0).children("span").eq(1).text();
    		var link = td.eq(1).children("a").attr("href");
    		var title = td.eq(1).children("a").text();
    		var start = new Date((Number)(td.eq(4).children("span").eq(0).text()));
    		var end = new Date((Number)(td.eq(4).children("span").eq(1).text()));
			
//     		console.log(sessionId);
//     		console.log(recruitNo);
//     		console.log(name);
//     		console.log(link);
//     		console.log(title);
//     		console.log(start);
//     		console.log(end);
    		
    		$.ajax({
    			url: "insertCalendar.json",
    			type: "POST",
    			data: {userId : sessionId, recruitNo : recruitNo, name : name, link : link,
    					title : title, start : start, end : end},
    			success: function (msg) {
    				alert(msg);
    				remakeCalendar();
    			}
    		});
    	}
    	
    	// 지역 검색 영역 생성
    	function loadArea() {
    		$.ajax({
    			url: "loadCodeArea.json",
    		}).done(function (result) {
    			sArea(result);
    		});
    	}
    	
    	function sArea(result) {
    		for (var i = 0; i < result.length; i++){
    			var id = "loc_cd" + (i + 1);
	    		$("#search-area").append(
					"<input type='radio' name='loc_cd' id='" + id + "' value='" + result[i].codeNo+ "'>"	    			
	    		);
	    		$("#search-area").append(
					"<label for='" + id + "'>&nbsp;" + result[i].codeName + "</label>&nbsp;&nbsp;"	    			
	    		);
    		}
    	}
    	
    	// 학력 검색 영역 생성
    	function loadGraduate() {
    		$.ajax({
    			url: "loadCodeGraduate.json",
    		}).done(function (result) {
    			sGraduate(result);
    		});
    	}
    	
    	function sGraduate(result) {
    		for (var i = 0; i < result.length; i++){
    			var id = "edu_lv" + (i + 1);
	    		$("#search-graduate").append(
					"<input type='radio' name='edu_lv' id='" + id + "' value='" + result[i].codeNo+ "'>"	    			
	    		);
	    		$("#search-graduate").append(
					"<label for='" + id + "'>&nbsp;" + result[i].codeName + "</label>&nbsp;&nbsp;&nbsp;&nbsp;"	    			
	    		);
    		}
    	}
    	
    	// 근무 형태 검색 영역 생성
    	function loadJobType() {
    		$.ajax({
    			url: "loadCodeJobType.json",
    		}).done(function (result) {
    			sJobType(result);
    		});
    	}
    	
    	function sJobType(result) {
    		for (var i = 0; i < result.length; i++){
    			var id = "job_type" + (i + 1);
	    		$("#search-jobtype").append(
					"<input type='radio' name='job_type' id='" + id + "' value='" + result[i].codeNo+ "'>"	    			
	    		);
	    		$("#search-jobtype").append(
					"<label for='" + id + "'>&nbsp;" + result[i].codeName + "</label>&nbsp;&nbsp;&nbsp;"	    			
	    		);
    		}
    	}
    	
    	// 업종 영역 생성
    	function loadind() {
    		var html='';
    		html += '<select name="ind_cd" id="ind_cd">';
    		html += '	<option value="" label=":: 업종 ::">:: 업종 ::</option>';
    		html += '	<optgroup label="서비스업">';
    		html += '<option value="108" label="호텔·여행·항공">호텔·여행·항공</option>';
			html += '<option value="109" label="외식업·식음료">외식업·식음료</option>';
			html += '<option value="111" label="시설관리·경비·용역">시설관리·경비·용역</option>';
			html += '<option value="115" label="레저·스포츠·여가">레저·스포츠·여가</option>';
			html += '<option value="118" label="AS·카센터·주유">AS·카센터·주유</option>';
			html += '<option value="119" label="렌탈·임대">렌탈·임대</option>';
			html += '<option value="120" label="웨딩·장례·이벤트">웨딩·장례·이벤트</option>';
			html += '<option value="121" label="기타서비스업">기타서비스업</option>';
			html += '<option value="122" label="뷰티·미용">뷰티·미용</option>';
			html += '</optgroup>';
			html += '<optgroup label="제조·화학">';
			html += '<option value="201" label="전기·전자·제어">전기·전자·제어</option>';
			html += '<option value="202" label="기계·설비·자동차">기계·설비·자동차</option>';
			html += '<option value="204" label="석유·화학·에너지">석유·화학·에너지</option>';
			html += '<option value="205" label="섬유·의류·패션">섬유·의류·패션</option>';
			html += '<option value="207" label="화장품·뷰티">화장품·뷰티</option>';
			html += '<option value="208" label="생활용품·소비재·사무">생활용품·소비재·사무</option>';
			html += '<option value="209" label="가구·목재·제지">가구·목재·제지</option>';
			html += '<option value="210" label="농업·어업·광업·임업">농업·어업·광업·임업</option>';
			html += '<option value="211" label="금속·재료·철강·요업">금속·재료·철강·요업</option>';
			html += '<option value="212" label="조선·항공·우주">조선·항공·우주</option>';
			html += '<option value="213" label="기타제조업">기타제조업</option>';
			html += '<option value="214" label="식품가공·개발">식품가공·개발</option>';
			html += '<option value="215" label="반도체·광학·LCD">반도체·광학·LCD</option>';
			html += '<option value="216" label="환경">환경</option>';
			html += '</optgroup>';
			html += '<optgroup label="IT·웹·통신">';
			html += '<option value="301" label="솔루션·SI·ERP·CRM">솔루션·SI·ERP·CRM</option>';
			html += '<option value="302" label="웹에이젼시">웹에이젼시</option>';
			html += '<option value="304" label="쇼핑몰·오픈마켓">쇼핑몰·오픈마켓</option>';
			html += '<option value="305" label="포털·인터넷·컨텐츠">포털·인터넷·컨텐츠</option>';
			html += '<option value="306" label="네트워크·통신·모바일">네트워크·통신·모바일</option>';
			html += '<option value="307" label="하드웨어·장비">하드웨어·장비</option>';
			html += '<option value="308" label="정보보안·백신">정보보안·백신</option>';
			html += '<option value="313" label="IT컨설팅">IT컨설팅</option>';
			html += '<option value="314" label="게임">게임</option>';
			html += '</optgroup>';
			html += '<optgroup label="은행·금융업">';
			html += '<option value="401" label="은행·금융·저축">은행·금융·저축</option>';
			html += '<option value="402" label="대출·캐피탈·여신">대출·캐피탈·여신</option>';
			html += '<option value="405" label="기타금융">기타금융</option>';
			html += '<option value="406" label="증권·보험·카드">증권·보험·카드</option>';
			html += '</optgroup>';
			html += '<optgroup label="미디어·디자인">';
			html += '<option value="501" label="신문·잡지·언론사">신문·잡지·언론사</option>';
			html += '<option value="502" label="방송사·케이블">방송사·케이블</option>';
			html += '<option value="503" label="연예·엔터테인먼트">연예·엔터테인먼트</option>';
			html += '<option value="504" label="광고·홍보·전시">광고·홍보·전시</option>';
			html += '<option value="505" label="영화·배급·음악">영화·배급·음악</option>';
			html += '<option value="506" label="공연·예술·문화">공연·예술·문화</option>';
			html += '<option value="509" label="출판·인쇄·사진">출판·인쇄·사진</option>';
			html += '<option value="510" label="캐릭터·애니메이션">캐릭터·애니메이션</option>';
			html += '<option value="511" label="디자인·설계">디자인·설계</option>';
			html += '</optgroup>';
			html += '<optgroup label="교육업">';
			html += '<option value="601" label="초중고·대학">초중고·대학</option>';
			html += '<option value="602" label="학원·어학원">학원·어학원</option>';
			html += '<option value="603" label="유아·유치원">유아·유치원</option>';
			html += '<option value="604" label="교재·학습지">교재·학습지</option>';
			html += '<option value="605" label="전문·기능학원">전문·기능학원</option>';
			html += '</optgroup>';
			html += '<optgroup label="의료·제약·복지">';
			html += '<option value="701" label="의료(진료과목별)">의료(진료과목별)</option>';
			html += '<option value="702" label="의료(병원종류별)">의료(병원종류별)</option>';
			html += '<option value="703" label="제약·보건·바이오">제약·보건·바이오</option>';
			html += '<option value="704" label="사회복지">사회복지</option>';
			html += '</optgroup>';
			html += '<optgroup label="판매·유통">';
			html += '<option value="801" label="판매(매장종류별)">판매(매장종류별)</option>';
			html += '<option value="802" label="판매(상품품목별)">판매(상품품목별)</option>';
			html += '<option value="803" label="유통·무역·상사">유통·무역·상사</option>';
			html += '<option value="804" label="운송·운수·물류">운송·운수·물류</option>';
			html += '</optgroup>';
			html += '<optgroup label="건설업">';
			html += '<option value="901" label="건설·건축·토목·시공">건설·건축·토목·시공</option>';
			html += '<option value="902" label="실내·인테리어·조경">실내·인테리어·조경</option>';
			html += '<option value="903" label="환경·설비">환경·설비</option>';
			html += '<option value="904" label="부동산·임대·중개">부동산·임대·중개</option>';
			html += '</optgroup>';
			html += '<optgroup label="기관·협회">';
			html += '<option value="1001" label="정부·공공기관·공기업">정부·공공기관·공기업</option>';
			html += '<option value="1002" label="협회·단체">협회·단체</option>';
			html += '<option value="1003" label="법률·법무·특허">법률·법무·특허</option>';
			html += '<option value="1004" label="세무·회계">세무·회계</option>';
			html += '<option value="1005" label="연구소·컨설팅·조사">연구소·컨설팅·조사</option>';
			html += '</optgroup>';
			html += '</select>';
			$("#search-ind").html(html);
    	}
    	
    	
    	// 직종 검색 영역 생성
    	function loadJobCategory () {
    		var html = '';
    		html += '<select name="job_category" id="job_category">';
			html += '<option value="" label=":: 직종 ::">:: 직종 ::</option>';
			html += '<optgroup label="경영·사무">';
			html += '<option value="101" label="기획·전략·경영">기획·전략·경영</option>';
			html += '<option value="102" label="총무·법무·사무">총무·법무·사무</option>';
			html += '<option value="103" label="경리·출납·결산">경리·출납·결산</option>';
			html += '<option value="104" label="홍보·PR·사보">홍보·PR·사보</option>';
			html += '<option value="107" label="비서·안내·수행원">비서·안내·수행원</option>';
			html += '<option value="108" label="사무보조·문서작성">사무보조·문서작성</option>';
			html += '<option value="113" label="인사·교육·노무">인사·교육·노무</option>';
			html += '<option value="114" label="회계·재무·세무·IR">회계·재무·세무·IR</option>';
			html += '<option value="119" label="마케팅·광고·분석">마케팅·광고·분석</option>';
			html += '<option value="120" label="전시·컨벤션·세미나">전시·컨벤션·세미나</option>';
			html += '</optgroup>';
			html += '<optgroup label="영업·고객상담">';
			html += '<option value="202" label="일반영업">일반영업</option>';
			html += '<option value="203" label="판매·매장관리">판매·매장관리</option>';
			html += '<option value="205" label="IT·솔루션영업">IT·솔루션영업</option>';
			html += '<option value="206" label="금융·보험영업">금융·보험영업</option>';
			html += '<option value="207" label="광고영업">광고영업</option>';
			html += '<option value="208" label="기술영업">기술영업</option>';
			html += '<option value="209" label="영업기획·관리·지원">영업기획·관리·지원</option>';
			html += '<option value="210" label="TM·아웃바운드">TM·아웃바운드</option>';
			html += '<option value="211" label="TM·인바운드">TM·인바운드</option>';
			html += '<option value="212" label="고객센터·CS">고객센터·CS</option>';
			html += '<option value="213" label="QA·CS강사·수퍼바이저">QA·CS강사·수퍼바이저</option>';
			html += '</optgroup>';
			html += '<optgroup label="생산·제조">';
			html += '<option value="301" label="금속·금형">금속·금형</option>';
			html += '<option value="302" label="기계·기계설비">기계·기계설비</option>';
			html += '<option value="303" label="화학·에너지">화학·에너지</option>';
			html += '<option value="304" label="섬유·의류·패션">섬유·의류·패션</option>';
			html += '<option value="308" label="전기·전자·제어">전기·전자·제어</option>';
			html += '<option value="309" label="생산관리·품질관리">생산관리·품질관리</option>';
			html += '<option value="314" label="반도체·디스플레이·LCD">반도체·디스플레이·LCD</option>';
			html += '<option value="315" label="생산·제조·포장·조립">생산·제조·포장·조립</option>';
			html += '<option value="316" label="비금속·요업·신소재">비금속·요업·신소재</option>';
			html += '<option value="317" label="바이오·제약·식품">바이오·제약·식품</option>';
			html += '<option value="318" label="설계·CAD·CAM">설계·CAD·CAM</option>';
			html += '<option value="319" label="안경·렌즈·광학">안경·렌즈·광학</option>';
			html += '</optgroup>';
			html += '<optgroup label="IT·인터넷">';
			html += '<option value="401" label="웹마스터·QA·테스터">웹마스터·QA·테스터</option>';
			html += '<option value="402" label="서버·네트워크·보안">서버·네트워크·보안</option>';
			html += '<option value="403" label="웹기획·웹마케팅·PM">웹기획·웹마케팅·PM</option>';
			html += '<option value="404" label="웹프로그래머">웹프로그래머</option>';
			html += '<option value="405" label="게임·Game">게임·Game</option>';
			html += '<option value="406" label="컨텐츠·사이트운영">컨텐츠·사이트운영</option>';
			html += '<option value="407" label="응용프로그래머">응용프로그래머</option>';
			html += '<option value="408" label="시스템프로그래머">시스템프로그래머</option>';
			html += '<option value="409" label="ERP·시스템분석·설계">ERP·시스템분석·설계</option>';
			html += '<option value="410" label="통신·모바일">통신·모바일</option>';
			html += '<option value="411" label="하드웨어·소프트웨어">하드웨어·소프트웨어</option>';
			html += '<option value="412" label="웹디자인">웹디자인</option>';
			html += '<option value="413" label="HTML·웹표준·UI개발">HTML·웹표준·UI개발</option>';
			html += '<option value="414" label="동영상·편집·코덱">동영상·편집·코덱</option>';
			html += '<option value="415" label="IT·디자인·컴퓨터교육">IT·디자인·컴퓨터교육</option>';
			html += '<option value="416" label="데이터베이스·DBA">데이터베이스·DBA</option>';
			html += '</optgroup>';
			html += '<optgroup label="전문직">';
			html += '<option value="501" label="경영분석·컨설턴트">경영분석·컨설턴트</option>';
			html += '<option value="502" label="증권·투자·펀드·외환">증권·투자·펀드·외환</option>';
			html += '<option value="504" label="헤드헌팅·노무·직업상담">헤드헌팅·노무·직업상담</option>';
			html += '<option value="505" label="설문·통계·리서치">설문·통계·리서치</option>';
			html += '<option value="509" label="외국어·번역·통역">외국어·번역·통역</option>';
			html += '<option value="510" label="법률·특허·상표">법률·특허·상표</option>';
			html += '<option value="511" label="세무·회계·CPA">세무·회계·CPA</option>';
			html += '<option value="512" label="채권·보험·보상·심사">채권·보험·보상·심사</option>';
			html += '<option value="513" label="도서관사서">도서관사서</option>';
			html += '<option value="518" label="연구소·R&amp;D">연구소·R&amp;D</option>';
			html += '<option value="522" label="문화·예술·종교">문화·예술·종교</option>';
			html += '<option value="523" label="특수직">특수직</option>';
			html += '<option value="524" label="임원·CEO">임원·CEO</option>';
			html += '</optgroup>';
			html += '<optgroup label="교육">';
			html += '<option value="601" label="교육기획·교재">교육기획·교재</option>';
			html += '<option value="602" label="초중고·특수학교">초중고·특수학교</option>';
			html += '<option value="603" label="학습지·과외·방문">학습지·과외·방문</option>';
			html += '<option value="604" label="유치원·보육">유치원·보육</option>';
			html += '<option value="605" label="전문직업·IT강사">전문직업·IT강사</option>';
			html += '<option value="606" label="입시·보습·속셈학원">입시·보습·속셈학원</option>';
			html += '<option value="609" label="학원관리·운영·상담">학원관리·운영·상담</option>';
			html += '<option value="610" label="대학교수·행정직">대학교수·행정직</option>';
			html += '<option value="611" label="외국어·어학원">외국어·어학원</option>';
			html += '</optgroup>';
			html += '<optgroup label="미디어">';
			html += '<option value="702" label="연예·엔터테인먼트">연예·엔터테인먼트</option>';
			html += '<option value="703" label="카메라·조명·미술">카메라·조명·미술</option>';
			html += '<option value="704" label="공연·무대·스텝">공연·무대·스텝</option>';
			html += '<option value="705" label="작가·시나리오">작가·시나리오</option>';
			html += '<option value="708" label="영화제작·배급">영화제작·배급</option>';
			html += '<option value="709" label="광고·카피·CF">광고·카피·CF</option>';
			html += '<option value="710" label="기자">기자</option>';
			html += '<option value="711" label="방송연출·PD·감독">방송연출·PD·감독</option>';
			html += '<option value="712" label="진행·아나운서">진행·아나운서</option>';
			html += '<option value="713" label="음악·음향·사운드">음악·음향·사운드</option>';
			html += '<option value="714" label="인쇄·출판·편집">인쇄·출판·편집</option>';
			html += '<option value="715" label="사진·포토그라퍼">사진·포토그라퍼</option>';
			html += '</optgroup>';
			html += '<optgroup label="특수계층·공공">';
			html += '<option value="807" label="중장년·고령인·실버">중장년·고령인·실버</option>';
			html += '<option value="808" label="장애인·국가유공자">장애인·국가유공자</option>';
			html += '<option value="809" label="병역특례">병역특례</option>';
			html += '<option value="810" label="공무원">공무원</option>';
			html += '<option value="812" label="사회복지·요양·봉사">사회복지·요양·봉사</option>';
			html += '<option value="813" label="장교·군인·부사관">장교·군인·부사관</option>';
			html += '</optgroup>';
			html += '<optgroup label="건설">';
			html += '<option value="901" label="토목·조경·도시·측량">토목·조경·도시·측량</option>';
			html += '<option value="902" label="건축·인테리어·설계">건축·인테리어·설계</option>';
			html += '<option value="903" label="전기·소방·통신·설비">전기·소방·통신·설비</option>';
			html += '<option value="904" label="환경·플랜트">환경·플랜트</option>';
			html += '<option value="905" label="현장·시공·감리·공무">현장·시공·감리·공무</option>';
			html += '<option value="906" label="안전·품질·검사·관리">안전·품질·검사·관리</option>';
			html += '<option value="908" label="부동산·개발·경매·분양">부동산·개발·경매·분양</option>';
			html += '<option value="909" label="본사·관리·전산">본사·관리·전산</option>';
			html += '</optgroup>';
			html += '<optgroup label="유통·무역">';
			html += '<option value="1001" label="물류·유통·운송">물류·유통·운송</option>';
			html += '<option value="1002" label="해외영업·무역영업">해외영업·무역영업</option>';
			html += '<option value="1003" label="구매·자재·재고">구매·자재·재고</option>';
			html += '<option value="1004" label="납품·배송·택배">납품·배송·택배</option>';
			html += '<option value="1005" label="상품기획·MD">상품기획·MD</option>';
			html += '<option value="1006" label="무역사무·수출입">무역사무·수출입</option>';
			html += '<option value="1007" label="운전·기사">운전·기사</option>';
			html += '<option value="1008" label="중장비·화물">중장비·화물</option>';
			html += '</optgroup>';
			html += '<optgroup label="서비스">';
			html += '<option value="1101" label="웨딩·행사·이벤트">웨딩·행사·이벤트</option>';
			html += '<option value="1102" label="안내·도우미·나레이터">안내·도우미·나레이터</option>';
			html += '<option value="1103" label="보안·경호·안전">보안·경호·안전</option>';
			html += '<option value="1104" label="주차·세차·주유">주차·세차·주유</option>';
			html += '<option value="1105" label="AS·서비스·수리">AS·서비스·수리</option>';
			html += '<option value="1107" label="외식·식음료">외식·식음료</option>';
			html += '<option value="1108" label="호텔·카지노·콘도">호텔·카지노·콘도</option>';
			html += '<option value="1109" label="여행·관광·항공">여행·관광·항공</option>';
			html += '<option value="1110" label="레저·스포츠">레저·스포츠</option>';
			html += '<option value="1111" label="미용·피부관리·애견">미용·피부관리·애견</option>';
			html += '<option value="1112" label="요리·제빵사·영양사">요리·제빵사·영양사</option>';
			html += '<option value="1113" label="가사·청소·육아">가사·청소·육아</option>';
			html += '</optgroup>';
			html += '<optgroup label="디자인">';
			html += '<option value="1201" label="그래픽디자인·CG">그래픽디자인·CG</option>';
			html += '<option value="1202" label="출판·편집디자인">출판·편집디자인</option>';
			html += '<option value="1203" label="제품·산업디자인">제품·산업디자인</option>';
			html += '<option value="1204" label="캐릭터·만화·애니">캐릭터·만화·애니</option>';
			html += '<option value="1205" label="의류·패션·잡화디자인">의류·패션·잡화디자인</option>';
			html += '<option value="1207" label="디자인기타">디자인기타</option>';
			html += '<option value="1208" label="전시·공간디자인">전시·공간디자인</option>';
			html += '<option value="1209" label="광고·시각디자인">광고·시각디자인</option>';
			html += '</optgroup>';
			html += '<optgroup label="의료">';
			html += '<option value="1301" label="의사·치과·한의사">의사·치과·한의사</option>';
			html += '<option value="1302" label="수의사">수의사</option>';
			html += '<option value="1303" label="약사">약사</option>';
			html += '<option value="1304" label="간호사">간호사</option>';
			html += '<option value="1305" label="간호조무사">간호조무사</option>';
			html += '<option value="1306" label="의료기사">의료기사</option>';
			html += '<option value="1307" label="사무·원무·코디">사무·원무·코디</option>';
			html += '<option value="1308" label="보험심사과">보험심사과</option>';
			html += '<option value="1309" label="의료기타직">의료기타직</option>';
			html += '</optgroup>';
			html += '</select>';
			$("#search-jobcategory").html(html);
    	}
    	
    </script>
</body>
</html>