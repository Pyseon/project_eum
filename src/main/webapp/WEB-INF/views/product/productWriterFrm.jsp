<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#category{
		font:bold 16px "malgun gothic";
		width: 120px;
		height:30px;
		color:black;
		line-height: 40px; 
	}
	
		#category > ul >li:hover > ul{
		display:block;
		}
	}
</style>
<%@ include file="/WEB-INF/views/common/header.jsp" %>	
<script src="/summernote/summernote-lite.js"></script>
<script src="/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/summernote/summernote-lite.css">
</head>
<body>
	<div class="container">
		<h1 style="border-bottom: 3px solid rgb(0 0 0);">상담 등록하기</h1>
		<form action="/productWrite.do" method="post">
		<div>
			<table class = "product-tab">
				<tr>
					<td><button type="button">1:1전문가상담</button></td>
					<td><button type="button">클래스</button></td>
					<td><button type="button">지식마켓</button></td>
				</tr>
			</table>	
		</div>
		<select id="category">
		<option value="">선택</option>
		<option value="1">법률</option>
		<option value="2">비즈니스</option>
		<option value="3">심리/헬스</option>
		<option value="4">학습</option>
		<option value="5">금융</option>
		<option value="6">라이프</option>
		<option value="7">취미</option>
		<option value="8">어학</option>
		<option value="9">레저</option>
		<option value="10">IT/테크</option>
		<option value="9">자기계발</option>
		</select>
		
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
		<div>
		<div>가격 설정</div>
			<span>
			<input class="input-form" type="text" name="productOption" placeholder="시간을 정해 주세요">
			<input class="input-form" type="text" name="cost" placeholder="가격을 정해주세요">원
			</span>
		</div>
		<div>
		<div>태그</div>
			<input class="input-form" type="text" name="productTag" placeholder="태그를 작성하세요">
		</div>
		<div>
		<input type="submit" value="등록하기">
		</div>
		</form>
	</div>
	<script>
	$("#productContent").summernote({
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
    });
	</script>
	

</body>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</html>