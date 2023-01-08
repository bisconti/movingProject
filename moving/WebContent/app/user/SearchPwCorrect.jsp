<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="../css/SearchPwCorrect.css">
<body>
<%@include file="../common/header.jsp" %>
	<div id="all">
        <br><br><br>
        <form action="${cp}/user/updatepw.us//구현해야함.">
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
                  <input type="password" name="userpw_re" id="userpw_re" onkeyup="pwcheck()" placeholder="비밀번호 확인"/>
                  <input type="submit" value="변경"/>
                </td>
              </tr>
            </table>
          </fieldset><br>
         </form>
    </div>
<%@include file="../common/footer.jsp" %>   
</body>
</html>