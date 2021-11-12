<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="<%=request.getContextPath()%>/resources/js/daumPost.js"></script>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

function register() {
   addr1 = $("#addr1").val()
   addr2 = $("#addr2").val()
   addr3 = $("#addr3").val()
   addr = addr1 + "/" + addr2 + "/" + addr3
   $("#addr1").val(addr)
   fo.submit()
}

</script>


</head>
<style>
#main{
width:400px;
height:600px;
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
      <form id="fo" action="member_save" method="post">
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
               <td><input type="text" name="addr" id="addr1" placeholder="우편번호" readonly></td>
            </tr>
            
            
            <tr>
               <td><input type="button" onclick="daumPost()" value="우편번호 찾기"></td>
            </tr>
            <tr>
               <td><input type="text" id="addr2" placeholder="주소" readonly></td>
            </tr>
             <tr>
               <td><input type="text" id="addr3" placeholder="상세주소"></td>
            </tr>
            
            
            <tr>
               <td style="padding-top: 16px;"><input style="padding: 7px 83px 7px 83px; color: white; background-color: black;border-radius: 5px;" type="button" onclick="register()" value="회원가입"></td>
            </tr>
         </table>
      </form>
   </div>
</div>
<c:import url="../default/footer.jsp"/>
</body>
</html>