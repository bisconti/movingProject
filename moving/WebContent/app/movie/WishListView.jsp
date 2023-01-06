<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${cp}/app/css/movingsearch.css">
</head>
<body>
   <%@include file="/app/common/header.jsp"%>
   <!--search-->
   <div id="wrap">
      <c:choose>
      <c:when test="${movieList != null and movieList.size()>0}">
      <div class="search_result">
         <h2 id="title">${userid}</h2>
         <p id="result">님의 찜목록 입니다.</p>
      </div>
         <c:forEach items="${movieList}" var="movie">
            <div class="movie_box">
               <div id="photo44">
                  <a href="${cp}/movie/moviedetail.mo?movienum=${movie.movienum}"><img id="image66" src="/app/file/${movie.moviephoto}" alt=""></a>
               </div>
               <div id="info">
                  <h2>${movie.movietitle}</h2>
                  <details>
                  <summary>줄거리 보기</summary>
                  <p>"${movie.moviecontents}"</p>
                  </details>
               </div>
            </div>
         </c:forEach>
      </c:when>
      <c:otherwise>
         <div class="search_result">
            <p id="title">${userid}</p>
            <p id="result">님의 찜목록이 존재하지 않습니다.</p>
         </div>
      </c:otherwise>
      </c:choose>
   </div>
   <%@include file="/app/common/footer.jsp"%>
</body>
</html>