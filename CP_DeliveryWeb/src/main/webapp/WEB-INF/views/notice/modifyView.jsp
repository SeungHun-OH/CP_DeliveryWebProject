<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/head.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
</head>
<body>
<form role="form" action="${path}/notice/modify" method="post">
	<div class="head">
		<h3>게시글 수정</h3>
	</div>
	<div class="body">
		<div>
			<label for="ntc_Title">제목</label>
			<input id="ntc_Title" name="ntc_Title" placeholder="제목을 입력해주세요." value="${notice.ntc_Title}">
		</div>
		<div>
			<label for="ntc_Content">내용</label>
			<textarea id="ntc_Content" name="ntc_Content" placeholder="내용을 입력해주세요." rows="30">${notice.ntc_Content}</textarea>
		</div>
		<div>
			<label for="ntc_Division">구분</label>
			<select id="ntc_Division" name="ntc_Division"> 
				<option value="구분" <c:if test="${notice.ntc_Division=='구분'}">selected</c:if>>구분</option>
				<option value="공지사항" <c:if test="${notice.ntc_Division=='공지사항'}">selected</c:if>>공지사항</option>
				<option value="이벤트" <c:if test="${notice.ntc_Division=='이벤트'}">selected</c:if>>이벤트</option>
			</select>
		</div>
	</div>
	<div class="footer">
		<button type="button" class="listBtn">목록</button>
		<button type="submit" class="modBtn">수정</button>
		<button type="button" class="cancelBtn">취소</button>
	</div>
	<input type="hidden" name="ntc_No" value="${notice.ntc_No}">
	<input type="hidden" name="page" value="${criteria.page}">
	<input type="hidden" name="perPageNum" value="${criteria.perPageNum}">
</form>
	<script>
		$(document).ready(function () {
			
			var formObj = $("form[role='form']");
			console.log(formObj);
			
			$(".modeBtn").on("click", function () {
				formObj.submit();
			});
			
			$(".cancelBtn").on("click", function () {
				history.go(-1);
			});
			
			$(".listBtn").on("click", function () {
				self.location = "/notice/list?page=${criteria.page}&perPageNum=${criteria.perPageNum}";
			});
		});
	</script>
</body>
</html>