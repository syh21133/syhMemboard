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

	<title>My Profile</title>

	<link href="resources/css/app.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
</head>
<style>
.cardtitle1 {
	color: #000000;
	font-size: .925rem;
	font-weight: 900;
}
</style>

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
								<div class="card-body">
									<img src="resources/proFile/${view.MProfileName}" alt="${view.MProfileName}" class="img-fluid rounded-circle mb-2" width="128" height="128" />
								</div>
								<hr class="my-0" />
								<div class="card-body">
									<h5 class="card-title">아이디</h5>
									<h5 class="h6 cardtitle1" >${view.MId}</h5>
								</div>
								<hr class="my-0" />
								<div class="card-body">
									<h5 class="card-title">이름</h5>
									<h5 class="h6 cardtitle1">${view.MName}</h5>
								</div>
								<hr class="my-0" />
								<div class="card-body">
									<h5 class="card-title">생년월일</h5>
									<h5 class="h6 cardtitle1">${view.MBirth}</h5>
								</div>
								<hr class="my-0" />
								<div class="card-body">
									<h5 class="card-title">성별</h5>
									<h5 class="h6 cardtitle1">${view.MGender}</h5>
								</div>
								<hr class="my-0" />
								<div class="card-body">
									<h5 class="card-title">이메일</h5>
									<h5 class="h6 cardtitle1">${view.MEmail}</h5>
								</div>
								<hr class="my-0" />
								<div class="card-body">
									<h5 class="card-title">연락처</h5>
									<h5 class="h6 cardtitle1">${view.MPhone}</h5>
								</div>
								<hr class="my-0" />
								<div class="card-body">
									<h5 class="card-title">주소</h5>
									<h5 class="h6 cardtitle1">${view.MAddr}</h5>
								</div>
								<br/>
								<div class="card-body text-center">
									<input type="button" onclick="location.href='mModiForm?mId=${view.MId}'" class="btn btn-lg btn-primary" value="수정"></a>
									<input type="button" onclick="Del()" class="btn btn-lg btn-primary" value="탈퇴"></a>
								</div>
								<script>
function Del(){
	
	let conf = confirm('탈퇴 하시겠습니까?');
	
	if(conf){
		alert("탈퇴 했습니다.")
		location.href='mDel?mId=${view.MId}&admin=${mId}';
	}else{
		alert('취소했습니다.')
	}
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