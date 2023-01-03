<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="../css/MovieDetailView.css">
</head>
<body>
   <%@include file="/app/common/header.jsp" %>
      <div id="movie">
         <iframe width="100%" height="100%" src="../app/film/${movieList.moviefilm}"></iframe>
      </div>
      <div id="i">
         <div id="but">
            <a id="a" href="${cp}/movie/movie_subscribe.mo?movienum=${movieList.movienum}">찜하기</a>
            <a href="javascript:;" class="like">
               <img src="https://cdn-icons-png.flaticon.com/128/889/889221.png" alt="좋아요">
            </a>
         </div>
         <div class="right_area">
            <a id="a" href="${cp}/movie/movie_like.mo?movienum=${movieList.movienum}">좋아요</a>
            <a href="javascript:;" class="icon heart">
               <img src="../img/heart.png" alt="좋아요">
            </a>
          </div>
          <div>
            <p>조회수 : ${movieList.view_cnt}</p>
          </div>
      </div>
   <div id="moviecontent">
         <div id="movietitle"><p>${movieList.movietitle}</p></div>
        <div id="movieopen"><p>${movieList.movierelease}</p></div>
        <div id="actor"><p>${movieList.actorname}</p></div>
        <div id="moviesummary"><p>${movieList.moviecontents}</p></div>
        <div id="genre"><p>${movieList.typename}</p></div>
   </div>
   <div id="nextmovie">
      <section class="carousel">
         <div class="reel">
         <c:if test="${movieList.movienum != movie1.movienum}">
            <article>
               <a href="${cp}/movie/moviedetail.mo?movienum=${movie1.movienum}" class="image featured"><img src="../app/file/${movie1.moviephoto}" alt=""/></a>
            </article>
         </c:if>
		 <c:if test="${movieList.movienum != movie2.movienum}">
            <article>
               <a href="${cp}/movie/moviedetail.mo?movienum=${movie2.movienum}" class="image featured"><img src="../app/file/${movie2.moviephoto}" alt=""/></a>
            </article>
		 </c:if>
		 <c:if test="${movieList.movienum != movie3.movienum}">
            <article>
               <a href="${cp}/movie/moviedetail.mo?movienum=${movie3.movienum}" class="image featured"><img src="../app/file/${movie3.moviephoto}" alt=""/></a>
            </article>
		 </c:if>
		 <c:if test="${movieList.movienum != movie4.movienum}">
            <article>
               <a href="${cp}/movie/moviedetail.mo?movienum=${movie4.movienum}" class="image featured"><img src="../app/file/${movie4.moviephoto}" alt=""/></a>
            </article>
		 </c:if>
		 <c:if test="${movieList.movienum != movie5.movienum}">
            <article>
               <a href="${cp}/movie/moviedetail.mo?movienum=${movie5.movienum}" class="image featured"><img src="../app/file/${movie5.moviephoto}" alt=""/></a>
            </article>
		 </c:if>
		 <c:if test="${movieList.movienum != movie6.movienum}">
            <article>
               <a href="${cp}/movie/moviedetail.mo?movienum=${movie6.movienum}" class="image featured"><img src="../app/file/${movie6.moviephoto}" alt=""/></a>
            </article>
		 </c:if>
	  	 <c:if test="${movieList.movienum != movie7.movienum}">
            <article>
               <a href="${cp}/movie/moviedetail.mo?movienum=${movie7.movienum}" class="image featured"><img src="../app/file/${movie7.moviephoto}" alt=""/></a>
            </article>
	  	 </c:if>
		 <c:if test="${movieList.movienum != movie8.movienum}">
            <article>
               <a href="${cp}/movie/moviedetail.mo?movienum=${movie8.movienum}" class="image featured"><img src="../app/file/${movie8.moviephoto}" alt=""/></a>
            </article>
		 </c:if>
		 <c:if test="${movieList.movienum != movie9.movienum}">
            <article>
               <a href="${cp}/movie/moviedetail.mo?movienum=${movie9.movienum}" class="image featured"><img src="../app/file/${movie9.moviephoto}" alt=""/></a>
            </article>
		 </c:if>
		 <c:if test="${movieList.movienum != movie10.movienum}">
            <article>
               <a href="${cp}/movie/moviedetail.mo?movienum=${movie10.movienum}" class="image featured"><img src="../app/file/${movie10.moviephoto}" alt=""/></a>
            </article>
		 </c:if>
         </div>
      </section>
   </div>
