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
       <div class="lor-header joinbox">
          <a href="${cp}/home.ho" class="lor-logo">
          </a>
       </div>
       <div class="lor-content joinbox">
          <form name="joinForm" method="post" action="${cp}/user/userjoinok.us"
             onsubmit="return sendit();">
             <div class="joinbox">
                <p id="result" colspan="2"></p> 
             </div>
             <div class="joinbox">
                <input name="userid" id="userid" placeholder="아이디를 입력해주세요">
                <input type="button" id="user_id_btn" value="중복검사"
                   onclick="checkId()">
             </div>
             <div class="joinbox">
                <p id="pwtxt" colspan="2"></p>
             </div>
             <div class="joinbox">
                <input type="password" name="userpw" id="userpw"
                   placeholder="비밀번호를 입력해주세요">
             </div>
             <div class="joinbox">
                <input type="password" name="userpw_re" id="userpw_re"
                   placeholder="비밀번호를 다시 입력해주세요">
             </div>
             <div class="username joinbox">
                <input type="text" name="username" id="username"
                   placeholder="이름을 입력해주세요">
             </div>
             <div class="gender_area joinbox">
                <span><label class="radiolabel">남자<input type="radio" name="usergender" value="M" checked></label></span>
                <span><label class="radiolabel">여자 <input type="radio" name="usergender" value="W"></label></span>
             </div>
             <div class="zipcode_area joinbox">
                <input readonly name="zipcode" type="text" id="sample6_postcode"
                   placeholder="우편번호"> 
                <input type="button" onclick="sample6_execDaumPostcode()" id="sample6_postcode_btn" value="우편번호 찾기">
             </div>
             <div class="addr_area joinbox">
                <input readonly name="useraddr" type="text"
                   id="sample6_address" placeholder="주소">
             </div>
             <div class="joinbox">
                <input name="useraddrdetail" type="text"
                   id="sample6_detailAddress" placeholder="상세주소">
             </div>
             <div class="joinbox">
                <input readonly name="useraddretc" type="text"
                   id="sample6_extraAddress" placeholder="참고항목">
             </div>
             <!-- 생년월일 
                    참고 예정 사이트 https://choiiis.github.io/web/toy-project-sign-up-and-in-page-2/-->
             <div class="info joinbox" id="userbirth" name="userbirth">
                <select class="box" id="birth-year" name="userbirth">
                   <option value="none" disabled selected>출생 연도</option>
                </select><span>년</span>
                <select class="box" id="birth-month" name="userbirth">
                   <option value="none" disabled selected>월</option>
                </select><span>월</span>
                <select class="box" id="birth-day" name="userbirth">
                   <option value="none" disabled selected>일</option>
                </select><span>일</span>
             </div>
             <div class="joinbox">
                <input type="text" name="userphone" id="userphone"
                   placeholder="핸드폰번호 입력" maxlength="13" onkeyup="addHypen(this);"/> 
                <input type="button" value="인증번호" id="userphone_btn">
             </div>
             <div class="joinbox">
                    <input type="text" name="check_number" id="userNum"
                       placeholder="인증번호를 입력해주세요" >
                    <input type="button" value="인증확인" id="correct_check">
                </div>
             <div class="btn-submit joinbox">
                <input type="submit" value="회원가입" id="join_submit"></input>
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
var code2= "";
$('#userphone_btn').click(function() {
    const userphone = $('#userphone').val();
      const xhr = new XMLHttpRequest();
      if(userphone == ""){
      alert("핸드폰 번호를 입력하세요 !");
      userid.focus();
      return false;
   }
   else if(userphone.length == 13){
   xhr.onreadystatechange = function(){
      if(xhr.readyState == 4){
         if(xhr.status == 200){
            let txt = xhr.responseText;
            txt = txt.trim();
            if(txt == "O"){
               alert("사용할 수 있는 번호");
               alert('인증번호가 전송되었습니다. 확인해주세요 !');
               $.ajax ({
                  url: '${cp}/user/send_msg.us',
                  type: 'GET',
                  async: false,
                  data: {
                     "userphone" : userphone
                  },
                   success: function(data) {
                     var checkNum = data;
                     alert(data);
                     
                     $('#correct_check').click(function() {   
                        const userNum = $('#userNum').val();
                        
                        if(checkNum == userNum) {
                           alert('인증 성공하였습니다.');
                           $("#userphone").attr("readonly",true);
                           code2 = data;
                           console.log(code2);
                        }
                        else {
                           alert('인증 실패하였습니다. 다시 입력해주세요.');
                        }
                     });
                     
                  }
               });
            }
            else{
               alert("이미 가입된 번호입니다.")
               userphone.value = "";
               userphone.focus();
            }
         }
      }
   }
   }else {
       alert('휴대폰번호를 정확하게 입력해주세요 !')
   } 
   xhr.open("GET",cp+"/user/checkphoneok.us?userphone="+userphone,true);
   xhr.send();
});
      
</script>
<script src="${cp}/app/user/user.js"></script>
</html>




