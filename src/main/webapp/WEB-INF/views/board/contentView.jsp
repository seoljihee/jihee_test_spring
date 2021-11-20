<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#modal_wrap{
display: none; position: fixed; z-index: 9;
margin: 0 auto; top:0; left: 0; right: 0;
width:100%; height:100%;
background-color: rgba(0, 0, 0, 0.4);
}
#first{ 
position: fixed; z-index: 10; margin: 0 auto;
top:30px; left: 0; right: 0; display:none;
background-color: rgba(212, 244, 250, 0.9);
height:350px; width:300px;
}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
    function slideClick(){
    $("#first").slideDown('slow'); //천천히 내려라
    $("#modal_wrap").show();
    }
    function slide_hide(){
    $("#first").slideUp('fast');   //위로 올려라 
    $("#modal_wrap").hide();
    }
    function rep(){
    	/*
    	var title = $("#title").val()
    	var content = $("#content").val()
    	let form = {t(key) : title(value), c(key) : content(value)}
    	*/
    let form={}; 
    let arr = $("#frm").serializeArray()
    /*
    	arr = [{name : write_no, value : "입력값"},{nme : title, value : "입력값"},,,{}]
    */
    
    for(i=0;i<arr.length;i++){ 
    	form[arr[i].name] = arr[i].value; }
    /*
    	form = {write_no : "입력값", title : "입력값",,,,}
    자바스크립트의 object타입으로 만들어진다.
    */
    $.ajax({
    url:"addReply",
    type:"POST",
    dataType:"json", 
    data:JSON.stringify(form),
    contentType:"application/json;charset=utf-8",
    success: function(list){
    alert("성공적으로 답글이 달렸습니다.");
    $("#title").val("")
    $("#content").val("")
    replyData()  //답글작성을 성공했을 때 보여주겠다.
    slide_hide();
    },
    error: function(){ alert("문제 발생!")}
    });
    }
    
    //답글보는 기능
    function replyData(){
      $.ajax({
         url:"replyData/"+${personalData.writeNo}, type:"GET", 
         dataType:"json", //리턴방식
         success: function(rep){ //rep는 list방식으로 돌아온다.
            let html = ""			//html형식으로 
            rep.forEach(function(data){ //forEach문으로 씀
               let date = new Date(data.write_date)
               let writeDate = date.getFullYear()+"년"+(date.getMonth()+1)+"월"
               writeDate += date.getDate()+"일"+date.getHours()+"시"
               writeDate += date.getMinutes()+"분"+date.getSeconds()+"초"
               html += "<div align='left'><b>아이디 : </b>"+data.id+"님 / ";  //html형식으로 저장
               html += "<b>작성일</b> : "+writeDate+"<br>"
               html += "<b>제목</b> : "+data.title+"<br>"
               html += "<b>내용</b> : "+data.content+"<hr></div>"
            })
            $("#reply").html(html)  //reply라는아이디 값을 가지고 있는 곳에 html형식으로 넣어주겠다.
         },error:function(){
            alert('데이터를 가져올 수 없습니다')
         }
      })
   }
</script>
</head>
<body onload="replyData()"><!-- onload : 페이지를 읽으면 함수를 호출해라 -->
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<div id="modal_wrap">
		<div id="first">
			<div style="width: 250px; margin: 0 auto; padding-top: 20px;">
				<form id="frm">
					<input type="hidden" name="write_no"
						value="${personalData.writeNo}"> <b>답글 작성 페이지</b>
					<hr>
					<b>작성자 : ${loginUser}</b>
					<hr>
					<b>제목</b><br>
					<input type="text" id="title" size="30" name="title">
					<hr>
					<b>내용</b><br>
					<textarea name="content" id="content" rows="5" cols="30"></textarea>
					<hr>
					<button type="button" onclick="rep()">답글</button>
					<button type="button" onclick="slide_hide()">취소</button>
				</form>
			</div>
		</div>
	</div>

	<c:set var="contextPath" value="${pageContext.request.contextPath}" />

	<c:import url="../default/header.jsp" />
	<table border="1" align="center">
		<caption>
			<font size="5"><b>개인 정보</b></font>
		</caption>
		<tr>
			<th width="100">글 번호</th>
			<td width="200">${personalData.writeNo}</td>
			<th width="100">작성자</th>
			<td width="200">${personalData.id}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${personalData.title}</td>
			<th>등록일자</th>
			<td>${personalData.saveDate}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${personalData.content}</td>
			<td colspan="2"><c:if
					test="${ personalData.imageFileName != 'nan' }">
					<img width="200px" height="100px"
						src="${contextPath}/board/download?imageFileName=${personalData.imageFileName}">
				</c:if></td>
		</tr>
		<tr>
			<td colspan="4" align="center"><c:if
					test="${ loginUser == personalData.id }">
					<input type="button" value="수정하기"
						onclick="location.href='${contextPath}/board/modify_form?writeNo=${personalData.writeNo}'">
					<input type="button" value="삭제하기"
						onclick="location.href='${contextPath}/board/delete?writeNo=${personalData.writeNo}&imageFileName=${personalData.imageFileName}'">
				</c:if> <input type="button" onclick="slideClick()" value="답글달기"> 
				type="button"
				onclick="location.href='${contextPath}/board/boardAllList'"
				value="리스트로 돌아가기">
				<hr>
				<div id="reply"></div></td>
		</tr>
	</table>
	<c:import url="../default/footer.jsp" />

</body>
</html>



