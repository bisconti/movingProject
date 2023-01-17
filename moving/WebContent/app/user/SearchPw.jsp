<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="/app/css/SearchId.css?after">
<body>
<%@include file="../common/header.jsp" %>
   <div class="idSearch">
        <form name="joinForm" method="post" action="${cp}/user/searchpwok.us" onsubmit="return pwSearch();">
           <div class="idSeach_header idsearchbox">
              <h1>비밀번호 찾기</h1>
           </div>
           <div class="idsearchbox">
              <h3>본인인증으로 찾기</h3>
           </div>
           <div class="userid idsearchbox">
              <input type="text" name="userid" id="userid"
                 placeholder="아이디를 입력해주세요">
           </div>
           <div class="idsearchbox">
            <input type="text" name="userphone" id="userphone" onkeyup="addHypen(this);"
               placeholder="핸드폰번호 입력" maxlength="13" /> 
            <input type="button" value="인증번호" id="userphone_btn">
         </div>
         <div class="idsearchbox">
            <input type="text" id="userNum" name="check_number"
               placeholder="인증번호를 입력해주세요"> 
            <input type="button" value="인증확인" id="correct_check">
         </div>
           <div class="idsearchbox">
              <input type="submit" value="확인" id="submit">
           </div>
        </form>
     </div>
<%@include file="../common/footer.jsp" %> 
</body>
<style>
#footer{
   position: absolute;
   bottom: 0px;
}
</style>
<script>
   const cp = "${cp}";
</script>
<script
   src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js">
</script>
<script>
var code2 = "";
$('#userphone_btn').click(function() {
    const userphone = $('#userphone').val();
     if(userphone.length == 13){ 
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
            alert('checkNum:'+ checkNum);
            
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
    else {
       alert('휴대폰번호를 정확하게 입력해주세요 !')
    } 
   });
   
   
function pwSearch() {
const joinForm = document.joinForm;
    
    const userid = joinForm.userid;
    if(userid.value == ""){
        alert("아이디를 입력하세요!")
        userid.focus();
        return false;
    }
    if(userid.value.length < 5 || userid.value.length > 12){
        alert("아이디는 5자 이상 12자 이하로 입력하세요!");
        userid.focus();
        return false;
    }
    
    const userphone = joinForm.userphone;
    if(userphone.value.length != 13){
       alert("휴대폰번호를 입력해주세요 !");
       return false;
    }
    if(code2 == ""){
       alert("휴대폰번호 인증 실패입니다!")
       return false;
    }
    return true;
}

</script>
<script src="${cp}/app/user/user.js"></script>
</html>