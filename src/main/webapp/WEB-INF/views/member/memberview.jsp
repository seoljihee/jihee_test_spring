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
*{

}
#main{height: 700px;margin:auto;}
th{padding: 5px 60px 5px 60px;}
table{
border : 1px  rgb(155, 155, 155) solid; 
border-radius: 5px;
background-color: rgb(240, 240, 240);
border-collapse:collapse;
margin-top: 20px;
}
button{
padding: 5px 40px 5px 40px;
margin: 5px;
color:white;
background-color:black;
border-radius: 5px;
}
</style>
<body>
<c:import url="../default/header.jsp"/>
<div class="wrap">
   <div id="main">
   <h1 style="text-align:center; padding-top:100px;">회원 리스트</h1>
      <table border="1">
         <tr style="background-color:gray;">
            <th>ID</th><th>PASSWORD</th><th>NAME</th><th>ADDRESS</th>
         </tr>
       <c:forEach var="s" items="${list}">
         <tr>
            <th>
            <a href="info?id=${s.id}">${s.id }</a>
            </th>
            <th>${s.pwd}</th>
            <th>
            <a href="info?id=${s.id}">${s.name}</a>
            </th>
            <th>${s.addr}</th>
         </tr>
       </c:forEach>
      </table>
   </div>
</div>
<c:import url="../default/footer.jsp"/>
</body>
</html>