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

	<link rel="canonical" href="https://demo-basic.adminkit.io/pages-sign-in" />

	<title>Sign In</title>

	<link href="resources/css/app.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
</head>

<body>
	<main class="d-flex w-100">
		<div class="container d-flex flex-column">
			<div class="row vh-100">
				<div class="col-sm-10 col-md-8 col-lg-6 mx-auto d-table h-100">
					<div class="d-table-cell align-middle">
						<div style="text-align:right">
						
								<a class="btn btn-light"  href="index">메인페이지</a>
          						</div>
						<div class="text-center mt-4">
							<h1 class="h2">로그인</h1>
							<p class="lead">
								로그인 후 이용하실 수 있습니다.
							</p>
						</div>

						<div class="card">
							<div class="card-body">
								<div class="m-sm-4">
									
									<form action="mLogin" method="POST">
										<div class="mb-3">
											<label class="form-label">아이디</label>
											<input class="form-control form-control-lg" type="text" name="mId" placeholder="아이디 입력" />
										</div>
										<div class="mb-3">
											<label class="form-label">비밀번호</label>
											<input class="form-control form-control-lg" type="password" name="mPw" placeholder="비밀번호 입력" />
											<small>
            
          </small>
										</div>
										<div>
											<label class="form-check">
            <input class="form-check-input" type="checkbox" value="remember-me" name="remember-me" checked>
            <span class="form-check-label">
              Remember me next time
            </span>
          </label>
										</div>
										<div class="text-center mt-3">
											<!-- <a href="index" class="btn btn-lg btn-primary">Sign in</a> -->
											<input type="submit" class="btn btn-lg btn-primary" value="로그인">
											<input type="button" class="btn btn-lg btn-primary" value="회원가입" onclick="mJoin()">
										</div>
									</form>
									
								
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</main>

	<script src="resources/js/app.js"></script>
	<script>
	function mJoin(){
		alert('회원가입 페이지로 이동합니다.')
		location.href="pages-sign-up";
		
	}
	</script>

</body>

</html>