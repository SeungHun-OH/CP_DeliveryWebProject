<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="${path}/webresources/lightbox/css/lightbox.css"/>
<script src="${path}/webresources/lightbox/js/lightbox.js" ></script>
<!-- 외부 API 다운 (다음 주소 찾기) -->
<style>
.fileDrop {
	width: 100%;
	height: 180px;
	border: 1px dotted blue;
}

small {
	margin-left: 3px;
	font-weight: bold;
	color: gray;
}

.fileDrop {
	padding-top: 80px;
	text-align: center;
}
.uploadedList li {
	list-style-type: none;
	float: left;
}
.uploadedList:after {
	content: "";
    display: block;
    clear: both;
}
</style>
<script>
$(document).ready(function($) {
    var checkload = true;
    $("#formSub").click(function () {
        checkload = false;
    });
    
    $(window).on("beforeunload", function () {
    	if (checkload == true)
        	return "페이지를 나가시겠습니까?";
    });
	
});
</script>
<script>
	$(function() {
		//이벤트 설정시에는 jquery의 .on()을 사용한다.
		//드래그 기본 효과를 막음
	$(".content-wrapper").on("dragenter dragover drop", function (event){
			event.preventDefault();
		});
		
	$(".fileDrop").on("dragenter dragover", function(event) {
			//drop영역에 들어가고, 드롭영역에 드래그 되고있을때의 기본 효과를 막음
			event.preventDefault();
		});
		$(".fileDrop").on("drop", function(event) {
			//drop이 될 때 기본 효과를 막음
			//기본 효과를 막지 않으면 드래그시에 브라우저에서 이미지파일이 열려버림
			event.preventDefault();
			//첨부파일 배열
			var files = event.originalEvent.dataTransfer.files;
			console.log(files);
			
			if (files.length > 2) {
				alert('파일은 한번에 두개만 올릴 수 있습니다!');
				return false;
			}

			if ($(".uploadedList div").length == 1
					&& files.length > 1) {
				alert('파일을 하나만 더 올릴 수 있습니다!');
				return false;
			
			} else if ($(".uploadedList div").length == 2) {
				alert('파일이 이미 두개입니다.');
				return false;
			}
			

			//AJAX로 (이미지를 넘길때)폼 전송을 가능케해주는 FormData 객체
			var formData = new FormData();
			var fileSize = new Array();
			for (var i = 0; i < files.length; i++) {
				if(checkImageType(files[i].name)){
					formData.append("file", files[i]); //폼에 file 변수 추가
					fileSize[i] = files[i].size;
				}else {
					alert("첨부파일 형식을 확인해 주십시오.")
					return false;
				}
			}
			//서버에 파일 업로드(백그라운드에서 실행됨)
			// contentType: false => multipart/form-data로 처리됨
			$.ajax({	
					//AjaxUploadController에 post방식으로 넘어감
					type : "post",
					url : "/upload/uploadAjax",
					data : formData,
					dataType : "json",
					processData : false,
					contentType : false,
					success : function(data, status, req) {
						console.log("data:" + data); //업로드된 파일 이름
						console.log("status:" + status); //성공,실패 여부
						console.log("req:" + req.status);//요청코드값
						var obj = eval(data);
						var index = 0;
						for(var item in obj){
							console.log(obj[item]);
							var str = "<span>";
							str = "<li><input type='hidden' name='fileLocationArr' value='"+ obj[item] + "'>"
							str += "<input type='hidden' name='fileSizeArr' value='"+ fileSize[index] + "'>"
							str += "<input type='hidden' name='fileNameArr' value='"+ getOriginalName(obj[item]) + "'>"
							str += "<span><img src='${path}/upload/displayFile?fileName="+ obj[item] + "'></span>";
							str += "<div class='file-info'><a data-lightbox='uploadImages' href='${path}/upload/displayFile?fileName="+ getImageLink(obj[item])+ "'>";
							str += getOriginalName(obj[item])+"</a>"
							str += "<a name='fileLocation' href='"+obj[item]+"' class='delBtn'>[X]</a></div></li>";
							$(".uploadedList").append(str);
							index++;
						}
					}
				});
		}); //fileDrop 함수
		//첨부파일 삭제 함수
		$(document).on("click", ".delBtn", function(event) {
			event.preventDefault();
			//현재 클릭한 태그
			if(confirm("삭제하시겠습니까? 삭제된 파일은 복구할 수 없습니다.")){
			var that = $(this);
			//data: "fileName="+$(this).attr("data-src"),
			$.ajax({
				url : "${path}/upload/deleteFile",
				type : "post",
				data : {
					fileName : $(this).attr("href")
				},
				dataType : "text",
				success : function(result) {
					if (result == "deleted") {
						that.parents("li").remove();
					}
				}
			});
			}
		});

		function getOriginalName(fileName) {
			var subFileName = fileName.substr(14);
			var idx = subFileName.indexOf("_") + 1
			return subFileName.substr(idx);
		}
		function getImageLink(fileName) {
			if (!checkImageType(fileName)) {//이미지 파일이 아니면 skip
				return;
			}
			var front = fileName.substr(0, 12);//연월일 경로
			var end = fileName.substr(14);// s_ 제거
			return front + end;
		}
		function checkImageType(fileName) {
			// '/i': ignore case
			var pattern = /jpg|png|jpeg/i; //정규표현식(대소문자 무시)
			return fileName.match(pattern); //규칙에 맞으면 true
		}
	});
