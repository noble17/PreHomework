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
	text-align : center; 
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
#messagestyle{
	font-family : 맑은 고딕;
	font-weight : bold;
	border : 2px solid black;
	border-radius : 20px;
	height : 50px;
	width : 250px;
	text-align : center; 
	display:table-cell;
	vertical-align:middle;
	padding-top: 30px;
	margin: 0px auto;
	position: absolute;
	top: 30%;
	left: 40%;
	color:yellow;
	background: black;
	opacity:0.7;
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
	   $('#btn').click(function() {

		   $('#fm').attr('action','insertBoard.do').submit();
	   });
	});
$(function(){
	   $('#messagestyle').click(function() {
		   $('#messagestyle').hide();
	   });
	});
$(function(){
	   $("input[value='수정']").click(function() {
	       
		   var name = "edit"+this.id;
		   $("form[name="+name+"]").attr('action','editPasswd.do').submit();
	   });
	});

$(function(){
	   $("input[value='삭제']").click(function() {
		   var name = "edit"+this.id;
		   $("form[name="+name+"]").attr('action','deleteTable.do').submit();
	   });
	});
</script>
<body>
	<div id="main_header">
		<h1>방   명   록</h1>
	</div>
	<div id="main_body">
	<div>
	${message}
	
	</div>
		<form id ="fm" name = "fm"  method="POST"><br>
			<b id="emailtext">이메일　: </b><input type="email"  id ="EMAIL"name="EMAIL" autofocus required placeholder="이메일"/>
			<b id="pwtext">비밀번호　: </b><input type="password" id = "PW" name="PW" required placeholder="패스워드" ><br><br>
			<textarea placeholder = "내용을 입력해주세요" rows= "7" cols = "50" id="CONTENTS" name="CONTENTS"> </textarea><br>
			<input type="button" id = "btn" class="button" value="방명록등록"  onmouseover='onMouseOver(this)' onmouseout='onMouseOut(this)'>
		</form>	
	</div>
	<div id = "main_footer">
	
	<br>
		<table  style="width:100%; word-break:break-all;">
         <thead>
            <tr>
               <th style= "width:15%">이메일</th>
               <th style= "width:45%">본문</th>
               <th style= "width:13%">글 등록시간</th>
               <th style= "width:13%">글 수정시간</th>
               <th >수 정</th>
               <th >삭 제</th>
            </tr>
         </thead>
         
         <tbody>
            <c:choose>
            <c:when test="${fn:length(list) > 0}">
               <c:forEach items="${list}" var="row">
               <form name="edit${row.ID}">
                  <input type="hidden" name ="ID" value="${row.ID}" >
                  <tr>
                  	<td>${row.email}</td>
                     <td>${row.contents}</td>
                     <td>${row.currentTime}</td>
                     <td>${row.modifyTime}</td>
                     <td><input type="button"  id="${row.ID}" value="수정" class="button" onmouseover='onMouseOver(this)' onmouseout='onMouseOut(this)'/></td>
                     <td><input type="button" id="${row.ID}" value="삭제" class="button" onmouseover='onMouseOver(this)' onmouseout='onMouseOut(this)'/></td>
                  </tr>
               </form>
               </c:forEach>
            </c:when>
            <c:otherwise>
               <tr>
                  <td colspan="6">조회된 결과가 없습니다.</td>
               </tr>
            </c:otherwise>
         </c:choose> 
         </tbody>
      </table>
    </div>
	
</body>
</html>