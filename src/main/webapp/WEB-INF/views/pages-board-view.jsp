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

<title>Board-View</title>

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
							<table class="table table-hover my-0">
								<thead>
									<tr>
										<th>No.${view.BNum}</th>
										<th>${view.BTitle}</th>
										<th>${view.BWriter}</th>
										<th>${view.BDate}</th>
										<th>조회수 ${view.BHit}</th>
									</tr>
								</thead>

								<tbody>

									<tr>
										<th>내용</th>
										<td><img alt="image"
											src="resources/proFile/${view.BFileName}">
									
										<br/><br/>
										${view.BContent}

										</td>
									</tr>

								</tbody>
								<tfoot>
								<tr>
								<th colspan="5">
								<div style="float:right">
								<div class="btn-group me-2" role="group" aria-label="First group">
								<button onclick="location.href='bList'" style="float:right" class="btn btn-secondary">목록</button>
								</div>
								
								<c:choose>
								<c:when test="${mId eq view.BWriter || mId == 'admin'}">
								<div class="btn-group me-2" role="group" aria-label="Second group">
								<button onclick="location.href='bModiForm?bNum=${view.BNum}'"  class="btn btn-secondary">수정</button>
								</div>
								<div class="btn-group me-2" role="group" aria-label="Third group">
								<button onclick="bDel()"  class="btn btn-secondary">삭제</button>
								</div>
								</c:when>
								
								</c:choose>
								</div>
								</th>
								</tr>
								</tfoot>
							</table>
							<div>
			<input type="hidden" value="${mId}" id="cmtWriter"/>
			<input type="hidden" value="${view.BNum}" id="cbNum"/>
			<textarea class="form-control" rows="5" id="cmtContent" onkeyup="checkLogin()" style="resize: none;"></textarea>
			<div style="float:right">
			<button onclick="cmtWrite()"  class="btn btn-secondary">댓글 입력</button>
			</div>
		</div>
		<br/><br/>
		<div id="cmtArea">
		
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
	<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
	
	<script>
	
