<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
	<meta name="author" content="AdminKit">
	<meta name="keywords" content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">

	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link rel="shortcut icon" href="resources/img/icons/icon-48x48.png" />

	<link rel="canonical" href="https://demo-basic.adminkit.io/pages-profile" />

	<title>My Profile-Modi</title>

	<link href="resources/css/app.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
</head>

<body>
	<div class="wrapper">
		<nav id="sidebar" class="sidebar js-sidebar">
			<div class="sidebar-content js-simplebar">
				<a class="sidebar-brand" href="index">
          <span class="align-middle">AdminKit</span>
        </a>

				<ul class="sidebar-nav">
					<li class="sidebar-header">
						메뉴
					</li>

					<li class="sidebar-item">
						<a class="sidebar-link" href="index">
              <i class="align-middle" data-feather="home"></i> <span class="align-middle">홈</span>
            </a>
					</li>

					<li class="sidebar-item active">
						<a class="sidebar-link" href="mView?mId=${mId}">
              <i class="align-middle" data-feather="user"></i> <span class="align-middle">내정보</span>
            </a>
					</li>

					<li class="sidebar-item">
						<a class="sidebar-link" href="mLogout">
              <i class="align-middle" data-feather="log-out"></i> <span class="align-middle">로그아웃</span>
            </a>
					</li>

					<li class="sidebar-item">
						<a class="sidebar-link" href="bList">
              <i class="align-middle" data-feather="coffee"></i> <span class="align-middle">게시판</span>
            </a>
					</li>
					
						<c:if test="${mId eq 'admin'}">
							<li class="sidebar-header">관리자</li>


							<li class="sidebar-item"><a class="sidebar-link"
								href="mList"> <i class="align-middle" data-feather="users"></i>
									<span class="align-middle">회원 목록</span>
							</a></li>
						</c:if>
					
					</nav>

		<div class="main">
			<nav class="navbar navbar-expand navbar-light navbar-bg">
				<a class="sidebar-toggle js-sidebar-toggle">
          <i class="hamburger align-self-center"></i>
        </a>


	<%@include file="../views/member.jsp" %>
			</nav>

			<main class="content">
				<div class="container-fluid p-0">

					<div class="mb-3">
						<h1 class="h3 d-inline align-middle">내정보</h1>
					</div>
					<div class="row">
						<div>
							<div class="card mb-3">
								<div class="card-header">
									<h5 class="card-title mb-0">프로필 사진</h5>
								</div>
								<form action="mModify" method="POST"  name="modiForm" enctype="multipart/form-data">
								<div class="card-body">
									<img src="resources/proFile/${modi.MProfileName}" alt="Christina Mason" class="img-fluid rounded-circle mb-2" width="128" height="128" />
									<input type="file" name="mProfile"> 
									<input type="hidden" name="mProfileName" value="${modi.MProfileName}"> </td>
								</div>
								<hr class="my-0" />
								<div class="card-body">
									<h5 class="h6 card-title">아이디</h5>
									<h5 class="h6 card-title1">${modi.MId}
									<input type="hidden" value="${modi.MId}" name="mId"></h5>
								</div>
								<hr class="my-0" />
								<div class="card-body">
									<h5 class="h6 card-title">비밀번호</h5>
									<input class="form-control form-control-lg" type="password" name="mPw"  id="mPw"
											 onkeyup="pwRegexp()" placeholder="비밀번호" />
											  <br/><span id="pwResult1"></span>
								</div>
								<div class="card-body">
									<h5 class="h6 card-title">비밀번호확인</h5>
									<input class="form-control form-control-lg" type="password" id="checkmPw" onkeyup="pwCheck()" placeholder="비밀번호 확인" />
										 <br/><span id="pwResult2"></span>
								</div>
								<hr class="my-0" />
								<div class="card-body">
									<h5 class="h6 card-title">이름</h5>
									<input class="form-control form-control-lg" type="text" name="mName" value="${modi.MName}" />
								</div>
								<hr class="my-0" />
								<div class="card-body">
									<h5 class="h6 card-title">생년월일</h5>
									<input class="form-control form-control-lg" type="date" name="mBirth" value="${modi.MBirth}"/>
								</div>
								<hr class="my-0" />
								<div class="card-body">
									<h5 class="h6 card-title">성별</h5>
									<br/>
											<div style="margin-left:20%">
											<c:choose>
											<c:when test="${modi.MGender=='남성'}">
											<input type="radio" name="mGender" value="남성" checked/>남성
											<input type="radio" name="mGender" value="여성"/>여성
											</c:when>
											<c:otherwise>
											<input type="radio" name="mGender" value="남성" />남성
											<input type="radio" name="mGender" value="여성" checked/>여성
											</c:otherwise>
											</c:choose>
										</div>
								</div>
								<hr class="my-0" />
								<div class="card-body">
									<h5 class="h6 card-title">이메일</h5>
									<input class="form-control form-control-lg" type="email" name="mEmail" value="${modi.MEmail}"/>
								</div>
								<hr class="my-0" />
								<div class="card-body">
									<h5 class="h6 card-title">연락처</h5>
									<input class="form-control form-control-lg" type="text" name="mPhone" value="${modi.MPhone}" /></h5>
								</div>
								<hr class="my-0" />
								<div class="card-body">
									<h5 class="h6 card-title">주소</h5>
									<input class="form-control form-control-lg" type="text" id="sample6_postcode" placeholder="우편번호" name="addr1">
											<input class="form-control form-control-lg" type="button" onclick="sample6_execDaumPostcode()"value="우편번호 찾기"><br>
											<input class="form-control form-control-lg" type="text" id="sample6_address" placeholder="주소" name="addr2"><br>
											<input class="form-control form-control-lg" type="text" id="sample6_detailAddress" placeholder="상세주소" name="addr3">
								</div>
								<br/>
								<div class="card-body text-center">
									<input type="button" onclick="checkConfirm()" class="btn btn-lg btn-primary" value="수정"></a>
									<input type="button" onclick="location.href='mView?mId=${mId}'" class="btn btn-lg btn-primary" value="취소"></a>
								</div>
							</form>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>

