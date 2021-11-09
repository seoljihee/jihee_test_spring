<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
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
height:400px;
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
      <h1 style="text-align:center;margin-bottom:10px">회원가입</h1>
   </div>
      <form action="member_save" method="post">
         <table>
            <tr>
               <td><label>아이디를 입려하세요.</label></td>
            </tr>
            <tr>
               <td><input type="text" name="id"></td>
            </tr>
            <tr>
               <td><label>비밀번호를 입려하세요.</label></td>
            </tr>
            <tr>
               <td><input type="text" name="pwd"></td>
            </tr>
            <tr>
               <td><label>이름을 입려하세요.</label></td>
            </tr>
            <tr>
               <td><input type="text" name="name"></td>
            </tr>
            <tr>
               <td><label>주소를 입려하세요.</label></td>
            </tr>
            <tr>
               <td><input type="text" name="addr"></td>
            </tr>
            <tr>
               <td style="padding-top: 16px;"><input style="padding: 7px 83px 7px 83px; color: white; background-color: black;border-radius: 5px;" type="submit" value="회원가입"></td>
            </tr>
         </table>
      </form>
   </div>
</div>
<c:import url="../default/footer.jsp"/>
</body>
</html>