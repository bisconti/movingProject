<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${cp}/app/css/subscribe.css">
<style>
@import url("https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,300italic,400,400italic,600");
@import url("/app/assets/css/fontawesome-all.css");

/* Footer */

#footer {
    width: 100%;
    position: relative;
    overflow: hidden;
    background: #212121;
    color: #fff;
}
#footer .contact {
    text-align: center;
    width: 1400px;
    height: 231px;
    position: relative;
}
#footer .copyright {
    text-align: center;
    color: rgba(128, 128, 128, 0.75);
    font-size: 0.8em;
    cursor: default;
}

#footer .copyright a {
    color: rgba(128, 128, 128, 0.75);
}

#footer .copyright a:hover {
    color: rgba(212, 212, 212, 0.85);
}
    
#footer .menus{
    display: inline-block;
    position: relative;
    width: 100%;
    clear: both;
    text-align: right;
    font-size: 100%;
}

body{
   margin: 0;
}

.copyright{
    clear: both;
    width: 100%;
}
div.menus{
    text-align: center;
    padding: 2% 0%;
}
.menus > li{
    text-align:center;
    float: left;
    padding-left: 3%;
    list-style: none;
    font-size: 130%;
}
#foot_menu > a {
    text-decoration: none;
}
p.menus{
    text-align: center;
    position: relative;
    list-style: none;
    float: left;
    background: black;
    padding: 0% 2% 0% 2%;
}
p.menus span a {
    text-decoration: none;
    color: white;
    font-weight: bold;
    font-size: 120%;
}
p.menus span a:hover{
    color: red;
}
    
    /* Icons */
#icons{
    text-align: right;
    position: relative;
    right: 7%;
}
ul.icons {
    position: relative;
    background: red;
    border-radius: 4em;
    display: inline-block;
    padding: 1.5%;
    font-size: 1.0em;
    cursor: default;
    list-style: none;
}
    
ul.icons li {
    display: inline-block;
    padding-left: 0;
}
    
ul.icons li a {
    display: inline-block;
    background: none;
    width: 2.0em;
    height: 2.0em;
    line-height: 2.0em;
    text-align: center;
    border-radius: 100%;
    border: 0;
    color: inherit;
}
    
ul.icons li a:hover {
    color:black;
}
    
    
/* Icons */
    
.icon {
    text-decoration: none;
    text-decoration: none;
}
    
.icon:before {
    -moz-osx-font-smoothing: grayscale;
    -webkit-font-smoothing: antialiased;
    display: inline-block;
    font-style: normal;
    font-variant: normal;
    text-rendering: auto;
    line-height: 1;
    text-transform: none !important;
    font-family: 'Font Awesome 5 Free';
    font-weight: 400;
}
    
.icon:before {
    line-height: inherit;
    font-size: 2em;
}
    
.icon > .label {
    display: none;
}
    

    
.icon.brands:before {
    font-family: 'Font Awesome 5 Brands';
}

</style>
</head>
<body id="body">
   <%@include file="/app/common/header.jsp" %>
   <div id="wrap">
         <div id="monthly">
            <p>월 구독제</p>
            <ul>
               <li>약 120편의 영화를 제한없이 감상하실 수 있습니다.</li>
               <li>720p 화질까지 시청이 가능합니다.</li>
               <li>9,000￦의 요금이 매달 납부됩니다.(VAT 포함, 구독은 언제든지 해지할 수 있습니다.)</li>
            </ul>
            <form name="subscribeMonth" action="${cp}/user/subscribeOk.us" method="post">
               <input type="button" value="결제하기" id="payment" onclick="paymentOk('${loginUser}', '9000')" >
               <input type="hidden" value="9,000￦" name="subprice"/>
               <input type="hidden" value="m" name="y"/>
            </form>
         </div>
         <div id="year">
            <p>연 구독제</p>
            <ul>
               <li>약 120편의 영화를 제한없이 감상하실 수 있습니다.</li>
               <li>1080p 화질까지 시청이 가능합니다.</li>
               <li>99,000￦의 요금이 매년 납부됩니다.(VAT 포함, 구독은 언제든지 해지할 수 있습니다.)</li>
            </ul>
            <form name="subscribeYear" action="${cp}/user/subscribeOk.us" method="post">
               <input type="button" value="결제하기" id="payment" onclick="paymentOk('${loginUser}', '99000')">
               <input type="hidden" value="99,000￦" name="subprice"/>
               <input type="hidden" value="y" name="y"/>
            </form>
         </div>
      </div>
   <div id="footer">
       <div class="container">
           <section class="contact">
               <div id="icons">
                   <ul class="icons">
                       <li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
                       <li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
                       <li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
                       <li><a href="#" class="icon brands fa-youtube"><span class="label">Instagram</span></a></li>
                   </ul>
               </div>
               <div class="copyright">
                           <div class="menus">
                               <ul class="menus">
                                   <li id="foot_menu"><a href="#">고객센터</a></li>
                                   
                                   <li id="foot_menu"><a href="#">이용약관</a></li>
                                   
                                   <li id="foot_menu"><a href="#">개인정보 처리방침</a></li>
                                   
                                   <li id="foot_menu"><a href="#">청소년 보호정책</a></li>
                                   
                                   <li id="foot_menu">Email : moving@naver.com</li>
                                   <li id="foot_menu">광고 문의 : 010-1234-2134</li>
                                   <li id="foot_menu">대표 : 이준민</li>
                                   <li id="foot_menu"><a href="#">© Moving. All rights reserved.</a></li>
                               </ul>
                           </div>
               </div>
           </section>
       </div>
   </div>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script>
var IMP = window.IMP;
IMP.init("imp67338724");
  
var today = new Date();
var hours = today.getHours(); 
var minutes = today.getMinutes();
var seconds = today.getSeconds();
var milliseconds = today.getMilliseconds();
var makeMerchantUid = hours +  minutes + seconds + milliseconds;

function paymentOk(user, price) {
   if(user == null || user == undefined || user == ''){
      alert("로그인 후 결제해주세요.");
      return false;
   }

    IMP.request_pay(
      {
          pg : 'kakaopay',
          merchant_uid: "IMP"+makeMerchantUid,
          name : '정기결제권',
          amount : price,
          buyer_email : 'asdoe22@gamil.com',
          buyer_name : 'history',
          buyer_tel : '010-1234-5678',
          buyer_addr : '서울특별시 강남구 삼성동', 
          buyer_postcode : '123-456',
       }, function (rsp) {
           if (rsp.success) {
               console.log(rsp);
               console.log(today);
               var msg = '결제가 완료되었습니다.\n';
                msg += '고유ID : ' + rsp.imp_uid+"\n";
                msg += '상점 거래ID : ' + rsp.merchant_uid+"\n";
                msg += '결제 금액 : ' + rsp.paid_amount+'원\n';
                msg += '카드 승인번호 : ' + rsp.apply_num;
                
                if(price == '99000'){
                   subscribeYear.submit();                   
                }else{
                   subscribeMonth.submit();   
                }
           } else {
               console.log(rsp);
               var msg = '결제에 실패하였습니다.\n';
               msg += '에러내용 : ' + rsp.error_msg;
           }
          alert(msg);
       }
    );
}
</script>
</body>
</html>