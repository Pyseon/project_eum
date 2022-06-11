<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
			</ul>
		</div>
	
		<div class="article-wrap" style="margin-top: 0;">
			<div class="tab_cont">
				<div class="write-frm on">
					<h1>이거어때 수정하기</h1>
					<form action="/communityUpdate.do" method="post" onsubmit="checkForm();return false" enctype="multipart/form-data">
					<input type="hidden" name="commNo" value="${comm.commNo }">
					<input type="hidden" name="commCategory" value="1">
					<input type="hidden" name="memberNo" value="${sessionScope.member.memberNo }">
					<input type="hidden" name="commIntro" value="x">
					<!--장점/단점-->
						<div class="write-frm-help">
							<i class="fa-solid fa-circle-question fc-9"></i> <span
								class="title-text fs-medium fc-9">이거어때</span>
							<p>vs 로 사람들의 의견을 구하는 게시판 입니다.</p>
							<p>예를들어 한다 vs 안한다 / 배우면 좋은이유 vs 안배워도 되는이유 등 자유롭게 설정해주세요!</p>
						</div>
						<p class="comm-write-p">제목</p>
						<input type="text" name="commTitle" class="commTitle comm-input"
							placeholder="제목을 입력하세요" value="${comm.commTitle }">
						
						<!-- 대표이미지 -->
						<div class="img-box-wrap" style="margin-top: 20px;">
							<div class="commFileBox preview-image2" style="margin-right: 10px;">
								<p class="comm-write-p" style="margin-bottom: 5px;">대표이미지</p>
								<h4 class="fc-3" style="margin-top: 0;">(세로로 긴 사진이 적합합니다.)</h4>
								<label for="input-file2">파일 선택</label> <input type="file"
									name="file" class="commFile upload-hidden2"
									id="input-file2">
							</div>
							<div class="input-img-box2">
								<div class="upload-display2" style="display:inline-block; border: 1px solid #eee; padding: 10px;">
									<div class="upload-thumb-wrap">
										<img src="./img/community/${comm.commFilepath }" class="upload-thumb" style="height: 160px;">
									</div>
								</div>
							</div>
						</div>

						
						<div class="adv-input">
						<p class="comm-write-p" style="margin-top:5px;"> vs 설정</p>
								<input type="text" name="advantage" class="comm-input" style="width:250px;"
									placeholder="10글자 이내로 작성해주세요" maxlength="10" required value="${comm.advantage }">
						</div>
						<div class="weak-input">
							<div class="vs-text" style="width:250px; text-align:center; font-size:25px;">vs</div>
							<div id="weak-opt">
								<input type="text" name="weakness" class="comm-input" style="width:250px;"
									placeholder="10글자 이내로 작성해주세요" maxlength="10" required value="${comm.weakness }">
							</div>
						</div>


						<!--썸머노트-->
						<p class="comm-write-p">상세 소개</p>
						<div class="pt-1" style="margin-bottom: 50px;">
							<textarea id="summernote2" name="commContent">${comm.commContent }</textarea>
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
             
              //썸머노트 불러오기 함수 
            $("#summernote2").summernote({
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
               
            // 이미지 추가 함수 시작2222222
            var imgTarget = $('.preview-image2 .upload-hidden2');

            imgTarget.on('change', function(){
              var parent = $(this).parent().next();
              parent.children('.upload-display2').remove();

                if(window.FileReader){
                    //image 파일만
                    if (!$(this)[0].files[0].type.match(/image\//)) return;
                    
                    var reader = new FileReader();
                    reader.onload = function(e){
                        var src = e.target.result;
                        parent.append('<div class="upload-display2" style="display:inline-block; border: 1px solid #eee; padding: 10px;"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb" style="height: 160px;"></div></div>');
                    }
                    reader.readAsDataURL($(this)[0].files[0]);
                }

                else {
                    $(this)[0].select();
                    $(this)[0].blur();
                    var imgSrc = document.selection.createRange().text;
                    parent.prepend('<div class="upload-display2" style="border: 1px solid #eee; padding: 10px;"><div class="upload-thumb-wrap"><img class="upload-thumb" style="width: 120px;"></div></div>');

                    var img = $(this).siblings('.upload-display2').find('img');
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