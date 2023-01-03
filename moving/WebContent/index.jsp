<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cp" value="${pageContext.request.contextPath}" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="${cp}/app/assets/css/main.css" />
</head>
<body>
<%@include file="/app/common/header.jsp" %>
	<div id="page-wrapper" class="top_box">
		<div id="post_title"></div>
		<!-- 최신 영화 -->
			<section class="carousel">
				<div id="title1"><h2>개봉일 순</h2></div>
				<div class="reel">
					<article>
						<a href="${cp}/movie/moviedetail.mo?movienum=${movie1.movienum}" class="image featured"><img src="../app/file/${movie1.moviephoto}" alt=""/></a>
					</article>

					<article>
						<a href="${cp}/movie/moviedetail.mo?movienum=${movie2.movienum}" class="image featured"><img src="../app/file/${movie2.moviephoto}" alt="" /></a>
					</article>

					<article>
						<a href="${cp}/movie/moviedetail.mo?movienum=${movie3.movienum}" class="image featured"><img src="../app/file/${movie3.moviephoto}" alt="" /></a>
					</article>

					<article>
						<a href="${cp}/movie/moviedetail.mo?movienum=${movie4.movienum}" class="image featured"><img src="../app/file/${movie4.moviephoto}" alt="" /></a>
					</article>

					<article>
						<a href="${cp}/movie/moviedetail.mo?movienum=${movie5.movienum}" class="image featured"><img src="../app/file/${movie5.moviephoto}" alt="" /></a>
					</article>

					<article>
						<a href="${cp}/movie/moviedetail.mo?movienum=${movie6.movienum}" class="image featured"><img src="../app/file/${movie6.moviephoto}" alt="" /></a>
					</article>

					<article>
						<a href="${cp}/movie/moviedetail.mo?movienum=${movie7.movienum}" class="image featured"><img src="../app/file/${movie7.moviephoto}" alt="" /></a>
					</article>

					<article>
						<a href="${cp}/movie/moviedetail.mo?movienum=${movie8.movienum}" class="image featured"><img src="../app/file/${movie8.moviephoto}" alt="" /></a>
					</article>

					<article>
						<a href="${cp}/movie/moviedetail.mo?movienum=${movie9.movienum}" class="image featured"><img src="../app/file/${movie9.moviephoto}" alt="" /></a>
					</article>

					<article>
						<a href="${cp}/movie/moviedetail.mo?movienum=${movie10.movienum}" class="image featured"><img src="../app/file/${movie10.moviephoto}" alt="" /></a>
					</article>
				</div>
			</section>
		</div>

			<div id="page-wrapper">
				<!-- 조회수 순 -->
				<section class="carousel">
					<div id="title3"><h2>조회수 순</h2></div>
						<div class="reel">
							<article>
								<a href="${cp}/movie/moviedetail.mo?movienum=${movie11.movienum}" class="image featured"><img src="../app/file/${movie11.moviephoto}" alt="" /></a>
							</article>
	
							<article>
								<a href="${cp}/movie/moviedetail.mo?movienum=${movie12.movienum}" class="image featured"><img src="../app/file/${movie12.moviephoto}" alt="" /></a>
							</article>
	
							<article>
								<a href="${cp}/movie/moviedetail.mo?movienum=${movie13.movienum}" class="image featured"><img src="../app/file/${movie13.moviephoto}" alt="" /></a>
							</article>
	
							<article>
								<a href="${cp}/movie/moviedetail.mo?movienum=${movie14.movienum}" class="image featured"><img src="../app/file/${movie14.moviephoto}" alt="" /></a>
							</article>
	
							<article>
								<a href="${cp}/movie/moviedetail.mo?movienum=${movie15.movienum}" class="image featured"><img src="../app/file/${movie15.moviephoto}" alt="" /></a>
							</article>
	
							<article>
								<a href="${cp}/movie/moviedetail.mo?movienum=${movie16.movienum}" class="image featured"><img src="../app/file/${movie16.moviephoto}" alt="" /></a>
							</article>
	
							<article>
								<a href="${cp}/movie/moviedetail.mo?movienum=${movie17.movienum}" class="image featured"><img src="../app/file/${movie17.moviephoto}" alt="" /></a>
							</article>
	
							<article>
								<a href="${cp}/movie/moviedetail.mo?movienum=${movie18.movienum}" class="image featured"><img src="../app/file/${movie18.moviephoto}" alt="" /></a>
							</article>
	
							<article>
								<a href="${cp}/movie/moviedetail.mo?movienum=${movie19.movienum}" class="image featured"><img src="../app/file/${movie19.moviephoto}" alt="" /></a>
							</article>
	
							<article>
								<a href="${cp}/movie/moviedetail.mo?movienum=${movie20.movienum}" class="image featured"><img src="../app/file/${movie20.moviephoto}" alt="" /></a>
							</article>
						</div>
					</section>
				</div>
						
			<c:if test="${loginUser != null}">
				<div id="page-wrapper">
				<!-- 시청한 영화 -->
					<section class="carousel">
						<div id="title3"><h2>조회수 순</h2></div>
						<div class="reel">
							<article>
								<a href="${cp}/movie/moviedetail.mo?movienum=${movie31.movienum}" class="image featured"><img src="../app/file/${movie31.moviephoto}" alt="" /></a>
							</article>
	
							<article>
								<a href="${cp}/movie/moviedetail.mo?movienum=${movie32.movienum}" class="image featured"><img src="../app/file/${movie32.moviephoto}" alt="" /></a>
							</article>
	
							<article>
								<a href="${cp}/movie/moviedetail.mo?movienum=${movie33.movienum}" class="image featured"><img src="../app/file/${movie33.moviephoto}" alt="" /></a>
							</article>
	
							<article>
								<a href="${cp}/movie/moviedetail.mo?movienum=${movie34.movienum}" class="image featured"><img src="../app/file/${movie34.moviephoto}" alt="" /></a>
							</article>
	
							<article>
								<a href="${cp}/movie/moviedetail.mo?movienum=${movie35.movienum}" class="image featured"><img src="../app/file/${movie35.moviephoto}" alt="" /></a>
							</article>
	
							<article>
								<a href="${cp}/movie/moviedetail.mo?movienum=${movie36.movienum}" class="image featured"><img src="../app/file/${movie36.moviephoto}" alt="" /></a>
							</article>
	
							<article>
								<a href="${cp}/movie/moviedetail.mo?movienum=${movie37.movienum}" class="image featured"><img src="../app/file/${movie37.moviephoto}" alt="" /></a>
							</article>
	
							<article>
								<a href="${cp}/movie/moviedetail.mo?movienum=${movie38.movienum}" class="image featured"><img src="../app/file/${movie38.moviephoto}" alt="" /></a>
							</article>
	
							<article>
								<a href="${cp}/movie/moviedetail.mo?movienum=${movie39.movienum}" class="image featured"><img src="../app/file/${movie39.moviephoto}" alt="" /></a>
							</article>
	
							<article>
								<a href="${cp}/movie/moviedetail.mo?movienum=${movie40.movienum}" class="image featured"><img src="../app/file/${movie40.moviephoto}" alt="" /></a>
							</article>
						</div>
					</section>
				</div>
				</c:if>

				<div id="page-wrapper">
				<!-- 좋아요 순 -->
					<section class="carousel">
						<div id="title4"><h2>좋아요 순</h2></div>
							<div class="reel">
								<article>
									<a href="${cp}/movie/moviedetail.mo?movienum=${movie21.movienum}" class="image featured"><img src="../app/file/${movie21.moviephoto}" alt="" /></a>
								</article>
				
								<article>
									<a href="${cp}/movie/moviedetail.mo?movienum=${movie22.movienum}" class="image featured"><img src="../app/file/${movie22.moviephoto}" alt="" /></a>
								</article>
				
								<article>
									<a href="${cp}/movie/moviedetail.mo?movienum=${movie23.movienum}" class="image featured"><img src="../app/file/${movie23.moviephoto}" alt="" /></a>
								</article>
				
								<article>
									<a href="${cp}/movie/moviedetail.mo?movienum=${movie24.movienum}" class="image featured"><img src="../app/file/${movie24.moviephoto}" alt="" /></a>
								</article>
				
								<article>
									<a href="${cp}/movie/moviedetail.mo?movienum=${movie25.movienum}" class="image featured"><img src="../app/file/${movie25.moviephoto}" alt="" /></a>
								</article>
				
								<article>
									<a href="${cp}/movie/moviedetail.mo?movienum=${movie26.movienum}" class="image featured"><img src="../app/file/${movie26.moviephoto}" alt="" /></a>
								</article>
				
								<article>
									<a href="${cp}/movie/moviedetail.mo?movienum=${movie27.movienum}" class="image featured"><img src="../app/file/${movie27.moviephoto}" alt="" /></a>
								</article>
				
								<article>
									<a href="${cp}/movie/moviedetail.mo?movienum=${movie28.movienum}" class="image featured"><img src="../app/file/${movie28.moviephoto}" alt="" /></a>
								</article>
				
								<article>
									<a href="${cp}/movie/moviedetail.mo?movienum=${movie29.movienum}" class="image featured"><img src="../app/file/${movie29.moviephoto}" alt="" /></a>
								</article>
				
								<article>
									<a href="${cp}/movie/moviedetail.mo?movienum=${movie30.movienum}" class="image featured"><img src="../app/file/${movie30.moviephoto}" alt="" /></a>
								</article>
							</div>
						</section>
					</div>
		<script src="/app/assets/js/jquery.min.js"></script>
		<script src="/app/assets/js/jquery.dropotron.min.js"></script>
		<script src="/app/assets/js/jquery.scrolly.min.js"></script>
		<script src="/app/assets/js/jquery.scrollex.min.js"></script>
		<script src="/app/assets/js/browser.min.js"></script>
		<script src="/app/assets/js/breakpoints.min.js"></script>
		<script src="/app/assets/js/util.js"></script>
		<script src="/app/assets/js/main.js"></script>
<%@include file="/app/common/footer.jsp" %>			
</body>
</html>