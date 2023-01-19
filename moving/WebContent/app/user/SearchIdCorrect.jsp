<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
   body{
        background-color: black;
    }
    .idsearch_container{
        width: 500px;
    }
    .resultid_container{
        color: red;
        border: 1px solid red;
        width: 400px;
        background-color : #222222;
    }
    .resultid_title{
        color: white;
        font-weight: bold;
    }
    #pwsearch{
        text-decoration: none;
        color: white;
        font-size: 14px;
        
    }
    .idsearch_container{
        margin: 0 auto;
       height: 60%;
       display: flex;
       align-items: center;
       justify-content: center;
       flex-direction: column;
        margin-top: 300px;
    }
    .login{
        margin-top: 20px;
    }
    #result_id{
       margin-top: 20px;
       display: block;
        text-align: center;
        color: white;
    }
</style>
<body>
<%@include file="../common/header.jsp" %>
   <!-- userphone으로 username과 userid 받아오기 -->
    <div class="idsearch_container">
        <div>
            <fieldset class="resultid_container">
                <legend class="resultid_title">아이디찾기 결과</legend>
                <span id="result_id">${username}님의 아이디는 ${userid} 입니다.</span>
                    <br>
            </fieldset>
        </div>
        <div class="login">
            <a href="${cp}/user/searchpw.us" id="pwsearch">비밀번호찾기</a>
        </div>
    </div>
<%@include file="../common/footer.jsp" %>
</body>
<style>
#footer{
   position: absolute;
   bottom: 0px;
}
</style>
</html>