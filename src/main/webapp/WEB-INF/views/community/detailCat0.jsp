<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이음 :: 커뮤니티</title>
<style>
.comment-write {
	background-color: #f9f9fad;
	border: 2px solid #ebecef;
	color: #323232;
	padding: 15px 6px 6px 20px;
	margin-bottom: 25px;
	border-radius: 6px;
	overflow: hidden;
}

.comment-write-head{
	display:flex;
	justify-content: space-between;
}
.comment-num-box{
	color: #757575;
}

#comment-textarea {
	resize: none;
	width: 100%;
	border: none;
	overflow: hidden;
	overflow-wrap: break-word;
	height: 42.5px;
	padding-bottom: 8px;
}

#comment-textarea:focus {
	outline: none;
}

.comment-write-btn {
	float: right;
	background-color: #cdd8fc;
	font-family: fs-m !important;
	color: #1a73e8 !important;
	padding: 4px 12px !important;
}

.autosize {
	min-height: 50px;
}
</style>
</head>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<body>
	<div class="container">
	 <div class="article-wrap">
		<!-- article-header -->
		<div class="article-header">
			<div class="article-list">
				<a href="/communityList.do?category=0&reqPage=1" class="fc-7">요즘 뭐하니 ></a>
				<button class="btn bc6 bs5 fc-1" onclick="location.href='/communityUpdateFrm.do?commNo=${comm.commNo}'">수정</button>
				<button class="btn bc6 bs5 fc-1  modal-open-btn" target="#del-modal">삭제</button>
			</div>
			<div class="article-title">
				<h2 style="font-size: 26px">${comm.commTitle}</h2>
			</div>
			<div class="article-profile"></div>
			<div class="info-box border-down">
				<div class="writer-info">
					<div class="card-user-img-wrap fll">
						<img class="card-user-img" src="./img/member/${comm.memberPicturepath }"
							style="width: 40px; height: 40px;" />
					</div>
					<div class="nick-box">
						<span class="writer-nick"><strong style="font-size: 15px">${comm.memberNick }</strong></span>
						<c:if test="${comm.memberGrade eq 1 }">
						<span class="material-icons verified-icon">verified</span>
						</c:if>
					</div>
					<div class="article-date">
						<span class="date fc-11">${comm.commDate }</span> <span
							class="article-info"><span class="fc-3" style="margin-left: 10px;">조회수 </span> <span class="num fc-3">${comm.readCount }</span>
						</span>
					</div>
				</div>
				<div class="article-info-box">
					<span class="article-info"> <i class="fa-regular fa-heart"></i>
						<i class="fa-solid fa-heart"></i> <span>좋아요</span> <strong
						class="num">${comm.commLike }</strong>
					</span> <span class="article-info"> <i
						class="fa-solid fa-comment fc-6"></i> <span>댓글</span> <strong
						class="num">${comm.cmntCount }</strong>
					</span>
				</div>
			</div>
		</div>
		<!-- article-content -->
		<div class="article-content-wrap">
			<div class="article-intro">
				<i class="fa-solid fa-circle-question"></i> <span
					class="title-text fs-medium fc-10">요즘 뭐하니?</span>
				<p>${comm.commIntro }</p>
			</div>
			<div class="attr-wrap">
				<!-- ADVANTAGE -->
				<div class="attr-box">
					<div class="attr-title bg-7">
						<i class="fa-solid fa-thumbs-up fc-5 attr-thumbs-up"></i> 
						<span class="fc-5">이런분들에게 추천해요!</span>
					</div>
					<c:forTokens var="adv" items="${comm.advantage}" delims="|" varStatus="i" >
						<div class="attribute adv">
							<i class="fa-regular fa-face-laugh-squint adv-icon"></i>
							<span>${adv }</span>
						</div>
					</c:forTokens>
				</div>

				<!-- WEAKNESS -->
				<div class="attr-box">
					<div class="attr-title bg-9">
						<i class="fa-solid fa-thumbs-down fc-5 attr-thumbs-down"></i> <span
							class="fc-5">이런 분들에게 비추해요!</span>
					</div>
				<c:forTokens var="weak" items="${comm.weakness}" delims="|" varStatus="i" >
					<div class="attribute weak">
						<i class="fa-regular fa-face-sad-tear weak-icon"></i>
						<span>${weak }</span>
					</div>
				</c:forTokens>
				</div>
			</div>

			<div class="article-cotent">${comm.commContent }</div>
			<div class="report-wrap">
				<i class="material-symbols-outlined">e911_emergency</i> <span>신고하기</span>
			</div>
		</div>
		</div>
		<!--article-content-wrap end-->

		<!-- comment start -->
		<div class="article-bottom info-box">
			<div class="comments-info">
				<i class="fa-solid fa-comment fc-6"></i> <span>댓글</span> <strong
					class="num">${comm.cmntCount }</strong>
			</div>
		</div>
		<div class="comments-area">
		  <div class="comment-list-wrap">
		<c:forEach items="${cmntList }" var="cmnt">
			<c:choose>
				<c:when test="${cmnt.cmntLev eq 0 }">
			<!--comment-->
					<div class="comment-list">
						<div class="single-comment justify-content-between d-flex">
							<div class="user justify-content-between d-flex">
								<div class="thumb">
									<img src="./img/member/${cmnt.memberPicturepath }" alt="" class="card-user-img" />
								</div>
								<div class="desc">
									<span class="writer-nick">
										<strong style="font-size: 15px">${cmnt.memberNick }</strong>
									</span>
									
									<c:if test="${cmnt.memberGrade eq 1 }">
										<span class="material-icons verified-icon">verified</span>
									</c:if>
									
									<c:if test="${cmnt.memberNo eq comm.memberNo }">
										<span class="reply-writer">작성자</span>
									</c:if>
									
									<p class="comment">${cmnt.cmntContent }</p>
									<p class="date fs-light">${cmnt.cmntDate }</p>
								</div>
							</div>
							<div class="reply-btn">
								<a href="" class="btn-reply">답글쓰기</a>
							</div>
						</div>
					</div>
			<!--comment end-->
				</c:when>
				<c:when test="${cmnt.cmntLev ne 0 }">
				<!--Re-comment-->
					<div class="comment-list left-padding">
						<div class="single-comment justify-content-between d-flex">
							<div class="user justify-content-between d-flex">
								<div class="thumb">
									<img src="./img/member/${cmnt.memberPicturepath }" alt="" class="card-user-img" />
								</div>
								<div class="desc">
									<span class="writer-nick">
									 <strong style="font-size: 15px">${cmnt.memberNick }</strong>
									 
									 <c:if test="${cmnt.memberGrade eq 1 }">
									<span class="material-icons verified-icon">verified</span>
									</c:if>
									
									<c:if test="${cmnt.memberNo eq comm.memberNo }">
									<span class="reply-writer">작성자</span>
									</c:if>
									
									</span>
									
									<c:if test="${cmnt.cmntLev eq 1 }">
									<p class="comment">${cmnt.cmntContent }</p>
									</c:if>
									
									<c:if test="${cmnt.cmntLev eq 2 }">
									<p class="comment"><span class="ref-nick">@${cmnt.cmntRefNick } </span>${cmnt.cmntContent }</p>
									</c:if>
									
									<p class="date fs-light">${cmnt.cmntDate }</p>
								</div>
							</div>
							<div class="reply-btn">
								<a href="" class="btn-reply text-uppercase">답글쓰기</a>
							</div>
						</div>
					</div>
			<!--Re-comment end-->
				</c:when>
			</c:choose>
		</c:forEach>
		</div>
		<div class="comment-write">
			<!-- 댓글 참고 data -->
			 	<input type="hidden" id="writerNo" value="${comm.memberNo}">
			<!-- 전송 데이터 -->
				<input type="hidden" name="commNo" id="commNo" value="${comm.commNo}">
				<input type="hidden" name="memberNo" id="memberNo" value="14">
				<input type="hidden" name="cmntContent" id="cmntContent">
				<input type="hidden" name="cmntLev" id="cmntLev" value="0">
			<!--            -->
				<div class="comment-write-head">
				<span style="font-family: fs-m; margin:0 0 8px 0; padding-left:2px;">댓글 쓰기</span>
				<span class="comment-num-box"><span id="comment-num">0</span>/250</span>
			</div>
			<textarea id="comment-textarea" placeholder="댓글 입력" onkeyup="resize(this)" onkeydown="resize(this)" maxlength="250"></textarea>
			<button type="button" id="comment-reg" class="comment-write-btn btn fc-7">등록</button>
		</div>

		</div>
		<!--comment-area-->
		<!-- comment end -->
		
	</div>
	<!--container end-->
	
	<!-- modal start -->
	<div id="del-modal" class="modal-bg">
	<div class="modal-wrap" style="margin-top: 300px;">
		<div class="modal-head" style="border-bottom: none;">
			<h2>정말로 삭제 하시겠습니까?</h2>
			<h4 style="color: #a7a7a7">삭제 후에는 복구 할 수 없습니다.</h4>
		</div>
			<div class="modal-btns-container">
				<button class="btn bg-9 fc-5" id="modal-btns-item" style="margin-right: 5px;" onclick="location.href='/communityDelete.do?category=${comm.commCategory }&commNo=${comm.commNo}'">삭제하기</button>
				<button class="btn bg-4 fc-5 modal-close" id="modal-btns-item"  style="margin-left: 5px;">취소하기</button>
			</div>
		</div>
	</div>
	<!-- modal end -->

	<script>

