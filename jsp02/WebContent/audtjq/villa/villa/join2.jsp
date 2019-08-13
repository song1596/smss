<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="header.jsp" %>
<script src="../include/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function(){//페이지 로딩이 끝나면 자동으로 실행되는 코드
	list();//list()호출
	$("#btnSave").click(function(){
		insert();
	});
});

/* function insert(){
	var param="userid="+$("#userid").val()
	    +"&passwd="+$("#passwd").val()
	    +"&name="+$("#name").val()
	    +"&email="+$("#email").val()
	    +"&hp="+$("#hp").val();
	$.ajax({
		type: "post",
		url: "/jsp02/aaa/join.do",
		data: param,
		success:function(){
			list();
			$("#userid").val("");
			$("#passwd").val("");
			$("#name").val("");
			$("#email").val("");
			$("#hp").val("");
		}
	});
} */
</script>
<style type="text/css">
body {
	font-family: sans-serif;
	background-image:url("img/46.png");
	background-repeat: no-repeat;
	background-size: cover;
}
.box {
	opacity: .8;
	padding: 40px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background: #191919;
	text-align: center;
}

.box h1 {
	opacity: .8;
	color: white;
	text-transform: uppercase;
	font-weight: 500;
}

.box input[type="text"] {
	opacity: .8;
	border: 0;
	background: none;
	display: block;
	margin: 20px auto;
	text-align: center;
	border: 2px solid #3498db;
	padding: 14px 10px;
	width: 200px;
	outline: none;
	color: white;
	border-radius: 24px;
	transition: 0.25s;
}

.box input[type="password"] {
	opacity: .8;
	border: 0;
	background: none;
	display: block;
	margin: 20px auto;
	text-align: center;
	border: 2px solid #3498db;
	padding: 14px 10px;
	width: 200px;
	outline: none;
	color: white;
	border-radius: 24px;
	transition: 0.25s;
}

.box input[type="text"]:focus, .box input[type="password"]:focus {
	opacity: .8;
	width: 280px;
	border-color: #2ecc71;
}

.box input[type="submit"] {
	opacity: .8;
	border: 0;
	background: none;
	display: block;
	margin: 20px auto;
	text-align: center;
	border: 2px solid #2ecc71;
	padding: 14px 40px;
	width: 200px;
	outline: none;
	color: white;
	border-radius: 24px;
	transition: 0.25s;
	cursor: pointer;
}

.box input[type="submit"]:hover {
	opacity: .8;
	background: #2ecc71;
}

.box input[type="submit"]:hover {
	background: #2ecc71;
}
</style>
</head>
<body>
	<form class="box"  method="post" action="${path}/aaa/join.do">		
		<h1>회원가입</h1>
		<input type="text" name="userid" id="userid" placeholder="id"> 
		<input type="password" name="passwd" id="passwd" placeholder="password"> 
			<input type="text" name="name" id="name" placeholder="name"> 
			<input type="text" name="email" id="email" placeholder="email">
			<input type="text" name="hp" id="hp" placeholder="hp">
			<div class="form-group" style="text-align: center;"></div>
			<!-- <div class="btn-group" data-toggle="buttons">
			<label class="btn btn-primary active">
			<input type="radio" name="userGender" autocomplete="off" value="남자" checked>남자</label>
			<label class="btn btn-primary">
			<input type="radio" name="userGender" autocomplete="off" value="여자">여자</label>
			</div> -->
		<input type="submit" name="" value="완료">
	</form> 
</body>
</html>