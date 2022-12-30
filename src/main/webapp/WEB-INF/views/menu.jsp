<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Menu</title>
</head>
<body>



		
        
        <c:choose>
        <c:when test="${mId eq 'admin'}">
        	<ul class="sidebar-nav">
					<li class="sidebar-header">
						메뉴
					</li>

					<li class="sidebar-item active">
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

					

					<li class="sidebar-item">
						<a class="sidebar-link" href="bList">
              <i class="align-middle" data-feather="coffee"></i> <span class="align-middle">게시판</span>
            </a>
					</li>
					<li class="sidebar-header">
					 관리자 
					</li>
        
					
					<li class="sidebar-item">
						<a class="sidebar-link" href="mList">
              <i class="align-middle" data-feather="users"></i> <span class="align-middle">회원 목록</span>
					</a>
					</li>
					
			</div>
			</c:when>
	
	
	<c:when test="${mId!=null}" >

				<ul class="sidebar-nav">
					<li class="sidebar-header">
						메뉴
					</li>

					<li class="sidebar-item active">
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

					

					<li class="sidebar-item">
						<a class="sidebar-link" href="bList">
              <i class="align-middle" data-feather="coffee"></i> <span class="align-middle">게시판</span>
            </a>
					</li>

			</div>
			</c:when>
			<c:otherwise>
			<ul class="sidebar-nav">
					<li class="sidebar-header">
						메뉴
					</li>

					<li class="sidebar-item active">
						<a class="sidebar-link" href="index">
              <i class="align-middle" data-feather="home"></i> <span class="align-middle">홈</span>
            </a>
					</li>
				<li class="sidebar-item">
						<a class="sidebar-link" href="pages-sign-in">
              <i class="align-middle" data-feather="log-in"></i> <span class="align-middle">로그인</span>
            </a>	
					</li>

					<li class="sidebar-item">
						<a class="sidebar-link" href="pages-sign-up">
              <i class="align-middle" data-feather="user-plus"></i> <span class="align-middle">회원가입</span>
            </a>
					</li>
					

					<li class="sidebar-item">
						<a class="sidebar-link" href="bList">
              <i class="align-middle" data-feather="coffee"></i> <span class="align-middle">게시판</span>
            </a>
					</li>

			</div>
			</c:otherwise>
	
	</c:choose>
		
		
</body>
</html>
