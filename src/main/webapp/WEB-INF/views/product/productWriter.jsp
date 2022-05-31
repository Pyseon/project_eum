<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/common/header.jsp" %>	
<script src="/summernote/summernote-lite.js"></script>
<script src="/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/summernote/summernote-lite.css">
</head>
<body>
	<div class="container">
		<h1 style="border-bottom: 3px solid rgb(0 0 0);">상담 등록하기</h1>
		<div class="title">
			<div>상담명</div>
			<input class="input-form" type="text" name="productTitle" placeholder="상담명을 입력해주세요.">
		</div>
		<div class="intro">
			<div>상담 간단한 소개</div>
			<input class="input-form" type="text" name="productIntro" placeholder="상담에 간단한 소개를 해주세요">
		</div>
		<div class="content">
			<div>상담 상세 설명</div>
			<textarea id="productContent" class="input-form"></textarea>
		</div>
		<div>
			<div>자주묻는 질문 (선택)</div>
			<div>
				<span>질문
					<input class="input-form" type="text" name="productQNA" placeholder="질문을 입력하세요">
				</span>
			</div>
			<div>
				<span>답변
					<input class="input-form" type="text" name="productAns" placeholder="답변을 입력하세요">
				</span>
			</div>
			
		</div>
		<div>
			<div>사업장 주소</div>
			<input class="input-form" type="text" name="productAddr" placeholder="주소를 입력해주세요">
		</div>
		<div>가격 설정</div>
			<input class="input-form" type="text" name="">
		
	</div>
	<script>
	$("#productContent").summernote({
		height : 500,
		lang : "ko-KR",
		focus : true,
		callbacks : {
			onImageUpload : function(files, editor, welEditable){
				for (var i=files.length - 1; i>=0; i--){
				uploadImage(files[0],this);
				}
			}
		
		}
		
	});
	function uploadSummernoteImageFile(file,editor){
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST",
			url : "/uploadSummernoteImageFile",
			contentType : false,
			enctype : 'multipart/form-data',
			processData : false,
			success : function(data) {
				$(editor).summernote('editor.insertImage', data.url);
				}
			});
	}
	
	$("div.note-editable").on('drop',function(e){
        for(i=0; i< e.originalEvent.dataTransfer.files.length; i++){
        	uploadSummernoteImageFile(e.originalEvent.dataTransfer.files[i],$("#productContent")[0]);
        }
       e.preventDefault();
  })
	</script>
	

</body>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</html>