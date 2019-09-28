<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/head.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>에러, 예외 페이지</h1>
<section>
	<h3>${exception.getMessage()}</h3>
	<ul>
		<c:forEach items="${exception.getStackTrace()}" var="stack">
			<li>${stack.toString()}</li>
		</c:forEach>
	</ul>
</section>
</body>
</html>