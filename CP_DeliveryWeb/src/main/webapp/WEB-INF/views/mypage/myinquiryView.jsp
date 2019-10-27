<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${path}/webresources/lightbox/css/lightbox.css"/>
<script src="${path}/webresources/lightbox/js/lightbox.js" ></script>
</head>
<body>
<div class="container col-md-10" role="main">
	<h1>문의내역</h1>
	<table class="table table-bordered table-hover text-center" id="myinquiryTable">
		<tr id="tableHeader">
			<th>문의유형</th>
			<th>제목</th>
			<th>운송장번호</th>
			<th>작성일</th>
			<th>처리 상태</th>
		</tr>
		<c:choose>
		<c:when test="${!empty inquiryList}">
		<c:forEach var="inquiryList" items="${inquiryList}">
		<tr class="inquiryTr" id="${inquiryList.inquiryNo}">
			<td>${inquiryList.inquiryType}</td>
			<td>${inquiryList.title}</td>
			<td>${inquiryList.waybillNum}</td>
			<td>${inquiryList.regDate}</td>
			<td>${inquiryList.inquiryStatus}</td>
		</tr>
		</c:forEach>
		</c:when>
		<c:when test="${empty inquiryList}">
		<tr>
			<td colspan="5" style="text-align: center;">문의내역이 없습니다.</td>
		</tr>
		</c:when>
		</c:choose>
	</table>
</div>
</body>
<script>
$('#myinquiryTable .inquiryTr').click(function(){
	alert('클릭');
	var tr = $(this);
	var tr_id =tr.attr('id');
	var param = '?inquiryNo='+tr_id;
	
	detailAjax(param, tr, tr_id);
});
function detailAjax(param, thisTr, tr_id) {
	$.ajax({
		type : 'get',
		url : '/mypage/inquiryDetail'+param,
		dataType : 'json',
		contentType:'application/json;charset=UTF-8',
		success : function (data) {
			console.log(data);
// 			$.each(data.result, function(key,value){
// 				if(value != '0' && value != null){
// 					re_data = 
// 				}
// 			});
			var result ='';
			result='<tr id=detail_'+tr_id+'><td colspan="5"><table class="table text-center" style="margin-bottom: 0px;" width="100%"><tr><th>물품명</th><th>이름</th><th>주소</th></tr>';
			result+='<tr><td>'+data.result.productName+'</td><td>'+data.result.name+'</td><td colspan="3">'+data.result.addr+" "+data.result.addr2+'</td></tr>';
			result+='<tr><td colspan="3"><a data-lightbox="uploadImages" href="/upload/displayFile?fileName='+getImageLink(data.resultList[0].fileLocation)+'"><img src="/upload/displayFile?fileName='+data.resultList[0].fileLocation+'" /></a></td><tr>'
			result+='<tr><td colspan="3"><a data-lightbox="uploadImages" href="/upload/displayFile?fileName='+getImageLink(data.resultList[1].fileLocation)+'"><img src="/upload/displayFile?fileName='+data.resultList[1].fileLocation+'" /></a></td><tr>'
			result+='<tr><th colspan="3">내용</th></tr><tr><td colspan="3">'+data.result.content+'</td></tr></table></td></tr>'
			thisTr.after(result);
		},
		error : function (request,status,error) {
			alert('실패');
		}
	});
}
function getImageLink(fileName) {
	var front = fileName.substr(0, 12);
	var end = fileName.substr(14);
	return front + end;
}
</script>
</html>