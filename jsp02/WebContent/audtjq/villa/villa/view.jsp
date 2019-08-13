<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title> 
<link rel="stylesheet" href="css/bootstrap.css">
<%@ include file="header.jsp" %>
<script src="../include/jquery-3.3.1.min.js">
</script>
<script type="text/javascript">
$(function(){
	comment_list();
	$("#btnSave").click(function(){
		comment_add();
	});
	$("#btnList").click(function(){
		location.href="${path}/board_servlet/list.do";
	});
	$("#btnReply").click(function(){
		document.form1.action="${path}/board_servlet/reply.do";
		document.form1.submit();
	});
	$("#btnEdit").click(function(){
		document.form1.action="${path}/board_servlet/pass_check.do";
		document.form1.submit();
	});
	
});

function comment_list(){
	$.ajax({
		url: "${path}/board_servlet/commentList.do",
		data: "num=${dto.num}",
		success: function(result){
			$("#commentList").html(result);
		}
	});
}

function comment_add(){
	var param="board_num=${dto.num}&writer="+$("#writer").val()
	+"&content="+$("#content").val();
	$.ajax({
		type: "post",
		url: "${path}/board_servlet/comment_add.do",
		data: param,
		success: function(){
			$("#writer").val("");
			$("#content").val("");
			comment_list();
		}
	});
}
</script>
<style type="text/css">
tr,td {padding: 10px;}	
</style>
</head>
<body style="background-color: white;">
<br>
<br>
<h2 style="font-size:36px; text-align:center;">상세화면</h2>
<br>
<br>
<div class="container">
<form name="form1" method="post">

<table  width="1300px" style="text-align:center;  margin-left:-90px;">
	<tr style="background-color: #eeeeee;">
		<td>날짜</td>
		<td>${dto.reg_date}</td>
		<td>조회수</td>
		<td>${dto.readcount}</td>
	</tr>
	<tr>
		<td>이름</td>
		<td colspan="3">${dto.writer}</td>
	</tr>
	<tr  style="background-color: #eeeeee;">
		<td>제목</td>
		<td colspan="3">${dto.subject}</td>
	</tr>
	<tr>
		<td>본문</td>
		<td colspan="3">${dto.content}</td>
	</tr>
	<tr  style="background-color: #eeeeee;">
		<td>비밀번호</td>
		<td colspan="3">
			<input type="password" name="passwd" id="passwd">
			<c:if test="${param.message == 'error' }">
				<span style="color:red;">
					비밀번호가 일치하지 않습니다.
				</span>
			</c:if>
		</td>
	</tr>
	<tr style="background-color: #FFEBCF;">
		<td>첨부파일</td>
		<td colspan="3">
			<c:if test="${dto.filesize > 0}">
				${dto.filename}( ${dto.filesize} bytes )
	<a href="${path}/board_servlet/download.do?num=${dto.num}">
	[다운로드]</a>
			</c:if>
		</td>
	</tr>
	<tr>
		<td colspan="4" align="center">
			<input type="hidden" name="num" value="${dto.num}">
			<input type="button"  class="btn btn-outline-primary col-sm-1" value="수정/삭제" id="btnEdit">
			<input type="button"  class="btn btn-outline-primary col-sm-1" value="답변" id="btnReply">
			<input type="button"  class="btn btn-outline-primary col-sm-1" value="목록" id="btnList">
		</td>
	</tr>
</table>
</form>
</div>
<br>	
<br>
<br>
<br>
<!-- 댓글 쓰기 폼 -->
<h4 style="font-size:30px; text-align:center;">댓글을 남겨주세요</h4>
<br>
<div class="container">
<table width="1300px" style="text-align:center;  margin-left: -100px;">
<thead>
<tr>
</tr>
</thead>
<br>
<br>
 <tr>
  <td><input id="writer" placeholder="이름"></td>
 </tr>
 <tr>
   <td><textarea rows="5" cols="80" 
   placeholder="내용을 입력하세요" id="content"></textarea></td>
 </tr>
 <tr>
	  <td rowspan="2">
	    <button id="btnSave"  class="btn btn-outline-primary col-sm-1" type="button">확인</button>
	  </td>
	  </tr>
</table>
</div>
<br>
<br>
<br>
<!-- 댓글 목록을 출력할 영역 -->
<div id="commentList">

</div>
 <footer class="section footer-section">
      <div class="container">
        <div class="row mb-4">
       </div>
        <div class="row bordertop pt-5">
          <p class="col-md-6 text-left" style="margin-left: -100px"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
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

	