<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
html,header,head{
    width: 100%;
    height: 100%;
}
    
#header{
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

#logo{
    width: 7%;
    height: 100%;
    margin-left: 30px;
    align-items: center;
}
#logos{
    margin-top: 15px;
    width: 100%;
}

#search{
    display: flex;
    position: relative;
    width: 82%;
    flex-grow: 2;
    justify-content: center;
}
#search > span{
    text-align: center;
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
}
#search > span > input:nth-child(1){
    width: 30%;
    height: 50%;
}
#magnifying{
    width: 2%;
    height: 35%;
    background: url(/app/img/magnifying-removebg-preview.png) no-repeat;
    background-size: contain;
    cursor: pointer;
    border: none;
    position: absolute;
    right: 35%;
}
#login{
    display: flex;
    position: relative;
    width: 10%;
    line-height: 35px;
}
#login_a{
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
#login_a > span{
    font-weight: bold;
}
#search_what{
    position: relative;
}
.cff::placeholder{
    color: #363636;
    font-size: 14px;
    font-weight: bold;

}
.cff{
    background-color: black;
    color: white;
    border: none;
}
</style>
</head>
<body>
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
        <div id="login">
            <a href="./loginview.html" id="login_a"><span>로그인</span></a>
        </div>
    </div>
</header>
</body>
</html>