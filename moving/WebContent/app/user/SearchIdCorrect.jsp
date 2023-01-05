<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    fieldset{
        color: red;
        border: 1px solid red;
        width: 400px;
        background-color : #222222;
    }
    legend{
        color: white;
    }
    span{
        display: block;
        text-align: center;
        color: white;
        margin: 0 auto;
    }
    a{
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
</style>
<body>
<%-- <%@include file="../common/header.jsp" %> --%>
	<!-- userphone으로 username과 userid 받아오기 -->
    <div class="idsearch_container">
        <div>
            <fieldset>
                <legend>아이디찾기 결과</legend>
                <span>${username}님의 아이디는 ${userid} 입니다.</span>
                    <br>
            </fieldset>
        </div>
        <div class="login">
            <span><a href="loginview.jsp" id="login">로그인&nbsp;&nbsp;&nbsp;</a>|
            <a href="SearchPw.jsp" id="pwsearch">&nbsp;&nbsp;&nbsp;비밀번호찾기</a></span>
        </div>
    </div>
<%@include file="../common/footer.jsp" %>
</body>
</html>