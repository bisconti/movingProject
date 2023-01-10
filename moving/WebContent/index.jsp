<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cp" value="${pageContext.request.contextPath}" scope="session"/>
<c:set var="loginUser" value="${loginUser}" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="${cp}/app/assets/css/main.css" />
<style>
html,header,head{
    width: 100%;
    margin: 0;
}
    
#header{
    height: 76px;
    max-height: 100%;
    position: fixed;
    display: flex;
    width: 100%;
    min-width: 1248px;
    max-width: 100%;
    top: 0;
    z-index: 10001;
    background-color: #212121;
    box-sizing: border-box;
}

#logo{
    width: 7%;
    height: 100%;
    margin-left: 30px;
    align-items: center;
}
#logos{
    margin-top: 15px;
    width: 100%;
}

#search{
    display: flex;
    position: relative;
    width: 82%;
    flex-grow: 2;
    justify-content: center;
}
#search > span{
    text-align: center;
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100%;
}
#search > span > input:nth-child(1){
    width: 30%;
    height: 50%;
}
#magnifying{
    width: 2%;
    height: 35%;
    background: url(/app/img/magnifying-removebg-preview.png) no-repeat;
    background-size: contain;
    cursor: pointer;
    border: none;
    position: absolute;
    right: 35%;
}
#login{
    display: flex;
    position: relative;
    width: 10%;
    line-height: 35px;
}
#login_a{
    background-color: #363636;
    color: white;
    height: 36px;
    padding: 0 20px;
    align-items: center;
    margin-left: 50px;
    margin-top: 20px;
    font-size: 13px;
    text-decoration: none;
    box-sizing: border-box;
    
}
#login_a > span{
    font-weight: bold;
}
#logout{
    display: flex;
    position: relative;
    width: 10%;
    line-height: 35px;
}
#logout_a{
    background-color: #363636;
    color: white;
    height: 36px;
    padding: 0 20px;
    align-items: center;
    margin-left: 50px;
    margin-top: 20px;
    font-size: 13px;
    text-decoration: none;
    box-sizing: border-box;
}
#logout_a > span{
	font-weight: bold;
}
#search_what{
    position: relative;
}
.cff::placeholder{
    color: #363636;
    font-size: 14px;
    font-weight: bold;

}
.cff{
    background-color: black;
    color: white;
    border: none;
}
#mypage{
    position: absolute;
    width: 10%;
    right: 7%;
}
#mypage > h5{
    color: white;
}
#myprofile{
    width: 25%;
    height: 50%;
    background-size: contain;
    margin-top: 13px;
    margin-left: 40px;
    border-radius: 100px;
}
#welcome{
    position: absolute;
    top: -4px;
    right: 8%;
    font-size: 90%;
    font-weight: bold;
}
body{
margin: 0;
}

