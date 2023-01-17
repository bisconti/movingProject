<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${cp}/app/css/mypage.css" rel="stylesheet">
</head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();">
<body>
<%@include file="/app/common/header.jsp" %>
<div id="all">
	<div id="left_area">
	<br><br><br><br><br><br><br><br>
	<form name="photoForm" id="photoForm" action="${cp}/user/adduserphoto.us" method="post" enctype="multipart/form-data">
	<fieldset style="margin-top : -11px;">
		<legend>PROFILE IMAGE</legend>
		<table>
		<tr>
			<td>
			<div id="mypage_img">
				<img alt="" src="${cp}/app/userprofile/${userphoto}" id="userphoto">
			</div>
				<div class="filebox">
				  <label for="ex_file">업로드</label>
				  <input type="file" id="ex_file" name="userphoto" accept=".jpg, .png, .jpeg, .gif">
				</div>
			<input type="submit" value="수정하기" id="modify" onclick="sendit()">
			</td>
		</tr>	
		</table>	
	</fieldset>
	</form>
	</div>
	<div id="right_area">
     <br><br><br>
      <form>
        <br><h2>"${loginUser}"님의 마이페이지</h2>
        <fieldset>
          <legend>INFO</legend>
          <table>
            <tr>
              <th colspan="2">
                <label for="date">다음 결제일은 
                <fmt:formatDate value="${pay.date}" pattern="yyyy.MM.dd"/>일 입니다.</label>
              </th>
            </tr>
            <tr>
               <th><label for="username">이름</label></th>
              <td>
                <input type="text" name="username" id="username" value="${user.username }" readonly disabled/>
              </td>
            </tr>
            <tr>
              <th><label for="userid">아이디</label></th>
              <td>
                <input type="text" name="userid" id="userid" value="${user.userid }" readonly disabled/>
              </td>
            </tr>
            <tr>
              <th><label for="pay">구매금액</label></th>
              <td>
                <input type="text" name="pay" id="pay" value="${pay.price }" readonly disabled/>
                <a href="${cp}/user/subscribe.us"><input type="button" value="구독연장" /></a>
              </td>
            </tr>
          </table>
        </fieldset><br>
        <fieldset style="border: 1px solid red; width: 500px">
          <legend>PASSOWRD</legend>
          <table>
            <tr>
                <th><label for="userpw">현재 비밀번호</label></th>
                <td>
                  <input type="password" name="userpw" id="userpw" />
                </td>
              </tr>
            <tr>
              <th><label for="userpw">비밀번호</label></th>
              <td>
                <input type="password" name="userpw" id="userpw" />
              </td>
            </tr>
            <tr>
              <th><label for="userpw_re">비밀번호 확인</label></th>
              <td>
                <input type="password" name="userpw_re" id="userpw_re" onkeyup="pwcheck()"/>
                <input type="button" value="변경"/>
              </td>
            </tr>
          </table>
        </fieldset><br>
        <fieldset>
          <legend>PHONE</legend>
          <table>
            <tr>
              <th><label for="userid">휴대폰번호</label></th>
              <td>
                <input type="text" name="userid" id="userid" value="01011112222"/>
                <input type="button" value="인증번호" />
              </td>
            </tr>
            <tr>
              <th><label for="userid">인증번호입력</label></th>
              <td>
                <input type="text" name="userid" id="userid" />
                <input type="button" value="인증확인" />
              </td>
            </tr>
          </table>
        </fieldset><br>
        <fieldset>
          <legend>ARRDRESS</legend>
          <table>
            <tr class="zipcode_area">
              <th>우편번호</th>
              <td>
                <input
                  type="text"
                  id="sample6_postcode"
                  placeholder="우편번호"
                  name="zipcode"
                  value="333021"
                  onclick="sample6_execDaumPostcode()"
                />
                <input
                  type="button"
                  value="우편번호"
                  onclick="sample6_execDaumPostcode()"
                />
              </td>
            </tr>
            <tr class="addr_area">
              <th>주소</th>
              <td>
                <input
                  type="text"
                  id="sample6_address"
                  placeholder="주소"
                  name="addr"
                  value="경기도 평택시"
                  readonly
                />
              </td>
            </tr>
            <tr>
              <th>상세주소</th>
              <td>
                <input
                  type="text"
                  id="sample6_detailAddress"
                  placeholder="상세주소"
                  value="고속도로 422"
                  name="addrdetail"
                />
              </td>
            </tr>
            <tr>
              <th>참고항목</th>
              <td>
                <input
                  type="text"
                  id="sample6_extraAddress"
                  placeholder="참고항목"
                  name="addretc"
                  value="10335"
                  readonly
                  disabled
                  style="color: white"
                />
              </td>
            </tr>
          </table>
        </fieldset>
      </form>
    </div>
    </div>
<%@include file="../common/footer.jsp" %>    
</body>
<style>
#welcome{
	top: -7px;
}
</style>
<script type="text/javascript">
    window.history.forward();
   function noBack(){
      window.history.forward();
   } 
   /* history.pushState(null, null, location.href); 
   window.onpopstate = function(event) { 
      history.go(1); 
   }; */
</script>
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
<script>
function sendit(){
    const photoForm = document.photoForm;
    movieForm.submit();
 }
</script>
</html>