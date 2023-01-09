<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${cp}/app/css/loginview.css">
</head>
<body>
<%@include file="/app/common/header.jsp" %>
   <div class="login_page">
        <div class="lor-header">
            <a href="index.jsp" class="lor-logo">
                
            </a>
        </div>
        <div class="lor-content" id="sky">
            <form id="loginForm" action="${cp}/user/userloginok.us">
                <div class="userid" id="sky">
                    <input name="userid" id="login_id" placeholder="아이디를 입력해주세요">
                </div>
                <div class="userpw" id="sky">
                    <input type="password" name="userpw" id="userpw" placeholder="비밀번호를 입력해주세요">
                </div>
                <div class="id_pw_Search" id="sky">
                   <a id="SearchId" href="/app/user/SearchId.jsp">아이디/비밀번호 찾기</a>
                </div>
                <div class="joinview" id="sky">
                    <a href="terms.jsp" class="join" rel="nofollow">회원가입</a>
                </div>
                <div class="btn-submit" id="sky">
                    <input type="submit" value="로그인"></input>
                </div>
            </form>
        </div>
    </div> 
    <%@include file="/app/common/footer.jsp" %> 
</body>
</html>