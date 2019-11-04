<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<div class="container  col-md-10" role="main">
		<div class="card">
			<div class="card-header">회원정보 수정</div>
			<div class="card-body">
				<form method="post" action="${pageContext.request.contextPath}/mypage/myinfo" id="myinfoForm">
					<div class="form-group row">
						<label for="user_id" class="col-md-3 col-form-label text-md-right">아이디</label>
						<div class="col-md-7">
							<input name="user_id" id="user_id" class="form-control" placeholder="아이디을 입력해 주세요" />
						</div>
					</div>
		
					<div class="form-group row">
						<label for="user_name" class="col-md-3 col-form-label text-md-right">이름</label>
						<div class="col-md-7">
							<input name="user_name" id="user_name" class="form-control" placeholder="이름을 입력해 주세요" />
						</div>
					</div>
					
					<div class="form-group row">
						<label for="user_birth" class="col-md-3 col-form-label text-md-right">생년월일</label>
						<div class="col-md-7">
							<input name="user_birth" id="user_birth" class="form-control" placeholder="생년월일을 입력해 주세요" />
						</div>
					</div>

					<div class="form-group row">
						<label for="user_gender" class="col-md-3 col-form-label text-md-right" >성별</label>
						<div class="col-md-7 my-auto" >
						<div class="custom-control custom-control-inline">
						  <input type="radio" id="male" value="남자" name="user_gender" class="custom-control-input"/>
						  <label class="custom-control-label" for="male">남자</label>
						</div>
						<div class="custom-control custom-control-inline" >
						  <input type="radio" id="female" value="여자" name="user_gender" class="custom-control-input"/>
						  <label class="custom-control-label" for="female">여자</label>
						</div>
						</div>
					</div>
					
					<div class="form-group row">
						<label for="user_pwd" class="col-md-3 col-form-label text-md-right">비밀번호</label>
						<div class="col-md-7">
							<input type="password" name="user_pwd" id="user_pwd" class="form-control" placeholder="비밀번호를 입력해 주세요" maxlength="20"/>
						</div>
					</div>

					<div class="form-group row">
						<label for="user_phone" class="col-md-3 col-form-label text-md-right">전화번호</label>
						<div class="col-md-7">
							<input name="user_phone" id="user_phone" class="form-control" placeholder="'-' 제외하고 전화번호를 입력해 주세요" />
						</div>
					</div>
					
					<div class="form-group row">
						<label for="user_addr" class="col-md-3 col-form-label text-md-right">주소</label>
						<div class="col-md-7" >
							<input name="user_addr" id="user_addr" class="form-control" readonly="true"/>
						</div>
						<div class="col-md-2">
							<input class="btn btn-primary" type='button' OnClick='DaumPostcode()' value='주소검색'>
						</div>
					</div>
					
					<div class="form-group row">
						<div class="offset-3 col-md-7">
							<input name="user_addr2" id="user_addr2" class="form-control"/>
						</div>
					</div>
					
				</form>
			</div>
		</div>
		<div style="margin-top:10px">
			<button type="button" class="btn btn-lg btn-primary" id="btnSignup">회원가입</button>
			<button type="button" class="btn btn-lg btn-primary" id="btnReset">다시쓰기</button>
		</div>
	</div>
</body>
</html>