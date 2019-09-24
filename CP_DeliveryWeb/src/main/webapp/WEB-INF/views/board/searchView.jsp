<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>배송조회</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    
    <script>
	    $(document).on('click', '#lookupBtn', function(e){
	    	if($("#waybill").val().replace(/\s/g,"").length==0){
				alert("운송장번호를 입력해주세요");
				$("#waybill").focus();
				return false;
			}
			e.preventDefault();
			var url = "${pageContext.request.contextPath}/board/search";
			var trim_num = $('#waybill').val().replace(/ /gi, '');
			if(trim_num.length!=11){
				alert("숫자 11자리를 입력해주세요");
				$("#waybill").focus();
				return false;
			}
			url = url + "?waybill=" + trim_num;
			location.href = url;
			console.log(url);
		});
    </script>
    <script>
    	
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
                <a class="nav-link active" data-toggle="tab" onclick="tab_replace();" href="#waybill_tab">운송장 번호로 조회</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" onclick="tab_replace();" href="#login_Info">고객정보로 조회</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" onclick="tab_replace();" href="#res_Num">예약번호로 조회</a>
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
              </div>
              <div class="tab-pane" id="login_Info">
                <p>Nunc vitae turpis id nibh sodales commodo et non augue. Proin fringilla ex nunc. Integer tincidunt risus ut facilisis tristique.</p>
              </div>
              <div class="tab-pane" id="res_Num">
                <p>Curabitur dignissim quis nunc vitae laoreet. Etiam ut mattis leo, vel fermentum tellus. Sed sagittis rhoncus venenatis. Quisque commodo consectetur faucibus. Aenean eget ultricies justo.</p>
              </div>
            </div>
        </div>
      </div>
    </div>
  </body>
	  
	<script type="text/javascript">
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
	</script> 
	
</html>