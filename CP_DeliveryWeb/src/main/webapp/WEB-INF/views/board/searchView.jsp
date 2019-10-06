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
	    $(document).on('click', '#lookupBtn', function(e){
	    	if($("#waybill").val().replace(/\s/g,"").length==0){
				alert("운송장번호를 입력해주세요");
				$("#waybill").focus();
				return false;
			}
			e.preventDefault();
			var resultList = new Array();
			$.ajax({
				type : 'post',
				url : '/board/lookupWaybill',
				data : JSON.stringify({waybill_Num:$('#waybill').val()}),
				dataType : 'json',
				contentType:'application/json;charset=UTF-8',
				success : function (data) {
					if(data != null){
						alert('성공');
						if($('#step_img').length>0 == false){
							$("#infoResult").append('<tr><th>운송장 번호</th><th>보내는 분</th><th>받는 분</th><th>상품 정보</th><th>수량</th></tr><tr id="result"></tr>');
						}
						var columnTd_Cnt = $("#result td").length;
						var row_Cnt = $("#resultList tr").length;
						if(columnTd_Cnt > 0){
							$("#result td").remove();
						}
						if(row_Cnt > 0){
							$("#resultList tr").remove();
						}
							
						$.each(data.result, function(key, value){
							if(value != null){
								$('#result').append('<td>'+value+'</td>');
							}
						});
						
						if($('#step_img').length>0 == false){
							$('#infoResult').after('<img alt="배송단계" id="step_img" src="${pageContext.request.contextPath}/webresources/img/delivery_step_info_7.jpg">');
						}
						if($('#stateBar').length>0 == false){
					    	$('#stateResult').append('<tr id="stateBar"><th>단계</th><th>처리</th><th>상품상태</th><th>담당 점소</th></tr>');
						}
						$('#stateResult').append('<tbody id="resultList"></tbody>');
		
						$.each(data.resultList, function(index1){
							var index2 = 0;
							var val = null;
							$.each(data.resultList[index1], function(key,value){
								if(index2 > 4){
									val+='<td>'+value+'</td>';
								}
								index2++;
							});
							$('#resultList').append('<tr>'+val+'</tr>');
						});
					} else {
						console.log(data);
						alert('실패');
						//추후에 조회된 내역이 없을때 div나 태그를 append하는 거 만들어야함
					}
				},
				error : function (request,status,error) {
					alert('실패');
				}
			
			});
// 			var url = "${pageContext.request.contextPath}/board/search";
// 			var trim_num = $('#waybill').val().replace(/ /gi, '');
// 			if(trim_num.length!=11){
// 				alert("숫자 11자리를 입력해주세요");
// 				$("#waybill").focus();
// 				return false;
// 			}
// 			url = url + "?waybill=" + trim_num;
// 			location.href = url;
// 			console.log(url);
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
                <a class="nav-link" data-toggle="tab" href="#login_Info">고객정보로 조회</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#res_Num">예약번호로 조회</a>
              </li>
            </ul>
            <div class="tab-content">
              <div class="tab-pane show active" id="waybill_tab">
                <h1>운송장 번호로 조회</h1>
	                
                <c:choose>
	                <c:when test="${deliveryNum == '0'}">
		                	<div>
			                	<input type="text" placeholder="예: 01234567890, '-'를 제외한 숫자 11자리" maxlength="11" id="waybill" name="waybill">
			                </div>
			                <div>
			                	<button id="lookupBtn">조회</button>
			                </div>
		            </c:when>
	            
                	<c:when test="${deliveryNum == null}">
	               		<meta http-equiv="refresh" content="5; url=${pageContext.request.contextPath}/board/search">
	                	<div>
	                		<h3>해당 운송장이 존재하지 않습니다.</h3>
	                	</div>
	                </c:when>
	                <c:when test="${deliveryNum != null}">
		            	${deliveryNum.waybill}
	                </c:when>
                </c:choose>
                <table class="table" id="infoResult">
                </table>
                <table class="table" id="stateResult">
                </table>
              </div>
              <div class="tab-pane" id="login_Info">
                <h1>고객 정보로 조회</h1>
                <div>
                	<input type="text" placeholder="예: 홍길동" id="user_name" name="user_name">
                	<input type="text" placeholder="예: abcd@example.com" id="user_email" name="user_email">
                </div>
                <div>
                	<button id="lookupBtn">조회</button>
                </div>
              </div>
              <div class="tab-pane" id="res_Num">
                <p>Curabitur dignissim quis nunc vitae laoreet. Etiam ut mattis leo, vel fermentum tellus. Sed sagittis rhoncus venenatis. Quisque commodo consectetur faucibus. Aenean eget ultricies justo.</p>
              </div>
            </div>
        </div>
      </div>
    </div>
    <script>
    $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
    	var tab = $(e.target).attr('href');
    		$('#waybill_tab').load('${pageContext.request.contextPath}/board/search' +  ' #waybill_tab');
    });
    </script>
  </body>
	  
<!-- <script type="text/javascript">
	//wire up shown event
	$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
	    console.log("tab shown...");
	    localStorage.setItem('activeTab', $(e.target).attr('href'));
	});
	// read hash from page load and change tab
	var activeTab = localStorage.getItem('activeTab');
	if(activeTab){
	    $('.nav-tabs a[href="' + activeTab + '"]').tab('show');
	}
	
	
	function tab_replace() {
		var url = "${pageContext.request.contextPath}/board/search";
			location.replace(url);
	}
	</script>  --> 
	
</html>