<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이음 :: 글쓰기</title>
<style>

</style>
</head>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<body>
	<div class="container">
		<div class="comm-write-tab-nav" style="margin-top: 40px;">
			<ul class="tab_title" style="padding-left: 0;">
				<li class="on">요즘뭐하니?</li>
				<li>이거어때?!</li>
			</ul>
		</div>
	
		<div class="article-wrap" style="margin-top: 0;">
			<div class="tab_cont">
				<div class="write-frm on">
					<h1>요즘뭐하니 글쓰기</h1>
					<form action="/communityWrite.do" method="post" onsubmit="checkForm();return false" enctype="multipart/form-data">
					<input type="hidden" name="commCategory" value="0">
					<input type="hidden" name="memberNo" value="${sessionScope.member.memberNo }">
					<input type="hidden" name="advantage">
					<input type="hidden" name="weakness">
						<p class="comm-write-p">제목</p>
						<input type="text" name="commTitle" class="commTitle comm-input"
							placeholder="제목을 입력하세요">
						<p class="comm-write-p">간단한 소개</p>
						<input type="text" name="commIntro" class="commIntro comm-input"
							placeholder="간단한 소개">
						<!-- 대표이미지 -->
						<div class="img-box-wrap">
							<div class="commFileBox preview-image">
								<p class="comm-write-p" style="margin-bottom: 5px;">대표이미지</p>
								<h4 class="fc-3" style="margin-top: 0;">(세로로 긴 사진이 적합합니다.)</h4>
								<label for="input-file">파일 선택</label> <input type="file"
									name="file" class="commFile upload-hidden"
									id="input-file">
							</div>
							<div class="input-img-box"></div>
						</div>

						<!--장점/단점-->
						<div class="write-frm-help">
							<i class="fa-solid fa-circle-question fc-9"></i> <span
								class="title-text fs-medium fc-9">추천과 비추천</span>
							<p>추천하는 이유: 내가 소개하는것과 어울리는 사람, 좋은점 등을 적어주세요.</p>
							<p>비추천하는 이유: 내가 소개하는것과 어울리지 않는 사람, 단점 등을 적어주세요.</p>
						</div>
						<div class="adv-input">
							<span class="comm-write-p"> 추천하는 이유
								<button type="button" class="addOptBtn optButton">
									<i class="fa-solid fa-square-plus"></i>
								</button>
							</span>
							<h4 class="fc-3" style="margin-top: 10px;">(최대 5개까지 추가 가능)</h4>
							<div id="adv-opt">
								<input type="text" name="advantage2" class="comm-input adv-val"
									placeholder="내용을 입력하세요." maxlength="51" required>
							</div>
						</div>
						<div class="weak-input" style="margin-top: 50px;">
							<span class="comm-write-p"> 추천하지 않는 이유
								<button type="button" class="addOptBtn2 optButton">
									<i class="fa-solid fa-square-plus"></i>
								</button>
							</span>
							<h4 class="fc-3" style="margin-top: 10px;"><span>(최대 5개까지 추가 가능)</span><span></span></h4>
							<div id="weak-opt">
								<input type="text" name="weakness2" class="comm-input weak-val"
									placeholder="내용을 입력하세요." maxlength="51" required>
							</div>
						</div>


						<!--썸머노트-->
						<p class="comm-write-p">상세 소개</p>
						<div class="pt-1" style="margin-bottom: 50px;">
							<textarea id="summernote" name="commContent"></textarea>
						</div>
						<input type="submit" class="btn bc1 bs4" style="margin: 30px 0; height:50px; font-size: 16px;"
							value="등록하기"></input>
					</form>
				</div>
			</div>
			<!--tab_cont end-->
		</div>
		<!--article-wrap end-->
	</div>
	<!--container end-->


