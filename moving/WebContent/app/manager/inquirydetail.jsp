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
<%@include file="/app/common/header.jsp" %><br><br><br><br>
    <h2 style="width: 1000px; margin : 0 auto;">고객센터</h2><br>
    <form>
        <input type="hidden" name="id" value="${qna.qnanum}"/>     
        <table border="1" width="90%" id="tables">
            <tr class="tr">
                <td class="td">번호</td>
                <td class="td_text">${qna.qnanum }</td> 
                <td class="td">작성자</td>
                <td class="td_text">${qna.userid }</td>
            </tr>
            <tr class="tr">
                <td class="td">작성일</td>
                <td class="td_text"><fmt:formatDate value="${qna.regdate}" pattern="yyyy.MM.dd HH:mm:ss"/></td> 
            </tr>
            <tr class="tr">
                <td class="td">제목</td>
                <td colspan="3" class="td_text">${qna.qnatitle}</td> 
            </tr>
            <tr class="tr"> 
                <td class="td">내용</td>
                <td colspan="3" height="100" class="td_text contents">${qna.qnacontents }</td>
            </tr>
        </table>
        <br>
        <table>
        <tr>
          <td colspan="4" align="center" id="rights">
         <c:if test="${!empty param.page}">
            <a class="btnb bg" href="${cp}/movie/answer.mo?&qnanum=${qna.qnanum}">답변하기</a>&nbsp;&nbsp;
            <a class="btnb bg" href="${cp}/movie/center.mo?page=${param.page}&q=${param.q}">목록</a>
         </c:if>
         <c:if test="${empty param.page}">
            <a class="btnb bg" href="${cp}/movie/answer.mo?&qnanum=${qna.qnanum}">답변하기</a>&nbsp;&nbsp;
            <a class="btnb bg" href="${cp }/movie/center.mo?page=1">목록</a>
         </c:if>
          </td>
        </tr>
        </table><br>
    </form>
<%@include file="/app/common/footer.jsp" %>    
</body>
</html>