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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user/userpage.css">
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
                        <li class="" role="presentation"><a href="${pageContext.request.contextPath}/schedule/schedule.do">MyCalendar</a></li>
                        <li class="" role="presentation"><a href="${pageContext.request.contextPath}/resume/list.do">MyResume</a></li>
                        <li class="" role="presentation"><a href="${pageContext.request.contextPath}/mystat/chart.do">MyStat</a></li>
                        <li class="" role="presentation"><a href="${pageContext.request.contextPath}/studyroom/video.do">StudyRoom</a></li>
                        <li class="" role="presentation"><a href="${pageContext.request.contextPath}/recruiting/hireInfo.do">Recruiting</a></li>
                    </ul>
                    <p class="navbar-text navbar-right actions">
	                    <a data-toggle="modal" href="#login" class="navbar-link login" data-target="#login">Log In</a>
	                    <a href="${pageContext.request.contextPath}/user/signupForm.do" 
	                       class="navbar-link signup btn btn-default action-button">Sign Up</a>
                    </p>
            	</div>
    		</div>
    	</nav>
    </div>
    
    <!-- 회원가입 파트 시작 -->
<form name="mForm" class="form-horizontal" method="POST" 
	  action="${pageContext.request.contextPath}/user/signup.do"
	  onsubmit="return doAction()">
    <div class="container" id="container" style="width: 70%" >
    <div class="container small">
    	<br><br><br><br><br><br>
	    <h1>Sign up</h1><br>
	    <div>
		    <input class="form-control" id="id" name="id" type="text" placeholder="ID"><span style="color:red" id="result"></span><br><br>
		    <input class="form-control" id="pw" name="pw" type="password" placeholder="Password"><br>
		    <input class="form-control" id="pw-check" type="password" placeholder="Re-type Password"><br>
		    <input class="form-control" id="name" name="name" type="text" placeholder="Name"><br>
		    <input class="form-control" id="email" name="email" type="email" placeholder="Email"><br>
			    <div align="center" style='margin-bottom: 10px;'>
			    	<input type="checkbox" id="terms" name="terms" value="1" />
					<a data-toggle="modal" data-target="#termModal" href="#">이용약관</a>에 동의합니다.<br>
		    	</div>
			<button id="signupBtn" class="btn btn-primary btn-block" type="submit">Sign up</button>
		</div>
    </div>
	</div>
</form>    

<script>
	$("#id").keyup(function () {
		$.ajax({
			url : "${pageContext.request.contextPath}/user/idCheck.json",
			data : "id=" + this.value,
			dataType : "json",
			success : function(no) {
				console.log(no);
				var result = "사용 가능한 아이디 입니다.";
				if(no == 1) {
					result = "중복된 아이디 입니다.";
				}
				$("#result").text(result);
			}
		})
	});

	$("#signupBtn").click(function doAction() {
		if($("#id").val()==''){
			alert("아이디를 입력하세요.")
			return false;
		} else if ($("#pw").val()==''){
			alert("비밀번호를 입력하세요.")
			return false;
		} else if ($("#pw-check").val()==''){
			alert("비밀번호를 다시 입력하세요.")
			return false;
		} else if ($("#name").val()==''){
			alert("이름을 입력하세요.")
			return false;
		} else if ($("#email").val()==''){
			alert("이메일을 입력하세요.")
			return false;
		} else if ($("#pw").val() != $("#pw-check").val()){
			alert("비밀번호 재입력을 확인해주세요.")
			return false;
		} else if (!$("#terms").is(":checked")){			
			alert("약관 동의에 체크해주세요.")
			return false;
		} else {
			alert("회원가입이 완료되었습니다.")
			return true;
		}
	});
</script>

	<!-- 이용약관 -->
	<div id="termModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">이용약관</h4>
	      </div>
	      <div class="modal-body" id="modal-body">
	      	<br>
