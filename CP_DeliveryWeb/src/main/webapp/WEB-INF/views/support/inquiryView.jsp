<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<style>
.fileDrop {
    width: 100%;
    height: 200px;
    border: 1px dotted blue;
}
small {
    margin-left:3px;
    font-weight: bold;
    color: gray;
}
</style>
<script>
$(function(){
    //이벤트 설정시에는 jquery의 .on()을 사용한다.
    //드래그 기본 효과를 막음
    $(".fileDrop").on("dragenter dragover", function(event){
        //drop영역에 들어가고, 드롭영역에 드래그 되고있을때의 기본 효과를 막음
        event.preventDefault();
    });
    $(".fileDrop").on("drop",function(event){
        //drop이 될 때 기본 효과를 막음
        //기본 효과를 막지 않으면 드래그시에 브라우저에서 이미지파일이 열려버림
        event.preventDefault();
        var blank_pattem = /^\s+|\s+$/g;
        //첨부파일 배열
        var files=event.originalEvent.dataTransfer.files;
        console.log(files);
        var file=files[0]; //첫번째 첨부파일
        console.log(file.name);
        //AJAX로 (이미지를 넘길때)폼 전송을 가능케해주는 FormData 객체
        var formData=new FormData();
        formData.append("file",file); //폼에 file 변수 추가
        //서버에 파일 업로드(백그라운드에서 실행됨)
        // contentType: false => multipart/form-data로 처리됨
        $.ajax({
            //AjaxUploadController에 post방식으로 넘어감
            type: "post",
            url: "/upload/uploadAjax",
            data: formData,
            dataType: "text",
            processData: false,
            contentType: false,
            success: function(data,status,req){
                console.log("data:"+data); //업로드된 파일 이름
                console.log("status:"+status); //성공,실패 여부
                console.log("req:"+req.status);//요청코드값
                var str="";
                if(checkImageType(data)){ //이미지 파일
					str="<div><a href='${path}/upload/displayFile?fileName="+getImageLink(data)+"'>";
					str+="<img src='${path}/upload/displayFile?fileName="+data+"'></a>"; 
                }else{ //이미지가 아닌 경우
                    str="<div>";
					str+="<a href='${path}/upload/displayFile?fileName="+data+"'>"+getOriginalName(data)+"</a>";
                }
                str+="<span data-src="+data+">[삭제]</span></div>";
                console.log(data);
                $(".uploadedList").append(str);
            }
        });
    }); //fileDrop 함수
    //첨부파일 삭제 함수
    $(".uploadedList").on("click","span",function(event){
        //현재 클릭한 태그
        var that=$(this);
		//data: "fileName="+$(this).attr("data-src"),
        $.ajax({
            url: "${path}/upload/deleteFile",
            type: "post",
            data: {
                fileName: $(this).attr("data-src")
            },
            dataType: "text",
            success: function(result){
                if(result=="deleted"){
                    that.parent("div").remove();
                }
            }
        });
    });
    
    function getOriginalName(fileName){
        if(checkImageType(fileName)){ //이미지 파일이면 skip
            return;
        }
        var idx=fileName.indexOf("_")+1; //uuid를 제외한 파일이름
        return fileName.substr(idx);
    }
    function getImageLink(fileName){
        if(!checkImageType(fileName)){//이미지 파일이 아니면 skip
            return;
        }
        var front=fileName.substr(0,12);//연월일 경로
        var end=fileName.substr(14);// s_ 제거
        return front+end;
    }
    function checkImageType(fileName){
        // '/i': ignore case
        var pattern=/jpg|png|jpeg/i; //정규표현식(대소문자 무시)
        return fileName.match(pattern); //규칙에 맞으면 true
    }
});
</script>
</head>
<body>
	<div class="card-body">
		<div>
		 	<h1>고객 문의</h1>
		 </div>
			 <table class="table">
			 	<tr>
				 	<td>운송장번호</td>
				 	<td></td>
			 	</tr>
			 	<tr>
				 	<td>이름</td>
				 	<td></td>
			 	</tr>
			 	<tr>
				 	<td>연락처</td>
				 	<td></td>
			 	</tr>
			 	<tr>
				 	<td>주소</td>
				 	<td></td>
			 	</tr>
			 	<tr>
				 	<td>유형</td>
				 	<td><select id="selectType"><option value="" selected="selected">배송확인</option><option value="">배송지연</option><option value="">반품확인</option><option value="">반품지연</option><option value="">칭찬</option><option value="">불친절</option><option value="">사고처리</option><option value="">기타</option><option value="">제안</option></select></td>
			 	</tr>
			 	<tr>
				 	<td>물품명</td>
				 	<td></td>
			 	</tr>
			 	<tr>
				 	<td>제목</td>
				 	<td></td>
			 	</tr>
			 	<tr>
				 	<td>내용</td>
				 	<td></td>
			 	</tr>
			 	<tr>
				 	<td>파일첨부</td>
				 	<td></td>
			 	</tr>
			 </table>
			 <div class="fileDrop">
			 <div class="uploadedList"></div>
			 </div>
			 
	</div>
</body>
</html>