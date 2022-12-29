<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
      crossorigin="anonymous"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous"
    ></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link href="/app/css/boardList.css" rel="stylesheet">
    <script src="/app/js/boardList.js"></script>
    <script>
    	const conPath = "${pageContext.request.contextPath}";
    </script>
</head>
<body>
<%@include file="/app/common/header.jsp" %>
<div id="circle1"></div>
    <h2 id="board">커뮤니티</h2>
    <div id="circle2"></div>
    <div id="cntBox">
      <div class="float-end mb-2">
      <form name="frmPageRows">
      	<input type="hidden" name="page" value="${page }">
        <select class="form-select" name="pageSize">
          <option value="10" ${pageSize==10 ? 'selected' : '' }>10</option>
          <option value="15" ${pageSize==15 ? 'selected' : '' }>15</option>
          <option value="20" ${pageSize==20 ? 'selected' : '' }>20</option>
          <option value="50" ${pageSize==50 ? 'selected' : '' }>50</option>
        </select>
      </form> 
      </div>
    </div>
    <jsp:useBean id="toDay" class="java.util.Date"/>
    <fmt:formatDate value="${toDay }" pattern="yyyyMMdd" var="nowDate"/>
    <c:out value="${nowDate}"/>
    
    
    <table class="table table-dark table-hover" id="tableHover">
      <thead>
        <tr>
          <th scope="col">번호</th>
          <th scope="col">제목</th>
          <th scope="col">작성자</th>
          <th scope="col">작성일</th>
          <th scope="col">조회수</th>
        </tr>
      </thead>
      <tbody>
      	<c:forEach items="${boardList}" var="board">
        <tr>
          <th scope="row">${board.boardnum}</th>
          <td style="width : 33%"><a id="tt" href="${cp}/board/boardview.bo?boardnum=${board.boardnum}&page=${page}&q=${keyword}">${board.boardtitle}</a> 
          		<span class="new"> new!</span>
          </td>
          <td>${board.userid}</td>
          <td>${board.regdate}</td>
          <td>${board.readcount}</td>
        </tr>
        </c:forEach>
      </tbody>
    </table>
    <br />
    <div id="circle3"></div>
    <div id="circle4"></div>
    <table id="writeBox">
		<tr align="right" valign="middle">
			<td><a class="write" href="${cp}/board/boardwrite.bo?page=${page}&q=${keyword}">글쓰기</a></td>
		</tr>
	</table>
    <nav class="navbar navbar-expand-lg navb">
      <div class="container-fluid">
        <form class="d-flex" role="search" style="margin: 0 auto">
          <input class="form-control me-2" type="search" id="q" name="q" value="${keyword}" placeholder="Search" aria-label="Search"/>
          <button class="btn btn-outline-danger" type="button" onclick="search()">Search</button>
        </form>
      </div>
    </nav>

    <nav aria-label="Page navigation example" class="navb navb2">
      <ul class="pagination justify-content-center">
    	<c:if test="${startPage != 1}">
        <li class="page-item">
          <a class="page-link" href="${url }?page=${startPage - 1 }" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
          </a>
        </li>
        </c:if>
        <c:forEach var="i" begin="${startPage }" end="${endPage}">
			<c:if test="${i == page}">
        		<li class="page-item"><a class="page-link nowPage" href="javascript:void(0);">${i}</a></li>
        	</c:if>
			<c:if test="${i != page }">
       			<li class="page-item"><a class="page-link" href="${url }?page=${i}">${i}</a></li>
        	</c:if>
		</c:forEach>
        <c:if test="${endPage != totalPage}">
        <li class="page-item">
          <a class="page-link" href="${url }?page=${endPage + 1 }" aria-label="Next">
            <span aria-hidden="true">&raquo;</span>
          </a>
        </li>
        </c:if>
      </ul>
    </nav>	   
<%@include file="/app/common/footer.jsp" %>    
</body>
<script>
	function search(){
		const q = document.getElementById("q");
		//유효성 검사
		if(q.value == ""){
			alert("검색어를 입력해주세요!");
			q.focus();
			return false;
		}
		location.href = "${cp}/board/boardlist.bo?q="+q.value;
	}

</script>
</html>