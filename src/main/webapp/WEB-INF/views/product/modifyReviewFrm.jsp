<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/reviewFrm.css" />
<!-- 구글 아이콘 -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
</head>
<body>
	<div class="header-div"><%@ include file="/WEB-INF/views/common/header.jsp"%></div>
	<div class="container">
		<div class="row">
			<div class="main-title">>후기작성</div>
			<div class="product-title">${p.productTitle }</div>
			<div class="picture">
				<a href="#"><img class="testimg" src="/img/member/${e.memberPicturePath }"></a>
			</div>
			<div class="expert-profile-wrap">
				<div class="expert-profile">
					<h3 class="expert-info">${e.expertName }</h3>					
				</div>	
				<div class="expert-profile">
					<span class="material-icons icon-confirm confirm2">verified</span>
				</div>	
			</div><!-- expert-profile -->
			<div class="star">
				<span class="material-icons fc-10 icon-star">star</span>
				<span class="material-icons fc-10 icon-star">star</span>
				<span class="material-icons fc-10 icon-star">star</span>
				<span class="material-icons fc-10 icon-star">star</span>
				<span class="material-icons fc-10 icon-star">star</span>
				<div class="score">
					<span id="star-result">0</span>
	                <span id="star-result2">${r.reviewStar}</span>
				</div>
			</div>
			<div class="review content">
				<div class="content-wrap">
					<div class="textarea-wrap">
						<input type="hidden" name="reviewNo" class="reviewNo" value="${r.reviewNo }">
						<input type="text" class="review-title" name="review-title" placeholder="제목을 입력해주세요.(60자 제한)" value="${r.reviewTitle }">
						<textarea class="textarea" name="textarea" maxlength="300" placeholder="후기를 입력해주세요.(300자 제한)">${r.reviewContent }</textarea>
					</div>
					<div class="textCount-wrap">	
						<span class="textCount">0</span> <span class="textTotal">/300</span>
					</div>
					<div class="submit-btn-wrap">
						<button class="bc1 submit-btn" id="submit-btn" onclick="update()">제출</button>
					</div>	
				</div>
			</div>
		</div>
	</div>	
	<div class="footer-div"><%@ include file="/WEB-INF/views/common/footer.jsp"%></div>
<script>

	
	


	function update(){
		
		if($('#star-result2').text() == 0){
	        alert("별점을 선택해주세요.");
	        return false;
	    }
		if($('.review-title').val() == ""){
	        alert("제목을 입력해주세요.");
	        $('.review-title').focus();
	        return false;
	    }
		if($('.textarea').val() == ""){
	        alert("내용을 입력해주세요.");
	        $('.textarea').focus();
	        return false;
	    }
		
		var reviewNo = $('.reviewNo').val();
		var title = $('.review-title').val();
		var text = $('.textarea').val();
		var score = $('#star-result2').text();
		
		
		$.ajax({
			url : "/updateReview.do",
			data : {
				   reviewNo:reviewNo,
				   reviewTitle:title,
				   reviewContent:text,
				   reviewStar:score
				   },
			success : function(data) {
				alert('후기가 정상적으로 수정되었습니다.')
				location.href='/Myreview.do?memberNo=${r.memberNo}';
			},
			error : function() {
				alert('잘못된 접근입니다.')
			}
		});
	}
	
	$(function(){
		
		const stars = $('.star>span');
		const result = $("#star-result");
		result.hide();
		
		stars.on("mouseover",function(){
	        stars.css("color","lightgray") 
	        const index = stars.index(this);
	        for(let i = 0; i <= index; i++){
	            stars.eq(i).css("color","#ff990d");
	        }
	        const result2 = $("#star-result2");
	        result2.hide();
	        result.show();
	        $("#star-result").text(index+1);
	    });
		
		stars.on("click",function(){
		    const index = stars.index(this);
		    $("#star-result2").text(index+1); //클릭을 하건 안하건 
		});
		
		stars.on("mouseleave",function(){
	        const result = $("#star-result");
	        result.hide();
	        const result2 = $("#star-result2");
	        result2.show();
	        const score = Number(result2.text());
	        stars.css("color","lightgray");
	        for(let i = 0; i < score; i++){
	            stars.eq(i).css("color","#ff990d");
	        }
	    });
		
		$('.textarea').keyup(function() {
			let content = $(this).val();
			
			// 글자수 세기
		    if (content.length == 0 || content == '') {
		    	$('.textCount').text('0');
		    } else {
		    	$('.textCount').text(content.length);
		    }
			
			// 글자수 제한
		    if(content.length > 200) {
		    	// 200자 부터는 타이핑 되지 않도록
		        $(this).val($(this).val().substring(0, 300));
		        // 200자 넘으면 알림창 뜨도록
		        alert('300자 까지 입력 가능합니다.');
		    };
		});
		
		$('.review-title').keyup(function() {
			let content = $(this).val();
			// 글자수 제한
		    if(content.length > 60) {
		    	// 200자 부터는 타이핑 되지 않도록
		        $(this).val($(this).val().substring(0, 60));
		        // 200자 넘으면 알림창 뜨도록
		        alert('60자 까지 입력 가능합니다.');
		    };
		});
		
	});
</script>
</body>
</html>