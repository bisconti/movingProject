<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath}" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<style>
body{
   background-color:black;
}
#table{
    color: #fff;
    width: 75%;
    text-align: center;
    height: 1000px;
    margin: 0 auto;
    margin-top: 100px;
}
.btn_area {
    margin: 0 auto;
    height: 100px ;
}
.btn_area a{
  margin-left: 10px;
  padding: 8px 10px;
  background-color: red;
  font-size: 14px;
  font-weight: bold;
  border: none;
  border-radius: 5px;
  width: 80px;
  text-decoration: none;
  color: white;
}
</style>
</head>
<body>
<%@include file="/app/common/header.jsp" %>
<form name="movieForm" id="movieForm" method="post" action="${cp}/movie/movieupload.mo" onsubmit="return sendit();" enctype="multipart/form-data">
   <fieldset style="border: 1px solid red; width: 70%; height:70%; margin: 0 auto; margin-top: 100px; font-weight: bold;">
   <legend style="color: white;">영화 업로드</legend>
   <table id="table">
      <tr align="left">
         <th id="th">
               영화 제목
          </th>
         <td>
            <input type="text" size="50" maxlength="100" name="movietitle" value="" placeholder="제목">
         </td>
      </tr>
        <tr align="left"> 
         <th>
               배우
         </th>
         <td>
            <input type="text" size="50" maxlength="100" name="actorname" placeholder="배우">
         </td>
      </tr>
        <tr align="left">
         <th>
                   장르
         </th>
         <td>
            <input type="text" size="50" maxlength="100" name="typename" value="" placeholder="장르">
         </td>
      </tr>
        <tr align="left">
         <th>
            개봉 일자
         </th>
         <td>
            <input type="text" size="50" maxlength="100" name="movierelease" value="" placeholder="개봉 일자">
         </td>
      </tr>
        <tr align="left">
         <th>
            런닝 타임
         </th>
         <td>
            <input type="text" size="50" maxlength="100" name="runningtime" height="30px" value="" placeholder="런닝 타임">
         </td>
      </tr>
      <tr align="left">
         <th>
            판권 만료일
         </th>
         <td>
            <input type="text" size="50" maxlength="100" name="movieended" height="30px" value="" placeholder="판권 만료일">
         </td>
      </tr>
      <tr align="left">
         <th>
            국내/해외
         </th>
         <td>
            <input type="text" size="50" maxlength="100" name="national" height="30px" value="" placeholder="국내/해외">
         </td>
      </tr>
      <tr align="left">
         <th>
            연령제
         </th>
         <td>
            <input type="text" size="50" maxlength="100" name="agelimit" height="30px" value="" placeholder="XX세">
         </td>
      </tr>
      <tr align="left">
         <th>
            줄거리
         </th>
         <td>
            <textarea style="width:700px;height:250px;resize:none;"name="moviecontents"></textarea>               
         </td>
      </tr>
        <tr align="left">
         <th>
            영화 포스터
         </th>
            <td>
                <input type="file" name="moviephoto">
            </td>
      </tr>
        <tr align="left">
         <th>
            영화 영상
         </th>
            <td>
                <input type="file" name="moviefilm">
            </td>
        </tr>
   </table>
   <table class="btn_area">
      <tr>
         <td>
            <a id="a" href="javascript:sendit()">업로드 완료</a>&nbsp;&nbsp;
            <a id="a" href="">취소</a>
         </td>
      </tr>
   </table>
   </fieldset>
</form>        
<%@include file="/app/common/footer.jsp" %> 
</body>
<style>
#welcome{
top: -7px;
}
</style>
<script>
function sendit(){
    const movieForm = document.movieForm;
    const movietitle = movieForm.movietitle;
    if(movietitle.value == ""){
       alert("제목을 입력하세요");
       movietitle.focus();
       return false;
    }
    
    movieForm.submit();
 }
</script>
</html>