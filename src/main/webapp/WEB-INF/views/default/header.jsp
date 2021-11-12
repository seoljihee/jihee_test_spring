<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %> 
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
*{
    padding: 0;
    margin: 0 auto;
}
.wrap{
    width: 1200px;
    margin: auto;
    
}
.header{
    background:url("${contextPath}/resources/img/back.jpg");
    width: 100%;
    height: 300px;
}

nav ul{ list-style: none; display: flex; justify-content: flex-end; }
nav ul li{line-height:120px;  margin: 0 3px; padding: 13px 13px;}
nav ul li a{ color: azure; text-decoration: none; font-weight: 700;}
nav ul li a:hover{
    color: rgb(111, 111, 111);
    padding-bottom:  3px;
    border-bottom: 1px solid  rgb(111, 111, 111);
    transition: all 0.25s;
}
#p1{font-size: 35px; text-align: center;color: rgba(199, 199, 199, 0.39);height: 70px;}
#p2{color: rgb(221, 221, 221);text-align: center; margin-top: 40px;}
#nav1{padding-top: 30px; }
</style>
<body>
 <div class="wrap">
        <div class="header">
            <div id="nav1">
                <p id="p1">
                    <b>The community for Open<br>Innovation and Collaboration</b>
                </p>
                <p id="p2">
                    The Eclipse Foundation provides our global community of individuals and<br>
                    organizations with a mature, scalable, and business-friendly environment<br>
                     for open source software collaboration and innovation.
                </p>
            </div>
            <nav>
                <ul>
                 <li><a href="${contextPath }/member/main">HOME</a></li>
                 <li><a href="${contextPath }/member/memberview">MEMBER_SHIP</a></li>
                 <li><a href="${contextPath }/board/list">BOARD</a></li>
                 <c:choose>
                 	<c:when test="${LOGIN != null}">
         		        <li><a href="${contextPath }/member/logout">LOGOUT</a></li>
                 	</c:when>
                 	<c:otherwise>
                 		<li><a href="${contextPath }/member/login">LOGIN</a></li>
                 	</c:otherwise>
                 </c:choose>
                </ul>
            </nav>
        </div>
    </div>
</body>
</html>