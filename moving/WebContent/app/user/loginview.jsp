<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="/app/css/loginview.css">
<style>
	.login_page {
		background-color: black;
	}
</style>
</head>
<body>
<%@include file="../common/header.jsp" %>
	<div class="login_page">
        <div class="lor-header">
        </div>
        <div class="lor-content">
            <form id="loginForm">
                <div class="userid">
                    <input name="userid" id="login_id" placeholder="아이디를 입력해주세요">
                </div>
                <div class="userpw">
                    <input type="password" name="mb_password" id="login_pw" placeholder="비밀번호를 입력해주세요">
                </div>
                <div class="joinview">
                    <a href="joinview.html" class="join" rel="nofollow">회원가입</a>
                </div>
                <div class="btn-submit">
                    <input type="submit" value="로그인"></input>
                </div>
            </form>
        </div>
    </div> 
</body>
<%@include file="../common/footer.jsp" %> 
</html>