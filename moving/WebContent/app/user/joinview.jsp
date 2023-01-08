<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="/app/css/joinview.css">
</head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<body>
	<%@include file="../common/header.jsp"%><br>
	<br>
	<div class="join_page">
		<div class="lor-header">
			<a href="main.html" class="lor-logo">
				<h1>moving</h1>
			</a>
		</div>
		<div class="lor-content">
			<form name="joinForm" method="post" action="${cp}/user/userjoinok.us"
				onsubmit="return sendit(); return phonecheck();">
				<div>
					<p id="result" colspan="2"></p>
				</div>
				<div>
					<input name="userid" id="userid" placeholder="${checkNum}아이디를 입력해주세요">
					<input type="button" id="user_id_btn" value="중복검사"
						onclick="checkId()">
				</div>
				<div>
					<p id="pwtxt" colspan="2"></p>
				</div>
				<div class="">
					<input type="password" name="userpw" id="userpw"
						placeholder="${dlswmdqjsgh}비밀번호를 입력해주세요" value="${dlswmdqjsgh}">
				</div>
				<div>
					<input type="password" name="userpw_re" id="userpw_re"
						placeholder="${dlswmdqjsgh}비밀번호를 다시 입력해주세요">
				</div>
				<div class="username">
					<input type="text" name="username" id="username"
						placeholder="이름을 입력해주세요">
				</div>
				<div class="gender_area">
					<span><label>남자${dlswmdqjsgh} <input type="radio" name="usergender" value="M" checked></label></span>
					<span><label>여자 ${dlswmdqjsgh}<input type="radio" name="usergender" value="W"></label></span>
				</div>
				<div class="zipcode_area">
					<input readonly name="zipcode" type="text" id="sample6_postcode"
						placeholder="우편번호"> 
					<input type="button" onclick="sample6_execDaumPostcode()" id="sample6_postcode_btn" value="우편번호 찾기">
				</div>
				<div class="addr_area">
					<input readonly name="useraddr" type="text"
						id="sample6_address" placeholder="주소">
				</div>
				<div>
					<input name="useraddrdetail" type="text"
						id="sample6_detailAddress" placeholder="상세주소">
				</div>
				<div>
					<input readonly name="useraddretc" type="text"
						id="sample6_extraAddress" placeholder="참고항목">
				</div>
				<!-- 생년월일 
                	참고 예정 사이트 https://choiiis.github.io/web/toy-project-sign-up-and-in-page-2/-->
				<div class="info" id="userbirth" name="userbirth">
					<select class="box" id="birth-year" name="userbirth">
						<option disabled selected>출생 연도</option>
					</select> 
					<select class="box" id="birth-month" name="userbirth">
						<option disabled selected>월</option>
					</select> 
					<select class="box" id="birth-day" name="userbirth">
						<option disabled selected>일</option>
					</select>
				</div>
				<div>
					<input type="text" name="userphone" id="userphone"
						placeholder="핸드폰번호 입력" maxlength="13" onkeyup="addHypen(this);"/> 
					<input type="button" value="인증번호" id="userphone_btn">
				</div>
				<div>
                	<input type="text" name="check_number" id="userNum"
               		 placeholder="인증번호를 입력해주세요" value="${checkNum}">
                	<input type="button" value="인증확인" id="correct_check">
            	</div>
				<div class="btn-submit">
					<input type="submit" value="회원가입"></input>
				</div>
			</form>
		</div>
	</div>
	<%@include file="../common/footer.jsp"%>
</body>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	const cp = "${cp}";
</script>
<script>
$('#userphone_btn').click(function() {
	 const userphone = $('#userphone').val();
	 if(userphone.length == 13) {
		alert('확인');
		$.ajax ({
			url: '${cp}/user/send_msg.us',
			type: 'GET',
			data: {
				"userphone" : userphone
			},
			 success: function(data) {
				var checkNum = data;
				$("input[name='userphone']").attr("readonly",true);
				
				$('#correct_check').click(function() {	
					const userNum = $('#userNum').val();
					
					if(checkNum == userNum) {
						alert('인증 성공하였습니다.');
						return true;
					}
					else {
						alert('인증 실패하였습니다. 다시 입력해주세요.');
						return false;
					}
				});
				
			}
		});
		}
	 else{
		 alert('핸드폰 번호를 정확히 입력해주세요!')
	 }
	});
function phonecheck(checkNum){
	alert(checkNum);
	const userNum = $('#userNum').val();
	if(checkNum == userNum) {
		alert('회원가입되셨습니다. 환영합니다 !');
		return true;
	}
	else {
		alert('인증번호를 다시 확인해주세요!');
		return false;
	}
}

function isBirthday(dateStr) {

	var year = Number(dateStr.substr(0,4)); // 입력한 값의 0~4자리까지 (연)
	var month = Number(dateStr.substr(4,2)); // 입력한 값의 4번째 자리부터 2자리 숫자 (월)
	var day = Number(dateStr.substr(6,2)); // 입력한 값 6번째 자리부터 2자리 숫자 (일)
	var today = new Date(); // 날짜 변수 선언
	var yearNow = today.getFullYear(); // 올해 연도 가져옴

	if (dateStr.length <=8) {
	// 연도의 경우 1900 보다 작거나 yearNow 보다 크다면 false를 반환합니다.
		if (1900 > year || year > yearNow){
			return false;
		} else if (month < 1 || month > 12) {
			return false;
		} else if (day < 1 || day > 31) {
			return false;
		} else if ((month==4 || month==6 || month==9 || month==11) && day==31) {
			return false;
		} else if (month == 2) {

			var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
			if (day>29 || (day==29 && !isleap)) {
				return false;
			} else {
				return true;
			} //end of if (day>29 || (day==29 && !isleap))
		} else {
			return true;
		}//end of if
	}
	else {
		//1.입력된 생년월일이 8자 초과할때 :  auth:false
		return false;
	}
}
</script>
<script src="${cp}/app/user/user.js"></script>
</html>






