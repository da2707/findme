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
                        <li class="" role="presentation"><a href="${pageContext.request.contextPath}/mystat/main.do">MyStat</a></li>
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
    <div class="container" id="container">
        <div class="row" id="mCarousel">
            <div class="col-md-9">
                <div class="carousel slide" data-ride="carousel" id="carousel-1">
                    <div class="carousel-inner" role="listbox">
                        <div class="item active"><img class="slide" src="${pageContext.request.contextPath}/resources/images/leg1.jpg" alt="Slide Image"></div>
                        <div class="item"><img class="slide" src="${pageContext.request.contextPath}/resources/images/leg2.jpg" alt="Slide Image"></div>
                        <div class="item"><img class="slide" src="${pageContext.request.contextPath}/resources/images/leg3.jpg" alt="Slide Image"></div>
                    </div>
                    <div><a class="left carousel-control" href="#carousel-1" role="button" data-slide="prev"><i class="glyphicon glyphicon-chevron-left"></i><span class="sr-only">Previous</span></a><a class="right carousel-control" href="#carousel-1" role="button"
                            data-slide="next"><i class="glyphicon glyphicon-chevron-right"></i><span class="sr-only">Next</span></a></div>
                    <ol class="carousel-indicators">
                        <li data-target="#carousel-1" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-1" data-slide-to="1"></li>
                        <li data-target="#carousel-1" data-slide-to="2"></li>
                    </ol>
                </div>
            </div>
            <div class="col-md-3">
            	<ul class="list-unstyled" id="rankingList">
            		<li><strong>▶ 업체별 순위 ◀</strong></li>
                    <li>1위 - 삼성전자</li>
                    <li>2위 - LG전자</li>
                    <li>3위 - 대우전자</li>
                    <li>4위 - 현대자동차</li>
                    <li>5위 - 기아자동차</li>
                    <li>6위 - 구글</li>
                    <li>7위 - 네이버</li>
                    <li>8위 - 다음</li>
                    <li>9위 - 페이스북</li>
                    <li>10위 - 트위터</li>
                </ul>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6" id="shareList">
                <div id="shareListTitle">
                    <div id="leftTitle"><span>취업 정보 나눔 게시판</span></div>
                    <div id="leftLink"><span><a role="button" href="#">전체 보기</a></span></div>
                </div>
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr></tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>2018년도 상반기 삼성전자 공채 면접 팁</td>
                            </tr>
                            <tr>
                                <td>2018년도 상반기 구글 웹 개발자 구직 주요 정보</td>
                            </tr>
                            <tr>
                                <td>2018년도 비트 학원 강사 모집 정보</td>
                            </tr>
                            <tr>
                                <td>2018년도 자바 개발자 면접 팁</td>
                            </tr>
                            <tr>
                                <td>2018년도 프로그래머 면접 질문 족보</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col-md-6" id="recruitList">
                <div id="recruitListTitle">
                    <div id="rightTitle"><span>최근 취업 정보</span></div>
                    <div id="rightLink"><span><a role="button" href="#">전체 보기</a></span></div>
                </div>
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr></tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>(주)라인플러스 2018 LINE 각 부문별 상시채용</td>
                            </tr>
                            <tr>
                                <td>(주)비자파크 [ 여행사 ] 여행사, 번역外 정규직 채용</td>
                            </tr>
                            <tr>
                                <td>(주)드림시드 건축 과장, 차장급 모집</td>
                            </tr>
                            <tr>
                                <td>아덴 호텔 스파 테라피스트 신입, 경력직 모집</td>
                            </tr>
                            <tr>
                                <td>(주)제이더블유씨네트웍스  [생산팀] 조립 경력무관 채용</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    
   	<!-- Login -->
	<div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">Log in</h4>
	      </div>
	      <div class="modal-body">
		    <input class="form-control" type="text" placeholder="ID">
		    <input class="form-control" type="password" placeholder="Password"><br>
		    <button class="btn btn-primary btn-block" type="submit">Log In</button>
		  </div>
		  	<div class="naverimg">
			    <a href="#" class="forgot">Forgot your email or password?</a><br>
				<a id="naverIdLogin_loginButton" href="#" role="button">
					<img id="naverimg" src="https://static.nid.naver.com/oauth/big_g.PNG" width=200>
				</a>
		  	</div>
	    </div>
	  </div>
	</div>
	
</body>

</html>