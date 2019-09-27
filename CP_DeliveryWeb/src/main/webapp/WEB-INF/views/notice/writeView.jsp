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
<form action="${path}/notice/write" method="post">
	<div class="head">
		<h3>게시글 작성</h3>
	</div>
	<div class="body">
		<div>
			<label for="ntc_Title">제목</label>
			<input id="ntc_Title" name="ntc_Title" placeholder="제목을 입력해주세요.">
		</div>
		<div>
			<label for="ntc_Content">내용</label>
			<textarea id="ntc_Content" name="ntc_Content" placeholder="내용을 입력해주세요." rows="30"></textarea>
		</div>
		<div>
			<label for="ntc_Division">구분</label>
			<select id="ntc_Division" name="ntc_Division"> 
				<option value="구분">구분</option>
				<option value="공지사항">공지사항</option>
				<option value="이벤트">이벤트</option>
			</select>
		</div>
	</div>
	<div class="footer">
		<button type="button" class="listBtn">목록</button>
		<button type="reset" class="resetBtn">초기화</button>
		<button type="submit">저장</button>
	</div>
</form>
<script>
		$(document).ready(function () {
			
			var formObj = $("form[role='form']");
			console.log(formObj);
			
			$(".resetBtn").on("click", function () {
				var result = confirm('초기화 하시겠습니까?'); 
				if(!result)
					return false;
			});
			
			
			$(".listBtn").on("click", function () {
				self.location = "/notice/list"
			});
		});
	</script>
</body>
</html>