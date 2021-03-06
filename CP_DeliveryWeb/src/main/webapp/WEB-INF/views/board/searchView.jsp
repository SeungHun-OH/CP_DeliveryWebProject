<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>배송조회</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	<script>
		$(document).ready(function() {
			let searchParams = new URLSearchParams(window.location.search)
			history.replaceState({}, null, location.pathname);
			if(searchParams.has('waybill')){
				let param = searchParams.get('waybill');
				var sendData = JSON.stringify({waybill_Num:param});
				$.fn.ajaxConnection(sendData);
// 				$(window).on("beforeunload", function() {
// 					setTimeout(test,0)
// 				}); //페이지 이동 감지 메소드
			}
			
		});
	</script>
	<script>
	function test() {
		history.replaceState({}, null, location.pathname);	//url 파라미터 제거
	}
	</script>
    <script>
    	$.fn.ajaxConnection = function(sendData) {
			var resultList = new Array();
			$.ajax({
				type : 'post',
				url : '/board/lookupSearch',
				data : sendData,
				dataType : 'json',
				contentType:'application/json;charset=UTF-8',
				success : function (data) {
					if(jQuery.isEmptyObject(data)){
							alert('조회된 결과가 없습니다.');
							$("#infoDiv").empty();
							$('#stepImg').empty();
							$('#stateDiv').empty();
							$('#infoDiv').append('<h1>조회된 내역이 없습니다.</h1>');
					} else {
						console.log(data);
						
						$("#infoDiv").empty();
						$("#infoDiv").append('<table class="table" id="infoResult"><tr><th>운송장 번호</th><th>보내는 분</th><th>받는 분</th><th>상품 정보</th><th>수량</th></tr><tr id="result"></tr></table>');

						$.each(data.result, function(key, value){
							if(value != null){
								$('#result').append('<td>'+value+'</td>');
							}
						});
						$('#stepImg').empty();
						$('#stepImg').append('<img alt="배송단계" id="step_img" src="${pageContext.request.contextPath}/webresources/img/delivery_step_info_7.jpg">');
						$('#stateDiv').empty();
					    $('#stateDiv').append('<table class="table" id="stateResult"><tr id="stateBar"><th>단계</th><th>처리</th><th>상품상태</th><th>담당 점소</th></tr></table>');
						$('#stateResult').append('<tbody id="resultList"></tbody>');
		
						$.each(data.resultList, function(index1){
							var index2 = 0;
							var val = '';
							$.each(data.resultList[index1], function(key,value){
								if(index2 > 4){
									val+='<td>'+value+'</td>';
								}
								index2++;
							});
							$('#resultList').append('<tr>'+val+'</tr>');
						});
					}
					alert('성공');
				},
				error : function (request,status,error) {
					alert('실패');
				}
			
			});
		}
    </script>
    <script>
	    $(document).on('click', '#btnWaybillNumLookup', function(e){
	    	if($("#waybill").val().replace(/\s/g,"").length==0){
				alert("운송장번호를 입력해주세요");
				$("#waybill").focus();
				return false;
			}
	    	var trim_num = $('#waybill').val().replace(/ /gi, '');
			if(trim_num.length!=11){
				alert("숫자 11자리를 입력해주세요");
				$("#waybill").focus();
				return false;
			}
			e.preventDefault();
			var sendData = JSON.stringify({waybill_Num:$('#waybill').val()});
			$.fn.ajaxConnection(sendData);
		});
    </script>
    <script>
    	$(document).on('click', '#btnUserInfoLookup', function(e){
    		e.preventDefault();
    		var sendData = JSON.stringify({user_name:$('#user_name').val(), user_email:$('#user_email').val()});
    		$.fn.ajaxConnection(sendData);
    	});
    </script>
    <script>
    	$(document).on('click', '#btnResNumLookup', function(e){
    		e.preventDefault();
    		var sendData = JSON.stringify({reservation_Num:$('#reservation_Num').val()});
    		$.fn.ajaxConnection(sendData);
    	});
    </script>
    <style>
      p { margin:20px 0px; }
    </style>
  </head>
  <body>
    <div class="container">
      <div class="row">
        <div class="col">
          <p>Tab</p>
            <ul class="nav nav-tabs nav-justified" id="mytab">
              <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#waybill_tab">운송장 번호로 조회</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#userInfo_tab">고객정보로 조회</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#resNum_tab">예약번호로 조회</a>
              </li>
            </ul>
            <div class="tab-content">
              <div class="tab-pane show active" id="waybill_tab">
                <h1>운송장 번호로 조회</h1>
	            <div>
		        	<input type="text" placeholder="예: 01234567890, '-'를 제외한 숫자 11자리" maxlength="11" id="waybill" name="waybill">
                </div>
                <div>
	               	<button id="btnWaybillNumLookup">조회</button>
                </div>
              </div>
              <div class="tab-pane" id="userInfo_tab">
                <h1>고객 정보로 조회</h1>
                <c:if test="${not empty logininfo}">
	                <div>
	                	<input type="text" placeholder="예: 홍길동" id="user_name" name="user_name">
	                	<input type="text" placeholder="예: abcd@example.com" id="user_email" name="user_email">
	                </div>
                <div>
                	<button id="btnUserInfoLookup">조회</button>
                </div>
                </c:if>
                <c:if test="${empty logininfo}">
                	<a href="${path}/user/login">로그인</a>
                </c:if>
              </div>
              <div class="tab-pane" id="resNum_tab">
                <h1>예약 정보로 조회</h1>
                <input type="text" placeholder="예약번호 12자리 입력" id="reservation_Num" name="reservation_Num">
                <div>
                	<button id="btnResNumLookup">조회</button>
                </div>
              </div>
            </div>
            <div id="infoDiv"></div>
            <div id="stepImg"></div>
            <div id="stateDiv"></div>
        </div>
      </div>
    </div>
    <script>
    $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
    	var tab = $(e.target).attr('href');
    	$("#infoDiv").empty();
		$('#stepImg').empty();
		$('#stateDiv').empty();
		$("input[type='text']").val('');
    });
    </script>
  </body>
</html>