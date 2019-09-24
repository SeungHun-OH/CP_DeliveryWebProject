<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>


<html>
<head>ㄴ
	<title>Home</title>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script>
		$(document).on("keyup", "input:text[numberOnly]", function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") );});
	</script>
	<script>
		$(document).on('click', '#btnSearch', function(e){
		e.preventDefault();
		var url = "${path}/board/search";
		url = url + "?waybill=" + $('#waybill').val();
		location.href = url;
		console.log(url);
	});	
	</script>
</head>
<body>
<h1>
	메인화면
</h1>
<c:if test="${not empty login}">
	<div>
	<p>로그인 됨 아이디: ${login.user_id}</p>
	<p><a href="${path}/user/logout">로그아웃</a></p>
	</div>
</c:if>
<c:if test="${empty login}">
	<div>
	<p>로그인 안됨</p>
	</div>
</c:if>

		<a href="${pageContext.request.contextPath}/board/search">서치</a>
<P>  The time on the server is ${serverTime}. </P>

		<!-- search{s} -->
		
		<div class="form-group row justify-content-center">

			<div class="w300" style="padding-right:10px">
				<input type="text" name="waybill" id="waybill" maxlength="11" numberOnly="true">
				<button name="btnSearch" id="btnSearch">검색</button>
			</div>
		</div>

		<!-- search{e} -->

</body>
</html>
