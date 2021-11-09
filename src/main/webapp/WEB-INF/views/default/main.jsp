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
margin:auto;
}

main h3{font-size:1.5em;line-height:50px;}
main div{margin-top: 40px;}
.one > img{float: left; margin-right: 50px;border-radius:20px;}
.two > img{float: left; margin-left: 20px; margin-right: 50px; border-radius:20px;}
.one p{line-height: 2;}
.two p{ line-height: 2;}
.one{ margin-left: 30px;}
.two{ margin-left: 10px; }
</style>
<body>
<c:import url="../default/header.jsp"/>
<div class="wrap">
 <main>
        <section id="contents">
            <div class="one">
                <img src="${contextPath }/resources/img/com.jpg" width="340px" height="220px">
                <h3>Tuesday, September 28, 2021 - 17:00</h3>
            <h3>Eclipse Foundation and OpenAtom Foundation<br>
                Forge a Strategic Initiative Focused on OpenHarmony OS
            </h3>
            <p>
            The shared goal of this partnership is to jointly build a worldwide,
             vendor-neutral, and independent open source community, 
             allowing developers, vendors, system integrators to increase their
              global reach in a single and unified ecosystem.</p>
            </div>
            <div class="two">
                <img src="${contextPath}/resources/img/comm.jpg" width="340px" height="220px">
                <h3>Wednesday, September 15, 2021 - 22:27</h3>
                <h3>Eclipse IDE 2021-09 Is Now Available</h3>
                
                <p>The latest Eclipse IDE release includes Java 17 support and
                theme and style improvements. Download the leading open
                 platform for professional developers.</p>
            </div>
        </section>
    </main>
</div>
<c:import url="../default/footer.jsp"/>
</body>
</html>