<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="${cp}/app/css/SearchId.css">
<body>
<%@include file="/app/common/header.jsp" %>
   <div class="idSearch">
		<form action="SearchIdCorrect.jsp"><!-- ${cp}/user/idsearch.us//구현해야함. -->
			<div class="idSeach_header" id="div1">
				<h1>아이디 찾기</h1>
			</div>
			<div id="div2">
				<h3>본인인증으로 찾기</h3>
			</div>
			<div class="username" id="div3">
				<input type="text" name="username" id="username" 
					placeholder="이름을 입력해주세요">
			</div>
			<div id="div4">
				<input type="text" name="userphone" id="userphone" onkeyup="addHypen(this);"
					placeholder="핸드폰번호 입력" maxlength="13" /> <input type="button"
					value="인증번호" id="userphone_btn" onclick="send_SMS();">
			</div>
			<div id="div5">
				<input type="text" id="check_number"
					placeholder="인증번호를 입력해주세요"> <input type="button"
					value="인증확인" id="correct_check">
			</div>
			<div class="pw_Search" id="div6">
				<a href="SearchPw.jsp" class="pw_Search1">비밀번호찾기</a>
			</div>
			<div id="div7">
				<input type="submit" value="확인" id="submit">
			</div>
		</form>
	</div>
<%@include file="/app/common/footer.jsp" %> 
</body>
<script src="${cp}/app/user/user.js"></script>
<script>
function send_SMS() {
	alert('인증번호가 전송되었습니다. 확인해주세요 !');
}
function correct_check() {
	
}
</script>
</html>