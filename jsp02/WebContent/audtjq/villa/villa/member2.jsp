<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../include/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function(){//페이지 로딩이 끝나면 자동으로 실행되는 코드
	list();//list()호출
	$("#btnSave").click(function(){
		insert();
	});
});
function insert(){
	var param="userid="+$("#userid").val();
	    +"&passwd="+$("#passwd").val();
	    +"&name="+$("#name").val();
	    +"&email="+$("#email").val();
	    +"&hp="+$("#hp").val();
	    +"&zipcode="+$("#zipcode").val();
	    +"&address1="+$("#address1").val();
	    +"&address2="+$("#address2").val();
	
	$.ajax({
		type: "post",
		url: "/jsp02/Aaa/join.do",
		data: param,
		success:function(){
			list();//회원목록 갱신
			//입력값 초기화
			$("#userid").val("");
			$("#passwd").val("");
			$("#name").val("");
			$("#email").val("");
			$("#hp").val("");
			$("#zipcode").val("");
			$("#address1").val("");
			$("#address2").val("");
		}
	});
}

function list(){
	$.ajax({
		type: "post",
		url: "/jsp02/Aaa/list.do",
		success: function(result){
			console.log(result);//F12 consol에서 응답text확인
			$("#memberList").html(result);
		}
	});
}
</script>
</head>  
<body>
<h2>회원관리</h2>
아이디 : <input id="userid">
비번 : <input type="password" id="passwd"><br>
이름 : <input id="name">
이메일 : <input id="email"><br>
핸드폰 : <input id="hp">
우편번호 : <input id="zipcode">
주소 : <input id="address1">
주소2 : <input id= "address2">
<button type="button" id="btnSave">추가</button>

<div id="member2List"></div>
</body>
</html>