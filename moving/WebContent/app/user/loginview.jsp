<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>무빙(moving) 움직이는 영화세상</title>
<link rel="stylesheet" href="${cp}/app/css/loginview.css">
<style>
   .login_page {
      background-color: black;
   }
</style>
</head>
<body>
<%@include file="/app/common/header.jsp" %>
   <div class="login_page">
        <div class="lor-header">
            <a href="${cp}/" class="lor-logo">
            </a>
        </div>
        <div class="lor-content">
            <form id="loginForm" name="loginForm" method="post" action="${cp}/user/userloginok.us" onsubmit="return sendit();">
                <div class="userid">
                    <input name="userid" id="login_id" placeholder="아이디를 입력해주세요" style="margin-bottom: 17px;">
                </div>
                <div class="userpw">
                    <input type="password" name="userpw" id="userpw" placeholder="비밀번호를 입력해주세요" style="margin-bottom: 17px;">
                </div>
                <div class="id_pw_Search" style="margin-bottom: 17px;">
                   <a id="SearchId" href="${cp}/user/searchid.us" style="font-weight: bold;">아이디/비밀번호 찾기</a>
                </div>
                <div class="joinview">
                    <a href="${cp}/user/userjoin.us" class="join" rel="nofollow" style="font-weight: bold;">회원가입</a>
                </div>
                <div class="btn-submit">
                    <input type="submit" value="로그인"></input>
                </div>
            </form>
        </div>
    </div> 
    <%@include file="/app/common/footer.jsp" %> 
</body>
<script>
function sendit() {
   const loginForm = document.loginForm;
   const userid = loginForm.userid;
   if(userid.value == ""){
       alert("아이디를 입력하세요!")
       userid.focus();
       return false;
   }
   const userpw = loginForm.userpw;
   if(userpw.value == ""){
        alert("비밀번호를 입력하세요!");
        userpw.focus();
        return false;
    }
   return true;
}
</script>
</html>