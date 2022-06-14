<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이음 :: 전문가상담</title>
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
		.input{
		margin-top: 20px;
		}
	.exp{
	width: 110px;
	height: 50px;
	background: #3865f2 !important;
	color: #fff !important;
    border: 1px solid #3865f2;
    padding: 6px 10px;
    border-radius: 4px;
}
	.cla{
	width: 110px;
	height: 50px;
	background-color: #ffffff;
    border: 1px solid #a7a7a7;
    padding: 6px 10px;
    border-radius: 4px;
	}
	.cla:hover{
	background: #3865f2 !important;
	color: #fff !important;
	border: 1px solid #3865f2;
	transition-duration: 0.5s;	
	}
	.idm{
	width: 110px;
	height: 50px;
	background-color: #ffffff;
    border: 1px solid #a7a7a7;
    padding: 6px 10px;
    border-radius: 4px;
	}
	.idm:hover{
	background: #3865f2 !important;
	color: #fff !important;
	border: 1px solid #3865f2;
	transition-duration: 0.5s;
	}
	.product-tab{
	margin-top: 3px !important;
	margin-bottom:-15px !important;
	 border-spacing: 30px;
  	border-collapse: separate;
 	margin-right: auto;
 	margin-left: auto;
	}
	.container > .div{
	margin-bottom: 10px !important;
	}
	.submit{
	display: inline-block;
    padding: 6px 12px;
    margin-bottom: 0;
    font-size: 14px;
    font-weight: normal;
    line-height: 1.428571429;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    cursor: pointer;
    background-image: none;
    border-radius: 4px;
	}
	.pro-input{
	width: 80%;
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
		<form action="/expertWrite.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="expertNo" value="${expertNo }">
		<input type="hidden" name="productQst">
		<input type="hidden" name="productAns">
		<input type="hidden" name="productTag">
		<div style="margin-top: -30px !important;">
			<table class = "product-tab">
				<tr>
					<td><button type="button" class="exp">1:1전문가상담</button></td>
					<td><button type="button" class="cla" onclick="location.href='/classWriterFrm.do'">클래스</button></td>
					<td><button type="button" class="idm" onclick="location.href='/ideamarketWriterFrm.do'">지식마켓</button></td>
				</tr>
			</table>	
		</div>
		<h3>카테고리 선택</h3>
		<select id="category" name="productCategory" style="margin-bottom: 10px !important;" required>
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
		
		<div class="title" style="margin-bottom: 20px">
			<div><h3>상담명</h3></div>
			<input class="input-form" type="text" name="productTitle" placeholder="상담명을 입력해주세요." 
			pattern=".{2,50}" required title="2~50글자 이내로 입력하세요" maxlength="50" required>>
		</div>
		<div class="intro" style="margin-bottom: 20px">
			<div><h3>상담 간단한 소개</h3></div>
			<input class="input-form" type="text" name="productIntro" placeholder="상담에 간단한 소개를 해주세요" 
			pattern=".{2,60}" required title="2~60글자 이내로 입력하세요" maxlength="60" required>
		</div>
		<div class="content" style="margin-bottom: 20px">
			<div><h3>상담 상세 설명</h3></div>
			<textarea id="summernote" name="productContent" class="input-form" onkeydown="checkNull();" onkeyup="checkNull();"></textarea>
		</div>
		
		<div style="margin-bottom: 20px">
			<div>
			<span>
			<h3>자주묻는 질문 (최소 하나씩은 작성해 주세요)
			<button type="button" class="addOptBtn optButton" style="line-height: 2;">
					<i class="fa-solid fa-square-plus"></i>
			</button>
			</h3>
			</span>
			</div>
			
			<div id="qna">
			<div id="qst-opt">
				<span style="display: flex;"> 
				<span style="line-height: 2.5;">질문 &nbsp;</span>
				<input type="text" name="productQst2" class="pro-input qst-val" placeholder="질문을 입력하세요" maxlength="1000" pattern=".{2,50}" required title="2~50글자 이내로 입력하세요" maxlength="50" required>
				
				</span>

			</div>
			<div id="ans-opt">
				<span style="line-height: 2.5;">답변 &nbsp;</span>
        
				<input type="text" name="productAns2" class="pro-input ans-val" placeholder="답변을 입력하세요" maxlength="1000" pattern=".{2,50}" required title="2~50글자 이내로 입력하세요" maxlength="50" required>
				</span>

			</div>
		</div>	
			
		</div>
			<div style="margin-bottom: 20px">
			<div><h3>상담예정지역</h3></div>
			<input class="input-form" type="text" name="productAddr" placeholder="주소를 입력해주세요" pattern=".{2,50}" required title="2~50글자 이내로 입력하세요" maxlength="50" required>
		</div>
		
		
		
		<div style="margin-bottom: 20px">
			<div><h3>시간설정</h3></div>
			<span style="display: flex;">
			<input class="input-form" type="text" name="productOption" style="width: 5%;" oninput="this.value = this.value.replace(/[^0-9.\-]/g, '').replace(/(\..*)\./g, '$1');" required>
			<span style="line-height: 2.5;">&nbsp; 분 (분단위로 입력해 주세요)</span>
			</span>
		</div>
		
		
		
		
		<div style="margin-bottom: 20px">
			<div><h3>가격설정</h3></div>
			<span style="display: flex;">
			<input class="input-form" type="text" name="cost" placeholder="가격을 정해주세요(단위 ' , '생략)" style="width: 30%;" oninput="this.value = this.value.replace(/[^0-9.\-]/g, '').replace(/(\..*)\./g, '$1');" required>
			<span style="line-height: 2.5;">&nbsp; 원</span>
			</span>
		</div>
				<div style="margin-bottom: 20px">
			<div><h3>할인률</h3></div>
			<span style="display: flex;">
			<input class="input-form" type="text" name="sale" style="width: 5%;" oninput="this.value = this.value.replace(/[^0-9.\-]/g, '').replace(/(\..*)\./g, '$1');" required>
			<span style="line-height: 2.5;">&nbsp; %(미작성시 자동으로 0%가 됩니다)</span>
			</span>
		</div>
		
		
		<div style="margin-bottom: 20px">
		<div>
		<span>
			<h3>태그
			<button type="button" class="addOptBtn2 optButton" style="line-height: 2;">
					<i class="fa-solid fa-square-plus"></i>
			</button>
			</h3>
			</span>
			</div>
			<div id="tag-opt">
			<span style="display: flex;"> 
			<input type="text" name="productTag2" class="pro-input tag-val" placeholder="태그를 입력하세요" style="width: 19.5%; height: 33px"pattern=".{2,20}" required title="2~20글자 이내로 입력하세요" maxlength="20" required>
			</span>
			</div>
		</div>
		<div>
		<input type="submit" id="submit-btn" class="btn bc1 bs4" value="등록하기">
		<input type="button" id="test-btn" value="테스트">
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
	
	$('#submit-btn').on("submit", function(event) {
		if($('#summernote').summernote('isEmpty')) {
			console.log('contents is empty, fill it!');
			event.preventDefault();
		}	
	});	  
	
	$('#test-btn').on("click", function(event) {
		if($('#summernote').summernote('isEmpty')) {
			console.log('contents is empty, fill it!');
			event.preventDefault();
		}else {
			console.log('잘 되는 중');	
		}
	});	 
	
	
	$("#summernote").on("change", function(){
		if($('#summernote').summernote('isEmpty')) {
			console.log('contents is empty, fill it!');
			event.preventDefault();
		}else {
			console.log('잘 되는 중');	
		}
	});
	
	
	function checkNull(){
		if(("#summernote").val() == ""){
			console.log("빈칸");
		}else{
			console.log("있음");
		}
	}
	
	
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
    
    function inputNumberFormat(obj) {
        obj.value = comma(uncomma(obj.value));
    }

    function comma(str) {
        str = String(str);
        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
    }

    function uncomma(str) {
        str = String(str);
        return str.replace(/[^\d]+/g, '');
    }
    
    
    var qstList=[];
    $(document).on("change", ".qst-val", function(){
    	var qstStr = $(this).val();
    	let regExp;
    	regExp = /^[0-9a-zA-Zㄱ-ㅎㅏ-ㅣ가-힣/\s/g(!><@#%*()-_)]{2,51}$/;	
    	qstList[$(".qst-val").index(this)] = qstStr+"|";
    	$("[name=productQst]").val(qstList);
    	console.log(qstList);
		
    });
    
    var ansList=[];
    $(document).on("change", ".ans-val", function(){
    	var ansStr = $(this).val();
    	let regExp;
    	regExp = /^[0-9a-zA-Zㄱ-ㅎㅏ-ㅣ가-힣/\s/g(!><@#%*()-_)]{2,51}$/;

    	ansList[$(".ans-val").index(this)] = ansStr+"|";
    	$("[name=productAns]").val(ansList);
    	console.log(ansList);
		
    });
    
    
    var qstCount = 1;
    var ansCount = 1;
    
    $(".addOptBtn").on("click",function(){
        if(qstCount >= 5) return;
        
        var qstDiv = document.createElement("div");
        qstDiv.setAttribute("class","optBox");
        qstDiv.innerHTML += '<span style="line-height: 2.5;">질문 &nbsp;</span>';
        qstDiv.innerHTML +='<input type="text" name="productQst2" class="pro-input qst-val" placeholder="질문을 입력하세요" maxlength="30" pattern=".{2,20}" required title="2~20글자 이내로 입력하세요" maxlength="20" required>';
        qstDiv.innerHTML +='<button class="delOptBtn optButton"><i class="fa-solid fa-square-minus fc-9"></i></button></span><br>';
        
        qstDiv.innerHTML += '<span style="line-height: 2.5;">답변 &nbsp;</span>';
        qstDiv.innerHTML += '<input type="text" name="productAns2" class="pro-input ans-val" placeholder="답변을 입력하세요" maxlength="30" pattern=".{2,20}" required title="2~20글자 이내로 입력하세요" maxlength="20" required>';
        
        $("#qna").append(qstDiv);
        qstCount++;
        
        $(".delOptBtn").off().on("click",function(){
        	qstList.splice($(".delOptBtn").index(this)+1, 1);
              $("[name=productQst]").val(qstList);
              console.log(qstList);
              
              ansList.splice($(".delOptBtn").index(this)+1, 1);
              $("[name=productAns]").val(ansList);
              console.log(ansList);
              qstCount--;
              ansCount--;
              $(this).parent().remove();
        });
    });
    
//태그함수    
    var tagCount = 1;
    var tagList=[];
    $(document).on("change", ".tag-val", function(){
    	var tagStr = $(this).val();
    	let regExp;
    	regExp = /^[0-9a-zA-Zㄱ-ㅎㅏ-ㅣ가-힣/\s/g(!><@#%*()-_)]{2,51}$/;

    	tagList[$(".tag-val").index(this)] = tagStr+"|";
    	$("[name=productTag]").val(tagList);
    	console.log(tagList);
		
    });
    $(".addOptBtn2").on("click",function(){
        if(tagCount >= 20) return;
        var tagDiv = document.createElement("div");
        tagDiv.setAttribute("class","optBox");
        tagDiv.innerHTML = '<span style="display: flex; margin-left: 0px !important; margin-right: -32px !important; "><input type="text" name="productTag2" id="tag22" class="pro-input tag-val" placeholder="태그를 입력하세요" style="width: 19.5%;  onkeydown="checkSpacebar();" onkeyup="checkSpacebar();" pattern=".{2,20}" required title="2~20글자 이내로 입력하세요" maxlength="20" required"><button class="delOptBtn2 optButton"><i class="fa-solid fa-square-minus fc-9"></i></button></span>';
        $("#tag-opt").append(tagDiv);
        tagCount++;
        
        $(".delOptBtn2").off().on("click",function(){
        	tagList.splice($(".delOptBtn2").index(this)+1, 1);
              $("[name=productTag]").val(tagList);
              console.log(tagList);
              $(this).parent().remove();
              tagCount--;
        });
    });
    
    //스페이스바 금지 함수
    function checkSpacebar(){
    	  var kcode = event.keyCode;
    	  if(kcode == 32) event.returnValue = false;
    	}
    
    
    // 특수문자 정규식 변수(공백 미포함)
   var replaceChar = /[\s~!@\#$%^&*\()\-=+_'\;<>0-9\/.\`:\"\\,\[\]?|{}]/gi;
 
    // 완성형 아닌 한글 정규식
        
        $(document).on("keyup",".tag-val", function() {
        	
            var x = $(this).val();
            
            if (x.length > 0) {
                if (x.match(replaceChar)) {
                    x = x.replace(replaceChar, "");
                    tagList[$(".tag-val").index(this)] = "";
                }
                $(this).val(x);
            }
            }).on("keyup", function() {
                $(this).val($(this).val().replace(replaceChar, ""));
                tagList[$(".tag-val").index(this)] = "";

       });

    
    
    
	</script>
	

</body>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</html>