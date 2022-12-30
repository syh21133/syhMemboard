<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
	<meta charset="UTF-8"/>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
	<script src="resources/sockjs.min.js"></script>
</head>
<style>
.testarea {
	overflow-y: scroll;
	width:auto; 
	height:300px;
	border:1px solid #3C2E22;
	}
</style>
<body>

	<div id="chat" class="testarea"></div>
	<form id="chatForm">
	<div style="display:flex">
		<input type="text" id="message" name="msg" class="form-control form-control-lg" required/>
		<button class="btn btn-secondary">send</button>
		</div>
	</form>
	
	<script>
	
	
	
		$(document).ready(function(){
			
			
			$("#chatForm").submit(function(event){
				event.preventDefault();
				sock.send($("#message").val());
				$("#message").val('').focus(); 
				
			
				
			});
			
			
		});
		
		var sock = new SockJS("/syh/echo");
		
		
		
		sock.onmessage = function(e){
			
			
			
			
			$("#chat").append("&nbsp"+e.data + "<br/>");
			$("#chat").scrollTop($("#chat")[0].scrollHeight);
			}
		
		
		sock.onclose = function(){
			$("#chat").append("연결 종료");
		}
		
	</script>
</body>
</html>