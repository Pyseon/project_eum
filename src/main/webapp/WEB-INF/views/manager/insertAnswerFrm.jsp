<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이음 :: 관리자</title>
<style>
	.ansTable{
		margin-top: 20px;
		border: 1px solid #3865f2;
		width: 100%;
	}
	.ansTable th{
		width: 20%;
	}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/manager/managerHeader.jsp"%>
	<div class="manaContentWrap">
	
		<h1>>1:1문의 상세 페이지</h1>
		<hr>
		<div class="questionBox">
			<h3>질문번호: ${qst.qstNo }</h3>
			<hr>
			<h3>제목: ${qst.qstTitle }</h3>
			<hr>
			<h4>${qst.memberId }</h4>
			<h4>${qst.qstDate.substring(0,10) }</h4>
			<h4>${qst.qstDate.substring(11,16) }</h4>
			<hr>
			<p>${qst.qstContent }</p>
		</div>
		<c:choose>
			<c:when test="${qst.ansState == 0 }">
				<form action="insertAnswer.do" method="post" class="answerForm">
			<span class="material-symbols-outlined ansRe">
				subdirectory_arrow_right</span><h2>답변</h2>
				<input type="text" class="managerTitle" name="ansTitle" placeholder="제목" maxlength="50">
				<div class="pt-1" style="margin-bottom: 50px;">
					<textarea id="summernote" name="ansContent"></textarea>
				</div>
				<input type="hidden" name="qstNo" value="${qst.qstNo }">
				<input id="submit" type="submit" disabled="disabled" class="btn bc1 bs4" value="제출">
			</form> 
			</c:when>
			<c:when test="${qst.ansState == 1 }">
				<table class="ansTable">
					<tr>
						<th>제목</th>
						<td>${ans.ansTitle }</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>${ans.ansContent }</td>
					</tr>
				</table>
			</c:when>
		</c:choose>
		</div>
		
	<input type="hidden" id="ansState" value=${qst.ansState }>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<script>
$(function() {
	const ansState = $("#ansState").val();
	const ansTitle = $("#ansTitle").val();
	const ansContent = $("#ansContent").val();
	if(ansState == 1){
		$("#submit").css("display","none");
	}
});

window.onkeydown = function() {
	const ansTitle = $("input[name=ansTitle]").val();
	const ansContent = $("#summernote").val();
	if(ansTitle.length > 0 && ansContent.length > 0){
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