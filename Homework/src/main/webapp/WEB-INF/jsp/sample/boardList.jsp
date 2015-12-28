<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>방명록</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
</head>
<style>
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
<script>
function onMouseOut(obj) {
	obj.style.color = "black";
}

function onMouseOver(obj) {
	obj.style.color = "red";
}


</script>
<body>
	<div id="main_header">
		<h1>방   명   록</h1>
	</div>
	<div id="main_body">
		<form action="" method="POST"><br>
			<b id="emailtext">이메일　: </b><input type="email" id="email" name="email" autofocus required placeholder="이메일">
			<b id="pwtext">비밀번호　: </b><input type="password" id="password" name="password" required placeholder="패스워드" ><br><br>
			<textarea placeholder = "" rows= "7" cols = "50" id="contents" name="contents"> </textarea><br>
			<input type="submit" class="button" value="방명록등록" onclick="openSignUpWnd()" onmouseover='onMouseOver(this)' onmouseout='onMouseOut(this)'>
		</form>	
	</div>
	<div id = "main_footer">
	</div>
</body>
</html>