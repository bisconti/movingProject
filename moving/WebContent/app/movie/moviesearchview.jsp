<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/app/css/movingsearch.css">
</head>
<body>
	<%@include file="../common/header.jsp"%>
	<!--search-->
	<div id="wrap">
		<%
			System.out.println("제발..");
		%>
		<c:choose>
		<c:when test="${movieList != null and movieList.size()>0}">
			<%
				System.out.println("제발..");
			%>
		<div class="search_result">
			<h2 id="title">${ms}</h2>
			<p id="result">의 검색 결과 입니다.</p>
		</div>
			<c:forEach items="${movieList}" var="movie">
				<div class="movie_box">
					<div id="photo">
						<a href=""><img id="image" src="/app/file/${movie.moviephoto}" alt=""></a>
					</div>
					<div id="info">
						<h2>${movie.movietitle}</h2>
						<h3>줄거리</h3>
						<p id="contents">"${movie.moviecontents}"</p>
					</div>
				</div>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<div class="search_result">
				<h2 id="title">${ms}</h2>
				<p id="result">의 검색 결과가 존재하지 않습니다.</p>
			</div>
		</c:otherwise>
		</c:choose>
	</div>
	<%@include file="../common/footer.jsp"%>
</body>
</html>