<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
ArrayList<String> items=new ArrayList<>();
items.add("사원번호:001");
items.add("사원이름:홍길동");
items.add("직책 :대리");
items.add("부서 :전산");
items.add("입사일자 :2019년1월1일");
items.add("연봉 :3000만");
request.setAttribute("items", items);
%>
<jsp:forward page="myELArrayList_result.jsp"></jsp:forward>
<!--참고: forward와 sendRedirect 차이
forward : 주소고정, 대량의 데이터 전달가능, 컨택스트패스 포함
sendRedirect : 주소변경, 소량의 데이터, 컨택스트패스 추가해야 함
-->

</body>
</html>ss