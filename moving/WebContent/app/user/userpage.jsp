<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath}"
   scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
html, header, head {
   width: 100%;
   height: 100%;
}

body {
   text-align: center;
   color: white;
   background-color: black;
}

h1 {
   padding-bottom: 5%;
   font-size: 50px;
}
#head{
   margin: 0 auto;
}
#main {
   padding-top: 5%;
   color: white;
   width: 100%;
   text-aligen: center;
}

#board, #mypages, #sexy {
   text-align: left;
   white: 50%;
   padding: 0% 2%;
   height: 100px;
   font-size: 30px;
}

#box {
   color: white;
   text-decoration: none;
}

#username {
   font-size: 60px;
}
#menus{
   text-align:left;
   width: 80%;
   height:100px;
   margin: 0 auto;
}
#margin{
   width:100%;
   height:300px;
}
hr{
   background:red;
    height:1px;
    border:0;

}
</style>
</head>
<body>
   <%@include file="/app/common/header.jsp"%>
   <div id="main">
   <div id="head">
      <h1>
         <span id="username"> ${loginUser}</span>님 오신걸 환영합니다
      </h1>
   </div>
   <div id="menus">
      <hr>
      <div id="mypages">
         <a id="box" href="${cp}/user/mypage.us">내정보 수정하기</a>
      </div>
      <hr>
      <div id="board" class="sky">
         <a id="box" href="${cp}/board/boardList.us">자유게시판</a>
      </div>
      <hr>
      <div id="sexy">
         <a id="box" href="${cp}/qna/myqna.qn">문의내역</a>
      </div>
      <hr>
   </div>
   </div>
   <div id="margin"></div>
   <%@include file="/app/common/footer.jsp"%>
</body>
<style>
#welcome{
	top: -7px;
	right: 9%;
}
#myprofile{
	margin-left: -57px;
}
</style>
</html>