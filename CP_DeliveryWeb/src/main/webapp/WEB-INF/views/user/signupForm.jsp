<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> <!-- 외부 API 다운 (다음 주소 찾기) -->
<script>
    function DaumPostcode() {
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

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('user_addr').value = fullAddr;

                document.getElementById('user_addr2').value = "";
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('user_addr2').focus();
            }
        }).open();
    }
</script>
<script>
	$(document).on('click', '#btnSignup', function(e){
		e.preventDefault();
		$("#form").submit();
	});
	
	$(document).on('click', '#btnReset', function(e){
		e.preventDefault();
		if(confirm('초기화 하시겠습니까?')){
			$( "#form" ).each( function () {
	            this.reset();
	        });
		}else{
			return false;
		}
	});
	
	function chkId() {
		if($('#user_id').val() == ''){
			alert("아이디를 입력해주십시오");
			return false;
		}
		var param = '?chkId='+$('#user_id').val();
		alert(param);
		chkIdAjax(param);
	}
	function chkIdAjax(param) {
		$.ajax({
			type : 'get',
			url : '/user/chkId'+param,
			dataType : 'json',
			contentType:'application/json;charset=UTF-8',
			success : function (data) {
				console.log(data);
			},
			error : function (request,status,error) {
				alert('실패');
			}
		});
	}
</script>
</head>
<body>


	<div class="container  col-md-10" role="main">
		<div class="card">
			<div class="card-header">회원정보 입력</div>
			<div class="card-body">
				<form:form name="form" id="form" class="form-signup" role="form" modelAttribute="userVO" method="post" action="${pageContext.request.contextPath}/user/signup">
					<div class="form-group row">
						<label for="user_id" class="col-md-3 col-form-label text-md-right">아이디</label>
						<div class="col-md-7">
							<form:input path="user_id" id="user_id" class="form-control" placeholder="아이디을 입력해 주세요" />
						</div>
						<div class="col-md-2">
							<input class="btn btn-primary" type='button' OnClick='chkId()' value='중복확인'>
						</div>
					</div>
		
					<div class="form-group row">
						<label for="user_name" class="col-md-3 col-form-label text-md-right">이름</label>
						<div class="col-md-7">
							<form:input path="user_name" id="user_name" class="form-control" placeholder="이름을 입력해 주세요" />
						</div>
					</div>
					
					<div class="form-group row">
						<label for="user_birth" class="col-md-3 col-form-label text-md-right">생년월일</label>
						<div class="col-md-7">
							<form:input path="user_birth" id="user_birth" class="form-control" placeholder="생년월일을 입력해 주세요" />
						</div>
					</div>

					<div class="form-group row">
						<label for="user_gender" class="col-md-3 col-form-label text-md-right" >성별</label>
						<div class="col-md-7 my-auto" >
						<div class="custom-control custom-control-inline">
						  <form:radiobutton id="male" value="남자" path="user_gender" class="custom-control-input"/>
						  <label class="custom-control-label" for="male">남자</label>
						</div>
						<div class="custom-control custom-control-inline" >
						  <form:radiobutton id="female" value="여자" path="user_gender" class="custom-control-input"/>
						  <label class="custom-control-label" for="female">여자</label>
						</div>
						</div>
					</div>
					
					<div class="form-group row">
						<label for="user_pwd" class="col-md-3 col-form-label text-md-right">비밀번호</label>
						<div class="col-md-7">
							<form:password path="user_pwd" id="user_pwd" class="form-control" placeholder="비밀번호를 입력해 주세요" maxlength="20"/>
						</div>
					</div>

					<div class="form-group row">
						<label for="user_phone" class="col-md-3 col-form-label text-md-right">전화번호</label>
						<div class="col-md-7">
							<form:input path="user_phone" id="user_phone" class="form-control" placeholder="'-' 제외하고 전화번호를 입력해 주세요" />
						</div>
					</div>
					
					<div class="form-group row">
						<label for="user_addr" class="col-md-3 col-form-label text-md-right">주소</label>
						<div class="col-md-7" >
							<form:input path="user_addr" id="user_addr" class="form-control" readonly="true"/>
							
						</div>
						<div class="col-md-2">
							<input class="btn btn-primary" type='button' OnClick='DaumPostcode()' value='주소검색'>
						</div>
					</div>
					
					<div class="form-group row">
						<div class="offset-3 col-md-7">
							<form:input path="user_addr2" id="user_addr2" class="form-control"/>
						</div>
					</div>
					
				</form:form>
			</div>
		</div>
		<div style="margin-top:10px">
			<button type="button" class="btn btn-lg btn-primary" id="btnSignup">회원가입</button>
			<button type="button" class="btn btn-lg btn-primary" id="btnReset">다시쓰기</button>
		</div>
	</div>
	
</body>
</html>