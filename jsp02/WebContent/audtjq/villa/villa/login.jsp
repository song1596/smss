<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="header.jsp" %>

 <c:if test="${param.message == 'error' }">
    <script>
      alert("아이디 또는 비밀번호가 일치하지 않습니다.")
    </script>
</c:if>
<c:if test="${param.message == 'logout' }">
    <script>
      alert("로그아웃되었습니다.");
    </script>
</c:if> 
<script src="../include/jquery-3.3.1.min.js"></script>

<style type="text/css">
body {
	font-family: sans-serif;
	background-image:url("img/45.jpg");
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
	<form class="box"  method="post" action="${path}/bbb/login.do">
		<h1>Login</h1>
		<input type="text" name="userid" id="userid" placeholder="id"> 
		<input type="password" name="passwd" id="passwd" placeholder="password"> 
		<input type="submit" name="" value="로그인">
	</form>
	
</body>
</html>