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
       color:white ;
        background-color: black;
    }
    #div{
        color: white;
        margin: 200px auto;
    }
    div{
        width: 40%;
    }
    #div1{
        text-align: center;
        padding-top: 20px;
        height: 300px;
        float: left;
        font-size: 50px;
    }
    a{
        color:white ;
    }
</style>
</head>
<body>
<%@include file="/app/common/header.jsp" %>
<div id="div">
<h1>관리자님 오신걸 환영합니다</h1>
    <div id="div1">
        <a href="">고객센터 문의 보기</a>
    </div>
    <div id="div1">
        <a href="${cp}/app/managerview/fileupload.jsp">영화 업로드 </a>
    </div>
</div>
</body>
<%@include file="/app/common/footer.jsp" %> 
</html>