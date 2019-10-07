<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> <!-- 외부 API 다운 (다음 주소 찾기) -->
<script type="text/javascript">
window.onload = function addOption(){
    var now = new Date();
	var valArr = new Array();
	
	if(now.getDay() == 5 || now.getDay() == 6) {
	 var num;
	 if(now.getDay() == 5){
	     num = 2;
	 }else {
	     num = 1  
	 }
	 now.setDate(now.getDate()+num);       
	}
	
	var nowDayOfWeek = now.getDay();
	var nowDay = now.getDate();
	var nowMonth = now.getMonth();
	var nowYear = now.getYear();
	nowYear += (nowYear < 2000) ? 1900 : 0;
	
	
	var today = new Date(nowYear, nowMonth, nowDay);
	var reserveDate = new Date(nowYear, nowMonth, nowDay)
	var weekStartDate = new Date(nowYear, nowMonth, nowDay - nowDayOfWeek);
	var weekEndDate = new Date(nowYear, nowMonth, nowDay + (6 - nowDayOfWeek));
	 
	for(var i=today.getDay(), j=1; i<5; i++,j++){
	    reserveDate.setDate(reserveDate.getDate()+1);
	 valArr[j-1] = (reserveDate.getMonth()+1)+'월'+(reserveDate.getDate())+'일';
	}
	  
	var objSel = document.getElementById("se_resDate");
	
	for(var i=0; i<=valArr.length-1; i++){
		var objOption = document.createElement("option");       
		objOption.text = valArr[i];
		objOption.value = valArr[i];
		objSel.options.add(objOption);
	}
}
</script>
<script type="text/javascript">
$(document).ready(function () {
	$('#sr_waybill').unbind('click').click(function (e) {
		e.preventDefault();
		waybillSearch();
	});
});