</script>
<script>
	function DaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {

				var fullAddr = ''; // 최종 주소 변수
				var extraAddr = ''; // 조합형 주소 변수

				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					fullAddr = data.roadAddress;

				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					fullAddr = data.jibunAddress;
				}

				if (data.userSelectedType === 'R') {

					if (data.bname !== '') {
						extraAddr += data.bname;
					}

					if (data.buildingName !== '') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
					fullAddr += (extraAddr !== '' ? ' (' + extraAddr
							+ ')' : '');
				}
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('addr').value = fullAddr;

				document.getElementById('addr2').value = '';
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById('addr2').focus();

			}
		}).open();
	}
</script>
<script>
$(document).ready(function(){
	$('#inquiryForm').submit(function () {
		if($(".uploadedList div").length > 0){
			$("#inquiryForm").attr("action", "${path}/support/inquiryF");
		}else{
			$("#inquiryForm").attr("action", "${path}/support/inquiry");
		}
		$("#formSub").submit;
	});
});
</script>
</head>
<body class="content-wrapper">
	<div class="container  col-md-10" role="main">
		<div class="card-body">
			<div>
				<h1>고객 문의</h1>
			</div>
			<form method="post" id="inquiryForm">
			<div class="form-group">
				<label for="waybillNum">운송장번호</label>
				<input type="text" id="waybillNum" name="waybillNum" placeholder="운송장번호를 입력해주세요" class="form-control">
			</div>
			<div class="form-group">
				<label for="name">이름</label>
				<input type="text" id="name" name="name" placeholder="이름을 입력해주세요" class="form-control">
			</div>
			<div class="form-group">
				<label for="phone">핸드폰</label>
				<input type="text" id="phone" name="phone" placeholder="핸드폰번호를 입력해주세요" class="form-control">
			</div>
			<div class="form-group">
				<label for="se_addr">주소</label>
				<button class="btn btn-primary" type="button" onclick="DaumPostcode()" id="se_addrBtn">주소검색</button>
				<input type="text" class="form-control" id="addr" name="addr" placeholder="주소">
			</div>
			<div class="form-group">
				<label for="se_addr2" class="sr-only">상세주소</label>
				<input type="text" class="form-control" id="addr2" name="addr2" placeholder="상세주소">
			</div>
			<div class="form-group">
				<label for="selectType">유형</label> 
				<select name="inquiryType" class="form-control">
					<option value="배송확인" selected="selected">배송확인</option>
					<option value="배송지연">배송지연</option>
					<option value="반품확인">반품확인</option>
					<option value="반품지연">반품지연</option>
					<option value="칭찬">칭찬</option>
					<option value="불친절">불친절</option>
					<option value="사고처리">사고처리</option>
					<option value="기타">기타</option>
					<option value="제안">제안</option>
				</select>
			</div>
			<div class="form-group">
				<label for="productName">물품명</label>
				<input type="text" id="productName" name="productName" class="form-control">
			</div>
			<div class="form-group">
				<label for="title">제목</label>
				<input type="text" id="title" name="title" class="form-control">
			</div>
			<div class="form-group">
			<label for="content">내용</label>
			<input type="text" id="content" name="content" class="form-control">
			</div>
			<div class="form-group">
				<label>파일</label>
			</div>
			<div class="form-group">
				<div class="fileDrop">
					<i>이미지를 드래그 해주세요.</i>
				</div>
				<ul class="uploadedList"></ul>
			</div>
			<div class="form-group">
			<button class="btn" id="formSub" type="submit">예약신청</button>
			</div>
			</form>
		</div>
	</div>
</body>
</html>