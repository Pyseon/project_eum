<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/reviewFrm.css" />
<!-- 구글 아이콘 -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
</head>
<body>
	<div class="header-div"><%@ include file="/WEB-INF/views/common/header.jsp"%></div>
	<div class="container">
		<div class="row">
			<div class="main-title">>후기작성</div>
			<div class="product-title">${pro.productTitle }</div>
			<div class="picture">
				<a href="#"><img class="testimg" src="/img/member/${em.memberPicturePath }"></a>
			</div>
			<div class="expert-profile-wrap">
				<div class="expert-profile">
					<h3 class="expert-info">
						<c:choose>
							<c:when test="${empty ec.compName}">
								${expert.expertName }
							</c:when>
							<c:otherwise>
								${ec.compName}
							</c:otherwise>
						</c:choose>
					</h3>					
				</div>	
				<div class="expert-profile">
					<span class="material-icons icon-confirm confirm2">verified</span>
				</div>	
			</div><!-- expert-profile -->
			<div class="info-wrap">
				<h5 class="extpert-info info2"><span>${expert.jobName }</span></h5>			
				<h5 class="extpert-info info2"><span>${expert.expertIntro }</span></h5>
			</div><!-- info-wrap -->
			<div class="star">
				<span class="material-icons fc-10 icon-star">star</span>
				<span class="material-icons fc-10 icon-star">star</span>
				<span class="material-icons fc-10 icon-star">star</span>
				<span class="material-icons fc-10 icon-star">star</span>
				<span class="material-icons fc-10 icon-star">star</span>
				<div class="score">
					<span id="star-result">0</span>
	                <span id="star-result2">0</span>
				</div>
			</div>
			<div class="review content">
				<div class="content-wrap">
					<input type="hidden" class="payNo" value="${pay.payNo }">
					<input type="hidden" class="memberNo" value="${m.memberNo }">
					<input type="hidden" class="productNo" value="${pro.productNo }">
					<div class="textarea-wrap">
						<input type="text" class="review-title" name="review-title" placeholder="제목을 입력해주세요.(60자 제한)">
						<textarea class="textarea" name="textarea" maxlength="300" placeholder="후기를 입력해주세요.(300자 제한)"></textarea>
					</div>
					<div class="submit-btn-wrap">
						<button class="bc1 submit-btn" id="submit-btn" onclick="insert()">제출</button>
					</div>	
				</div>
			</div>
		</div>
	</div>	
	<div class="footer-div"><%@ include file="/WEB-INF/views/common/footer.jsp"%></div>
<script>


function insert(){
	const payNo = $('.payNo').val();
	const memberNo = $('.memberNo').val();
	const productNo = $('.productNo').val();
	const title = $('.review-title');
	const text = $('.textarea');
	const score = $('#star-result2');
	$.ajax({
		url : "insertReview.do",
		data : {
			   payNo:payNo,
			   memberNo:memberNo,
			   productNo:productNo,
			   reviewTitle:title,
			   reviewContent:text,
			   reviewStar:score
			   },
		success : function(data) {
			console.log(11111);
		},
		error : function() {
			console.log(2222);
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