<!-- script -->
<script>
        $(document).ready(function() {
            $(".tab_title li").click(function() {
                var idx = $(this).index();
                $(".tab_title li").removeClass("on");
                $(".tab_title li").eq(idx).addClass("on");
                $(".tab_cont > div").hide();
                $(".tab_cont > div").eq(idx).show();
            })
             
            var advList = [];
            //장점 가져오기
            $(document).on("change", ".adv-val", function(){
            	var advStr = $(this).val();
            	let regExp;
    			regExp = /^[0-9a-zA-Zㄱ-ㅎㅏ-ㅣ가-힣/\s/g(!><@#%*()-_)]{2,51}$/;
    			if(!regExp.test(advStr) || advStr.length > $(this).attr('maxlength')){
    				const title = "2-50자 이내로 입력해주세요. 허용특수문자(!><@#%*()-_)";
    				const icon = "warning";
    				toastShow(title,icon);
    			}else{
	            	advList[$(".adv-val").index(this)] = advStr+"|";     
	            	$("[name=advantage]").val(advList);
	            	console.log(advList);
    			}
           
            });
            
            var weakList = [];
            //단점 가져오기
            $(document).on("change", ".weak-val", function(){
            	var weakStr = $(this).val();
            	let regExp;
    			regExp = /^[0-9a-zA-Zㄱ-ㅎ|ㅏ-ㅣ|가-힣|/\s/g(!><@#%*()-_)]{2,51}$/;
    			if(!regExp.test(weakStr) || weakStr.length > $(this).attr('maxlength')){
    				const title = "2-50자 이내로 입력해주세요. 허용특수문자(!><@#%*()-_)";
    				const icon = "warning";
    				toastShow(title,icon);
    			}else{
	            	weakList[$(".weak-val").index(this)] = weakStr+"|";
	            	$("[name=weakness]").val(weakList);
	            	console.log(weakList);
    			}
           
            });
            
            
            //옵션 추가 버튼함수 시작
            var advCount = 1;
            var weakCount = 1;
       
        $(".addOptBtn").on("click",function(){
            if(advCount >= 5) return;
            var advDiv = document.createElement("div");
            advDiv.setAttribute("class","optBox");
            advDiv.innerHTML = '<input type="text" name="advantage2" class="comm-input adv-val" placeholder="내용을 입력하세요." required><button class="delOptBtn optButton"><i class="fa-solid fa-square-minus fc-9"></i></button>';
            $("#adv-opt").append(advDiv);
            advCount++;
            $(".delOptBtn").off().on("click",function(){
                  advList.splice($(".delOptBtn").index(this)+1, 1);
                  $("[name=advantage]").val(advList);
                  console.log(advList);
                  $(this).parent().remove();
                  advCount--;
            });
        });

        $(".addOptBtn2").on("click",function(){
            if(weakCount >= 5) return;
            var newDiv = document.createElement("div");
            newDiv.setAttribute("class","optBox");
            newDiv.innerHTML = '<input type="text" name="weakness2" class="comm-input weak-val" placeholder="내용을 입력하세요."><button class="delOptBtn2 optButton"><i class="fa-solid fa-square-minus fc-9"></i></button>';
            $("#weak-opt").append(newDiv);
            weakCount++;
            $(".delOptBtn2").off().on("click",function(){
            	weakList.splice($(".delOptBtn2").index(this)+1, 1);
                $("[name=weakness]").val(weakList);
                console.log(weakList);
                  $(this).parent().remove();
                  weakCount--;
            });
        });
        
            
            
            //썸머노트 불러오기 함수 
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
          
         
    		//토스트 알림 함수		
    		function toastShow(title, icon){
    			const Toast = Swal.mixin({
        		    toast: true,
        		    position: 'center-center',
        		    showConfirmButton: true,
        		    timer: 5500,
        		    timerProgressBar: true,
        		    didOpen: (toast) => {
        		     // toast.addEventListener('mouseenter', Swal.stopTimer)
        		      toast.addEventListener('mouseleave', Swal.resumeTimer)
        		    }
        		 	})
    		
    		  Toast.fire({
    		    title: title,
    		    icon: icon
    		  })
    		
    		}//토스트 알림 함수 끝		

        });
  </script>
  </body>
  <%@ include file="/WEB-INF/views/common/footer.jsp"%>
</html>