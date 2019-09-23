<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/webresources/css/loginForm.css">

<title>Insert title here</title>
</head>
<body>
	<div class="container login-container">
            <div class="row">
                <div class="col-md-6 login-form">
                    <h3>로그인</h3>
                    <form action="${pageContext.request.contextPath}/user/loginPost" method="post">
                        <div class="form-group">
                            <input type="text" name="user_id" class="form-control" placeholder="아이디" value="" />
                        </div>
                        <div class="form-group">
                            <input type="password" name="user_pwd" class="form-control" placeholder="비밀번호" value="" />
                        </div>
                        <div class="form-group">
                            <input type="submit" class="btnSubmit" value="로그인" />
                        </div>
                        <div class="form-group">
                        	<div class="checkbox icheck">
                        		<label>
                        			<input type="checkbox" name="userCookie"> 로그인 유지
                        		</label>
                        	</div>
                        </div>
                        <div class="form-group">
                            <a href="#" class="ForgetIdPwd">아이디/비밀번호 찾기</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
</body>
</html>