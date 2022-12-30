<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board</title>
    <link
      href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link
      href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
      rel="stylesheet"
    />
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
    <style>
        body{
            background-color: black;
        }
        .n{
            color: white;
        }
        .color {
            background-color: red;
            color: white;
            float : right;
        }
        #both{
            clear: both;
        }
        h2{
            width: 1000px;
            margin: 0 auto;
            color: white;
            margin-bottom: 20px;
        }
        .formD{
            width: 1000px; 
            margin: 0 auto; 
            border : 1px solid red; 
            padding: 20px; 
            border-radius: 20px;
        }
    </style>
</head>
<body>
<%@include file="/app/common/header.jsp" %>
<br><br><br><br><br><br>
    <div class="wrap">
        <h2>Write</h2>
        <form class="formD" id="boardForm" method="post" name="boardForm" action="${cp}/board/boardwriteok.bo">
            <div class="form-group">
                <label for="title" class="n">제목</label>
                <input type="text" name="boardtitle" class="form-control bc" placeholder="제목을 입력하세요" id="boardtitle">
            </div>

            <div class="form-group">
                <label for="userid" class="n">작성자</label>
                <input type="text" name="userid" class="form-control bc" value="user11" id="userid" readonly>
            </div>
    
            <div class="form-group">
                <label for="comment" class="n">내용</label>
                <textarea class="form-control summernote bc" name="boardcontents" rows="5" id="boardcontents"></textarea>
            </div>
            <a class="btn color" href="javascript:sendit()">작성완료</a>
            <div id="both"></div>
        </form>
    </div><br><br>
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
                  ['table', ['table']],
                ],
              fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
              fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
        });
        
        function sendit(){
    		const boardForm = document.boardForm;
    		const boardtitle = boardForm.boardtitle;
    		if(boardtitle.value == ""){
    			alert("제목을 입력하세요");
    			boardtitle.focus();
    			return false;
    		}
    		
    		boardForm.submit();
    	}
    </script>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/jquery-migrate-1.2.1.js"></script>
</html>









