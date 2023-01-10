<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.idsearch_container{
	width: 100%;
	height: 100%;
	margin: 0 auto;
}
body{
        background-color: black;
    }
    fieldset{
        color: red;
        border: 1px solid red;
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
    #login, #pwsearch{
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
        margin-top: 309px;
        margin-bottom: 300px;
    }
    .login{
        margin-top: 20px;
    }
</style>
<body>
<%@include file="../common/header.jsp" %>
	<!-- userphone으로 username과 userid 받아오기 -->
    <div class="idsearch_container">
        <div>
            <fieldset>
                <legend>아이디찾기 결과</legend>
                <span>${username}님의 아이디는 ${userid}입니다.</span>
                    <br>
            </fieldset>
        </div>
        <div class="login">
            <a href="SearchPw.jsp" id="pwsearch">비밀번호찾기</a>
        </div>
    </div>
<%@include file="../common/footer.jsp" %>
</body>
</html>