<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이음 :: 마이페이지</title>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
	<h1>>1:1 질문</h1>
	<hr>
	<form action="/insertQuestion.do" method="post">
		<input class="managerTitle" type="text" name="qstTitle" placeholder="제목을 입력하세요." maxlength="50">
		
		<!-- 썸머노트 -->
		<div class="pt-1" style="margin-bottom: 50px;">
			<textarea id="summernote" name="qstContent"></textarea>
		</div>
		<input id="submit" type="submit" disabled="disabled" class="btn bc1 bs4" value="등록하기">
	</form>
	</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<script>
window.onkeydown = function() {
	const qstTitle = $("input[name=qstTitle]").val();
	const qstContent = $("#summernote").val();
	if(qstTitle.length > 0 && qstContent.length > 0){
		$("#submit").attr("disabled", false);
	}
};

$("#summernote").summernote({
	  toolbar: [ //썸머노트 툴바 추가
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
lang: "ko-KR",					// 한글 설정
placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정

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
</html>