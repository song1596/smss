<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
</head>
<body>
<%
session.setAttribute(" number", 001);
session.setAttribute("name", "김철수");
session.setAttribute("job", "대리");
session.setAttribute("Department", "전산");
session.setAttribute("employment", "2019년1월1일");
session.setAttribute("lincome", "3000만원");
%>
세션변수가 생성되었습니다.<br>
<a href="myEL_result.jsp">확인</a>
</body>
</html>