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
                <div id="keyword" style="margin-top:7px;padding-top:10px;"><button class="btn btn-default" type="button" data-toggle="modal" data-target="#myModal2" style="margin-left:34px;">키워드 수정</button></div>
                </div>
            </div>
            
            <c:if test="${listSize eq 0}">
           	 <td>등록된 키워드가 없습니다</td>
            </c:if>
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
           </div>
                 <form id="mForm" >
                <div class="modal fade" id="myModal" role="dialog" tabindex="-1">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                        <h4 class="modal-title">등록할 키워드를 선택하세요</h4>
                    </div>
                    <div class="modal-body" style="height:500px;">
                        <div class="col-md-12" style="height:500px;">
                            <div style="width:539px;margin-top:60px;">
                 <br>               
                                직종1 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select name="jobType1">
                                						<option>경영·사무</option>
                                						<option>영업·고객상담</option>
                                						<option>생산·제조</option>
                                						<option>IT·인터넷</option>
                                						<option>전문직</option>
                                						<option>교육</option>
                                						<option>미디어</option>
                                						<option>특수계층·공공</option>
                                						<option>건설</option>
                                						<option>유통·무역</option>
                                						<option>서비스</option>
                                						<option>디자인</option>
                                						<option>의료</option>
                                					   </select> <br>
                                직종2 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select name="jobType2">
                                						<option>경영·사무</option>
                                						<option>영업·고객상담</option>
                                						<option>생산·제조</option>
                                						<option>IT·인터넷</option>
                                						<option>전문직</option>
                                						<option>교육</option>
                                						<option>미디어</option>
                                						<option>특수계층·공공</option>
                                						<option>건설</option>
                                						<option>유통·무역</option>
                                						<option>서비스</option>
                                						<option>디자인</option>
                                						<option>의료</option>
                                					   </select> <br> <br>
                                지역1 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select name="location1">
                                					  	<option>서울</option>
                                					  	<option>경기</option>
                                					  	<option>광주</option>
                                					  	<option>대구</option>
                                					  	<option>부산</option>
                                					  	<option>울산</option>
                                					  	<option>인천</option>
                                					  	<option>강원</option>
                                					  	<option>경남</option>
                                					  	<option>경북</option>
                                					  	<option>전남</option>
                                					  	<option>전북</option>
                                					  	<option>충북</option>
                                					  	<option>충남</option>
                                					  	<option>제주</option>
                                					  </select> <br>
                                지역2 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select name="location2">
                                					  	<option>서울</option>
                                					  	<option>경기</option>
                                					  	<option>광주</option>
                                					  	<option>대구</option>
                                					  	<option>부산</option>
                                					  	<option>울산</option>
                                					  	<option>인천</option>
                                					  	<option>강원</option>
                                					  	<option>경남</option>
                                					  	<option>경북</option>
                                					  	<option>전남</option>
                                					  	<option>전북</option>
                                					  	<option>충북</option>
                                					  	<option>충남</option>
                                					  	<option>제주</option>
                                					  </select> <br> <br>
                                학력 :  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select name="education">
                                									<option>학력무관</option>
                                									<option>고등학교졸업</option>
                                									<option>대학졸업(2,3년)</option>
                                									<option>대학교졸업(4년)</option>
                                									<option>석사졸업</option>
                                									<option>박사졸업</option>
                                									<option>고등학교졸업이상</option>
                                									<option>대학교졸업(2,3년)이상</option>
                                									<option>대학교졸업(4년)이상</option>
                                									<option>석사졸업이상</option>
                                								  </select> <br>
                                경력 :  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select name="career">
                                								  	<option>1년이하</option>
                                								  	<option>1~3년</option>
                                								  	<option>3~6년</option>
                                								  	<option>6~9년</option>
                                								  	<option>10년이상</option>
                                								  </select> <br>
                                급여 :  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select name="salary">
                                								   <option>회사내규에 따름</option>
                                								   <option>1,400 만원 이하</option>
                                								   <option>1,400~1,600만원</option>
                                								   <option>1,600~1,800만원</option>
                                								   <option>1,800~2,000만원</option>
                                								   <option>2,000~2,200만원</option>
                                								   <option>2,200~2,400만원</option>
                                								   <option>2,400~2,600만원</option> 
                                								   <option>2,600~2,800만원</option> 
                                								   <option>2,800~3,000만원</option> 
                                								   <option>3,000~3,200만원</option> 
                                								   <option>3,200~3,400만원</option> 
                                								   <option>3,400~3,600만원</option> 
                                								   <option>3,600~4,800만원</option> 
                                								   <option>3,800~4,000만원</option> 
                                								   <option>4,000만원 이상</option> 
                                								   <option>면접 후 결정</option> 
                                								  </select> <br>
                                근무형태 : <select name="position">
                          	<option>정규직</option>      
                          	<option>계약직</option>      
                          	<option>병역특례</option>      
                          	<option>인턴직</option>      
                          	<option>아르바이트</option>      
                          	<option>파견직</option>      
                          	<option>해외취업</option>      
                          	<option>프리랜서</option>            
                          </select> <br>
                  		  <input type="hidden" name="id" value="${sessionScope.id}" style="margin-left:85px;"> <br>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                    <button class="btn btn-default" type="button" data-dismiss="modal" id="modalClose">Close</button>
                    <button class="btn btn-primary" type="button" id="insertKey">등록</button></div>
                </div>
            </div>
        </div>
                 </form>
    </div>
    
                 <form id="uForm">
                <div class="modal fade" id="myModal2" role="dialog" tabindex="-1">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                        <h4 class="modal-title">수정할 키워드를 선택하세요</h4>
                    </div>
                    <div class="modal-body" style="height:500px;">
                        <div class="col-md-12" style="height:500px;">
                            <div style="width:539px;margin-top:60px;">
                 <br>               
                                직종1 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select name="jobType1">
                                						<option>${recruiting.jobType1}</option>
                                						<option>경영</option>
                                						<option>사무</option>
                                						<option>영업</option>
                                						<option>고객상담</option>
                                						<option>생산</option>
                                						<option>제조</option>
                                						<option>IT</option>
                                						<option>인터넷</option>
                                						<option>전문직</option>
                                						<option>교육</option>
                                						<option>미디어</option>
                                						<option>특수계층</option>
                                						<option>공공</option>
                                						<option>건설</option>
                                						<option>유통</option>
                                						<option>무역</option>
                                						<option>서비스</option>
                                						<option>디자인</option>
                                						<option>의료</option>
                                					   </select> <br>
                                직종2 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select name="jobType2">
                                						<option>${recruiting.jobType2}</option>
                                						<option>경영</option>
                                						<option>사무</option>
                                						<option>영업</option>
                                						<option>고객상담</option>
                                						<option>생산</option>
                                						<option>제조</option>
                                						<option>IT</option>
                                						<option>인터넷</option>
                                						<option>전문직</option>
                                						<option>교육</option>
                                						<option>미디어</option>
                                						<option>특수계층</option>
                                						<option>공공</option>
                                						<option>건설</option>
                                						<option>유통</option>
                                						<option>무역</option>
                                						<option>서비스</option>
                                						<option>디자인</option>
                                						<option>의료</option>
                                					   </select> <br> <br>
                                지역1 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select name="location1">                                						
                                					  	<option>${recruiting.location1}</option>
                                					  	<option>서울</option>
                                					  	<option>경기</option>
                                					  	<option>광주</option>
                                					  	<option>대구</option>
                                					  	<option>부산</option>
                                					  	<option>울산</option>
                                					  	<option>인천</option>
                                					  	<option>강원</option>
                                					  	<option>경남</option>
                                					  	<option>경북</option>
                                					  	<option>전남</option>
                                					  	<option>전북</option>
                                					  	<option>충북</option>
                                					  	<option>충남</option>
                                					  	<option>제주</option>
                                					  </select> <br>
                                지역2 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select name="location2">
                                					  	<option>${recruiting.location2}</option>
                                					  	<option>서울</option>
                                					  	<option>경기</option>
                                					  	<option>광주</option>
                                					  	<option>대구</option>
                                					  	<option>부산</option>
                                					  	<option>울산</option>
                                					  	<option>인천</option>
                                					  	<option>강원</option>
                                					  	<option>경남</option>
                                					  	<option>경북</option>
                                					  	<option>전남</option>
                                					  	<option>전북</option>
                                					  	<option>충북</option>
                                					  	<option>충남</option>
                                					  	<option>제주</option>
                                					  </select> <br> <br>
                                학력 :  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select name="education">
                                									<option>${recruiting.education}</option>
                                									<option>학력무관</option>
                                									<option>고등학교졸업</option>
                                									<option>대학졸업(2,3년)</option>
                                									<option>대학교졸업(4년)</option>
                                									<option>석사졸업</option>
                                									<option>박사졸업</option>
                                									<option>고등학교졸업이상</option>
                                									<option>대학교졸업(2,3년)이상</option>
                                									<option>대학교졸업(4년)이상</option>
                                									<option>석사졸업이상</option>
                                								  </select> <br>
                                경력 :  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select name="career">
                                								  	<option>${recruiting.career}</option>
                                								  	<option>신입</option>
                                								  	<option>1년</option>
                                								  	<option>2년</option>
                                								  	<option>3년</option>
                                								  	<option>4년</option>
                                								  	<option>5년</option>
                                								  	<option>6년</option>
                                								  	<option>7년</option>
                                								  	<option>8년</option>
                                								  	<option>9년</option>
                                								  	<option>10년</option>
                                								  </select> <br>
                                급여 :  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select name="salary">
                                								   <option>${recruiting.salary}</option>
                                								   <option>회사내규에 따름</option>
                                								   <option>1,400 만원 이하</option>
                                								   <option>1,400~1,600만원</option>
                                								   <option>1,600~1,800만원</option>
                                								   <option>1,800~2,000만원</option>
                                								   <option>2,000~2,200만원</option>
                                								   <option>2,200~2,400만원</option>
                                								   <option>2,400~2,600만원</option> 
                                								   <option>2,600~2,800만원</option> 
                                								   <option>2,800~3,000만원</option> 
                                								   <option>3,000~3,200만원</option> 
                                								   <option>3,200~3,400만원</option> 
                                								   <option>3,400~3,600만원</option> 
                                								   <option>3,600~4,800만원</option> 
                                								   <option>3,800~4,000만원</option> 
                                								   <option>4,000만원 이상</option> 
                                								   <option>면접 후 결정</option> 
                                								  </select> <br>
                                근무형태 : <select name="position">
                          	<option>${recruiting.position}</option>      
                          	<option>정규직</option>      
                          	<option>계약직</option>      
                          	<option>병역특례</option>      
                          	<option>인턴직</option>      
                          	<option>아르바이트</option>      
                          	<option>파견직</option>      
                          	<option>해외취업</option>      
                          	<option>프리랜서</option>            
                          </select> <br>
                  		  <input type="hidden" name="id" value="${sessionScope.id}" style="margin-left:85px;"> <br>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer"><button class="btn btn-default" type="button" data-dismiss="modal" id="uModalClose">Close</button>
                    <button class="btn btn-primary" type="button" id="updateKey">수정</button></div>
                </div>
            </div>
        </div>
                 </form>
