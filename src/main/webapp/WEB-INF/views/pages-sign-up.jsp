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

	<link rel="canonical" href="https://demo-basic.adminkit.io/pages-sign-up" />

	<title>Sign Up</title>

	<link href="resources/css/app.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
</head>
<style>
.form-control-lg2{
	border-radius: .3rem;
	font-size: .925rem;
	min-height: calc(2.1875rem + 2px);
	padding: .4rem 1rem
	margin: -.4rem -1rem;
	margin-inline-end: 1rem;
	padding: .4rem 1rem
	font-size: .925rem;
	min-height: calc(2.1875rem + 2px);
	padding: .4rem 1rem
	}
</style>

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
							<h1 class="h2">회원가입</h1>
							<p class="lead">
								회원가입 후 다양한 서비스를 즐겨보세요.
							</p>
						</div>

						<div class="card">
							<div class="card-body">
								<div class="m-sm-4">
									<form action="mJoin" name="joinForm" method="POST" enctype="multipart/form-data">
										<div class="mb-3">
											<label class="form-label">아이디</label>
											<input class="form-control form-control-lg" type="text" id="mId" name="mId" onkeyup="checkId()" placeholder="아이디" />
											<br/><span id="check1"></span></td>
										</div>
										<div class="mb-3">
											<label class="form-label">비밀번호</label>
											<input class="form-control form-control-lg" type="password" name="mPw"  id="mPw"
											 onkeyup="pwRegexp()" placeholder="비밀번호" />
											  <br/><span id="pwResult1"></span></td>
										</div>
										<div class="mb-3">
											<label class="form-label">비밀번호확인</label>
											<input class="form-control form-control-lg" type="password" id="checkmPw" onkeyup="pwCheck()" placeholder="비밀번호 확인" />
										 <br/><span id="pwResult2"></span></td>
										</div>
										<div class="mb-3">
											<label class="form-label">이름</label>
											<input class="form-control form-control-lg" type="text" name="mName" placeholder="이름" />
										</div>
										<div class="mb-3">
											<label class="form-label">생년월일</label>
											<input class="form-control form-control-lg" type="date" name="mBirth" />
										</div>
										<div class="mb-3">
											<label class="form-label">성별</label>
											<br/>
											<div style="text-align:center">
											<input type="radio" name="mGender" value="남성"/>남성
											<input type="radio" name="mGender" value="여성"/>여성
										</div>
										</div>
										<div class="mb-3">
											<label class="form-label">이메일</label>
											<div style="display:flex;">
												<input class="form-control form-control-lg" type="email"  id="mEmail" name="mEmail"/>
												<input type="button"  class="btn btn-lg btn-primary" value="인증번호 발송" style="float:right" onclick="checkEmail()"/>
												
										</div>
										<span id="confEmail"></span>
										</div>
										<div class="mb-3">
											<label class="form-label">연락처</label>
											<input class="form-control form-control-lg" type="text" name="mPhone" placeholder="연락처" />
										</div>
										<div class="mb-3">
											<label class="form-label">주소</label>
											<input class="form-control form-control-lg" type="text" id="sample6_postcode" placeholder="우편번호" name="addr1">
											<input class="form-control form-control-lg" type="button" onclick="sample6_execDaumPostcode()"value="우편번호 찾기"><br>
											<input class="form-control form-control-lg" type="text" id="sample6_address" placeholder="주소" name="addr2"><br>
											<input class="form-control form-control-lg" type="text" id="sample6_detailAddress" placeholder="상세주소" name="addr3">
										</div>
										<div class="mb-3">
											<label class="form-label">프로필 사진</label>
											<input class="form-control form-control-lg" type="file" name="mProfile"/>
										</div>
										<div class="text-center mt-3">
											<!-- <a href="index" class="btn btn-lg btn-primary">Sign up</a> -->
											<input type="button" class="btn btn-lg btn-primary" onclick="checkConfirm()" value="가입"> 
											<input type="button" class="btn btn-lg btn-primary" onclick="location.href='index'" value="취소"> 
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

</body>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<script>
function checkId(){
	 let mId = document.getElementById("mId").value;
	// location.href = "checkId?mId=" + mId;
	
	let check1 = document.getElementById("check1");
	
	
	$.ajax({
		type : "POST",
		url : "idoverlap",
		data : {
			"mId" : mId
		},
		
		dataType : "text",
		success : function(result){
			if(result == "OK"){
				check1.innerHTML="사용 가능한 아이디";
				check1.style.color = "#0000ff";
			}else{
				check1.innerHTML="사용 중인 아이디";
				check1.style.color = "#ff0000";
			}
		},
		error : function(){
			alert("idoverlap함수 통신실패")	
			
		}
	});
	
	
	
}
	
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
		
		
		
		/* if(checkId() && pwRegexp() && pwCheck()){
			joinForm.submit();
		}else if(!checkId()){
			alert('아이디 중복체크')
		}else{
		alert('비밀번호를 확인하세요')
		} */
		
		if(!pwRegexp() || !pwCheck()){
			
			alert('비밀번호를 확인해주세요!.');
			
		}  else if(!checkEmail2()){
			
			alert('이메일 인증을 진행해주세요.'); 
			
		}
		else {
			
			joinForm.submit();
		}
	}
	
	function checkEmail(){
		
	
		let mEmail = $("#mEmail").val();
		
		$.ajax({
			type:"POST",
			url:"mCheckEmail",
			data:{"mEmail" : mEmail},
			dataType:"text",
			success: function(uuid){
					
				console.log("이메일 인증번호1 : " + uuid);
				$("#confEmail").html("<br/><div style='display:flex'><input type='text' id='uuidCheck' class='form-control form-control-lg' placeholder='인증번호 입력'/>"
						+" <input type='hidden' value="+ uuid +" id='uuid' class='form-control form-control-lg'/>"
						+" <input type='button' value='인증' onclick='checkEmail2()' class='btn btn-lg btn-primary' /></div>");
			},
			error :function(){
				alert('이메일 인증 통신 실패');
			}
		});
		
	}
	function checkEmail2(){
		let uuid = $("#uuid").val();
		console.log("이메일 인증번호2 : " + uuid);
		
		let uuidCheck = $("#uuidCheck").val();
		console.log("입력한 인증번호 : " + uuidCheck);
		
		let boolUUID = false;
		
		if(uuidCheck==null || uuidCheck==""){
			
		}else if(uuid == uuidCheck){
			$("#confEmail").html("<br/><div style='display:flex'><input type='text' id='uuidCheck' class='form-control form-control-lg' value='"+uuid+"'/>"
					+" <input type='hidden' value="+ uuid +" id='uuid' class='form-control form-control-lg'/>"
					+" <input type='button' value='인증' onclick='checkEmail2()' class='btn btn-lg btn-primary' /></div>"
					+" <div class='text-primary'>&nbsp인증성공</div>");
			boolUUID = true;
		} else {
			$("#confEmail").html("<br/><div style='display:flex'><input type='text' id='uuidCheck' class='form-control form-control-lg' placeholder='인증번호 입력'/>"
					+" <input type='hidden' value="+ uuid +" id='uuid' class='form-control form-control-lg'/>"
					+" <input type='button' value='인증' onclick='checkEmail2()' class='btn btn-lg btn-primary' /></div>"
					+" <div class='text-danger'>&nbsp인증실패</div>");
		}
		
		return boolUUID;
		
		
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

</html>