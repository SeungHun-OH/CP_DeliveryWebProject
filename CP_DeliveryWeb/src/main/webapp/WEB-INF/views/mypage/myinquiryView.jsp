<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container col-md-10" role="main">
	<h1>문의내역</h1>
	<table class="table" id="myinquiryTable">
		<tr id="tableHeader">
			<th>문의유형</th>
			<th>제목</th>
			<th>운송장번호</th>
			<th>작성일</th>
			<th>처리 상태</th>
		</tr>
		<c:choose>
		<c:when test="${!empty inquiryList}">
		<c:forEach var="inquiryList" items="${inquiryList}">
		<tr>
			<td>${inquiryList.inquiryType}</td>
			<td>${inquiryList.title}</td>
			<td>${inquiryList.waybillNum}</td>
			<td>${inquiryList.regDate}</td>
			<td>${inquiryList.inquiryStatus}</td>
		</tr>
		</c:forEach>
		</c:when>
		<c:when test="${empty inquiryList}">
		<tr>
			<td colspan="5" style="text-align: center;">문의내역이 없습니다.</td>
		</tr>
		</c:when>
		</c:choose>
	</table>
</div>
</body>
</html>