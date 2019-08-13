<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
<table  width="1300px" style="margin-left: -90px;">
<c:forEach var="row" items="${list}">
  <tr  style="border-bottom: 1px solid #6B6357;">
    <td>${row.writer}
    (<fmt:formatDate value="${row.reg_date}" 	
      pattern="yyyy-MM-dd hh:mm:ss" />)<br>
      ${row.content}
    </td>
  </tr>
</c:forEach>
</table>
</div>
</body>
</html>