function waybillSearch() {
	var sendData = JSON.stringify({waybill_Num:$('#waybill').val(), phone_Num:$('#phone').val()});
	$.ajax({
		type : 'post',
		url : "/board/lookupReserve",
		data : sendData,
		dataType : 'json',
		contentType:"application/json;charset=UTF-8",
		success : function (data) {
			if(jQuery.isEmptyObject(data)) {
					alert("검색된 정보가 없습니다. 확인 후 다시 입력해 주시기 바랍니다. ");
			} else{
				alert("조회 완료");
				console.log(data);
				var attrArr = new Array ('se_name','se_phone','se_phone2','se_addr','se_addr2','re_name','re_phone','re_phone2','re_addr','re_addr2','item_name','item_price','res_count','item_farePrice');
				var valArr = new Array();
				var count = 0;
				$.each(data.reservationVO, function(key,value){
					if(key==attrArr[count]){
						valArr[count] = value;
						count++;
					}
				});
				attrArr = new Array ('re_name','re_phone','re_phone2','re_addr','re_addr2','se_name','se_phone','se_phone2','se_addr','se_addr2','item_name','item_price','res_count','item_farePrice');
				for(var i=0; i<attrArr.length; i++){
					$('input[name='+attrArr[i]+']').attr('value',valArr[i]);
				}
				$('#item_weight option:contains('+data.reservationVO.item_weight+')').prop('selected', 'selected');
				$('#item_farePrice').val(data.reservationVO.item_farePrice);
			}
		},
		error : function (request,status,error) {
			alert('서버가 응답하지 않습니다. \n다시 시도해주시기 바랍니다.');
		 console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	
	});
	
}
</script>
<script>
    function DaumPostcode(chk) {
        new daum.Postcode({
            oncomplete: function(data) {

                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                if(data.userSelectedType === 'R'){

                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
  
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }
                var addrId = '';
                var addrId2 = '';
				
                if (chk == 'se'){
                	addrId = 'se_addr';
          		  	addrId2 = 'se_addr2';
                } else if (chk=='re'){
               	    addrId = 're_addr';
               	    addrId2 = 're_addr2';
                } 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById(addrId).value = fullAddr;

                document.getElementById(addrId2).value = '';
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById(addrId2).focus();
                
            }
        }).open();
    }
</script>
</head>
<body>
	<div class="container  col-md-10" role="main">
		<div class="card">
			<div class="card-header">반품예약</div>
			<div class="card-body">
				<div>
				 	<h1>원 운송장 번호 조회</h1>
				 	<div class="form-group">
				 		<label for="waybill_Num">원운송장 번호</label>
				 		<input type="text" class="form-control" id="waybill" name="waybill" placeholder="원운송장 번호" >
				 	</div>
				 	<div class="form-group">
				 		<label for="phone">받는 분 번호</label>
				 		<input type="text" class="form-control" id="phone" name="phone" placeholder="받는 분 전화번호" >
				 		<button class="btn btn-primary"  type="button" id="sr_waybill">조회</button>
				 	</div>
				 </div>
				 <div>
				 	<h1>보내는 분</h1>
				 </div>
				 <form action="${path}/board/reservation" method="post">
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
					    <button class="btn btn-primary"  type="button" onclick="DaumPostcode('se')" id="se_addrBtn">주소검색</button>
					    <input type="text" class="form-control" id="se_addr" name="se_addr" placeholder="주소">
					 </div>
					 <div class="form-group">
						<label for="se_addr2" class="sr-only">상세주소</label>
						<input type="text" class="form-control" id="se_addr2" name="se_addr2" placeholder="상세주소">
					 </div>
					 <div class="form-group">
					    <label for="se_email">이메일</label>
					    <input type="text" class="form-control" id="se_email" name="se_email" placeholder="보내는 사람 이메일">
					 </div>
					 <div class="form-group">
					    <label for="se_resDate">방문희망일</label>
					    <select class="form-control" name="se_resDate" id="se_resDate">
						</select>
					 </div>
					 <div class="form-group">
					    <label for="se_req">요청사항</label>
					    <select class="form-control" name="se_req">
							<option selected="selected">직접입력</option>
							<option>방문 전 연락 바랍니다.</option>
							<option>문 앞에 놓겠습니다.</option>
							<option>경비실에 맡겨 두겠습니다.</option>
							<option>파손에 주의해 주세요.</option>
							<option>빠른 배송 부탁드립니다.</option>
							<option>부재시 연락 바랍니다.</option>
						</select>
					 </div>
					 <div class="form-group">
					    <label class ="sr-only" for="se_reqContents">요청사항 내용</label>
					    <input type="text" class="form-control" id="se_reqContents" name="se_reqContents" placeholder="요청사항 상세">
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
					    <button class="btn btn-primary"  type="button" onclick="DaumPostcode('re')" id="re_addrBtn">주소검색</button>
					    <input type="text" class="form-control" id="re_addr" name="re_addr" placeholder="주소">
					 </div>
					 <div class="form-group">
						<label for="re_addr2" class="sr-only">상세주소</label>
						<input type="text" class="form-control" id="re_addr2" name="re_addr2" placeholder="상세주소">
					 </div>
					 <div>
					 	<h1>상품정보</h1>
					 </div>
					 <div class="form-group">
					 	<label for="item_name">상품명</label>
					    <input type="text" class="form-control" id="item_name" name="item_name" placeholder="물품명">
					 </div>
					 <div class="form-group">
					 	<label for="item_price">상품가격</label>
					    <input type="number" class="form-control" id="item_price" name="item_price" placeholder="물품가격">
					 </div>
					 <div class="form-group">
					 	<label for="res_count">포장수량</label>
					    <input type="number" class="form-control" id="res_count" name="res_count" placeholder="개수를 입력해주세요">
					 </div>
					 <div class="form-group">
					    <label for="se_req">부피</label>
					    <select class="form-control" name="item_weight" id="item_weight">
							<option selected="selected" value="4000">극소형 (2kg 이하)</option>
							<option value="6000">소형 (5kg 이하)</option>
							<option value="7000">중형 (15kg 이하)</option>
							<option value="8000">대형 (25kg 이하)</option>
						</select>
					 </div>
					 <div class="form-group">
					 	<h6>운임구분</h6>
					    <div class="custom-control custom-radio">
				          <input type="radio" class="custom-control-input" name="item_fare" id="item_ip1" value="선불">
				          <label class="custom-control-label" for="item_ip1">선불</label>
				        </div>
				        <div class="custom-control custom-radio">
				          <input type="radio" class="custom-control-input" name="item_fare" id="item_ip2" value="착불">
				          <label class="custom-control-label" for="item_ip2">착불</label>
				        </div>
				        <div class="custom-control custom-radio">
				          <input type="radio" class="custom-control-input" name="item_fare" id="item_ip3" value="신용">
				          <label class="custom-control-label" for="item_ip3">신용</label>
				        </div>
					 </div>
					 <input type="hidden" id="item_farePrice" name="item_farePrice" value="">
					 <div class="form-group">
					 <button class="btn" type="submit">예약신청</button>
					 </div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>