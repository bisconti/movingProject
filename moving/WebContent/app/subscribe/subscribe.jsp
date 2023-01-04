<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/app/css/subscribe.css">
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
				<input type="button" value="결제하기" id="payment">
			</div>
			<div id="year">
				<p>연 구독제</p>
				<ul>
					<li>약 120편의 영화를 제한없이 감상하실 수 있습니다.</li>
					<li>1080p 화질까지 시청이 가능합니다.</li>
					<li>99,000￦의 요금이 매년 납부됩니다.(VAT 포함, 구독은 언제든지 해지할 수 있습니다.)</li>
				</ul>
				<input type="button" value="결제하기" id="payment">
			</div>
		</div>
	<%@include file="/app/common/footer.jsp" %>
</body>
</html>