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
         <iframe width="100%" height="100%" src="../file/${movie1.movie}"></iframe>
      </div>
      <div id="i">
         <div id="but">
            <p id="a">찜하기</p>
            <a href="javascript:;" class="like">
               <img src="https://cdn-icons-png.flaticon.com/128/889/889221.png" alt="좋아요">
            </a>
         </div>
         <div class="right_area">
            <p id="a">좋아요</p>
            <a href="javascript:;" class="icon heart">
               <img src="../assets/css/images/heart.png" alt="좋아요">
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
        <div id="genre"><p>${movieList.typenmae}</p></div>
   </div>
   <div id="nextmovie">
      <section class="carousel">
         <div class="reel">
            <article>
               <a href="#" class="image featured"><img src="../file/${movie1.moviephoto}" alt="" /></a>
            </article>

            <article>
               <a href="#" class="image featured"><img src="../img/아바타 물의 길.jpg" alt="" /></a>
            </article>

            <article>
               <a href="#" class="image featured"><img src="../img/아바타 물의 길.jpg" alt="" /></a>
            </article>

            <article>
               <a href="#" class="image featured"><img src="../img/아바타 물의 길.jpg" alt="" /></a>
            </article>

            <article>
               <a href="#" class="image featured"><img src="../img/아바타 물의 길.jpg" alt="" /></a>
            </article>

            <article>
               <a href="#" class="image featured"><img src="../img/아바타 물의 길.jpg" alt="" /></a>
            </article>

            <article>
               <a href="#" class="image featured"><img src="../img/아바타 물의 길.jpg" alt="" /></a>
            </article>

            <article>
               <a href="#" class="image featured"><img src="../img/아바타 물의 길.jpg" alt="" /></a>
            </article>

            <article>
               <a href="#" class="image featured"><img src="../img/아바타 물의 길.jpg" alt="" /></a>
            </article>

            <article>
               <a href="#" class="image featured"><img src="../img/아바타 물의 길.jpg" alt="" /></a>
            </article>

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
              'src': './img/heart.png',
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