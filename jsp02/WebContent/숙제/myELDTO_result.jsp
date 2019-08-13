<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="member.MemberDTO" %>	
<%
MemberDTO dto=(MemberDTO)request.getAttribute("dto");
if(dto != null) {
	out.println("userid: "+dto.getUserid()+"<br>");
	out.println("name : "+dto.getName()+"<br>");
	out.println("email : "+dto.getEmail()+"<br>");
	out.println("hp : "+dto.getHp()+"<br>");
}else{
	out.println("출력할 값이 없습니다.");
}
%>


</body>
</html>