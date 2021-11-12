<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#main{
width:400px;
height:460px;
padding:50px 20px 20px 0px;
margin-top:50px;
border : 1px  rgb(155, 155, 155) solid; 
border-radius: 5px;
 background-color: rgb(240, 240, 240);
}
input{
margin-bottom:10px; padding: 5px 25px 5px 25px;
}
label{
font-size:small;
}
</style>
<body>
<c:import url="../default/header.jsp"/>
<div class="wrap">
	<div id="main">
	<div>
		<h1 style="text-align:center;margin-bottom:10px">'${param.id}' 님 정보수정</h1>
	</div>
		<form action="memberinfo2_save" method="post">
			<table>
				<tr>
					<td><label style="color:red;">아이디는 수정 불가</label></td>
				</tr>
				<tr>
					<td><input type="text" name="id" value="${param.id }" readonly></td>
				</tr>
				<tr>
					<td><label>수정할 비밀번호를 입력하세요.</label></td>
				</tr>
				<tr>
					<td><input type="text" name="pwd" value="${memberinfo.pwd }"></td>
				</tr>
				<tr>
					<td><label>수정할 이름을 입력하세요.</label></td>
				</tr>
				<tr>
					<td><input type="text" name="name" value="${memberinfo.name }"></td>
				</tr>
				<tr>
					<td><label>수정할 주소를 입력하세요.</label></td>
				</tr>
				<tr>
					<td><input type="text" name="addr" value="${memberinfo.addr}"></td>
				</tr>
				<tr>
					<td style="padding-top: 16px;">
					<input style="padding: 7px 95px 7px 95px; color: white; background-color: black;border-radius: 5px; margin-top:15px" type="submit" value="확인"></td>
				</tr>
			</table>
		</form>
	</div>
</div>
<c:import url="../default/footer.jsp"/>
</body>
</html>