<script>
	var f = document.mForm;
	var uf = document.uForm;
	$("#insertKey").click(function(){
// 		if(f.jobType1.value == "") {
// 			alert("직종1을 입력하지 않았습니다");
// 			f.jobType1.focus();
// 		}
// 		else if(f.jobType2.value == "") {
// 			alert("직종2를 입력하지 않았습니다");
// 			f.jobType2.focus();
// 		}
// 		else if(f.location1.value == "") {
// 			alert("지역1을 입력하지 않았습니다");
// 			f.location1.focus();
// 		}
// 		else if(f.location2.value == "") {
// 			alert("지역2를 입력하지 않았습니다");
// 			f.location2.focus();
// 		}
// 		else if(f.education.value == "") {
// 			alert("학력을 입력하지 않았습니다");
// 			f.education.focus();
// 		}
// 		else if(f.career.value == "") {
// 			alert("경력을 입력하지 않았습니다");
// 			f.career.focus();
// 		}
// 		else if(f.salary.value == "") {
// 			alert("급여를 입력하지 않았습니다");
// 			f.salary.focus();
// 		}
// 		else if(f.position.value == "") {
// 			alert("근무형태를 입력하지 않았습니다");
// 			f.position.focus();
// 		}
// 		else {	
// 		}
			var formData = $("#mForm").serialize();
			console.log(formData);
			$.ajax({
				url: "insertKey.json",
				type: "POST",
				dataType: "json",
				data: formData,
				success: function(result){
					console.log(result);
					$("#modalClose").trigger("click", function() {
						
					});
					makeKeyword(result);
				}
				
			});
	})
	
	$("#updateKey").click(function(){
		var formData = $("#uForm").serialize();
		$.ajax({
			url:"updateKey.json",
			type: "POST",
			dataType: "json",
			data: formData,
			success: function(result){
				$("#uModalClose").trigger("click",function(){
					
				});
				makeKeyword(result);
			}
		});
		
		
	})
	
	function makeKeyword(result){
		var html = "";
html+='		<div class="table-responsive" style="width:700px;margin-left:24px;margin-top:26px;">                            '
html+='        <table class="table">                                                                                        '
html+='            <thead>                                                                                                  '
html+='                <tr>                                                                                                 '
html+='                    <th>직종</th>                                                                                      '
html+='                </tr>                                                                                                '
html+='            </thead>                                                                                                 '
html+='            <tbody>                                                                                                  '
html+='                <tr>                                                                                                 '
html+='                    <td>-'+result.jobType1+' &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;-'+result.jobType2+'</td> '
html+='                </tr>                                                                                                '
html+='                <tr></tr>                                                                                            '
html+='            </tbody>                                                                                                 '
html+='        </table>                                                                                                     '
html+='    </div>                                                                                                           '
html+='    <div class="table-responsive" style="width:700px;margin-left:24px;margin-top:26px;">                             '
html+='        <table class="table">                                                                                        '
html+='            <thead>                                                                                                  '
html+='                <tr>                                                                                                 '
html+='                    <th>근무지/지역</th>                                                                                  '
html+='                </tr>                                                                                                '
html+='            </thead>                                                                                                 '
html+='            <tbody>                                                                                                  '
html+='                <tr>                                                                                                 '
html+='                    <td>-'+result.location1+' &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;-'+result.location2+'</td>'
html+='                </tr>                                                                                                '
html+='                <tr></tr>                                                                                            '
html+='            </tbody>                                                                                                 '
html+='        </table>                                                                                                     '
html+='    </div>                                                                                                           '
html+='    <div class="table-responsive" style="width:700px;margin-left:24px;margin-top:26px;">                             '
html+='        <table class="table">                                                                                        '
html+='            <thead>                                                                                                  '
html+='                <tr>                                                                                                 '
html+='                    <th>학력</th>                                                                                      '
html+='                </tr>                                                                                                '
html+='            </thead>                                                                                                 '
html+='            <tbody>                                                                                                  '
html+='                <tr>                                                                                                 '
html+='                    <td>-'+result.education+'</td>                                                                '
html+='                </tr>                                                                                                '
html+='                <tr></tr>                                                                                            '
html+='            </tbody>                                                                                                 '
html+='        </table>                                                                                                     '
html+='    </div>                                                                                                           '
html+='    <div class="table-responsive" style="width:700px;margin-left:24px;margin-top:26px;">                             '
html+='        <table class="table">                                                                                        '
html+='            <thead>                                                                                                  '
html+='                <tr>                                                                                                 '
html+='                    <th>경력</th>                                                                                      '
html+='                </tr>                                                                                                '
html+='            </thead>                                                                                                 '
html+='            <tbody>                                                                                                  '
html+='                <tr>                                                                                                 '
html+='                    <td>-'+result.career+'</td>                                                                   '
html+='                </tr>                                                                                                '
html+='                <tr></tr>                                                                                            '
html+='            </tbody>                                                                                                 '
html+='        </table>                                                                                                     '
html+='    </div>                                                                                                           '
html+='    <div class="table-responsive" style="width:700px;margin-left:24px;margin-top:26px;">                             '
html+='        <table class="table">                                                                                        '
html+='            <thead>                                                                                                  '
html+='                <tr>                                                                                                 '
html+='                    <th>급여</th>                                                                                      '
html+='                </tr>                                                                                                '
html+='            </thead>                                                                                                 '
html+='            <tbody>                                                                                                  '
html+='                <tr>                                                                                                 '
html+='                    <td>-'+result.salary+'</td>                                                                   '
html+='                </tr>                                                                                                '
html+='                <tr></tr>                                                                                            '
html+='            </tbody>                                                                                                 '
html+='        </table>                                                                                                     '
html+='    </div>                                                                                                           '
html+='    <div class="table-responsive" style="width:700px;margin-left:24px;margin-top:26px;">                             '
html+='        <table class="table">                                                                                        '
html+='            <thead>                                                                                                  '
html+='                <tr>                                                                                                 '
html+='                    <th>근무형태</th>                                                                                    '
html+='                </tr>                                                                                                '
html+='            </thead>                                                                                                 '
html+='            <tbody>                                                                                                  '
html+='                <tr>                                                                                                 '
html+='                    <td>-'+result.position+'</td>                                                                 '
html+='                </tr>                                                                                                '
html+='                <tr></tr>                                                                                            '
html+='            </tbody>                                                                                                 '
html+='        </table>                                                                                                     '
html+='    </div>         '
$("#content").html(html);
	}                                                                                                                       
	
	
	