let cbNum = ${view.BNum};
	
	
	
	$.ajax({
		type : "POST",
		url : "comment/commentList",
		data : {
			"cbNum" : cbNum
		},
		dataType : "json",
		success : function(result){
			commentList(result)
		},
		error : function(){
			alert("댓글 불러오기 통신 실패")
		}
	});

	
	
	
	function commentList(list){
		
		let mId =  $("#cmtWriter").val();
		
		let output = "";
		
		output +=  "<table  class='table table-hover my-0'>";
		output +=  "<tr>";
		output +=  "<th>작성자</th>";
		output +=  "<th width='70%'>댓글</th>";
		output +=  "<th>작성일</th>";
		output +=  "</tr>";

		
		
		for(let i in list ){
			output +=  "<tr>";
			output +=  "<td><a href='#' data-bs-toggle='dropdown'><span class='text-dark'>"+list[i].cmtWriter+"</span></a>";
			output +=  "<div class='dropdown-menu dropdown-menu-end'><a class='dropdown-item' href='mybList?mId="+list[i].cmtWriter+"'>";
			output +=  "<i class='align-middle me-1' data-feather='help-circle'></i>작성글 보기</a><a class='dropdown-item' href='myCmt?mId="+list[i].cmtWriter+"'>";
			output +=  "<i class='align-middle me-1' data-feather='help-circle'></i>작성 댓글보기</a></div></td>";
			output +=  "<td>"+list[i].cmtContent+"</td>";
			output +=  "<td>"+list[i].cmtDate+"</td>";
			
			if(  mId == list[i].cmtWriter  ||  mId == 'admin'  )  {  
				
			output +=  "<td><div class='btn-group me-2' role='group' aria-label='First group'> <button onclick='cmtModiForm("+list[i].cmtNum+","+list[i].cbNum+")'  class='btn btn-secondary'>수정</button> </div>";	
			output +=  "<div class='btn-group me-2' role='group' aria-label='Second group'> <button onclick='cmtDel("+list[i].cmtNum+","+list[i].cbNum+")'  class='btn btn-secondary'>삭제</button> </div></td>";
			
			
			}else{
				output +=  "<td></td>"
			}
			output +=  "</tr>";
			
		}
		
		
		
		output += "</table>";
		
		document.getElementById("cmtArea").innerHTML = output;
		
	}
	function cmtDel(cmtNum,cbNum){
		if(${mId eq view.BWriter || mId eq 'admin'}){
			$.ajax({
				type : "POST",
				url : "comment/cmtDel",
				data: {
					"cbNum" : cbNum,
					"cmtNum" : cmtNum
				},
				dataType : "json",
				success : function(list){
					commentList(list);
					$("#cmtContent").val("");
				},
				error : function(){
					alert("댓글 삭제 통신 실패")
				}
				
			});
			
		}else{
			alert('다른 사용자입니다.')
		}
	}
	function cmtModiForm(cmtNum,cbNum){
		
			$.ajax({
				type : "POST",
				url : "comment/cmtModiForm",
				data: {
					"cbNum" : cbNum,
					"cmtNum" : cmtNum
				},
				dataType : "json",
				success : function(list){
					commentModi(list,cmtNum);
					
				},
				error : function(){
					alert("댓글 수정 통신 실패")
				}
				
			});
			
		
	}
	
	function commentModi(list,cmtNum){
		
		let mId =  $("#cmtWriter").val();
		
		let output = "";
		
		output +=  "<table class='table table-hover my-0'>";
		output +=  "<tr>";
		output +=  "<th>작성자</th>";
		output +=  "<th width='70%'>댓글</th>";
		output +=  "<th>작성일</th>";
		output +=  "</tr>";

		
		
		for(let i in list ){
			output +=  "<tr>";
			output +=  "<td>"+list[i].cmtWriter+"</td>";
			if(cmtNum == list[i].cmtNum)  {  	
			output +=  "<td><textarea class='form-control'rows='2'cols='10' id='cmtContent1' style='resize: none;'>"+list[i].cmtContent+"</textarea></td>";
			output +=  "<td>"+list[i].cmtDate+"</td>";
			output +=  "<td><div class='btn-group me-2' role='group' aria-label='First group'> <button onclick='cmtModi("+list[i].cmtNum+")'  class='btn btn-secondary'>수정</button> </div>";
			output +=  "<div class='btn-group me-2' role='group' aria-label='Second group'> <button onclick='cmtDel("+list[i].cmtNum+","+list[i].cbNum+")'  class='btn btn-secondary'>삭제</button> </div></td>";
			
			
			
			}else{
				output +=  "<td>"+list[i].cmtContent+"</td>";
				output +=  "<td>"+list[i].cmtDate+"</td>";
				output +=  "<td></td>";
			}
			output +=  "</tr>";
			
		}
		
		output += "</table>";
		
		document.getElementById("cmtArea").innerHTML = output;
		
	}
	
	function cmtModi(cmtNum){
		
		let cmtContent = $("#cmtContent1").val();
		
		console.log(cmtContent);
		
		
		$.ajax({
			type : "POST",
			url : "comment/cmtModi",
			data : {
				"cmtNum" : cmtNum,
				"cmtContent" : cmtContent
			},
			dataType : "json",
			success : function(result){
				commentList(result)
			},
			error : function(){
				alert("댓글 불러오기 통신 실패")
			}
		});
		
	}
	
	
	
	
	function cmtWrite(){
		
		if(${mId != null}){
			
		let cmtWriter = document.getElementById("cmtWriter").value;
		let cmtContent= $("#cmtContent").val();
		let cbNum= $("#cbNum").val();
		
		console.log(cmtWriter,cmtContent,cbNum);
		
		$.ajax({
			type: "POST",
			url : "comment/cmtWrite",
				data : {
					"cbNum" : cbNum,
					"cmtWriter" : cmtWriter,
					"cmtContent" : cmtContent
				},
				dataType : "json",
				success : function(list){
					commentList(list);
					$("#cmtContent").val("");
				},
				error : function(){
					alert("댓글 작성 통신 실패")
				}
			
			
		});
		
		}else{
			$("#cmtContent").val("");
			alert('로그인 후 이용해주세요.');
			location.href("#");
		}
		
	}
	
function bDel(){
	
	let conf = confirm('삭제 하시겠습니까?');
	
	if(conf){
		alert("삭제 했습니다.")
		location.href='bDel?bNum=${view.BNum}';
	}else{
		alert('삭제 취소했습니다.')
	}
}

</script>

</body>

</html>