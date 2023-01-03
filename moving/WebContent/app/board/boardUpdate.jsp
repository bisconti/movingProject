<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
    <link href="/app/css/boardUpdate.css" rel="stylesheet">
</head>
<body>
<%@include file="/app/common/header.jsp" %>
<br><br><br><br><br><br>
<h2 style="width: 1000px; margin : 0 auto;">update</h2><br>
    <form method="post" name="boardForm" action="${cp}/board/boardmodifyok.bo">
        <input type="hidden" name="boardnum" value="${board.boardnum}"/>
		<input type="hidden" name="page" value="${param.page}">
		<input type="hidden" name="q" value="${param.q }">     
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
                <td colspan="3" class="td_text">
                	<input class="upcolor upsize" type="text" name="boardtitle" id="boardtitle" value="${board.boardtitle }">
                </td> 
            </tr>
            <tr>
				<td class="td"><label for="comment" class="n">내용</label></td>
				<td colspan="3" class="td_text upcolor" ><textarea class="form-control summernote" name="boardcontents" id="boardcontents">${board.boardcontents }</textarea></td>
			</tr> 
        </table>
        <br>
        <table>
	        <tr>
	          <td colspan="4" align="center" id="rights">
				<a class="btns" href="javascript:document.boardForm.submit()">수정완료</a>&nbsp;&nbsp;
				<a class="btns" href="${cp}/board/boardview.bo?boardnum=${board.boardnum}">취소</a>&nbsp;&nbsp;
				<a class="btns" href="${cp}/board/boardlist.bo?page=1">목록</a>
	          </td>
	        </tr>
        </table><br>
    </form>
<%@include file="/app/common/footer.jsp" %>    
<script>
    $('.summernote').summernote({
    tabsize: 2,
    height: 300,
    toolbar: [
              ['fontname', ['fontname']],
              ['fontsize', ['fontsize']],
              ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
              ['color', ['forecolor','color']],
            ],
          fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
          fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
    });

    function sendit(){
		const boardForm = document.boardForm;
		const boardtitle = boardForm.boardtitle;
		const boardcontents = boardForm.boardcontents;
		
		if(boardtitle.value == ""){
			alert("제목을 입력하세요");
			boardtitle.focus();
			return false;
		}
		
		if(boardcontents.value == ""){
			alert("내용을 입력하세요");
			boardcontents.focus();
			return false;
		}

		boardForm.submit();
	}
</script>
</body>
</html>