<%@include file="/app/common/footer.jsp" %>
</body>
<script src="../assets/js/jquery.min.js"></script>
<script src="../assets/js/jquery.dropotron.min.js"></script>
<script src="../assets/js/jquery.scrolly.min.js"></script>
<script src="../assets/js/jquery.scrollex.min.js"></script>
<script src="../assets/js/browser.min.js"></script>
<script src="../assets/js/breakpoints.min.js"></script>
<script src="../assets/js/util.js"></script>
<script src="../assets/js/main.js"></script>
<script>
   // <![CDATA[  <-- For SVG support
   if ('WebSocket' in window) {
      (function () {
         function refreshCSS() {
            var sheets = [].slice.call(document.getElementsByTagName("link"));
            var head = document.getElementsByTagName("head")[0];
            for (var i = 0; i < sheets.length; ++i) {
               var elem = sheets[i];
               var parent = elem.parentElement || head;
               parent.removeChild(elem);
               var rel = elem.rel;
               if (elem.href && typeof rel != "string" || rel.length == 0 || rel.toLowerCase() == "stylesheet") {
                  var url = elem.href.replace(/(&|\?)_cacheOverride=\d+/, '');
                  elem.href = url + (url.indexOf('?') >= 0 ? '&' : '?') + '_cacheOverride=' + (new Date().valueOf());
               }
               parent.appendChild(elem);
            }
         }
         var protocol = window.location.protocol === 'http:' ? 'ws://' : 'wss://';
         var address = protocol + window.location.host + window.location.pathname + '/ws';
         var socket = new WebSocket(address);
         socket.onmessage = function (msg) {
            if (msg.data == 'reload') window.location.reload();
            else if (msg.data == 'refreshcss') refreshCSS();
         };
         if (sessionStorage && !sessionStorage.getItem('IsThisFirstTime_Log_From_LiveServer')) {
            console.log('Live reload enabled.');
            sessionStorage.setItem('IsThisFirstTime_Log_From_LiveServer', true);
         }
      })();
   }
   else {
      console.error('Upgrade your browser. This Browser is NOT supported WebSocket for Live-Reloading.');
   }
   // ]]>

   //heart 좋아요 클릭시! 하트 뿅
$(function(){
    var $likeBtn =$('.icon.heart');

        $likeBtn.click(function(){
        $likeBtn.toggleClass('active');

        if($likeBtn.hasClass('active')){          
           $(this).find('img').attr({
              'src': 'https://cdn-icons-png.flaticon.com/512/803/803087.png',
               alt:'찜하기 완료'
                });
          
          
         }else{
            $(this).find('i').removeClass('fas').addClass('far')
           $(this).find('img').attr({
              'src': '../img/heart.png',
              alt:"찜하기"
           })
         }
     })
})
// 좋아요
$(function(){
    var $likeBtn =$('#but .like ');

        $likeBtn.click(function(){
        $likeBtn.toggleClass('active');

        if($likeBtn.hasClass('active')){          
           $(this).find('img').attr({
              'src': 'https://cdn-icons-png.flaticon.com/128/818/818489.png',
               alt:'좋아요 완료'
                });
          
         }else{
            $(this).find('i').removeClass('fas').addClass('far')
           $(this).find('img').attr({
              'src': 'https://cdn-icons-png.flaticon.com/128/889/889221.png',
              alt:"좋아요"
           })
         }
     })
})

</script>
</html>