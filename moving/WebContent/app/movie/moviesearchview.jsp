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
	<%@include file="../common/header.jsp"%><br>
	<br>
	<!--search-->
	<div id="wrap">
		<div class="search_result">
			<h2 id="title">"OOO"</h2>
			<p id="result">님의 검색 결과 입니다.</p>
		</div>
		<div class="movie_box">
			<div id="photo">
				<a href=""><img id="image" src="/images/007 스펙터.jpg" alt=""></a>
			</div>
			<div id="info">
				<h2>제목</h2>
				<h3>줄거리</h3>
				<p id="contents">Lorem ipsum dolor sit amet consectetur
					adipisicing elit. Labore earum corporis, molestiae consectetur
					delectus omnis temporibus iusto provident porro adipisci in officia
					culpa tempora ex ratione pariatur at nobis inventore?</p>
			</div>
		</div>

		<div class="movie_box">
			<div id="photo">
				<a href=""><img id="image" src="/images/20세기소녀.jpg" alt=""></a>
			</div>
			<div id="info">
				<h2>제목</h2>
				<h3>줄거리</h3>
				<p id="contents">Lorem ipsum dolor sit amet consectetur
					adipisicing elit. Labore earum corporis, molestiae consectetur
					delectus omnis temporibus iusto provident porro adipisci in officia
					culpa tempora ex ratione pariatur at nobis inventore?Lorem ipsum
					dolor sit amet consectetur adipisicing elit. Labore earum corporis,
					molestiae consectetur delectus omnis temporibus iusto provident
					porro adipisci in officia culpa tempora ex ratione pariatur at
					nobis inventore?Lorem ipsum dolor sit amet consectetur adipisicing
					elit. Labore earum corporis, molestiae consectetur delectus omnis
					temporibus iusto provident porro adipisci in officia culpa tempora
					ex ratione pariatur at nobis inventore?Lorem ipsum dolor sit amet
					consectetur adipisicing elit. Labore earum corporis, molestiae
					consectetur delectus omnis temporibus iusto provident porro
					adipisci in officia culpa tempora ex ratione pariatur at nobis
					inventore?</p>
			</div>
		</div>
	</div>
	<%@include file="../common/footer.jsp"%>
</body>
</html>