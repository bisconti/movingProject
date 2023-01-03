<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cp" value="${pageContext.request.contextPath}" scope="session"/>
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
#mypage{
    position: absolute;
    width: 10%;
    right: 7%;
}
#mypage > h5{
    color: white;
}
#myprofile{
    width: 25%;
    height: 50%;
    background-size: contain;
    margin-top: 13px;
    margin-left: 40px;
    border-radius: 100px;
}
#welcome{
    position: absolute;
    top: 0.1%;
    right: 10%;
}
</style>
<header>
    <div id="header">
        <div id="logo">
            <a href="./main.html"><img src="/app/img/moving_logo.png" alt="" id="logos"></a>
        </div>
        <div id="search">
            <span>
                <input class="cff" type="text" placeholder="    검색어를 입력해주세요(영화명, 배우명)" id="search_what"><input type="button" class="cff" id="magnifying" onclick="location.href='<!-- 검색 시 나오는 페이지에 대한 view-->'">
            </span>
        </div>
        <c:if test="${loginUser == null}">
	        <div id="login">
	            <a href="/user/userlogin.us" id="login_a"><span>로그인</span></a>
	        </div>
        </c:if>
        <c:if test="${loginUser != null}">
            <div id="mypage">
            	<a href=""><img src="/app/img/basicprofile.jpg" alt="" id="myprofile"></a>
            		<h5 id="welcome">환영합니다! <br></h5>
        	</div>
        	<div id="logout">
	            <a href="/home.ho" id="login_a"><span>로그아웃</span></a>
	        </div>
        </c:if>
    </div>
</header>