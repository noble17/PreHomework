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
	height: 40px;
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
<script type="text/javascript">
$(function(){
	   $('#editbtn').click(function() {
		   $('#editdialog').attr('action','checkPasswd.do').submit();
	   });
	});
$(function(){
	   $('#close').click(function() {
		   $('#editdialog').attr('action','openBoardList.do').submit();
	   });
	});

</script>
<body>
	<div id="main_header">
		<h1>비 밀 번 호 입 력</h1>
	</div>
	<div id="main_body">
		 <div id = "form_dialog">
    		 <form id = "editdialog">
     			<div id= "styles">
     			<br><br>
     				<input type ="hidden" name = "ID" value="${row.ID}" />
     				비 밀 번 호 : <input type ="password" id= "passwd" name="passwd"/>
     				<input type = "button" id = "editbtn" value = "수정하기"/>
     				<input type = "button" id = "close" value = "취소하기"/>
     			</div>
     		</form>
   		 </div>
	</div>
	<div id = "main_footer">	</div>
	<br>
</body>
</html>