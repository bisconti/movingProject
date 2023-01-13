<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath}" scope="session"/>
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
    body{
    
    text-align:center;
       color:white ;
        background-color: black;
    }
    #main{
        color: white;
        margin: 260px auto;
        width: 50%;
        height: 300px;
        text-aligen:center;
    }
    #board , #mypages, #sexy{
        text-align: center;
        white: 40%;
        height: 350px;
        float: left;
        font-size: 50px;
        margin-top: 100px; 
        margin-left: 30px; 
        }
    #box{
    margin : 10px;
        color:white ;
        text-shadow: 10px 2px 5px gray;
    }
    #username{
    font-size: 60px;
    text-shadow: 10px 2px 5px gray;
    }
</style>
</head>
<body>
<%@include file="/app/common/header.jsp" %>
<div id="main">
<h1><span id="username"> ${loginUser}</span>님 오신걸 환영합니다</h1>
    <div id="mypages">
        <a id="box" href="${cp}/user/mypage.us">내정보 수정하기</a>
    </div>
    <div id="board" class="sky">
        <a id="box" href="${cp}/board/boardList.us">커뮤니티 가기</a>
    </div>
    <div id="sexy"  >
        <a id="box" href="${cp}/qna/qnaList.us">문의내역</a>
    </div>
</div>
<%@include file="/app/common/footer.jsp" %> 
</body>
</html>