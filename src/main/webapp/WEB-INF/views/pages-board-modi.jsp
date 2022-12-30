<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description"
	content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
<meta name="author" content="AdminKit">
<meta name="keywords"
	content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">

<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="shortcut icon" href="resources/img/icons/icon-48x48.png" />

<link rel="canonical"
	href="https://demo-basic.adminkit.io/pages-profile" />

<title>Board-Modi</title>

<link href="resources/css/app.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap"
	rel="stylesheet">
</head>

<body>
	<div class="wrapper">
		<nav id="sidebar" class="sidebar js-sidebar">
			<div class="sidebar-content js-simplebar">
				<a class="sidebar-brand" href="index"> <span
					class="align-middle">AdminKit</span>
				</a>

				<ul class="sidebar-nav">
					<li class="sidebar-header">메뉴</li>

					<li class="sidebar-item"><a class="sidebar-link" href="index">
							<i class="align-middle" data-feather="home"></i> <span
							class="align-middle">홈</span>
					</a></li>

					<li class="sidebar-item"><a class="sidebar-link"
						href="mView?mId=${mId}"> <i class="align-middle"
							data-feather="user"></i> <span class="align-middle">내정보</span>
					</a></li>

					<li class="sidebar-item"><a class="sidebar-link"
						href="mLogout"> <i class="align-middle" data-feather="log-out"></i>
							<span class="align-middle">로그아웃</span>
					</a></li>

					<li class="sidebar-item  active"><a class="sidebar-link"
						href="bList"> <i class="align-middle" data-feather="coffee"></i>
							<span class="align-middle">게시판</span>
					</a></li>
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
				<a class="sidebar-toggle js-sidebar-toggle"> <i
					class="hamburger align-self-center"></i>
				</a>


				<%@include file="../views/member.jsp"%>
			</nav>

			<main class="content">

				<div class="row">
					<div>
						<div class="card flex-fill">
							<div class="card-header">

								<h5 class="card-title mb-0">게시판</h5>

							</div>
							<form action="bModi" method="POST" enctype="multipart/form-data">
								<table class="table table-hover my-0">
									<thead>
										<tr>
											<th>No.${view.BNum} <input type="hidden" name="bNum"
												value="${modi.BNum}"></th>
											<th><input type="text" name="bTitle" value="${modi.BTitle}" class="form-control form-control-lg"></th>
											<th><input type="hidden" name="bWriter" value="${modi.BWriter}">${view.BWriter}</th>
											<th><input type="hidden" name="bDate" value="${modi.BDate}">${view.BDate}</th>
											<th><input type="hidden" name="bHit" value="${modi.BHit}">조회수 ${view.BHit}</th>
										</tr>
									</thead>

									<tbody>

										<tr>
											<th>내용</th>
											<td><img alt="image" src="resources/proFile/${view.BFileName}"> 
											<input type="hidden" name="bFileName" value="${modi.BFileName}">
												<input type="file" name="bFile"> <br />
											<br /> <textarea class="form-control" rows="10" name="bContent">${modi.BContent}</textarea></td>
										</tr>

									</tbody>
									<tfoot>
										<tr>
											<th colspan="5" style="text-align:center">
											<input class="btn btn-secondary" type="submit" value="수정">
												<input class="btn btn-secondary" type="reset" value="다시작성"></th>
										</tr>

									</tfoot>
									
								</table>
								</form>
						</div>
					</div>

				</div>
			</main>

			<footer class="footer">
				<div class="container-fluid">
					<div class="row text-muted">
						<div class="col-6 text-start">
							<p class="mb-0">
								<a class="text-muted" href="https://adminkit.io/"
									target="_blank"><strong>AdminKit</strong></a> - <a
									class="text-muted" href="https://adminkit.io/" target="_blank"><strong>Bootstrap
										Admin Template</strong></a> &copy;
							</p>
						</div>
						<div class="col-6 text-end">
							<ul class="list-inline">
								<li class="list-inline-item"><a class="text-muted"
									href="https://adminkit.io/" target="_blank">Support</a></li>
								<li class="list-inline-item"><a class="text-muted"
									href="https://adminkit.io/" target="_blank">Help Center</a></li>
								<li class="list-inline-item"><a class="text-muted"
									href="https://adminkit.io/" target="_blank">Privacy</a></li>
								<li class="list-inline-item"><a class="text-muted"
									href="https://adminkit.io/" target="_blank">Terms</a></li>
							</ul>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>

	<script src="resources/js/app.js"></script>
	<script>
		function bDel() {

			let conf = confirm('삭제 하시겠습니까?');

			if (conf) {
				alert("삭제 했습니다.")
				location.href = 'bDel?bNum=${view.BNum}';
			} else {
				alert('삭제 취소했습니다.')
			}
		}
	</script>

</body>

</html>