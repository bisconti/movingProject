<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="${cp}/app/css/SearchPwCorrect.css">
<body>
<%@include file="../common/header.jsp" %>
   <div id="all">
        <br><br><br>
       <form action="${cp}/user/updatepw.us" name="joinForm" method="post" onsubmit="return pwcheck();">
          <input type="hidden" name="userid" id="userid" value="${userid}">
          <br><h2>비밀번호 변경 페이지</h2>
          <fieldset style="border: 1px solid red; width: 500px">
            <legend>PASSOWRD</legend>
            <table>
              <tr>
                <th><label for="userpw">변경할 비밀번호</label></th>
                <td>
                  <input type="password" name="userpw" id="userpw" placeholder="비밀번호를 입력해주세요" />
                </td>
              </tr>
              <tr>
                <th><label for="userpw_re">비밀번호 확인</label></th>
                <td>
                  <input type="password" name="userpw_re" id="userpw_re" placeholder="비밀번호 확인"/>
                  <input type="submit" value="변경"/>
                </td>
              </tr>
            </table>
          </fieldset><br>
         </form>
    </div>
<%@include file="../common/footer.jsp" %>   
</body>
<script>
   function pwcheck() {
      
      const joinForm = document.joinForm;
      
      const userpw = joinForm.userpw;
       const userpw_re = joinForm.userpw_re;
       if(userpw.value == ""){
           alert("비밀번호를 입력하세요!");
           userpw.focus();
           return false;
       }
       const reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[~?!@#$%^&*_-]).{8,}$/;
       if(!reg.test(userpw.value)){
          alert("비밀번4호는 8자 이상, 숫자, 대문자, 소문자, 특수문자를 모두 하나 이상 포함해야 합니다!");
          return false;
       }
       if(/(\w)\1\1\1/.test(userpw.value)){
          alert("같은 문자를 4번 연속해서 사용할 수 없습니다!")
          userpw.focus();
          return false;
       }
       if(userpw.value.search(/\s/) != -1){
          alert("비밀번호는 공백을 포함할 수 없습니다!");
          userpw.focus();
          return false;
       }
       if(userpw_re.value == ""){
          alert("비밀번호 확인을 해주세요!");
          userpw_re.focus();
          return false;
       }
       if(userpw.value != userpw_re.value){
          alert("비밀번호 확인을 다시 해주세요!");
          userpw.focus();
          return false;
       }
      return true;
   }
</script>
</html>