<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="https://kit.fontawesome.com/51772bd9bd.js"
	crossorigin="anonymous"></script>

<!-- 댓글 -->
<div class="container my-3 border rounded" style="width: 1000px; margin : 0 auto;">
	<div class="mb-3 mt-3">
		<label>댓글: <span id="cmt_cnt"></span> 개
		</label>
		
		<div class="input-group my-2">
			<input type="text" class="form-control" id="input_comment">
			<button type="button" class="btn btn-outline-danger"
				id="btn_comment">작성</button>
		</div>
		
		<table class="table table-hover mt-3" id="cmt_table">
			<thead>
				<tr>
					<th style="width: 16.66%; color:white;">작성자</th>
					<th style="color : white;">내용</th>
					<th style="width: 16.66%; color:white;">작성일</th>
				</tr>
			</thead>
			<tbody id="cmt_list">
				
			</tbody>
		</table>
	</div>
</div>
<!-- 댓글 -->



