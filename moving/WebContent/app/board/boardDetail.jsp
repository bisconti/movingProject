<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <link href="/app/css/boardDetail.css" rel="stylesheet">
    <style>
    .reply_line{
		width:1000px;
		margin-top:20px;
		border-top:1px solid grey;
		padding: 20px 0;
		margin : 0 auto;
	}
	.write_box{
		padding-bottom: 40px;
	}
	.write_box>tbody>tr>td:first-child, .update_box>tbody>tr>td:first-child{
		width:150px;
		text-align: center;
		font-weight: bold;
		font-size: 18px;
	}
	.write_box>tbody>tr>td+td{
		position: relative;
	}
	.write_box textarea, .update_box textarea{
		padding:5px 10px;
		height:70px;
		resize:none;
		width:600px;
		outline:none;
		border:1px solid rgba(0,200,80,0.5);
		border-radius:10px;
	}
	.update_box textarea{
		width:600px;
		height:80px;
	}
	.write_box a{
		display:inline-block;
		text-align:center;
		padding:10px;
		width:90px;
		position: absolute;
		top:22px;
		right:0px;
		background-color: red;
		color : white;
		text-decoration: none;
	}
	.update_box{
		margin-top:30px;
		bottom : 30px;
	}
	.update_boxes{
		width: 1000px;
		border-top:1px solid grey;
		margin : 0 auto;
		margin-top:30px;
		bottom : 30px;
	}
	.update_box td:last-child {
		vertical-align: top;
	}
	.update_box .btns a{
		display:inline-block;
		width:70px;
		height:30px;
		text-align: center;
		vertical-align: middle;
		line-height: 30px;
		margin-top: 20px;
		background-color: red;
		color : white;
		text-decoration: none;
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
			if(cookie.getValue().equals("wt")){
%>
				<script>alert("등록 성공!");</script>
<%
				userid = cookie.getValue();
				cookie.setMaxAge(0);
				response.addCookie(cookie);
				break;
			}
			
			if(cookie.getValue().equals("ut")){
%>
				<script>alert("수정 성공!");</script>
<%
				userid = cookie.getValue();
				cookie.setMaxAge(0);
				response.addCookie(cookie);
				break;
			}
		}
	}
%> 
<%@include file="/app/common/header.jsp" %><br><br><br><br>
    <h2 style="width: 1000px; margin : 0 auto;">detail</h2><br>
    <form>
        <input type="hidden" name="id" value="${board.boardnum}"/>     
        <table border="1" width="90%" id="tables">
            <tr class="tr">
                <td class="td">번호</td>
                <td class="td_text">${board.boardnum }</td> 
                <td class="td">작성자</td>
                <td class="td_text">${board.userid }</td>
            </tr>
            <tr class="tr">
                <td class="td">작성일</td>
                <td class="td_text"><fmt:formatDate value="${board.regdate}" pattern="yyyy.MM.dd HH:mm:ss"/></td> 
                <td class="td">조회수</td>
                <td class="td_text">${board.readcount }</td>
            </tr>
            <tr class="tr">
                <td class="td">제목</td>
                <td colspan="3" class="td_text">${board.boardtitle }</td> 
            </tr>
            <tr class="tr"> 
                <td class="td">내용</td>
                <td colspan="3" height="100" class="td_text contents">${board.boardcontents }</td>
            </tr>
        </table>
        <br>
        <table>
        <tr>
          <td colspan="4" align="center" id="rights">
            <c:if test="${board.userid == loginUser }">
				<a class="btnb bg" href="${cp}/board/boardmodify.bo?boardnum=${board.boardnum}&page=${param.page}&q=${param.q}">수정</a>&nbsp;&nbsp;
				<a class="btnb bg" href="${cp}/board/boardremove.bo?boardnum=${board.boardnum}">삭제</a>&nbsp;&nbsp;
			</c:if>
			<c:if test="${!empty param.page}">
				<a class="btnb bg" href="${cp }/board/boardlist.bo?page=${param.page}&q=${param.q}">목록</a>
			</c:if>
			<c:if test="${empty param.page}">
				<a class="btnb bg" href="${cp }/board/boardlist.bo?page=1">목록</a>
			</c:if>
          </td>
        </tr>
        </table><br>
    </form>

	<!--  -->
	<div class="reply_line"></div>	
		<form name="replyForm" method="post" action="${cp}/board/replywrite.bo">
			<input type="hidden" name="boardnum" value="${board.boardnum}">
			<input type="hidden" name="page" value="${param.page}">
			<input type="hidden" name="q" value="${param.q}">
			<c:if test="${loginUser != null }">
			<table class="write_box">
				<tr>
					<td>댓글</td>
					<td>
						<textarea name="replycontents"></textarea>
						<a href="javascript:document.replyForm.submit()">등록</a>
					</td>
				</tr>
			</table>
			</c:if>
			<c:if test="${loginUser == null }">
			<table class="write_box">
				<tr>
					<td>댓글</td>
					<td>
						<textarea name="replycontents" placeholder="로그인 후 댓글을 사용하실 수 있습니다." readonly></textarea>
					</td>
				</tr>
			</table>	
			</c:if>					
		</form>
		<div class="update_boxes"></div>
		<form name="updateForm" method="post" action="${cp}/board/replymodify.bo">
			<input type="hidden" name="boardnum" value="${board.boardnum}">
			<input type="hidden" name="page" value="${param.page}">
			<input type="hidden" name="q" value="${param.q}">
			<table class="update_box">
				<c:set var="i" value="0"/>
				<c:forEach items="${replies}" var="reply">
					<tr>
						<td>${reply.userid}</td>
						<td>
							<textarea readonly name="reply${i}" id="reply${i}" class="replycontents">${reply.replycontents }</textarea>
						</td>
						<td valign="middle" style="text-align: center">
							${reply.regdate}
							<c:if test="${reply.updatechk == 'o' }">
								<br>(수정됨)
							</c:if>
							<c:if test="${reply.userid == loginUser }">
								<br>
								<div class="btns">
									<a href="javascript:updateReply(${i})" id="start${i}">수정</a>
									<a href="javascript:updateOk(${i},${reply.replynum})" style="display:none;" id="end${i}">수정완료</a>
									<a href="javascript:deleteReply(${reply.replynum})">삭제</a>
								</div>
							</c:if>
						</td>
					</tr>
					<c:set var="i" value="${i+1}"/>
				</c:forEach>
			</table>
			<input type="hidden" name="replynum">
			<input type="hidden" name="i">
		</form>
		<br><br><br><br><br><br>

<%@include file="/app/common/footer.jsp" %>    
</body>
<script>
let flag = true;
const updateForm = document.updateForm;
function updateReply(i){
	if(flag){
		const start = document.getElementById("start"+i);
		const end = document.getElementById("end"+i);
		const reply = document.getElementById("reply"+i);
		
		start.style.display = 'none';
		end.style.display = 'inline-block';
		reply.removeAttribute('readonly');
		
		flag = false;
	}
	else{
		alert("수정중인 댓글이 있습니다!");
	}
}

function updateOk(i,replynum){
	updateForm.replynum.value = replynum;
	updateForm.i.value = i;
	updateForm.submit();
}

function deleteReply(replynum){
	updateForm.setAttribute("action","${cp}/board/replyremove.bo");
	updateForm.replynum.value = replynum;
	updateForm.submit();
}
</script>
</html>