<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/head.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
</style>
<script>
	var result = "${msg}";
	if(result == "regSuccess") {
		alert("게시글 등록이 완료되었습니다.")
	} else if (result == "modSuccess") {
		alert("게시글 수정이 완료되었습니다.")
	} else if (result == "delSuccess") {
		alert("게시글 삭제가 완료되었습니다.")
	}
</script>
</head>
<body>
<div class="head">
	<h3>게시글 목록</h3>
</div>
<div class="body">
	<table>
		<tbody>
			<tr>
				<th style="width: 100px">번호</th>
				<th style="width: 100px">구분</th>
				<th>제목</th>
				<th style="width: 150px">날짜</th>
			</tr>
			<c:forEach items="${notices}" var="notice">
			<tr>
				<td>${notice.ntc_No}</td>
				<td>${notice.ntc_Division}</td>
				<td><a href="read${pageMaker.makeQuery(pageMaker.criteria.page)}&noticeNo=${notice.ntc_No}">${notice.ntc_Title}</a></td>
				<td><fmt:formatDate value="${notice.ntc_RegDate}" pattern="YYYY년 M월 d일"/></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
	<div class="footer">
	<div>
	  <ul class="pagination">
	    <c:if test="${pageMaker.prev}">
	    	<li><a href="list${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
	    </c:if> 
	
	    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
	    	<li><a href="list${pageMaker.makeQuery(idx)}">${idx}</a></li>
	    </c:forEach>
	
	    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
	    	<li><a href="list${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
	    </c:if> 
	  </ul>
	</div>
	<button type="button" onclick="location.href='/notice/write'">글쓰기</button>
</div>
</body>
</html>