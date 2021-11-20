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
	<c:import url="../default/header.jsp" />
	<div class="wrap">
		<div id="main">
			<h1 style="text-align: center; padding-top: 100px;">회원 리스트</h1>
			<table border="1">
				<tr style="background-color: gray;">
					<th>번호</th>
					<th>id</th>
					<th>제목</th>
					<th>날짜</th>
					<th>조회수</th>
					<th>image_file_name</th>
					<c:if test="${boardList.size() == 0 }">
						<tr>
							<td colspan="6">저장 데이터 없음</td>
						</tr>
					</c:if>
					<c:forEach var="dto" items="${boardList}">
						<tr>
							<td>${dto.writeNo }</td>
							<td>${dto.id }</td>
							<td><a href="${contextPath}/board/contentView?writeNo=${dto.writeNo}">${dto.title }</a></td>
							<td>${dto.saveDate }</td>
							<td>${dto.hit }</td>
							<td>${dto.imageFileName }</td>
						</tr>
					</c:forEach>
				<tr>
					<td colspan="6">
					<div align="left">
						<c:forEach var="num" begin="1" end="${repeat}">
							<a href="boardAllList?num=${num}">[${num}]</a> 
						</c:forEach>
					</div>
					<a href="${contextPath }/board/writeForm">글작성</a>
					</td>
				</tr>
			</table>

		</div>
	</div>
	<c:import url="../default/footer.jsp" />
</body>
</html>