<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="/app/css/joinview.css">
</head>
<body>
<%@include file="../common/header.jsp" %><br><br>
	<div class="join_page">
        <div class="lor-header">
            <a href="main.html" class="lor-logo">
                <h1>moving</h1>
            </a>
        </div>
        <div class="lor-content">
            <form id="joinForm">
                <div class="userid">
                    <input name="userid" id="user_id" placeholder="아이디를 입력해주세요">
                    <input type="button" value="중복검사" id="user_id_btn"></input>
                </div>
                <div class="userpw">
                    <input type="password" name="userpw" id="user_pw" placeholder="비밀번호를 입력해주세요">
                </div>
                <div class="userpw">
                    <input type="password" name="userpw_re" id="userpw_re" placeholder="비밀번호를 다시 입력해주세요">
                </div>
                <div class="username">
                    <input type="text" name="username" id="user_name" placeholder="이름을 입력해주세요">
                </div>
                <div class="usernickname">
                    <input type="password" name="mb_password" id="join_pw" placeholder="닉네임을 입력해주세요">
                </div>
                <div class="zipcode_area">
                    <input type="text" id="sample6_postcode" placeholder="우편번호" name="zipcode">
                    <input type="button" value="우편번호 찾기" id="sample6_postcode_btn">
                </div>
                <div class="addr_area">
                    <input type="text" id="sample6_address" placeholder="주소" name="addr">
                </div>
                <div>
                    <input type="text" id="sample6_detailAddress" placeholder="상세주소" name="addrdetail">
                </div>
                <div>
                    <input type="text" id="sample6_extraAddress" placeholder="참고항목" name="addretc">
                </div>
                <!-- 생년월일 
                참고 예정 사이트 https://choiiis.github.io/web/toy-project-sign-up-and-in-page-2/-->
                <div class="info" id="info__birth">
                    <select class="box" id="birth-year">
                    <option disabled selected>출생 연도</option>
                    </select>
                    <select class="box" id="birth-month">
                    <option disabled selected>월</option>
                    </select>
                    <select class="box" id="birth-day">
                    <option disabled selected>일</option>
                    </select>
                </div>
                <!-- 핸드폰번호 참고: https://codepen.io/HAJAE/pen/jdmRLM -->
                <div>
                    <input type="text" name="cellphone" id="cellphone" placeholder="핸드폰번호 입력" maxlength="13" />
                    <input type="button" value="인증번호받기" id="cellphone_btn">
                </div>
                <div class="userpw">
                    <input type="password" name="userpw" id="user_pw" placeholder="인증번호를 입력해주세요">
                </div>
                <div class="btn-submit">
                    <input type="submit" value="회원가입"></input>
                </div>
            </form>
        </div>
    </div>
<%@include file="../common/footer.jsp" %>
</body>
</html>






