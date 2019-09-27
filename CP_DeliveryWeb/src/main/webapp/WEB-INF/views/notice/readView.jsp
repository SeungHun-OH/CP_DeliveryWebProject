<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/head.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="head">
		<h3>번호 : ${notice.ntc_No}</h3>
		<h4>제목 : ${notice.ntc_Title }</h4>
		<h4>구분 : ${notice.ntc_Division}</h4> 
		<h4>날짜 : <fmt:formatDate value="${notice.ntc_RegDate}" pattern="YYYY년 M월 d일"/></h4>
	</div>
	<div class="body">
		<div>
			${notice.ntc_Content}
		</div>
	</div>
	<div class="footer">
	<form role="form" method="post">
		<input type="hidden" name="noticeNo" value="${notice.ntc_No}">
	</form>
		<button type="submit" class="listBtn">목록</button>
		<button type="submit" class="modBtn">수정</button>
		<button type="submit" class="delBtn">삭제</button>
	</div>
	<script>
		$(document).ready(function () {
			
			var formObj = $("form[role='form']");
			console.log(formObj);
			
			$(".modBtn").on("click", function () {
				formObj.attr("action", "/notice/modify");
				formObj.attr("method", "get");
				formObj.submit();
			});
			
			$(".delBtn").on("click", function () {
				formObj.attr("action", "/notice/remove");
				formObj.submit();
			});
			
			$(".listBtn").on("click", function () {
				self.location = "/notice/list"
			});
		});
	</script>
</body>
</html>