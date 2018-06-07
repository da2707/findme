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
	    	<div class="col-md-8">
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
    		<div class="row" id="search-wrapper">
    			<div class="col-md-12">
    				<span>※선택하지 않은 조건은</span>
    				<span id="condition">'전체'</span>
    				<span>로 검색됩니다.</span>
    			</div>
    		</div>
			<div class="row" id="search-wrapper">
				<div class="col-md-1">
					<span>▶ 지역</span>
				</div>
				<div class="col-md-11">
					<input type="checkbox" name="area" id="1" value="1">
					<label for="1">서울</label>
					<input type="checkbox" name="area" id="2" value="2">
					<label for="2">부산</label>
					<input type="checkbox" name="area" id="3" value="3">
					<label for="3">인천</label>
					<input type="checkbox" name="area" id="4" value="4">
					<label for="4">대구</label>
					<input type="checkbox" name="area" id="5" value="5">
					<label for="5">대전</label>
					<input type="checkbox" name="area" id="6" value="6">
					<label for="6">광주</label>
					<input type="checkbox" name="area" id="7" value="7">
					<label for="7">울산</label>
					<input type="checkbox" name="area" id="8" value="8">
					<label for="8">경기</label>
					<input type="checkbox" name="area" id="9" value="9">
					<label for="9">경북</label>
					<input type="checkbox" name="area" id="10" value="10">
					<label for="10">경남</label>
				</div>
			</div> <!-- 지역 -->
			<div class="row" id="search-wrapper">
				<div class="col-md-1">
					<span>▶ 학력</span>
				</div>
				<div class="col-md-5">
					<select>
						<option value="">선택</option>
					</select>
					<span>~</span>
					<select>
						<option value="">선택</option>
					</select>
				</div>
				<div class="col-md-6">
					<input type="checkbox" name="nograduate" id="nograduate">
					<label for="nograduate">학력 무관</label>
				</div>
			</div><!-- 학력 -->
			<div class="row" id="search-wrapper">
				<div class="col-md-1">
					<span>▶ 경력</span>
				</div>
				<div class="col-md-1">
					<input type="checkbox" name="career" id="career1" value="1">
					<label for="career1">신입</label>
				</div>
				<div class="col-md-1">
					<input type="checkbox" name="career" id="career2" value="2">
					<label for="career2">경력</label>
				</div>
				<div class="col-md-3">
					<select>
						<option value="">선택</option>
					</select>
					<span>~</span>
					<select>
						<option value="">선택</option>
					</select>
				</div>
				<div class="col-md-6">
					<input type="checkbox" name="nocareer" id="nocareer">
					<label for="nocareer">경력 무관</label>
				</div>
			</div><!-- 경력 -->
			<div class="row" id="search-wrapper">
				<div class="col-md-1">
					<span>▶ 연봉</span>
				</div>
				<div class="col-md-5">
					<select>
						<option value="">선택</option>
					</select>
					<span>~</span>
					<select>
						<option value="">선택</option>
					</select>
				</div>
				<div class="col-md-3">
					<input type="checkbox" name="salary" id="salary1" value="1">
					<label for="salary1">면접 후 결정</label>
				</div>
				<div class="col-md-3">
					<input type="checkbox" name="salary" id="salary2" value="2">
					<label for="salary2">회사 내규에 따름</label>
				</div>
			</div>
			<div class="row" id="searchbutton">
				<div class="col-md-12" align="center">
					<div id="findjob">
						<a class="btn btn-default" href="#">
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
				<div class="col-md-12">
					<table class="table table-hover">
						<tr class="info">
							<th>기업명</th>
							<th>제목</th>
							<th>지원자격</th>
							<th>근무조건</th>
							<th>마감일/등록일</th>
							<th>캘린더 등록</th>
						</tr>
						<tr>
							<td>(주)라인플러스</td>
							<td>2018 LINE 각 부문별 상시채용</td>
							<td>신입/경력 학력 무관</td>
							<td>정규직/인턴직</td>
							<td>~05/31(목)</td>
							<td><a role="button" href="#">캘린더 등록</a></td>
						</tr>
						<tr>
							<td>(주)비자파크</td>
							<td>[ 여행사 ] 여행사, 번역外 정규직 채용</td>
							<td>신입  대학 졸업(2,3년)이상</td>
							<td>정규직(수습기간)-3개월</td>
							<td>~08/13(월)</td>
							<td><a role="button" href="#">캘린더 등록</a></td>
						</tr>
						<tr>
							<td>(주)드림시드</td>
							<td>건축 과장, 차장급 모집</td>
							<td>경력 7년 이상, 대학 졸업(2,3년)이상</td>
							<td>정규직</td>
							<td>~06/27(수)</td>
							<td><a role="button" href="#">캘린더 등록</a></td>
						</tr>
						<tr>
							<td>아덴</td>
							<td>호텔 스파 테라피스트 신입, 경력직 모집</td>
							<td>신입/경력 학력 무관</td>
							<td>정규직</td>
							<td>~06/12(화)</td>
							<td><a role="button" href="#">캘린더 등록</a></td>
						</tr>
						<tr>
							<td>(주)제이더블유씨네트웍스</td>
							<td>[생산팀] 조립 경력무관 채용</td>
							<td>경력 무관 고졸 이상</td>
							<td>정규직</td>
							<td>~08/26(일)</td>
							<td><a role="button" href="#">캘린더 등록</a></td>
						</tr>
					</table>
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
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">구직 일정 관리</h4>
	      </div>
	      <div id="schedulebody" class="modal-body">
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary">Save changes</button>
	      </div>
	    </div>
	  </div>
	</div>
    
    <script>

    
    	$(document).ready(function() {
    		
    		$('div#cal').fullCalendar({
	            header: {
	                left: 'prev,next today',
	                center: 'title',
	                right: 'month,agendaWeek,agendaDay'
	            },
	            monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
	            monthNamesShort: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
	            dayNames: ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"],
	            dayNamesShort: ["일","월","화","수","목","금","토"],
	            editable: true, // 수정 가능 여부
				events: "list.json",
    			timeFormat: '(YYYY-MM-DD)', // 날짜 정보 설정

	            eventDrop: function( event, delta, revertFunc, jsEvent, ui, view ) {
	            	if (delta._days != 0) {
						batchModifyDate(event.recruitNo, delta._days);
	            	}
	            },
	            
	            eventResize: function(event, delta, revertFunc, jsEvent, ui, view) {
	            	console.log(event);
	            },
	            
	            
    			eventClick: function(calEvent, jsEvent, view) {
    				eventDetail(calEvent);
    				
    				// 캘린더 일정 클릭 시 자동 버튼 클릭 이벤트 발생
    				$("#schedule").trigger("click", function() {
    				});

    			    // change the border color just for fun
    			    $(this).css('border-color', 'red');
	   			  }
    		});
    	});
    	
    	// 캘린더 이벤트 클릭 시 상세 데이터 출력
    	function eventDetail(calEvent) {  
    		var title = calEvent.title + " : " + calEvent.name;
   		
    		$("#myModalLabel").text(title);

    		var html = "";
    		html += "<form id='scheduleForm'>";
   			html += "	<div class='container-fluid'>";
			html += "		<div class='row'>";
			html += "			<div class='col-md-2'>";
			html += "				<strong>접수 시작 / 마감일</strong>";
			html += "			</div>";
			html += "			<div class='col-md-4'>";
			html += "				<span>";
			html += 					moment(calEvent.start).format('YYYY-MM-DD');
			html += "				</span>";
			html += "				<span> ~ </span>";
			html += "				<span>";
			html += 					moment(calEvent.end).format('YYYY-MM-DD');
			html += "				</span>";
			html += "			</div>";
			html += "		</div>";
			html += "	</div>";
			html += "</form>";
			
    		
// 			html += "서류 접수    : " + calEvent.apply + "<br>";
// 			html += "지원 일자    : " + calEvent.regDate + "<br>";
// 			html += "현재 상태    : " + calEvent.codeNo + "<br>";
// 			html += "최종 단계    : " + calEvent.finalRound + "<br>";
// 			html += "합격 여부    : " + calEvent.result + "<br>";
// 			html += "공고 링크    : " + calEvent.link + "<br>";
			
			$("#schedulebody").html(html);
    	}
    	
    	
    	// 드래그로 날짜 일괄 업데이트 함수
    	function batchModifyDate(recruit, day) {
    		$.ajax({
    			url: "updateBatchDate.json",
    			type: "POST",
    			data: {recruitNo : recruit, days : day},
    			success: function() {
    				alert("정상 수정");
    			}
    		});
    	}
    </script>
</body>
</html>