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
	$("#btnWrite").click(function(){
		location.href="${path}/audtjq/villa/villa/write.jsp"
	})
});

$(function(){
	$("#btnindex").click(function(){
		location.href="${path}/audtjq/villa/villa/index.jsp"
	})
});  

function gb_search() {
	document.form1.action="${path}/board_servlet/search.do";
	document.form1.submit();
}
function list(page){
	location.href="${path}/board_servlet/list.do?curPage="+page;
}

</script>
<style>

</style>
</head>

<body style="background-color: white;">


<br>
<br>
<h2 style="font-size:36px; text-align:center;">자유 게시판</h2>
<br>
<br>
<div class="container">
<table class="table table-striped" style="text-align:center; border:1px solid #dddddd"> 
<thead>
<tr>
  <th style="background-color: #eeeeee; text-align: center;">번호</th>
  <th style="background-color: #eeeeee; text-align: center;">등록명</th>
  <th style="background-color: #eeeeee; text-align: center;">제목</th>
  <th style="background-color: #eeeeee; text-align: center;">등록날짜</th>
  <th style="background-color: #eeeeee; text-align: center;">조회수</th>
  <th style="background-color: #eeeeee; text-align: center;">첨부파일</th>
  <th style="background-color: #eeeeee; text-align: center;">다운로드</th>
</tr>
</thead>


<c:forEach var="dto" items="${list}">
<c:choose> 
  <c:when test="${dto.show == 'y'}">

<tr>
<td>${dto.num}</td>
<td>${dto.writer}</td>
<td>
</div>


<!-- 답글 들여쓰기 -->
<c:forEach var="i" begin="1" end="${dto.re_level}">
   &nbsp;&nbsp;	
</c:forEach>

<a href="${path}/board_servlet/view.do?num=${dto.num}">
${dto.subject}</a>
<!-- 댓글갯수 표시  -->
<c:if test="${dto.comment_count > 0}">
<span style="color:red;">(${dto.comment_count})</span>
</c:if>
</td>
<td>${dto.reg_date}</td>
<td>${dto.readcount}</td>

  <td align="center">
    <c:if test="${dto.filesize > 0}">
      <a href="${path}/board_servlet/download.do?num=${dto.num}">
       <img src="../images/file.gif">
      </a> 
  </c:if>
  </td>
  <td>${dto.down}</td>
</tr>
</c:when>
<c:otherwise>
 <%-- <tr>
   <td>${dto.num}</td>
   <td colspan="6" align="center">
     삭제된 게시물입니다.
   </td>
 </tr> --%>
</c:otherwise>
</c:choose>
</c:forEach>
</table>
<div style="text-align: center">
      <c:if test="${page.curPage > 1}">
        <a href="#" onclick="list('1')">[처음]</a>
      </c:if>
      <c:if test="${page.curBlock > 1}">
        <a href="#" onclick="list('${page.prevPage}')">[이전]</a>
      </c:if>
      <c:forEach var="num" begin="${page.blockStart}" 
      end="${page.blockEnd }">
        <c:choose>
          <c:when test="${num == page.curPage }">
            <span style="color:red">${num}</span>
          </c:when>
          <c:otherwise>
            <a href="#" onclick="list('${num}')">${num}</a>
          </c:otherwise>
        </c:choose>
      </c:forEach>
      <c:if test="${page.curBlock < page.totBlock }">
        <a href="#" onclick="list('${page.nextPage}')">[다음]</a>
      </c:if>
      <c:if test="${page.curPage < page.totPage}">
        <a href="#" onclick="list('${page.totPage}')">[끝]</a>
      </c:if>
      </div>
 <br>
 <br>
 
<div align="center">
<button id="btnWrite" class="btn btn-outline-primary col-sm-1">글쓰기</button>&emsp;
<button id="btnindex" class="btn btn-outline-primary col-sm-1">home</button>
</div>
<br>
<br>

<div align="center">

<form name="form1" id="form1" method="post">

<select name="searchkey" id="searchkey"> 

  <option value="writer" selected>이름</option>
  <option value="subject">제목</option>
  <option value="writer_subject">이름+제목</option>
  

</select> 
 <input name="search" id="search" value="${search}" autocomplete="off">
<button type="button" value="" onclick="gb_search()"  class="btn btn-outline-warning">조회</button>
</form>

</div>
 <footer class="section footer-section">
      <div class="container">
        <div class="row mb-4">
       </div>
        <div class="row bordertop pt-5">
          <p class="col-md-6 text-left" style="margin-left: -10px"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
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