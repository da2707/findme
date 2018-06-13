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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/link/link.css">
<script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
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
                        <li class="" role="presentation"><a href="${pageContext.request.contextPath}/mystat/chart.do">MyStat</a></li>
                        <li class="" role="presentation"><a href="${pageContext.request.contextPath}/studyroom/video.do">StudyRoom</a></li>
                        <li class="" role="presentation"><a href="${pageContext.request.contextPath}/recruiting/hireInfo.do">Recruiting</a></li>
                    </ul>
                    <p class="navbar-text navbar-right actions" id="guest">
	                    <a data-toggle="modal" href="#login" class="navbar-link login" data-target="#login">Log In</a>
	                    <a href="${pageContext.request.contextPath}/user/signup.do" 
	                       class="navbar-link signup btn btn-default action-button">Sign Up</a>
                    </p>
                    <p class="navbar-text navbar-right actions" id="member">
                    	${id}<span id="welcome" style="color:red;"> 님 환영합니다</span>&nbsp;&nbsp;&nbsp;
                    	<a href="${pageContext.request.contextPath}/user/logout.do" id="logout"
                    	   class="navbar-link login">Log out</a>
                    	<a href="${pageContext.request.contextPath}/user/mypage.do"
                    	   class="navbar-link signup btn btn-default action-button">My Page</a>
                    </p>
            </div>
    </div>
    </nav>
    </div>
		<div id="container" class="container">
			<ul class="nav nav-tabs">
                <li class=""  onclick="location.href='${pageContext.request.contextPath}/studyroom/video.do'"><a href="#tab-1" role="tab" data-toggle="tab">video</a></li>
                <li class="active" onclick="location.href='${pageContext.request.contextPath}/studyroom/link.do'"><a href="#tab-2" role="tab" data-toggle="tab">link</a></li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane active" role="tabpanel" id="tab-2">
				<div class="container">
				<div class="row">
					<div class="col-md-4">
						<h1 id="status">Useful Link</h1>
					</div>
					<div class="col-md-8"></div>
					<div class="col-md-12">
						<select name="category" id="sort" style="width: 150px; margin: 20px; margin-right: 0px; margin-left: 25px; margin-top: 20px;">
								<optgroup label="Category Sort">
									<option value="programming">programming</option>
									<option value="language">language</option>
									<option value="music">music</option>
									<option value="etc">etc</option>
								</optgroup>
						</select>
						<table class="tg">
						  <thead>	
						  	<tr>
							    <th class="tg-yw4l" style="width: 50px;">no</th>
							    <th class="tg-yw4l" style="width: 250px;">title</th>
							    <th class="tg-yw4l" style="width: 350px;">link</th>
							    <th class="tg-yw4l" style="width: 150px;">category</th>
							    <th class="tg-yw4l" style="width: 250px;">memo</th>
							    <th class="tg-yw4l" ></th>
							    <th class="tg-yw4l" ></th>
						    </tr>
						  </thead>
						  <tbody id="resultLink">
						  </tbody>
						</table>
					</div>
				</div>
					<div class="btn-group" role="group" id="statusbtn" style="margin-top: 100px;">
						<!-- Button trigger modal -->
						<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">등록</button>
					</div>
				</div>
				</div>
			</div>
		</div>
		
			<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
					<h4 class="modal-title" id="myModalLabel">Useful Link Collection</h4>
				</div>
				<div class="modal-body">
					<form id="linkForm">
							<input type='hidden' name='id' value='${sessionScope.id}' />
							Link Title : <input type="text" name="title" size="60" />
							<br><br> 
							Link URL(https://포함) : <textarea name='url' rows='5' cols='70'></textarea>
							<br><br>
							Category : <select name="category" style="width: 150px; margin: 20px; margin-right: 0px; margin-left: 25px; margin-top: 20px;">
								<optgroup label="Category Sort">
									<option value="programming">programming</option>
									<option value="language">language</option>
									<option value="music">music</option>
									<option value="etc">etc</option>
								</optgroup>
							</select>
							<br><br> 
							Memo : <br> 
							<textarea name='memo' rows='5' cols='70'></textarea>
							<br>
					</form>
				</div>
				<div id="modalFooter" class="modal-footer">
					<button type="button" id="closeModal" class="btn btn-default" data-dismiss="modal">Close</button>
					<input type="submit" value="Save changes" id="save" class="btn btn-primary">
				</div>
			</div>
		</div>
	</div>
<script>
	var sessionId = '${id}';
	console.log(sessionId);
	
	$(document).ready(function() {
		guestAndMember();
	});
	
	function hideNav() {
		if(sessionId == ''){
			$('.mynavbar').hide();
		} else {
			$('.mynavbar').show();
		}
	};
	
	function guestAndMember() {
		if(sessionId == ''){
			$("#member").hide();
		} else {
			$("#guest").hide();
		}
	};

	function linkList() {
		$.ajax({
			url : `${pageContext.request.contextPath}/studyroom/linkList.json`,
			success: makeLinkList
		});
	}
	
	linkList();
	
	$("#sort").change(function () {
			var id = ${sessionScope.id};
			var category = $("select[name='category']").val();
			console.log(id);
			console.log(category);
		$.ajax({
			url: `${pageContext.request.contextPath}/studyroom/linkListByCategory.json`,
			data: {id : id, category : category},
			dataType: "json",
			success: function(data) {
				makeLinkList(data);
			}
		});
	});
	
	function makeLinkList(data) {
		var html = '';
		for(var i=0; i<data.length; i++) {
// 			console.log(data[i].category);
// 			if(data[i].category=="") {
// 					html += 'Category에 해당하는 검색 결과가 없습니다.';
// 			}
			html += '<tr>';
			html += '	<td>' +data[i].no+ '</td>';
			html += '	<td>' +data[i].title+ '</td>';
			html += '	<td><a href="'+ data[i].url +'" target="_blank">' + data[i].url+ '</a></td>';
			html += '	<td>' +data[i].category+ '</td>';
			html += '	<td>' +data[i].memo+ '</td>';
			html += '		<td><button id="update" type="button" data-toggle="modal" data-target="#myModal" onclick="updateLinkForm(' + data[i].id + ',' + data[i].no + ')">수정</button></td>';
			html += '		<td><button id="delete" type="button" onclick="deleteLink(' + data[i].id + ',' + data[i].no + ')">삭제</button></td>';
			html += '</tr>';
		}
		$("#resultLink").html(html);
	}
	
	$("#save").click(function () {
		var serial = $("#linkForm").serialize();
		serial = decodeURIComponent((serial + '').replace(/\+/g, '%20'));
			$.ajax({
				url: `${pageContext.request.contextPath}/studyroom/linkInsert.json`,
				type: "POST",
				data: serial,
				dataType: "json",
				success: function (data) {
					$("#closeModal").trigger("click");
					makeLinkList(data);
				}
			});
	});

	function updateLinkForm(id, no) {
		
		$.ajax({
			url: `${pageContext.request.contextPath}/studyroom/linkUpdateForm.json`,
			data: {id : id, no : no},
			dataType: "json",
			success: function(data) {
				makeUpdate(data);
			}
		});
	}

	function makeUpdate(data) {
		var html ='';
		html += '<input type="hidden" name="id" value="' + data[0].id + '" />';
		html += '<input type="hidden" name="no" value="' + data[0].no + '" />';
		html += '	Link Title : <input type="text" name="title" size="60" value="' + data[0].title + '"/> <br>';
		html += '	<br><br> ';
		html += '	Link URL(https://포함) : <textarea name="url" rows="5" cols="70" >' + data[0].url + '</textarea><br>';
		html += '	<br><br>';
		html += '	Category : <select name="category">';
		html += '		<option value="' + data[0].category + '">' + data[0].category + '</option>';
		html += '		<option value="programming">programming</option>';
		html += '		<option value="language">language</option>';
		html += '		<option value="music">music</option>';
		html += '		<option value="etc">etc</option>';
		html += '			    </select>';
		html += '	<br><br> ';
		html += '	Memo : <br>';
		html += '	<textarea name="memo" rows="5" cols="70">'+ data[0].memo +'</textarea>';
		html += '	<br>';
		
		var htmlpart = '';
		htmlpart += '<div id="modalFooter" class="modal-footer">';
		htmlpart += '	<button type="button" id="closeModal" class="btn btn-default" data-dismiss="modal">Close</button>';
		htmlpart += '	<input type="submit" value="Save changes" id="updateLink" class="btn btn-primary">';
		htmlpart += '</div>';
		
		$("#linkForm").html(html);
		$("#modalFooter").html(htmlpart);
		
		$("#updateLink").click(function () { 
				console.dir("1 : " + $("#linkForm").serialize());

				var serial = $("#linkForm").serialize();
				serial = decodeURIComponent((serial + '').replace(/\+/g, '%20'));
					$.ajax({
						url: `${pageContext.request.contextPath}/studyroom/linkUpdate.json`,
						type: "POST",
						data: serial,
						dataType: "json",
						success: function (data) {
							$("#closeModal").trigger("click");
							makeLinkList(data);
						}
					});
		});
	}
	
	function deleteLink(id, no) {
		$.ajax({
			url: `${pageContext.request.contextPath}/studyroom/linkDelete.json`,
			data: {id : id, no : no},
			dataType: "json",
			success: function(data) {
				makeLinkList(data);
			}
		});
	};
	
</script>
</body>
</html>