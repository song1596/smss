<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.css">
<%@ include file="header.jsp" %>
<script src="../include/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

$(function(){
	$("#btnSave").click(function(){
		document.form1.submit();
	});
});
</script>
<style type="text/css">
tr,td {padding: 10px;}
</style>
</head>
<body style="background-color: white;">
<br>
<br>
<h2 style="font-size:40px; text-align:center;"">글남기는 곳</h2>
<br>
<br>
<div class="container">
<form name="form1" method="post" 
action="${path}/board_servlet/insert.do" 
enctype="multipart/form-data">
<table  width="700px" style=" margin-left: 250px;">

 <tr style="background-color:#EFFFC2;">
   <td>이름</td>
   <td><input name="writer" id="writer"></td>
 </tr>
 <tr style="background-color: #eeeeee;">
   <td>제목</td>
   <td><input name="subject" id="subject" size="60"></td>
 </tr>
 <tr style="background-color: #eeeeee;">
   <td>본문</td>
   <td><textarea rows="5" cols="60" name="content" id="content">
   </textarea></td>
 </tr>
 <tr style="background-color: #DCC6FF">
   <td>첨부파일</td>
   <td><input type="file" name="file1"></td>
 </tr>
 <tr style="background-color: #eeeeee;">
   <td>비밀번호</td>
   <td><input type="password" name="passwd" id="passwd"></td>
 </tr>
 <tr>
   <td colspan="2" align="center">
     <input type="button" class="btn btn-outline-primary col-sm-1" value="확인" id="btnSave">
   </td>
 </tr>
</table>
</form>

 <footer class="section footer-section">
      <div class="container">
        <div class="row mb-4">
       </div>
        <div class="row bordertop pt-5">
          <p class="col-md-6 text-left" style="margin-left: 220px" ><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with by Chelsea
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
            
          <p class="col-md-6 text-right social">
         <a href="https://www.facebook.com/ChelseaFC/?eid=ARBrNJ4XmLEhyuXLiZPzjAcp-H6p9pi1jWxFL2rhQiNVrhoPznJ0bOtISxUuWfvjVJOY7xFt2iJ0rN0v"><span class="fa fa-facebook"></span></a>
            <a href="https://twitter.com/ChelseaFC_Korea"><span class="fa fa-twitter"></span></a>
          </p>
        </div>
      </div>
    </footer>
           

</body>
</html>