<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Date date=new Date();
%>
<c:set var="str" value="1234" scope="page" />
<c:set var="str" value="kim" scope="request" />
<c:set var="str" value="김철수" scope="session" />
<c:set var="str" value="전산부" scope="application" />
<c:set var="date" value="<%=date%>"/>

page : ${pageScope.str}<br>
request : ${requestScope.str}<br>
session : ${sessionScope.str}<br>
application : ${applicationScope.str}<br>
<fmt:formatDate value="${date}" pattern="yyyy-MM-dd HH:mm:ss"/><br>
</body>
</html>