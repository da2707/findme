<%@ page contentType="text/html; charset=UTF-8" %>
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
    <script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
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
                <div id="keyword" style="margin-top:32px;padding-top:10px;"><a href="${pageContext.request.contextPath}/recruiting/manageKey.do" id="keywordmng" style="margin:8px;font-size:20px;margin-left:27px;">키워드 관리</a>
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
                            <tr style="padding-top:0px;">
                                <td style="padding-top:35px;">80%</td>
                                <td style="padding-top:35px;">2018-05-18</td>
                                <td style="padding-top:35px;">(주)씨퍼스트코리아</td>
                                <td><br><a href="">엠스테이호텔 기흥 - 마케팅 신입, 경력(남,여)...</a>&nbsp;<a data-toggle="modal" data-target="#myModal">[요약보기]</a>[경기
                                    &gt; 용인시 기흥구] [호텔·여행·항공] [학력무관] [경력무관]<br><br></td>
                                <td style="padding-top:35px;">2018-06-17</td>
                            </tr>
                            <tr style="padding-top:0px;">
                                <td style="padding-top:35px;">30%</td>
                                <td style="padding-top:35px;">2018-05-18</td>
                                <td style="padding-top:35px;">포디믹스</td>
                                <td><br><a href="http://www.saramin.co.kr/zf_user/recruit/recruit-view/idx/33924758#utm_source=job-search-api&amp;utm_medium=api&amp;utm_campaign=saramin-job-search-api">주식회사 포디믹스에서 조형제작팀원을 구합니다. </a>&nbsp;<a href="https://cms1.ks.ac.kr/job/WorkSuburb/list.do?mCode=MN0050#n">[요약보기]</a>[경기
                                    &gt; [대전 > 중구] [디자인·설계] [대학교졸업(4년)이상] [경력1년↑]<br><br></td>
                                <td style="padding-top:35px;">2018-06-17</td>
                            </tr>
                            <tr style="padding-top:0px;">
                                <td style="padding-top:35px;">20%</td>
                                <td style="padding-top:35px;">2018-05-18</td>
                                <td style="padding-top:35px;">극단해오름</td>
                                <td><br><a href="http://www.saramin.co.kr/zf_user/recruit/recruit-view/idx/33924758#utm_source=job-search-api&amp;utm_medium=api&amp;utm_campaign=saramin-job-search-api">극단업무 및 공연스텝 모집</a>&nbsp;<a href="https://cms1.ks.ac.kr/job/WorkSuburb/list.do?mCode=MN0050#n">[요약보기]</a>[경기
                                    &gt; [인천 > 남구] [공연·예술·문화] [대학졸업(2,3년)이상] [경력무관]<br><br></td>
                                <td style="padding-top:35px;">2018-06-17</td>
                            </tr>
                            <tr style="padding-top:0px;">
                                <td style="padding-top:35px;">50%</td>
                                <td style="padding-top:35px;">2018-05-18</td>
                                <td style="padding-top:35px;">에이스파트너스</td>
                                <td><br><a href="http://www.saramin.co.kr/zf_user/recruit/recruit-view/idx/33924758#utm_source=job-search-api&amp;utm_medium=api&amp;utm_campaign=saramin-job-search-api">1553[중국,8-25년]자동차 전기장치 부품품질... </a>&nbsp;<a href="https://cms1.ks.ac.kr/job/WorkSuburb/list.do?mCode=MN0050#n">[요약보기]</a>[경기
                                    &gt; [서울 > 강남구] [네트워크·통신·모바일] [대학교졸업(4년)이상] [경력 8~16년]<br><br></td>
                                <td style="padding-top:35px;">2018-06-17</td>
                            </tr>
                            <tr style="padding-top:0px;">
                                <td style="padding-top:35px;">50%</td>
                                <td style="padding-top:35px;">2018-05-18</td>
                                <td style="padding-top:35px;">나주곰탕</td>
                                <td><br><a href="http://www.saramin.co.kr/zf_user/recruit/recruit-view/idx/33924758#utm_source=job-search-api&amp;utm_medium=api&amp;utm_campaign=saramin-job-search-api">송파 나주곰탕 본점에서 주방직원을 모집합니다</a>&nbsp;<a href="https://cms1.kr/job/WorkSuburb/list.do?mCode=MN0050#n">[요약보기]</a>[경기
                                    &gt; [서울 > 송파구] [외식업·식음료] [학력무관] [경력무관]<br><br></td>
                                <td style="padding-top:35px;">2018-06-17</td>
                            </tr>
                            <tr></tr>
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


</body>

</html>