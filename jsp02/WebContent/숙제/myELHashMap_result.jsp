<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<%@ include file="../include/header.jsp" %>
<table>
<c:forEach var="row" items="${map}">
	<tr>
		<th>${row.key}</th>
		<td>&nbsp;${row.value}</td>
	</tr>
	<%-- ${row.key}: ${row.value}<br> --%>
</c:forEach>
</table>
</body>
</html>