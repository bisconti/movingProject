<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" href="/app/css/MovieDetailView.css">
</head>
<body>
   <%@include file="/app/common/header.jsp" %>
      <div id="movie">
         <iframe onclick="plusWatch()" width="100%" height="100%" src="../app/file/${movieList.moviefilm}"></iframe>
      </div>
      <div id="i">
            <c:choose>
   <c:when test="${wish == 0}">
      <div id="but">
         <a href="#;" id="a">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;찜</a> <a href="javascript:;"
            class="like" onclick="wishcheck()"><img src="/app/img/noheart.png" alt="찜하기전" id="wish">
         </a>
      </div>
      </c:when>
      <c:otherwise>
      <div id="but">
         <a href="#;" id="a">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;찜</a> <a href="javascript:;"
            class="like" onclick="wishcheck()"><img src="/app/img/heart.png" alt="찜한후" id="wish">
         </a>
      </div>
      </c:otherwise>
      </c:choose>
      <c:choose>
      <c:when test="${like == 0}">
      <div class="right_area">
         <a id="a"
            href="${cp}/movie/movie_like.mo?movienum=${movieList.movienum}">좋아요</a>
         <a href="javascript:;" class="icon heart" onclick="likecheck()"> <img
            src="/app/img/구독하기.png" alt="좋아요" id="heart">
         </a>
      </div>
      </c:when>
      <c:otherwise>
      <div class="right_area">
         <a id="a"
            href="${cp}/movie/movie_like.mo?movienum=${movieList.movienum}">좋아요</a>
         <a href="javascript:;" class="icon heart" onclick="likecheck()"> <img
            src="/app/img/구독완료.png" alt="좋아요" id="heart">
         </a>
      </div>
      </c:otherwise>
      </c:choose>
      <div id="totalview">
         <div id="hey"><p>조회수: ${movieList.view_cnt}</p></div>
         <div id="heyhey"><a class="fuck" href="${cp}/movie/wishlist.mo?userid=${loginUser}">나의 찜목록 보기♥</a></div><br>
		 <div id="genre"><p>장르: ${movieList.typename}</p></div>	
		 <div id="actor"><p>주연배우: ${movieList.actorname}</p></div>
      </div>
     </div>
   <div id="moviecontent">
        <div id="movietitle"><p>제목 : ${movieList.movietitle}</p></div>
        <div id="movieopen"><p>개봉일 : ${movieList.movierelease}</p></div>
        <div id="moviesummary"><p>${movieList.moviecontents}</p></div>
   </div>
   <hr>
   <div id="nextmovie_word">
         <p>이런 영화는 어떠세요?</p>
   </div>
   <div id="nextmovie">
      <section class="carousel">
         <div class="reel">
         <c:if test="${movieList.movienum != movie1.movienum}">
            <article>
               <a href="${cp}/movie/moviedetail.mo?movienum=${movie1.movienum}&movieage=${movie1.agelimit}" class="image featured"><img src="../app/file/${movie1.moviephoto}" alt=""/></a>
            </article>
         </c:if>
       <c:if test="${movieList.movienum != movie2.movienum}">
            <article>
               <a href="${cp}/movie/moviedetail.mo?movienum=${movie2.movienum}&movieage=${movie2.agelimit}" class="image featured"><img src="../app/file/${movie2.moviephoto}" alt=""/></a>
            </article>
       </c:if>
       <c:if test="${movieList.movienum != movie3.movienum}">
            <article>
               <a href="${cp}/movie/moviedetail.mo?movienum=${movie3.movienum}&movieage=${movie3.agelimit}" class="image featured"><img src="../app/file/${movie3.moviephoto}" alt=""/></a>
            </article>
       </c:if>
       <c:if test="${movieList.movienum != movie4.movienum}">
            <article>
               <a href="${cp}/movie/moviedetail.mo?movienum=${movie4.movienum}&movieage=${movie4.agelimit}" class="image featured"><img src="../app/file/${movie4.moviephoto}" alt=""/></a>
            </article>
       </c:if>
       <c:if test="${movieList.movienum != movie5.movienum}">
            <article>
               <a href="${cp}/movie/moviedetail.mo?movienum=${movie5.movienum}&movieage=${movie5.agelimit}" class="image featured"><img src="../app/file/${movie5.moviephoto}" alt=""/></a>
            </article>
       </c:if>
       <c:if test="${movieList.movienum != movie6.movienum}">
            <article>
               <a href="${cp}/movie/moviedetail.mo?movienum=${movie6.movienum}&movieage=${movie6.agelimit}" class="image featured"><img src="../app/file/${movie6.moviephoto}" alt=""/></a>
            </article>
       </c:if>
         <c:if test="${movieList.movienum != movie7.movienum}">
            <article>
               <a href="${cp}/movie/moviedetail.mo?movienum=${movie7.movienum}&movieage=${movie7.agelimit}" class="image featured"><img src="../app/file/${movie7.moviephoto}" alt=""/></a>
            </article>
         </c:if>
       <c:if test="${movieList.movienum != movie8.movienum}">
            <article>
               <a href="${cp}/movie/moviedetail.mo?movienum=${movie8.movienum}&movieage=${movie8.agelimit}" class="image featured"><img src="../app/file/${movie8.moviephoto}" alt=""/></a>
            </article>
       </c:if>
       <c:if test="${movieList.movienum != movie9.movienum}">
            <article>
               <a href="${cp}/movie/moviedetail.mo?movienum=${movie9.movienum}&movieage=${movie9.agelimit}" class="image featured"><img src="../app/file/${movie9.moviephoto}" alt=""/></a>
            </article>
       </c:if>
       <c:if test="${movieList.movienum != movie10.movienum}">
            <article>
               <a href="${cp}/movie/moviedetail.mo?movienum=${movie10.movienum}&movieage=${movie10.agelimit}" class="image featured"><img src="../app/file/${movie10.moviephoto}" alt=""/></a>
            </article>
       </c:if>
         </div>
      </section>
   </div>
