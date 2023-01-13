<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link href="/app/css/qnaList.css" rel="stylesheet" />
<style>
.modalcolor {
	color : black;
}
span{
	font-size : 12px;
	margin-left: 17px;
}
</style>
</head>
<body>
<%
	String c = request.getHeader("Cookie");
	String userid = "";
	if(c != null){
		Cookie[] cookies = request.getCookies();
		for(Cookie cookie : cookies){
			if(cookie.getValue().equals("qs")){
%>
				<script>alert("문의가 정상적으로 등록되었습니다.");</script>
<%
				userid = cookie.getValue();
				cookie.setMaxAge(0);
				response.addCookie(cookie);
				break;
			}
		}
	}
%>
<%@include file="/app/common/header.jsp" %>
<div id="qnaname1">고객센터</div>
    <br />
    <div id="qnaname2">자주찾는질문</div>
    <br />
    <div id="dan">
      <div class="divBox">
        <div>PC에서 자동 로그아웃이 되었는데, <br>제 계정을 모르겠어요</div>
        <div>PC WEB 계정 선택 화면에서 최근에 마지막으로 로그인하신 계정을 확인하실 수 있습니다.<br>
        최근 로그인 하신 계정을 선택하여 주시고, 혹시라도 일치하는 회원정보가 없다는 알림 메시지가 나온다면 아래 사항을 확인하여 주세요.<br><br>
        ■ MOVING 계정 확인 방법<br>
        1) PC WEB 가장 하단 '아이디 찾기' 클릭<br>
        2) 본인인증으로 찾기 > 본인인증하기<br>
        3) 가입한 계정ID들 안내<br><br>
        ※ 이메일로 찾기 시 확인되지 않으니, 반드시 본인인증으로 찾기로 이용 계정을 확인해주세요.<br>
        ※ SNS 회원은 해당 SNS 아이디가 아닌 무빙 가입 시 등록한 이메일을 알려드립니다.<br>
        ※ 본인인증이 완료된 계정만 확인이 가능합니다.
        </div>
      </div>
      <div class="v-line"></div>
      <div class="divBox">
        <div>PC에서 팝업 플레이로<br>시청하고 싶어요.</div>
        <div>PC 사이트 개편으로 티빙 자체 팝업 플레이어 기능이 중단되었으나, 브라우저 팝업 플레이어 기능은 사용이 가능합니다.<br><br>
        PC팝업 플레이어 기능으로 보다 편하게 시청하실 수 있도록 설정 방법 안내해 드리니 아래 방법으로 설정 후 이용해 주시기 바랍니다.<br><br>
        [크롬 브라우저 PIP기능 사용 방법]<br>
        1) 크롬 브라우저 실행<br>
        2) MOVING 접속 → 콘텐츠 재생<br>
        3) 브라우저 우상단 '음악, 동영상 등의 항목 제어하기'클릭<br>
        4) 재생 중인 티빙 콘텐츠 항목의 'PIP 모드 시작' 클릭<br>
        5) PIP 플레이어 실행<br>
        </div>
      </div>
      <div class="v-line"></div>
      <div class="divBox">
        <div class="lh">무빙 이용권이 무엇인가요?</div>
        <div>무링 이용권은 KT 통신사 요금제 혜택으로 제공되는 이용권으로 실시간 채널, 일부 TV 프로그램, 일부 영화 시청이 가능합니다.<br>무빙 서비스 내에서 별도 구매는 어려우시며, 무빙 이용권의 상세 이용 권한은 다음과 같습니다.<br><br>
        ■ 무빙 이용권 안내<br>
        1) 영화 + 720p HD 화질 이용 가능<br>
        2) 모바일/태블릿 + PC + 크롬캐스트 이용 가능 (TV 기기 이용 불가)<br><br>
        * 무빙 이용권은 MOVING ORIGINAL 방송, 월정액 영화 컨텐츠가 제공됩니다.<br>
        * 무빙 이용권 이용 중 다른 이용권으로 변경을 원하시는 경우 다른 계정으로 구매하시거나, 이용권 만료 후 구매하셔야 합니다.
        </div>
      </div>
    </div>
    <div id="btnBox">
      <input type="button" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@getbootstrap" value="1:1 문의하기" onclick="return checkid(${loginUser})"/>
      <input type="button" value="내 문의 내역" onclick="location.href=''"/>
    </div><br />

<c:if test="${loginUser != null}">
<div class="modal fade modalcolor" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title fs-5" id="exampleModalLabel">1:1 문의하기</h3>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <span>무빙을 사용하시면서 불편한 사항이나 개선의견이 있다면 문의해주세요.</span>
      <form method="post" action="${cp}/qna/qnasendok.qn">
      <div class="modal-body">
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">제목</label>
            <input type="text" class="form-control" id="recipient-name" name="qnatitle">
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label">문의 내용</label>
            <textarea style="height: 250px;" class="form-control" id="message-text" name="qnacontents"></textarea>
          </div>
          <input type="hidden" name="userid" value="${loginUser}">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
        <button type="submit" class="btn btn-danger">보내기</button>
      </div>
      </form>
    </div>
  </div>
</div>
</c:if>
<br><br><br><br>
<%@include file="/app/common/footer.jsp" %>
</body>
<script>
function checkid(user){
	if(user == null){
		alert("로그인 후 문의해주세요");
		return false;
	}
	
	return true;
}
</script>
</html>