<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<div class="container  col-md-10" role="main">
		<div class="card">
			<div class="card-header">택배예약</div>
			<div class="card-body">
				 <div>
				 	<h1>보내는 분</h1>
				 </div>
				 <div class="form-group">
				    <label for="se_name">이름</label>
				    <input type="text" class="form-control" id="se_name" name="se_name" placeholder="보내는 사람 이름">
				 </div>
				 <div class="form-group">
				    <label for="se_phone">연락처1</label>
				    <input type="text" class="form-control" id="se_phone" name="se_phone" placeholder="보내는 사람 연락처1">
				 </div>
				 <div class="form-group">
				    <label for="se_phone2">연락처2</label>
				    <input type="text" class="form-control" id="se_phone2" name="se_phone2" placeholder="보내는 사람 연락처2">
				 </div>
				 <div class="form-group">
				    <label for="se_addr">주소</label>
				    <input type="text" class="form-control" id="se_addr" name="se_addr" placeholder="주소">
				 </div>
				 <div class="form-group">
					<label for="se_addr2" class="sr-only">상세주소</label>
					<input type="text" class="form-control" id="se_addr2" name="se_addr2" placeholder="상세주소">
				 </div>
				 <div class="form-group">
				    <label for="se_email">이메일</label>
				    <input type="text" class="form-control" id="se_email" name="se_email" placeholder="보내는 사람 이름">
				 </div>
				 <div class="form-group">
				    <label for="se_resDate">방문희망일</label>
				    <select class="form-control" name="se_resDate">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
					</select>
				 </div>
				 <div class="form-group">
				    <label for="se_req">요청사항</label>
				    <select class="form-control" name="se_req">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
					</select>
				 </div>
				 <div class="form-group">
				    <label class ="sr-only" for="se_reqContents">요청사항 내용</label>
				    <input type="text" class="form-control" id="se_reqContents" name="se_reqContents" placeholder="보내는 사람 이름">
				 </div>
				 <div>
				 	<h1>받는 분</h1>
				 </div>
				 <div class="form-group">
				 	<label for="re_name">이름</label>
				    <input type="text" class="form-control" id="re_name" name="re_name" placeholder="받는 사람 이름">
				 </div>
				 <div class="form-group">
				 	<label for="re_phone">연락처1</label>
				    <input type="text" class="form-control" id="re_phone" name="re_phone" placeholder="받는 사람 연락처">
				 </div>
				 <div class="form-group">
				 	<label for="re_phone2">연락처2</label>
				    <input type="text" class="form-control" id="re_phone2" name="re_phone2" placeholder="받는 사람 연락처2">
				 </div>
				 	 <div class="form-group">
				    <label for="re_addr">주소</label>
				    <input type="text" class="form-control" id="re_addr" name="re_addr" placeholder="주소">
				 </div>
				 <div class="form-group">
					<label for="re_addr2" class="sr-only">상세주소</label>
					<input type="text" class="form-control" id="re_addr2" name="re_addr2" placeholder="상세주소">
				 </div>
				 <div>
				 	<h1>물품정보</h1>
				 </div>
				 <div class="form-group">
				 	<label for="item_name">물품명</label>
				    <input type="text" class="form-control" id="item_name" name="item_name" placeholder="물품명">
				 </div>
				 <div class="form-group">
				 	<label for="item_price">물품가격</label>
				    <input type="text" class="form-control" id="item_price" name="item_price" placeholder="물품가격">
				 </div>
				 <div class="form-group">
				    <label for="se_req">부피</label>
				    <select class="form-control" name="item_weight">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
					</select>
				 </div>
				 <div class="form-group">
				    <label for="item_fare">운임구분</label>
				    <select class="form-control" name="item_fare">
						<option>선불</option>
						<option>착불</option>
					</select>
				 </div>
				 <div class="form-group">
				 	<label for="item_farePrice">예상운임</label>
				    <input type="text" class="form-control" id="item_farePrice" name="item_farePrice" placeholder="예상운임">
				 </div>
			</div>
		</div>
	</div>
</body>
</html>