제1조 (목적 등) <br>
1. 이 서비스 약관은 회원이 Findme(이하 ""회사"")에서 제공하는 인터넷 사이트 Findme 서비스(이하 ""서비스"")를 이용함에 있어 회사와 회원 간의 권리, 의무 및 책임사항 등을 규정함을 목적으로 합니다.
2. 회원이 되고자 하는 이용자가 회사가 정한 소정의 절차를 거쳐서 ""동의"" 버튼을 누르면 본 약관에 동의하는 것으로 간주합니다. 본 약관에 정하는 이외의 회사와 회원의 권리, 의무 및 책임사항에 관해서는 전기통신사업법 기타 대한민국의 관련 법령과 상관습에 의합니다.
<br>
제2조 (회원의 정의) <br>
회원이란 회사가 제공하는 서비스에 접속하여 본 약관에 따라 회원으로 가입하여 서비스를 제공받는 자를 말합니다.
<br>
제3조 (서비스 이용 계약) <br>
1. 회원 가입을 희망하는 이용자는 회사가 정한 가입 양식에 따라 회원정보를 기입하고 ""동의"" 버튼을 누르는 방법으로 회원 가입을 신청합니다.
2. 회사는 제1항과 같이 회원으로 가입을 신청한 자가 다음 각 호에 해당하지 않는 한 신청한 자를 회원으로 등록합니다.
- 등록 내용에 허위, 기재누락, 오기가 있는 경우
- 제6조 제2항에 해당하는 회원 자격 제한 및 정지, 상실을 한 경험이 있었던 경우
- 기타 회원으로 등록하는 것이 회사의 서비스 운영 및 기술상 현저히 지장이 있다고 판단되는 경우
3. 회원가입계약의 성립시기는 회사의 승낙이 가입신청자에게 도달한 시점으로 합니다.
4. 회원은 제1항의 회원정보 기재 내용에 변경이 발생한 경우, 즉시 변경사항을 정정하여 기재하여야 합니다.
<br>
제4조 (서비스의 제공 및 변경)<br>
1. 회사는 회원에게 아래와 같은 서비스를 제공합니다.
- Findme 서비스
- 회사가 자체 개발하거나 다른 회사와의 협력계약 등을 통해 회원들에게 제공할 일체의 서비스
2. ""서비스제공자""는 그 변경될 서비스의 내용 및 제공일자를 제7조 제2항에서 정한 방법으로 이용자에게 통지하고, 제1항에 정한 서비스를 변경하여 제공할 수 있습니다.
<br>
제5조 (서비스의 중단) <br>
1. 회사는 컴퓨터 등 정보통신설비의 보수점검/교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있고, 새로운 서비스로의 교체 기타 ""서비스제공자""가 적절하다고 판단하는 사유에 기하여 현재 제공되는 서비스를 완전히 중단할 수 있습니다. 
2. 제1항에 의한 서비스 중단의 경우에는 ""서비스제공자""는 제7조 제2항에서 정한 방법으로 ""회원""에게 통지합니다. 다만, 회사가 통제할 수 없는 사유로 인한 서비스의 중단(시스템 관리자의 고의. 중과실이 없는 시스템 장애 또는 다운 등)으로 인하여 사전 통지가 불가능한 경우에는 그러하지 아니합니다.
<br>
제6조 (회원 탈퇴 및 자격 상실 등)<br> 
1. 회원은 회사에 언제든지 자신의 회원등록 정보를 말소해 줄 것(회원 탈퇴)을 요청할 수 있으며 회사는 위 요청을 받은 즉시 해당 회원의 정보 말소를 위한 절차를 시행합니다. 
2. 회원이 다음 각 호의 사유에 해당하는 경우, 회사는 회원의 자격을 적절한 방법으로 제한 및 정지, 상실시킬 수 있습니다. 
- 허위 내용을 등록한 경우 
- 다른 사람의 서비스 이용을 방해하거나 그 정보를 도용하는 등 전자거래질서를 위협하는 경우 
- 서비스를 이용하여 법령과 본 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우 
3. 회사가 회원의 회원자격을 상실시키기로 결정한 경우에는 회원등록 정보를 말소합니다.
4. 이용자가 서비스 이용 도중 12개월 이상 로그인 기록이 없는 경우, 회사는 해당 회원의 자격을 상실시킬 수 있습니다. 
<br>
제7조 (회원에 대한 통지) <br>
1. 회사가 특정 회원에게 서비스에 관한 통지를 하는 경우 회원정보에 등록된 메일주소를 사용할 수 있습니다.
2. 회사가 불특정다수 회원에 대한 통지를 하는 경우 7일 이상 공지사항 게시판 혹은 관련 서비스 게시판에 게시함으로써 개별 통지에 갈음할 수 있습니다. 
<br>
제8조 (회원의 개인정보) <br>
1. 회사는 ""정보통신망 이용촉진 및 정보보호 등에 관한 법률 (2016.7.25)""에 의거하여 회원으로 가입 시 아이디, 비밀번호, 닉네임, 이메일, 가입인증정보를 필수적인 개인정보로 입력 받습니다.
<br>
제9조 (회사의 의무)<br>
1. 회사는 법령과 본 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 본 약관이 정하는 바에 따라 지속적이고, 안정적으로 서비스를 제공하기 위해서 노력합니다. 
2. 회사는 회원이 안전하고 편리하게 서비스를 이용할 수 있도록 시스템을 구축합니다.
3. 회사는 회원이 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다. 
4. 회사는 회원이 서비스를 이용함에 있어 회원에게 법률적인 증명이 가능한 고의 또는 중대한 과실을 입힐 경우 이로 인한 손해를 배상할 책임이 있습니다.
<br>
제10조 (회원의 ID 및 비밀번호에 대한 의무)<br>
1. 회사가 관계법령, 『개인정보 보호법』에 의해서 그 책임을 지는 경우를 제외하고, 자신의 ID와 비밀번호에 관한 관리책임은 각 회원에게 있습니다.
2. 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다. 
3. 회원은 자신의 ID 및 비밀번호를 도난 당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 회사에 통보하고 회사의 안내가 있는 경우에는 그에 따라야 합니다.
<br>
제11조 (회원의 의무)<br>
1. 회원은 다음 각 호의 행위를 하여서는 안됩니다.
- 회원가입신청 또는 변경 시 허위내용을 등록하는 행위 
- 회사 및 제3자의 지적재산권을 침해하거나 회사의 권리와 업무 또는 제3자의 권리와 활동을 방해하는 행위
- 다른 회원의 ID를 도용하는 행위
- 관련 법령에 의하여 전송 또는 게시가 금지되는 정보(컴퓨터 프로그램 등)의 게시 또는 전송하는 행위
- 회사의 직원 또는 서비스의 관리자를 가장하거나 타인의 명의를 도용하여 정보를 게시, 전송하는 행위
- 컴퓨터 소프트웨어, 하드웨어, 전기통신 장비의 정상적인 가동을 방해, 파괴할 목적으로 고안된 소프트웨어 바이러스, 기타 다른 컴퓨터 코드, 파일, 프로그램을 포함하고 있는 자료를 게시하거나 전송하는 행위
- 스토킹(stalking) 등 다른 회원을 괴롭히는 행위
- 다른 회원에 대한 개인정보를 그 동의 없이 수집, 저장, 공개하는 행위
- 불특정 다수의 자를 대상으로 하여 광고 또는 선전을 게시하거나 음란물을 게시하는 행위
- 회사가 제공하는 서비스에 게시된 공지사항 규정을 위반하는 행위
2. 제1항에 해당하는 행위를 한 회원이 있을 경우 회사는 본 약관 제6조 제2, 3항에서 정한 바에 따라 회원의 회원자격을 적절한 방법으로 제한 및 정지, 상실시킬 수 있습니다.
3. 회원은 그 귀책사유로 인하여 회사나 다른 회원이 입은 손해를 배상할 책임이 있습니다.
<br>
제12조 (공개게시물의 삭제)<br>
1. 회원의 공개게시물의 내용이 다음 각 호에 해당하는 경우 회사는 회원에게 사전 통지 없이 해당 공개게시물을 삭제할 수 있고, 해당 회원의 회원 자격을 제한, 정지 또는 상실시킬 수 있습니다.
- 다른 회원 또는 제3자를 비방하거나 중상 모략으로 명예를 손상시키는 내용
- 공서양속에 위반되는 내용의 정보, 문장, 도형 등을 유포하는 내용
- 범죄행위와 관련이 있다고 판단되는 내용
- 다른 회원 또는 제3자의 저작권 등 기타 권리를 침해하는 내용
- 기타 관계 법령에 위배된다고 판단되는 내용 
- 종교적, 정치적 분쟁을 야기하는 내용으로서, 이러한 분쟁으로 인하여 회사의 업무가 방해되거나 방해되리라고 판단되는 경우
2. 회원의 공개게시물로 인한 법률상 이익 침해를 근거로, 다른 회원 또는 제3자가 회원 또는 회사를 대상으로 하여 민형사상의 법적 조치(예: 고소, 가처분신청, 손해배상청구소송)를 취하는 동시에 법적 조치와 관련된 게시물의 삭제를 요청해오는 경우, 회사는 동 법적 조치의 결과(예: 검찰의 기소, 법원의 가처분결정, 손해배상판결)가 있을 때까지 관련 게시물에 대한 접근을 잠정적으로 제한할 수 있습니다.
3. 정보통신망 이용촉진 및 정보보호 등에 관한 법률(이하 “정보통신망법”이라 합니다)의 규정에 의해 공개된 게시물 등이 본인의 사생활을 침해하거나 명예를 훼손하는 등 권리를 침해 받은 회원 또는 제3자(이하 “요청자”이라 합니다)는 그 침해사실을 소명하여 회사에 해당 게시물 등의 삭제를 요청할 수 있습니다. 회사는 해당 게시물 등의 권리 침해 여부를 판단할 수 없거나 당사자 간의 다툼이 예상되는 경우 해당 게시물 등에 대한 접근을 임시적으로 차단하는 조치(이하 “임시조치”라 합니다)를 최대 30일 취합니다.
4. 제3항에 의해 본인의 게시물 등이 임시조치된 회원(이하 “게시자”라 합니다)은 임시조치기간 중 회사에 해당 게시물 등을 복원해 줄 것을 요청(이하 “재 게시 요청”이라 합니다)할 수 있으며, 게시자의 재 게시 요청이 있는 경우 임시조치는 해제되고, 해당 사실은 게시자와 요청자에게 전달됩니다. 이후 요청자가 방송통신심의위원회, 법원 등 법률 기관에 의뢰하여 권리침해를 입증받은 후 이를 회사에 전달할 경우 해당 게시물 등은 삭제됩니다. 재 게시 요청이 없는 경우 해당 게시물 등은 임시조치 기간 만료 후 영구 삭제됩니다.
<br>
제13조 (저작권의 귀속 및 게시물의 이용)<br>
1. 회사가 작성한 저작물에 대한 저작권, 기타 지적재산권은 회사에 귀속합니다.
2. 회원은 서비스를 이용함으로써 얻은 정보를 회사의 사전승낙 없이 복제, 전송, 출판, 배포, 방송, 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.
3. 회원이 서비스 내에 게시한 게시물의 저작권은 게시한 회원에게 귀속됩니다. 단, 회사는 서비스의 운영, 전시, 전송, 배포, 홍보의 목적으로 회원의 별도의 허락 없이 무상으로 저작권법에 규정하는 공정한 관행에 합치되게 합리적인 범위 내에서 다음과 같이 회원이 등록한 게시물을 사용할 수 있습니다.
- 서비스 내에서 회원 게시물의 복제, 수정, 개조, 전시, 전송, 배포 및 저작물성을 해치지 않는 범위 내에서의 편집 저작물 작성
- 미디어, 통신사 등 서비스 제휴 파트너에게 회원의 게시물 내용을 제공, 전시 혹은 홍보하게 하는 것. 단, 이 경우 회사는 별도의 동의 없이 회원의 이용자ID 외에 회원의 개인정보를 제공하지 않습니다.
- 회사는 전항 이외의 방법으로 회원의 게시물을 이용하고자 하는 경우, 전화, 팩스, 전자우편 등의 방법을 통해 사전에 회원의 동의를 얻어야 합니다.
- 회원이 이용계약 해지를 한 경우 회원 본인 ID에 기록된 보관자료(스크랩, 쪽지 등)는 삭제됩니다.
<br>
제14조 (광고게재 및 광고주와의 거래)<br>
1. 회사가 회원에게 서비스를 제공할 수 있는 서비스 투자기반의 일부는 광고게재를 통한 수익으로부터 나옵니다. 회원은 회원이 등록한 게시물의 내용을 활용한 광고게재 및 기타 서비스상에 노출되는 광고게재에 대해 동의합니다.
2. 회사는 서비스상에 게재되어 있거나 서비스를 통한 광고주의 판촉활동에 회원이 참여하거나 교신 또는 거래를 함으로써 발생하는 손실과 손해에 대해 책임을 지지 않습니다.
<br>
제15조 (약관의 개정)<br>
1. 회사는 『약관의 규제 등에 관한 법률』, 『전자거래기본법』, 『전자서명법』, 『정보통신망이용촉진 및 정보보호 등에 관한 법률』 등 관련법을 위배하지 않는 범위에서 본 약관을 개정할 수 있습니다. 
2. 다만, 개정 내용이 회원에게 불리할 경우에는 적용일자 30일 이전부터 적용일자 전일까지 공지합니다. 
3. 회원은 변경된 약관에 대해 거부할 권리가 있습니다. 회원은 변경된 약관이 공지된 후 15일 이내에 거부의사를 표명할 수 있습니다. 회원이 거부하는 경우 회사는 당해 회원과의 계약을 해지할 수 있습니다. 만약 회원이 변경된 약관이 공지된 후 15일 이내에 거부의사를 표시하지 않는 경우에는 동의하는 것으로 간주합니다.
<br>
제16조 (재판관할)<br>
회사와 회원간에 발생한 서비스 이용에 관한 분쟁에 대하여는 대한민국 법을 적용하며, 본 분쟁으로 인한 소는 민사소송법상의 관할을 가지는 대한민국의 법원에 제기합니다.
<br>
(부칙)<br>
이 약관은 2015년 4월 24일부터 적용하고 이전의 모든 약관의 내용에 우선하여 적용됩니다.
	      	<br><br><br>
		  </div>
		  <br>
		    <button id="modal-submit" class="btn btn-primary btn-block" type="submit" data-dismiss="modal">확인</button>
	      <br>
	    </div>
	  </div>
	</div>
	
</body>
<script>

$("#loginBtn").click(function () {
	var id = $(this).siblings("input[name='id']").val();
	var pw = $(this).siblings("input[name='pw']").val();
	
	if(id=='') {
 		alert(sessionId);
 		
 		return false;
 	}  	
 	if(pw=='') {
 		alert("비밀번호를 입력하세요");
 		return false;
 	}
	
 	$.ajax({
 		url: `${pageContext.request.contextPath}/user/loginPost.json`,
 		data: {id : id, pw: pw},
 		type: "POST",
 		success: function(result){
 			if (result.startsWith("/")){
 				location.href = `${pageContext.request.contextPath}` + result;
 				return;
 			}
 			alert(result);
 		}
 		
 	});
});

</script>

</html>


