</style>
</head>
<body>
<header>
      <div id="header">
         <div id="logo">
            <a href="${cp}/"><img src="/app/img/moving_logo.png" alt="" id="logos"></a>
        </div>
         <div id="search">
            <span> <input class="cff" type="search"
               placeholder="검색어를 입력해주세요(영화명, 배우명)" id="ms" name=ms
               value="${keyword}" onkeypress="if(event.keyCode == 13){search()}"> <input type="button" class="cff"
               id="magnifying" onclick="search()">
            </span>
         </div>
         <c:choose>
         	<c:when test="${loginUser == null}">
		        <div id="login">
		            <a href="/user/userlogin.us" id="login_a"><span>로그인</span></a>
		        </div>
         	</c:when>
         	<c:otherwise>
	            <div id="mypage">
	            	<a href="${cp}/user/mypage.us"><img src="/app/img/basicprofile.jpg" alt="" id="myprofile"></a>
	            		<h5 id="welcome">환영합니다! <br>${loginUser}님</h5>
	        	</div>
	        	<div id="logout">
		            <a href="${cp}/user/userlogout.us" id="logout_a"><span>로그아웃</span></a>
		        </div>
         	</c:otherwise>
         </c:choose>
      </div>
   </header>
	<div id="page-wrapper" class="top_box">
		<div id="post_title"></div>
		<!-- 최신 영화 -->
			<section class="carousel" id="yes">
				<div id="title1"><h2>개봉일 순</h2></div>
				<div class="reel">
					<article onclick="datecheck()">
						<a id="target_movie" href="${cp}/movie/moviedetail.mo?movienum=${movie1.movienum}" class="image featured"><img src="../app/file/${movie1.moviephoto}" alt=""/></a>
					</article>

					<article onclick="datecheck()">
						<a href="${cp}/movie/moviedetail.mo?movienum=${movie2.movienum}" class="image featured"><img src="../app/file/${movie2.moviephoto}" alt="" /></a>
					</article>

					<article onclick="datecheck()">
						<a href="${cp}/movie/moviedetail.mo?movienum=${movie3.movienum}" class="image featured"><img src="../app/file/${movie3.moviephoto}" alt="" /></a>
					</article>

					<article onclick="datecheck()">
						<a href="${cp}/movie/moviedetail.mo?movienum=${movie4.movienum}" class="image featured"><img src="../app/file/${movie4.moviephoto}" alt="" /></a>
					</article>

					<article onclick="datecheck()">
						<a href="${cp}/movie/moviedetail.mo?movienum=${movie5.movienum}" class="image featured"><img src="../app/file/${movie5.moviephoto}" alt="" /></a>
					</article>

					<article onclick="datecheck()">
						<a href="${cp}/movie/moviedetail.mo?movienum=${movie6.movienum}" class="image featured"><img src="../app/file/${movie6.moviephoto}" alt="" /></a>
					</article>

					<article onclick="datecheck()">
						<a href="${cp}/movie/moviedetail.mo?movienum=${movie7.movienum}" class="image featured"><img src="../app/file/${movie7.moviephoto}" alt="" /></a>
					</article>

					<article onclick="datecheck()">
						<a href="${cp}/movie/moviedetail.mo?movienum=${movie8.movienum}" class="image featured"><img src="../app/file/${movie8.moviephoto}" alt="" /></a>
					</article>

					<article onclick="datecheck()">
						<a href="${cp}/movie/moviedetail.mo?movienum=${movie9.movienum}" class="image featured"><img src="../app/file/${movie9.moviephoto}" alt="" /></a>
					</article>

					<article onclick="datecheck()">
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
							<article onclick="datecheck()">
								<a href="${cp}/movie/moviedetail.mo?movienum=${movie11.movienum}" class="image featured"><img src="../app/file/${movie11.moviephoto}" alt="" /></a>
							</article>
	
							<article onclick="datecheck()">
								<a href="${cp}/movie/moviedetail.mo?movienum=${movie12.movienum}" class="image featured"><img src="../app/file/${movie12.moviephoto}" alt="" /></a>
							</article>
	
							<article onclick="datecheck()">
								<a href="${cp}/movie/moviedetail.mo?movienum=${movie13.movienum}" class="image featured"><img src="../app/file/${movie13.moviephoto}" alt="" /></a>
							</article>
	
							<article onclick="datecheck()">
								<a href="${cp}/movie/moviedetail.mo?movienum=${movie14.movienum}" class="image featured"><img src="../app/file/${movie14.moviephoto}" alt="" /></a>
							</article>
	
							<article onclick="datecheck()">
								<a href="${cp}/movie/moviedetail.mo?movienum=${movie15.movienum}" class="image featured"><img src="../app/file/${movie15.moviephoto}" alt="" /></a>
							</article>
	
							<article onclick="datecheck()">
								<a href="${cp}/movie/moviedetail.mo?movienum=${movie16.movienum}" class="image featured"><img src="../app/file/${movie16.moviephoto}" alt="" /></a>
							</article>
	
							<article onclick="datecheck()">
								<a href="${cp}/movie/moviedetail.mo?movienum=${movie17.movienum}" class="image featured"><img src="../app/file/${movie17.moviephoto}" alt="" /></a>
							</article>
	
							<article onclick="datecheck()">
								<a href="${cp}/movie/moviedetail.mo?movienum=${movie18.movienum}" class="image featured"><img src="../app/file/${movie18.moviephoto}" alt="" /></a>
							</article>
	
							<article onclick="datecheck()">
								<a href="${cp}/movie/moviedetail.mo?movienum=${movie19.movienum}" class="image featured"><img src="../app/file/${movie19.moviephoto}" alt="" /></a>
							</article>
	
							<article onclick="datecheck()">
								<a href="${cp}/movie/moviedetail.mo?movienum=${movie20.movienum}" class="image featured"><img src="../app/file/${movie20.moviephoto}" alt="" /></a>
							</article>
						</div>
					</section>
				</div>
						
			<c:if test="${loginUser != null}">
				<div id="page-wrapper">
				<!-- 시청한 영화 -->
					<section class="carousel">
						<div id="title3"><h2>시청한 영화</h2></div>
						<div class="reel">
						<c:if test="${movie31.moviephoto != null }">
							<article onclick="datecheck()">
								<a href="${cp}/movie/moviedetail.mo?movienum=${movie31.movienum}" class="image featured"><img src="../app/file/${movie31.moviephoto}" alt="" /></a>
							</article>
						</c:if>
						<c:if test="${movie32.moviephoto != null }">
							<article onclick="datecheck()">
								<a href="${cp}/movie/moviedetail.mo?movienum=${movie32.movienum}" class="image featured"><img src="../app/file/${movie32.moviephoto}" alt="" /></a>
							</article>
						</c:if>
						<c:if test="${movie33.moviephoto != null }">
							<article onclick="datecheck()">
								<a href="${cp}/movie/moviedetail.mo?movienum=${movie33.movienum}" class="image featured"><img src="../app/file/${movie33.moviephoto}" alt="" /></a>
							</article>
						</c:if>
						<c:if test="${movie34.moviephoto != null }">
							<article onclick="datecheck()"> 
								<a href="${cp}/movie/moviedetail.mo?movienum=${movie34.movienum}" class="image featured"><img src="../app/file/${movie34.moviephoto}" alt="" /></a>
							</article>
						</c:if>	
						<c:if test="${movie35.moviephoto != null }">
							<article onclick="datecheck()">
								<a href="${cp}/movie/moviedetail.mo?movienum=${movie35.movienum}" class="image featured"><img src="../app/file/${movie35.moviephoto}" alt="" /></a>
							</article>
						</c:if>
	
						<c:if test="${movie36.moviephoto != null }">
							<article onclick="datecheck()">
								<a href="${cp}/movie/moviedetail.mo?movienum=${movie36.movienum}" class="image featured"><img src="../app/file/${movie36.moviephoto}" alt="" /></a>
							</article>
						</c:if>
						
						<c:if test="${movie37.moviephoto != null }">
							<article onclick="datecheck()">
								<a href="${cp}/movie/moviedetail.mo?movienum=${movie37.movienum}" class="image featured"><img src="../app/file/${movie37.moviephoto}" alt="" /></a>
							</article>
						</c:if>
	
						<c:if test="${movie38.moviephoto != null }">
							<article onclick="datecheck()">
								<a href="${cp}/movie/moviedetail.mo?movienum=${movie38.movienum}" class="image featured"><img src="../app/file/${movie38.moviephoto}" alt="" /></a>
							</article>
						</c:if>
						
						<c:if test="${movie39.moviephoto != null }">
							<article onclick="datecheck()">
								<a href="${cp}/movie/moviedetail.mo?movienum=${movie39.movienum}" class="image featured"><img src="../app/file/${movie39.moviephoto}" alt="" /></a>
							</article>
						</c:if>
						
						<c:if test="${movie40.moviephoto != null }">
							<article onclick="datecheck()">
								<a href="${cp}/movie/moviedetail.mo?movienum=${movie40.movienum}" class="image featured"><img src="../app/file/${movie40.moviephoto}" alt="" /></a>
							</article>
						</c:if>
						</div>
					</section>
				</div>
				</c:if>

				<div id="page-wrapper">
				<!-- 좋아요 순 -->
					<section class="carousel">
						<div id="title4"><h2>좋아요 순</h2></div>
							<div class="reel">
								<article onclick="datecheck()">
									<a href="${cp}/movie/moviedetail.mo?movienum=${movie21.movienum}" class="image featured"><img src="../app/file/${movie21.moviephoto}" alt="" /></a>
								</article>
				
								<article onclick="datecheck()">
									<a href="${cp}/movie/moviedetail.mo?movienum=${movie22.movienum}" class="image featured"><img src="../app/file/${movie22.moviephoto}" alt="" /></a>
								</article>
				
								<article onclick="datecheck()">
									<a href="${cp}/movie/moviedetail.mo?movienum=${movie23.movienum}" class="image featured"><img src="../app/file/${movie23.moviephoto}" alt="" /></a>
								</article>
				
								<article onclick="datecheck()">
									<a href="${cp}/movie/moviedetail.mo?movienum=${movie24.movienum}" class="image featured"><img src="../app/file/${movie24.moviephoto}" alt="" /></a>
								</article>
				
								<article onclick="datecheck()">
									<a href="${cp}/movie/moviedetail.mo?movienum=${movie25.movienum}" class="image featured"><img src="../app/file/${movie25.moviephoto}" alt="" /></a>
								</article>
				
								<article onclick="datecheck()">
									<a href="${cp}/movie/moviedetail.mo?movienum=${movie26.movienum}" class="image featured"><img src="../app/file/${movie26.moviephoto}" alt="" /></a>
								</article>
				
								<article onclick="datecheck()">
									<a href="${cp}/movie/moviedetail.mo?movienum=${movie27.movienum}" class="image featured"><img src="../app/file/${movie27.moviephoto}" alt="" /></a>
								</article>
				
								<article onclick="datecheck()">
									<a href="${cp}/movie/moviedetail.mo?movienum=${movie28.movienum}" class="image featured"><img src="../app/file/${movie28.moviephoto}" alt="" /></a>
								</article>
				
								<article onclick="datecheck()">
									<a href="${cp}/movie/moviedetail.mo?movienum=${movie29.movienum}" class="image featured"><img src="../app/file/${movie29.moviephoto}" alt="" /></a>
								</article>
				
								<article onclick="datecheck()">
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
<script>
	const cp = "${cp}";
</script>
<script>
function datecheck(){
	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4){
			if(xhr.status == 200){
				let txt = xhr.responseText;
				txt = txt.trim();
				if(txt == "O"){
					
				}
				else{
					alert("로그인 및 구독 갱신 후 다시 이용 바랍니다.");
					location.href = "${cp}/";
				}
			}
		}
	}
	
	xhr.open("GET",cp+"/user/subscribe.us?userid=${loginUser}",true);
	xhr.send();
}
</script>
<script>
   function search() {
      const ms = document.getElementById("ms");
      //유효성 검사
      if (ms.value == "") {
         alert("검색어를 입력해주세요!");
         ms.focus();
         return false;
      }
      location.href = "${cp}/movie/moviesearch.mo?ms="+ms.value;
   }
</script>
<%@include file="/app/common/footer.jsp" %>			
</body>
</html>