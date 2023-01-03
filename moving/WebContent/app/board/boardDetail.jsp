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
<%@include file="/app/comment/comment.jsp" %> 
<%@include file="/app/common/footer.jsp" %>    
</body>
</html>