$(function(){
	
	$("#comment-reg").on("click",function(){
		//글자수세기 함수 동작
		convertbr();
		//ajax 동작
		let commNo = $("#commNo").val();
		let memberNo = $("#memberNo").val();
		let cmntContent = $("#cmntContent").val();
		let cmntLev = $("#cmntLev").val();
		let writerNo = $("#writerNo").val();
		let cmntHtml = "";
		$.ajax({
			url: "/commCoWrite.do",
			data: {commNo:commNo, memberNo:memberNo, cmntContent:cmntContent, cmntLev:cmntLev},
			success:function(data){
				cmntHtml += '<div class="comment-list"><div class="single-comment justify-content-between d-flex"><div class="user justify-content-between d-flex"><div class="thumb">';
				cmntHtml += '<img src="./img/member/'+data.memberPicturepath+'" alt="" class="card-user-img" /></div><div class="desc"><span class="writer-nick">';
				cmntHtml += '<strong style="font-size: 15px">'+data.memberNick+'</strong>';
				if(data.memberGrade == 1){
					cmntHtml += '<span class="material-icons verified-icon">verified</span>';
				}
				if(data.memberNo == writerNo){
					cmntHtml += '<span class="reply-writer">작성자</span>';
				}
				cmntHtml += '<p class="comment">'+data.cmntContent+'</p>';
				cmntHtml += '<p class="date fs-light">'+data.cmntDate+'</p>';
				cmntHtml += '</div>';
				cmntHtml += '<div class="reply-btn"><a href="" class="btn-reply">답글쓰기</a></div></div>';
				cmntHtml += '</div>';
				$(".comment-list-wrap").append(cmntHtml);
				$(".comment-list-wrap").load(location.href + " .comment-list-wrap");
				
			}
		})
			
	});
	
	
	
	
	
	
	
	//글자수세기 함수
	$("#comment-textarea").on("keydown",function(){
		 var comment = $("#comment-textarea").val();
		 console.log(comment.length);
		$("#comment-num").text(comment.length);
	});
	
	
	
});
	
	
	
	

		
function resize(obj) {
    obj.style.height = '1px';
    obj.style.height = (12 + obj.scrollHeight) + 'px';
    
    //5줄 이상 입력하면 알림창 띄우도록
    var str = $("#comment-textarea").val();
    var str_arr = str.split("\n");  // 줄바꿈 기준으로 나눔 
    var row = str_arr.length;  // row = 줄 수 
    if(row >10){
   		 //마지막 입력문자 삭제
   		var title = "10줄 이상 작성할 수 없습니다.";
    	var icon = "error";
    	toastShow(title,icon);
	    var lastChar = str.slice(0,-1); //열 
	    $("#comment-textarea").val(lastChar)
    }
    
}

//textarea 엔터시 <br>로 바꿔주는 함수

function convertbr(){
   var str = document.getElementById("comment-textarea").value;
   var str = str.replace(/\r\n|\n/g,'<br>');
   document.getElementById('cmntContent').value = str;
   
  	
}




//토스트 알림 함수		
function toastShow(title, icon){
	const Toast = Swal.mixin({
	    toast: true,
	    position: 'center-center',
	    showConfirmButton: true,
	    timer: 3500,
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



	
</script>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>


</html>