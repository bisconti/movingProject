<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>무빙(moving)</title>
<style>
html, header, head {
   width: 100%;
}

#header {
   height: 76px;
   max-height: 100%;
   position: fixed;
   display: flex;
   width: 100%;
   min-width: 1248px;
   max-width: 100%;
   top: 0;
   z-index: 10001;
   background-color: #212121;
   box-sizing: border-box;
}

#logo {
   width: 7%;
   height: 100%;
   margin-left: 30px;
   align-items: center;
}

#logos {
   margin-top: 15px;
   width: 100%;
}

#search {
   display: flex;
   position: relative;
   width: 82%;
   flex-grow: 2;
   justify-content: center;
}

#search>span {
   text-align: center;
   width: 100%;
   display: flex;
   justify-content: center;
   align-items: center;
}

#search>span>input:nth-child(1) {
   width: 30%;
   height: 50%;
}

#magnifying {
   width: 2%;
   height: 35%;
   background: url(/app/img/magnifying-removebg-preview.png) no-repeat;
   background-size: contain;
   cursor: pointer;
   border: none;
   position: absolute;
   right: 35%;
}

#login {
   display: flex;
   position: relative;
   width: 10%;
   line-height: 35px;
}

#login_a {
   background-color: #363636;
   color: white;
   height: 36px;
   padding: 0 20px;
   align-items: center;
   margin-left: 50px;
   margin-top: 20px;
   font-size: 13px;
   text-decoration: none;
   box-sizing: border-box;
}

#login_a>span {
   font-weight: bold;
}

#search_what {
   position: relative;
}

.cff::placeholder {
   color: #363636;
   font-size: 14px;
   font-weight: bold;
}

.cff {
   background-color: black;
   color: white;
   border: none;
}
#logout{
	text-decoration : none;
	color : white;
	font-size : 12px;
}
#mypage{
	text-decoration : none;
	color : white;
	font-size : 12px;
}

</style>
</head>
<body>
   <header>
      <div id="header">
         <div id="logo">
            <a href="${cp}/"><img src="/app/img/moving_logo.png" alt="" id="logos"></a>
        </div>
         <div id="search">
            <span> <input class="cff" type="search"
               placeholder="검색어를 입력해주세요(영화명, 배우명)" id="ms" name=ms
               value="${keyword}" onkeypress="if(event.keyCode == 13){search()}"> <input type="button" class="cff"
               id="magnifying" onclick="search()">
            </span>
         </div>
         <c:choose>
           <c:when test="${loginUser == null }">
              <div id="login">
                  <a href="${cp}/user/userlogin.us" id="login_a"><span>로그인</span></a>
              </div>
           </c:when>
           <c:otherwise>
	           <div class="mypage">
	                 <a href="/app/user/mypage.jsp" id="mypage"><span>마이페이지</span></a>
	           </div>
	           <div class="logout">
	                 <a href="${cp}/user/userlogout.us" id="logout"><span>로그아웃</span></a>
	           </div>
           </c:otherwise>
         </c:choose>
      </div>
   </header>
</body>
<script>
   function search() {
      const ms = document.getElementById("ms");
      //유효성 검사
      if (ms.value == "") {
         alert("검색어를 입력해주세요!");
         ms.focus();
         return false;
      }
      location.href = "${cp}/movie/moviesearch.mo?ms="+ms.value;
   }
</script>
</html>