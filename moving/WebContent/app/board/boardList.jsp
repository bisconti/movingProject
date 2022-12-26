<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link href="../css/boardList.css" rel="stylesheet">
</head>
<body>
<%@include file="../common/header.jsp" %>
<div id="circle1"></div>
    <h2 id="board">게시판</h2>
    <div id="circle2"></div>
    <div id="cntBox">
      <div class="float-end mb-2">
        <select class="form-select" name="pageRows">
          <option value="10">10</option>
          <option value="15">15</option>
          <option value="20">20</option>
          <option value="50">50</option>
        </select>
      </div>
    </div>
    <table class="table table-dark table-hover" id="tableHover">
      <thead>
        <tr>
          <th scope="col">번호</th>
          <th scope="col">제목</th>
          <th scope="col">글쓴이</th>
          <th scope="col">작성일</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <th scope="row">1</th>
          <td>안녕하세요 <span class="new">new!</span></td>
          <td>user1</td>
          <td>2022-12-22</td>
        </tr>
        <tr>
          <th scope="row">2</th>
          <td>환불해주세요</td>
          <td>user2</td>
          <td>2022-12-23</td>
        </tr>
        <tr>
          <th scope="row">3</th>
          <td>굿</td>
          <td>user3</td>
          <td>2022-12-33</td>
        </tr>
        <tr>
          <th scope="row">4</th>
          <td>비밀번호 까먹엇어요</td>
          <td>user1</td>
          <td>2022-12-22</td>
        </tr>
        <tr>
          <th scope="row">5</th>
          <td>무빙 좋네요</td>
          <td>user2</td>
          <td>2022-12-23</td>
        </tr>
        <tr>
          <th scope="row">6</th>
          <td>별로에요</td>
          <td>user3</td>
          <td>2022-12-33</td>
        </tr>
        <tr>
          <th scope="row">7</th>
          <td>너무 비싸요</td>
          <td>user3</td>
          <td>2023-02-23</td>
        </tr>
        <tr>
          <th scope="row">8</th>
          <td>너무 싸요</td>
          <td>user3</td>
          <td>2025-09-09</td>
        </tr>
        <tr>
          <th scope="row">9</th>
          <td>movie</td>
          <td>user1</td>
          <td>2022-05-19</td>
        </tr>
      </tbody>
    </table>
    <br />
    <div id="circle3"></div>
    <div id="circle4"></div>
    <div id="btnBox">
      <div>
        <input type="button" value="글쓰기" />
        <input type="button" value="목록" />
      </div>
    </div>
    <nav class="navbar navbar-expand-lg navb">
      <div class="container-fluid">
        <form class="d-flex" role="search" style="margin: 0 auto">
          <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search"/>
          <button class="btn btn-outline-danger" type="submit">Search</button>
        </form>
      </div>
    </nav>

    <nav aria-label="Page navigation example" class="navb navb2">
      <ul class="pagination justify-content-center">
        <li class="page-item">
          <a class="page-link" href="#" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
          </a>
        </li>
        <li class="page-item"><a class="page-link" href="#">1</a></li>
        <li class="page-item"><a class="page-link" href="#">2</a></li>
        <li class="page-item"><a class="page-link" href="#">3</a></li>
        <li class="page-item"><a class="page-link" href="#">4</a></li>
        <li class="page-item"><a class="page-link" href="#">5</a></li>
        <li class="page-item">
          <a class="page-link" href="#" aria-label="Next">
            <span aria-hidden="true">&raquo;</span>
          </a>
        </li>
      </ul>
    </nav>
<%@include file="../common/footer.jsp" %>    
</body>
</html>