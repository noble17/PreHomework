<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>방명록</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</head>
<style>
#form_dialog{
    width: 40%;
    background-color: black;
    height: 50%;
    margin: 0 auto;
    padding: 0 auto;
    position: absolute;
    left: 30%;
    top: 50%;
    
}
#styles{
	margin: 0 auto;
	padding: 0 auto;
	width:200px;
	height:30px;
	top: 50%;
	position:absolute;
}


#form_dialog{
    width: 40%;
    background-color: black;
    height: 50%;
    margin: 0 auto;
    padding: 0 auto;
    position: absolute;
    left: 30%;
    top: 50%;
    
}
#main_header {
	width : 99%;
	height : 80px;
	text-align : center;
	background-color : #669999;
	border-top-left-radius : 100px;
	border-top-right-radius : 100px;
	border-top : 5px solid gray;
	border-left : 5px solid gray;
	border-right : 5px solid gray;
}
#main_body {
	overflow: hidden;
	width : 99%;
	height : 240px;
	background-color : #B2CCFF;
	text-align : center;
	border : 2px solid black;
	border-left : 5px solid gray;
	border-right : 5px solid gray;
}

#main_footer {
	background-color : #B2CCFF;
	width : 99%;
	height : 625px;
	text-align : right; 
	border-bottom-left-radius : 100px;
	border-bottom-right-radius : 100px;
	border-left : 5px solid gray;
	border-right : 5px solid gray;
	border-bottom : 5px solid gray;
}
#email {
	border : 2px solid gray;
	border-radius : 5px;
	height : 20px;
}
#password {
	border : 2px solid gray;
	border-radius : 5px;
	height : 20px;
}
table, th, td {
	border:1px solid black;
	border-collapse:collapse;
}
.button {
	font-family : 맑은 고딕;
	font-weight : bold;
	background-color : #B2CCFF;
	border : 2px solid gray;
	border-radius : 20px;
	height : 30px;
	width : 100px;
	cursor : pointer;
}

</style>
<script type ="text/javascript">
function onMouseOut(obj) {
	obj.style.color = "black";
}

function onMouseOver(obj) {
	obj.style.color = "red";
}
$(function(){
	   $('#btn_mod').click(function() {	
		   $('#fm').attr('action','updateTable.do').submit();
	   });
	});

</script>
<body>
	<div id="main_header">
		<h1>수 정 하 기</h1>
	</div>
	<div id="main_body">
		<form id ="fm" name = "fm"  method="POST"><br>
			<b id="emailtext">이메일　: </b><input type="email"  disabled value = "${row.email}" autofocus required placeholder="이메일"/>
			<b id="pwtext">비밀번호　: </b><input type="password" name="PW" required placeholder="패스워드" ><br><br>
			<input type="hidden" name = "EMAIL" value="${row.email}">
			<textarea placeholder = "" rows= "7" cols = "50"id="CONTENTS" name="CONTENTS">${row.contents}</textarea><br>
			<input type="button" id = "btn_mod" class="button" value="수정완료"  onmouseover='onMouseOver(this)' onmouseout='onMouseOut(this)'>
			<input type ="hidden" name = "ID" value="${row.ID}" />	
		</form>	
	</div>
	<div id = "main_footer">
	</div>
	<br>
</body>
</html>