<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이음 :: 개설요청</title>
<%@ include file="/WEB-INF/views/common/header.jsp" %>	
</head>
<body>
<div class="container">
<h1>개설요청 수정 페이지</h1>
<form action="updateRequest.do" method="post" onsubmit="checkForm();return false" enctype="multipart/form-data">
<input type="hidden" name="reqNo" value="${req.reqNo }">

	<div style="margin-top: 50px; font-size:25px; font-family: fs-bold">요청 제목을 작성해 주세요
		<input class="input-form" type="text" name="reqTitle" value="${req.reqTitle }" pattern=".{2,20}" required title="2~20글자 이내로 입력하세요" maxlength="20" required>
	</div>
	<div style="margin-top: 50px; font-size:25px; font-family: fs-bold">내용을 작성해 주세요
		<textarea id="summernote" class="input-form" name="reqContent" >
		${req.reqContent }
		</textarea>
	</div>
	<input type="submit" class="btn bc1 bs4" value="등록"> 
</form>
</div>
<script>
$("#summernote").summernote({
    toolbar: [ //썸머노트 툴바 추가/수정
        ['fontsize', ['fontsize']],
        ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
        ['color', ['forecolor','color']],
        ['table', ['table']],
        ['para', ['ul', 'ol', 'paragraph']],
        ['height', ['height']],
        ['insert',['picture','link','video']],
        ['view', ['fullscreen', 'help']]
          ],
    fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
height: 500,                 // 에디터 높이
minHeight: null,             // 최소 높이
maxHeight: null,             // 최대 높이
focus: false,                  // 에디터 로딩후 포커스를 맞출지 여부
lang: "ko-KR",                    // 한글 설정
placeholder: '최대 2048자까지 쓸 수 있습니다'    //placeholder 설정

});

 // 이미지 추가 함수 시작
var imgTarget = $('.preview-image .upload-hidden');

imgTarget.on('change', function(){
  var parent = $(this).parent().next();
  parent.children('.upload-display').remove();

    if(window.FileReader){
        //image 파일만
        if (!$(this)[0].files[0].type.match(/image\//)) return;
        
        var reader = new FileReader();
        reader.onload = function(e){
            var src = e.target.result;
            parent.append('<div class="upload-display" style="display:inline-block; border: 1px solid #eee; padding: 10px;"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb" style="height: 160px;"></div></div>');
        }
        reader.readAsDataURL($(this)[0].files[0]);
    }

    else {
        $(this)[0].select();
        $(this)[0].blur();
        var imgSrc = document.selection.createRange().text;
        parent.prepend('<div class="upload-display" style="border: 1px solid #eee; padding: 10px;"><div class="upload-thumb-wrap"><img class="upload-thumb" style="width: 120px;"></div></div>');

        var img = $(this).siblings('.upload-display').find('img');
        img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";        
    }
});// 이미지 추가 함수 종료
</script>
</body>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</html>