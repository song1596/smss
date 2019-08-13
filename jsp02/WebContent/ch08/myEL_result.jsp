<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
사원번호 : ${sessionScope. number}<br>
이름 : ${sessionScope.name}<br>
직책 : ${sessionScope.job}<br>
부서: ${sessionScope.Department}<br>
입사일자 : ${sessionScope.employment}<br>
연봉 : ${sessionScope.lincome}<br>
</body>
</html>