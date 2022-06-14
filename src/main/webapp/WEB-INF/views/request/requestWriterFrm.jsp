<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이음 :: 개설요청</title>
<style>

.writetitle{
	height: 50px;
	background-color: #3865f2;
	}
.writetitle > span{
	color:#ffffff;
	font-size:25px;
	margin: 0px 0px 0px 500px;
	line-height: 2;
}
.category{
	font-size:20px;
	width: 200px;
	height: 30px;
}
.input-form{
	margin-top: 5px; 
	font-size:15px; 
	font-family:normal 
}

</style>
<%@ include file="/WEB-INF/views/common/header.jsp" %>	
</head>
<body>
<div class="writetitle">
	<span>개설요청글 작성하기</span>
</div>
<div class="container">

<a href="/requestList.do?reqPage=1&selReq=전체"><h1 style="height: 30px; font-size:30px; font-family: fs-bold">< 개설요청</h1></a>
<form action="/requestWrite.do" method="post" onsubmit="checkForm();return false" enctype="multipart/form-data">
<input type="hidden" name="memberNo" value="${memberNo }">
<h3>카테고리 선택</h3>
		<select class ="category" id="category" name="reqCategory" style="margin-bottom: 10px !important;" required>
		<option value="">선택</option>
		<option value="법률">법률</option>
		<option value="비즈니스">비즈니스</option>
		<option value="심리/헬스">심리/헬스</option>
		<option value="학습">학습</option>
		<option value="금융">금융</option>
		<option value="라이프">라이프</option>
		<option value="취미">취미</option>
		<option value="어학">어학</option>
		<option value="레저">레저</option>
		<option value="IT/테크">IT/테크</option>
		<option value="자기계발">자기계발</option>
		</select>
	<div style="margin-top: 50px; font-size:25px; font-family: fs-bold " >요청 제목을 작성해 주세요
		<input class="input-form" type="text" name="reqTitle" required>
	</div>
	
	
	<div style="margin-top: 50px; font-size:25px; font-family: fs-bold">요청사항을 상세하게 작성해 주세요
		<div>
		<textarea id="summernote" class="input-form" name="reqContent"></textarea>
		</div>
		
		
	</div>
	<div style="margin-top: 50px; font-size:25px; font-family: fs-bold">요청페이지에서 사용할 닉네임을 작성해 주세요
		<input class="input-form" type="text" name="reqNick" required>
	</div>
	
	
	<div style="margin-top: 50px; font-size:25px; font-family: fs-bold">태그를 작성해 주세요
	<button type="button" class="addOptBtn optButton" style="line-height: 2;">
		<i class="fa-solid fa-square-plus " style="line-height: 1.5;"></i>
	</button>
	</div>
	<div id="tag-opt">
		<span style="display: flex;">
		<input type="text" name="reqTag" class="req-input tag-val" placeholder="태그를 작성하세요" required>
		</span>
	</div>
	
	
	<div style="margin: 65px 0px 0px 0px; padding: 0 400px;">
		<span style="display: flex; justify-content: space-between;">
			<input type="submit" class="submit btn bc1 bs4" value="등록하기" style="width: 150px; height: 50px;">
			<input type="submit" class="submit btn bc1 bs4" value="취소하기" style="width: 150px; height: 50px;">
		</span>
</div>
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

	var tagCount = 1;
	var tagList=[];
	 $(document).on("change", ".tag-val", function(){
	    	var tagStr = $(this).val();
	    	let regExp;
	    	regExp = /^[0-9a-zA-Zㄱ-ㅎㅏ-ㅣ가-힣/\s/g(!><@#%*()-_)]{2,51}$/;

	    	tagList[$(".tag-val").index(this)] = tagStr+"|";
	    	$("[name=reqTag]").val(tagList);
	    	console.log(tagList);
			
	    });
	 $(".addOptBtn").on("click",function(){
	        if(tagCount >= 5) return;
	        var tagDiv = document.createElement("div");
	        tagDiv.setAttribute("class","optBox");
	        tagDiv.innerHTML = '<span style="display: flex; margin-left: 32px !important; margin-right: -32px !important; "><input type="text" name="reqTag2" class="req-input tag-val" placeholder="태그를 입력하세요" required"><button class="delOptBtn optButton"><i class="fa-solid fa-square-minus fc-9"></i></button></span>';
	        $("#tag-opt").append(tagDiv);
	        tagCount++;
	        
	        $(".delOptBtn").off().on("click",function(){
	        	tagList.splice($(".delOptBtn").index(this)+1, 1);
	              $("[name=reqTag]").val(tagList);
	              console.log(tagList);
	              $(this).parent().remove();
	              tagCount--;
	        });
	    });
</script>
</body>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</html>