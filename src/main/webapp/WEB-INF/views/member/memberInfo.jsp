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
      <h1 style="text-align:center;margin-bottom:10px">'${param.id}' 님 상세 정보</h1>
   </div>
      <form action="${contextPath}/member/MemberInfo2.jsp" method="post">
         <table>
            <tr>
               <td><label>아이디</label></td>
            </tr>
            <tr>
               <td><input type="text" name="id" value="${param.id}" readonly></td>
            </tr>
            <tr>
               <td><label>비밀번호</label></td>
            </tr>
            <tr>
               <td><input type="text" name="pwd" value="${memberinfo.pwd}"readonly></td>
            </tr>
            <tr>
               <td><label>이름</label></td>
            </tr>
            <tr>
               <td><input type="text" name="name" value="${memberinfo.name}"readonly></td>
            </tr>
            <tr>
               <td><label>주소</label></td>
            </tr>
            <tr>
               <td><input type="text" name="addr" value="${memberinfo.addr}"readonly></td>
            </tr>
            <tr>
               <td style="padding-top: 16px;">
               <button style="padding: 7px 95px 7px 95px; color: white; background-color: black;border-radius: 5px;" type="button" onclick="location.href='${contextPath}/member/MemberInfo2.jsp?id=${dto.id}'">수정</button></td>
            </tr>
            <tr>
               <td style="padding-top: 16px;">
               <button style="padding: 7px 95px 7px 95px; color: white; background-color: black;border-radius: 5px;" type="button" onclick="location.href='${contextPath}/member/delete.jsp?id=${dto.id}'">삭제</button></td>
            </tr>
         </table>
      </form>
   </div>
</div>
<c:import url="../default/footer.jsp"/>
</body>
</html>