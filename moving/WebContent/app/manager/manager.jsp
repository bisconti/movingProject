<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath}" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
html {
   width: 100%;
   height: 100%;
}
    body{
       color:white ;
        background-color: black;
        width: 100%;
        height: 100%;
    }
    #div{
        color: white;
        margin: 343px auto;
        min-height: 50%;
        margin-left: 600px;
    }
    div{
        width: 40%;
    }
    #div1{
        text-align: center;
        padding-top: 20px;
        height: 300px;
        float: left;
        font-size: 40px;
        width: 30%;
    }
    a{
        color:white ;
        text-decoration: none;
    }
    
    
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
               placeholder="???????????? ??????????????????(?????????, ?????????)" id="ms" name=ms
               value="${keyword}" onkeypress="if(event.keyCode == 13){search()}"> <input type="button" class="cff"
               id="magnifying" onclick="search()">
            </span>
         </div>
         <c:choose>
         	<c:when test="${loginUser == null}">
		        <div id="login">
		            <a href="/user/userlogin.us" id="login_a"><span>?????????</span></a>
		        </div>
         	</c:when>
         	<c:otherwise>
	            <div id="mypage">
	            	<a href="${cp}/user/mypage.us"><img src="/app/img/basicprofile.jpg" alt="" id="myprofile"></a>
	            		<h5 id="welcome">???????????????! <br>${loginUser}???</h5>
	        	</div>
	        	<div id="logout">
		            <a href="${cp}/user/userlogout.us" id="logout_a"><span>????????????</span></a>
		        </div>
         	</c:otherwise>
         </c:choose>
      </div>
   </header>
		<div id="div">
		<h1>???????????? ????????? ???????????????</h1>
		    <div id="div1">
		        <a href="${cp}/movie/center.mo">???????????? ?????? ??????</a>
		    </div>
		    <div id="div1">
		        <a href= "${cp}/movie/fileupload.mo">?????? ????????? </a>
		    </div>
		</div>
		</body>
		<%@include file="/app/common/footer.jsp" %> 
<script>
   function search() {
      const ms = document.getElementById("ms");
      //????????? ??????
      if (ms.value == "") {
         alert("???????????? ??????????????????!");
         ms.focus();
         return false;
      }
      location.href = "${cp}/movie/moviesearch.mo?ms="+ms.value;
   }
</script>
</html>