<%@include file="/app/common/footer.jsp" %>
</body>
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
              'src': '../img/heart.png',
               alt:'찜하기 완료'
                });
          
          
         }else{
            $(this).find('i').removeClass('fas').addClass('far')
           $(this).find('img').attr({
              'src': '../img/noheart.png',
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
              'src': 'https://cdn-icons-png.flaticon.com/512/7606/7606143.png',
               alt:'좋아요 완료'
                });
          
         }else{
            $(this).find('i').removeClass('fas').addClass('far')
           $(this).find('img').attr({
              'src': 'https://cdn-icons-png.flaticon.com/512/3384/3384158.png',
              alt:"좋아요 하기"
           })
         }
     })
})

</script>
<script>
function wishcheck(){
      const xhr = new XMLHttpRequest();
      const like = document.getElementsByClassName("like");
      
      xhr.onreadystatechange = function(){
         if(xhr.readyState == 4){
            if(xhr.status == 200){
               let txt = xhr.responseText;
               txt = txt.trim();
               if(txt == "O"){
                  document.getElementById("wish").src="/app/img/heart.png";
               }
               else{
                  document.getElementById("wish").src="/app/img/noheart.png";

               }
            }
         }
      }
      
      xhr.open("GET",cp+"/movie/wishcheck.mo?movienum=${movieList.movienum}",true);
      xhr.send();
   }
    
   function likecheck(){
         const xhr = new XMLHttpRequest();
         const like = document.getElementsByClassName("icon heart");
         
         xhr.onreadystatechange = function(){
            if(xhr.readyState == 4){
               if(xhr.status == 200){
                  let txt = xhr.responseText;
                  txt = txt.trim();
                  if(txt == "O"){
                     document.getElementById("heart").src="/app/img/구독완료.png";
                  }
                  else{
                     document.getElementById("heart").src="/app/img/구독하기.png";

                  }
               }
            }
         }
         
         xhr.open("GET",cp+"/movie/likecheck.mo?movienum=${movieList.movienum}",true);
         xhr.send();
      }
</script>
</html>