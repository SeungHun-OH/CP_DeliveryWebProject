<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!-- <%@ page session="false" %>  -->
<html>
<head>
	<title>Home</title>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script>
		$(document).on("keyup", "input:text[numberOnly]", function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") );});
	</script>
	<script>
		$(document).on('click', '#btnSearch', function(e){
		e.preventDefault();
		var url = "${pageContext.request.contextPath}/board/search";
		url = url + "?waybillNum=" + $('#waybillNum').val();
		location.href = url;
		console.log(url);
	});	
	</script>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

		<!-- search{s} -->

		<div class="form-group row justify-content-center">

			<div class="w300" style="padding-right:10px">
				<input type="text" name="waybillNum" id="waybillNum" maxlength="11" numberOnly="true">
				<button name="btnSearch" id="btnSearch">검색</button>
			</div>
			
		</div>

		<!-- search{e} -->

</body>
</html>