<script>
function pwRegexp(){
	let mPw = document.getElementById("mPw").value;
	let pwResult1 = document.getElementById("pwResult1");
	
	let num = mPw.search(/[0-9]/);
	let eng = mPw.search(/[a-z]/);
	let spe = mPw.search(/[`~!@#$%^&*|\\\'\":;\/?]/);
	let spc = mPw.search(/\s/);
	
	console.log('숫자 : ' + num);
	console.log('영어 : ' + eng);
	console.log('특문 : ' + spe);
	console.log('공백 : ' + spc);
	
	/* `~!@#$%^&*|\\\'\":;\/? */
	
	if(mPw.length < 8 || mPw.length > 16){
		pwResult1.style.color = "#ff0000";
		pwResult1.innerHTML = "비밀번호는 8자리에서 16자리 이내로 입력해주세요.";
		return false;
		
	} else if(spc != -1){
		pwResult1.style.color = "#ff0000";
		pwResult1.innerHTML = "비밀번호는 공백없이 입력해주세요.";
		return false;
	
	} else if(num < 0 || eng < 0 || spe < 0){
		pwResult1.style.color = "#ff0000";
		pwResult1.innerHTML = "영문, 숫자, 특수문자를 혼합하여 입력해주세요.";
		return false;
	
	} else {
		pwResult1.style.color = "#0000ff";
		pwResult1.innerHTML = "사용가능한 비밀번호 입니다.";
		return true;
	}
	

}
function pwCheck(){
	
	let mPw = document.getElementById("mPw").value;
	let checkmPw =document.getElementById("checkmPw").value;
	let pwResult2 = document.getElementById("pwResult2");
	
	console.log(mPw);
	console.log(checkmPw);
	
	
	if(mPw == checkmPw){
		pwResult2.style.color = "#0000ff";
		pwResult2.innerHTML = "비밀번호가 일치합니다.";
		return true;
	}else{
		pwResult2.style.color = "#ff0000";
		pwResult2.innerHTML = "비밀번호가 일치하지 않습니다.";
		return false;
	}
	
}

function checkConfirm(){
	if(pwRegexp() && pwCheck()){
		modiForm.submit();
	}else{
		alert('비밀번호를 확인하세요')
	}
}
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
								
							</div>
						</div>
					</div>

				</div>
			</main>

			<footer class="footer">
				<div class="container-fluid">
					<div class="row text-muted">
						<div class="col-6 text-start">
							<p class="mb-0">
								<a class="text-muted" href="https://adminkit.io/" target="_blank"><strong>AdminKit</strong></a> - <a class="text-muted" href="https://adminkit.io/" target="_blank"><strong>Bootstrap Admin Template</strong></a>								&copy;
							</p>
						</div>
						<div class="col-6 text-end">
							<ul class="list-inline">
								<li class="list-inline-item">
									<a class="text-muted" href="https://adminkit.io/" target="_blank">Support</a>
								</li>
								<li class="list-inline-item">
									<a class="text-muted" href="https://adminkit.io/" target="_blank">Help Center</a>
								</li>
								<li class="list-inline-item">
									<a class="text-muted" href="https://adminkit.io/" target="_blank">Privacy</a>
								</li>
								<li class="list-inline-item">
									<a class="text-muted" href="https://adminkit.io/" target="_blank">Terms</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>

	<script src="resources/js/app.js"></script>

</body>

</html>