// 	function doAction() {
// 		if(f.jobType1.value == "") {
// 			alert("직종1을 입력하지 않았습니다")
// 			f.jobType1.focus()
// 			return false;
// 		}
// 		else if(f.jobType2.value == "") {
// 			alert("직종2를 입력하지 않았습니다")
// 			f.jobType2.focus()
// 			return false;
// 		}
// 		else if(f.location1.value == "") {
// 			alert("지역1을 입력하지 않았습니다")
// 			f.location1.focus()
// 		}
// 		else if(f.location2.value == "") {
// 			alert("지역2를 입력하지 않았습니다")
// 			f.location2.focus()
// 		}
// 		else if(f.education.value == "") {
// 			alert("학력을 입력하지 않았습니다")
// 			f.education.focus()
// 		}
// 		else if(f.career.value == "") {
// 			alert("경력을 입력하지 않았습니다")
// 			f.career.focus()
// 		}
// 		else if(f.salary.value == "") {
// 			alert("급여를 입력하지 않았습니다")
// 			f.salary.focus()
// 		}
// 		else if(f.position.value == "") {
// 			alert("근무형태를 입력하지 않았습니다")
// 			f.position.focus()
// 		}
// 		else {			
// 		alert("키워드 등록완료")
// 		return true;
// 		}
// 	}
</script>
</body>

</html>