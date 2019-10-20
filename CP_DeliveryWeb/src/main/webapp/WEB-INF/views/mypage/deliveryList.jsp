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
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<style>
	p { margin:20px 0px; }
	/*datepicer 버튼 롤오버 시 손가락 모양 표시*/
	.ui-datepicker-trigger{cursor: pointer;}
	/*datepicer input 롤오버 시 손가락 모양 표시*/
	.hasDatepicker{cursor: pointer;}
</style>
<body>
<div class="container  col-md-10" role="main">
	<h1>배송내역</h1>
	<div class="btn-group btn-group-toggle" data-toggle="buttons">
		<label class="btn btn-light" for="mr-1">
			<input type="radio" class="radio-value" name="momentRadio" id="mr-1" value="1week"> 1주일
		</label>
		<label class="btn btn-light" for="mr-2">
			<input type="radio" class="radio-value" name="momentRadio" id="mr-2" value="1month"> 1개월
		</label>
		<label class="btn btn-light" for="mr-3">
			<input type="radio" class="radio-value" name="momentRadio" id="mr-3" value="3month"> 3개월
		</label>
		<label class="btn btn-light active" for="mr-4">
			<input type="radio" class="radio-value" name="momentRadio" id="mr-4" checked="checked" value="all"> 전체시기
		</label>
	</div>
    From: <input type="text" id="datepicker">
    ~ <input type="text" id="datepicker2">
 	<button type="button" class="btn btn-info" id="lookupBtn">조회</button>
	<table class="table">
		<tr>
			<th>상품이름</th>
			<th>송장번호</th>
			<th>보내는 분</th>
			<th>배송일자</th>
			<th>배송상태</th>
		</tr>
		<tr>
			<td>사과</td>
			<td>229292929</td>
			<td>권*</td>
			<td>2019-10-08</td>
			<td>배송중</td>
		</tr>
	</table>

</div>
</body>
<script>
$(function() {
       	$('label.btn.btn-light').on('change',function(){
			if($('input[name="momentRadio"]:checked').val() == '1week'){
				alert("1주");
	             $('#datepicker').datepicker('setDate', '-7D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
	             $('#datepicker2').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
			}else if($('input[name="momentRadio"]:checked').val() == '1month'){
				alert("1개월");
				$('#datepicker').datepicker('setDate', '-1M'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
	            $('#datepicker2').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
			}else if($('input[name="momentRadio"]:checked').val() == '3month'){
				alert("3개월");
				$('#datepicker').datepicker('setDate', '-3M'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
	            $('#datepicker2').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
			}else if($('input[name="momentRadio"]:checked').val() == 'all'){
				alert("전체");
				$('#datepicker').datepicker('setDate', null); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
	            $('#datepicker2').datepicker('setDate', null); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
			}
		});
           //input을 datepicker로 선언
           $("#datepicker").datepicker({
               dateFormat: 'yy-mm-dd' //Input Display Format 변경
               ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
               ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
               ,changeYear: true //콤보박스에서 년 선택 가능
               ,changeMonth: true //콤보박스에서 월 선택 가능                
//          ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
//          ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
               ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
               ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
               ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
               ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
               ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
               ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
               ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
               ,minDate: "-1Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
               ,maxDate: "-1D" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
           });                 
           
           $("#datepicker2").datepicker({
               dateFormat: 'yy-mm-dd' //Input Display Format 변경
               ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
               ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
               ,changeYear: true //콤보박스에서 년 선택 가능
               ,changeMonth: true //콤보박스에서 월 선택 가능                
//          ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
//          ,buttonImage: "http://jqueryui.com/resources/demos/datepicker2/images/calendar.gif" //버튼 이미지 경로
               ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
               ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
               ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
               ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
               ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
               ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
               ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
               ,minDate: "-1Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
               ,maxDate: "today" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
           });
           //초기값을 오늘 날짜로 설정
//      $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
//      $('#datepicker2').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)

           $('#lookupBtn').click(function() {
           	var sendData = JSON.stringify({startDate:$('input[id="datepicker"]').val(), endDate:$('input[id="datepicker2"]').val()});
           	alert(sendData);
           	$.ajax({
   				type : 'post',
   				url : '/mypage/lookuplist',
   				data : sendData,
   				dataType : 'json',
   				contentType:'application/json;charset=UTF-8',
   				success : function (data) {
   					alert("성공"+data);
   				},
   				error : function (request,status,error) {
   					alert('실패');
   				}
   			});
 		});
});
</script>
</html>