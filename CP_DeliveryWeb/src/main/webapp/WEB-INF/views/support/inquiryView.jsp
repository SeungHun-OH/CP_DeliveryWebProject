<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="card-body">
		<div>
		 	<h1>고객 문의</h1>
		 </div>
		 <form action="" enctype="multipart/form-data">
			 <table class="table">
			 	<tr>
				 	<td>운송장번호</td>
				 	<td></td>
			 	</tr>
			 	<tr>
				 	<td>이름</td>
				 	<td></td>
			 	</tr>
			 	<tr>
				 	<td>연락처</td>
				 	<td></td>
			 	</tr>
			 	<tr>
				 	<td>주소</td>
				 	<td></td>
			 	</tr>
			 	<tr>
				 	<td>유형</td>
				 	<td><select id="selectType"><option value="" selected="selected">배송확인</option><option value="">배송지연</option><option value="">반품확인</option><option value="">반품지연</option><option value="">칭찬</option><option value="">불친절</option><option value="">사고처리</option><option value="">기타</option><option value="">제안</option></select></td>
			 	</tr>
			 	<tr>
				 	<td>물품명</td>
				 	<td></td>
			 	</tr>
			 	<tr>
				 	<td>제목</td>
				 	<td></td>
			 	</tr>
			 	<tr>
				 	<td>내용</td>
				 	<td></td>
			 	</tr>
			 	<tr>
				 	<td>파일첨부</td>
				 	<td><input type="file"></td>
			 	</tr>
			 </table>
		</form>
	</div>
</body>
</html>