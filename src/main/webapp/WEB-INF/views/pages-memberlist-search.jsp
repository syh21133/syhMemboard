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

	<title>Member List-Search</title>

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

					<li class="sidebar-item">
						<a class="sidebar-link" href="mView?mId=${mId}">
              <i class="align-middle" data-feather="user"></i> <span class="align-middle">내정보</span>
            </a>
					</li>

					<li class="sidebar-item">
						<a class="sidebar-link" href="mLogout">
              <i class="align-middle" data-feather="log-out"></i> <span class="align-middle">로그아웃</span>
            </a>
					</li>

					<li class="sidebar-item ">
						<a class="sidebar-link" href="bList">
              <i class="align-middle" data-feather="coffee"></i> <span class="align-middle">게시판</span>
            </a>
					</li>
					<c:if test="${mId eq 'admin'}">
							<li class="sidebar-header">관리자</li>


							<li class="sidebar-item  active"><a class="sidebar-link"
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
				
				<div class="row">
						<div>
							<div class="card flex-fill">
								<div class="card-header">

									<h5 class="card-title mb-0">게시판</h5>
				<form action="mSearch" method="get" style="float:right">
		
			<select name="limit" >
				<option value="5">5개씩</option>
				<option value="10">10개씩</option>
				<option value="20">20개씩</option>
			</select>
			<input type="hidden" name="page" value="${paging.page}">
			<input type="hidden" name="category" value="${paging.category}">
			<input type="hidden" name="keyword" value="${paging.keyword}">
			
			<input type="submit" value="선택"/>
</form>
									
								</div>
							<table class="table table-hover my-0">
								<thead>
									<tr>
										<th>아이디</th>
										<th class="d-none d-xl-table-cell">이름</th>
										<th class="d-none d-xl-table-cell">생년월일</th>
										<th  class="d-none d-md-table-cell">성별</th>
										
										

									</tr>
								</thead>

								<tbody>
									<c:forEach var="list" items="${mList}">
										<tr>
											<td class="d-none d-xl-table-cell"><a href="mView?mId=${list.MId}">${list.MId}</a></td>
											<td class="d-none d-xl-table-cell">${list.MName}</td>
											<td class="d-none d-xl-table-cell">${list.MBirth}</td>
											<td class="d-none d-xl-table-cell">${list.MGender}</td>
										</tr>
									</c:forEach>
									
								</tbody>
								<tr>
			
			<th colspan="5" style="text-align:center">
				
		
		
	<c:if test="${paging.page <=1}"> <a class="btn btn-secondary">〈이전</a></c:if>
	<c:if test="${paging.page > 1}"><a href="mSearch?category=${paging.category}&keyword=${paging.keyword}&page=${paging.page-1}&limit=${paging.limit}" class="btn btn-secondary" >〈이전</a></c:if>
	
	
	<c:forEach var="b" begin="${paging.startPage}" end="${paging.endPage}" step="1">
		<c:choose>
		
			<c:when test="${paging.page eq b}"> <a class="btn btn-secondary">${b}</a> </c:when>
			
			
			<c:otherwise>
				<a href="mSearch?category=${paging.category}&keyword=${paging.keyword}&page=${b}&limit=${paging.limit}" class="btn btn-secondary">${b}</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	
	<c:if test="${paging.page >= paging.maxPage}"> <a class="btn btn-secondary"> 다음〉</a>
	
	</c:if>
	<c:if test="${paging.page < paging.maxPage}">
	<a href="mSearch?category=${paging.category}&keyword=${paging.keyword}&page=${paging.page+1}&limit=${paging.limit}" class="btn btn-secondary"> 다음〉</a>
	
	</c:if>
			

				<form action="mSearch" method="GET">
				
				<!-- 카테고리 -->
				<select name="category">
					<option value="MNAME">이름</option>				
					<option value="MID">아이디</option>				
					<option value="MPHONE">연락처</option>				
				</select>
				
				<!-- 검색어 -->
				<input type="text" name="keyword"/>
				
				<!-- 검색버튼 -->
				<input type="submit" class="btn btn-secondary" value="검색"/>	
				
				
				</form>
				
								
	
	</th>
		</tr>
							</table>
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
	<script>
		function bWrite(){
			
			if(${mid != null}){
				location.href='bWriteForm'
			} else{
				alert('로그인 후 이용해주세요.');
				location.href="#";
			}
		}
	</script>
</body>


</html>