<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이음 :: 커뮤니티</title>
<link rel="stylesheet" href="css/report.css" />
<script src="js/report.js"></script>
<style>
.attr-wrap{
 width: 100%;
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
					<a href="/communityList.do?category=1&reqPage=1" class="fc-7">이거어때
						></a>
					<c:if test="${comm.memberNo eq sessionScope.member.memberNo }">	
					<button class="btn bc6 bs5 fc-1"
						onclick="location.href='/communityUpdateFrm2.do?commNo=${comm.commNo}'">수정</button>
					<button class="btn bc6 bs5 fc-1  modal-open-btn"
						target="#del-modal">삭제</button>
					</c:if>
				</div>
				<div class="article-title">
					<h2 style="font-size: 26px">${comm.commTitle}</h2>
				</div>
				<div class="article-profile"></div>
				<div class="info-box border-down">
					<div class="writer-info">
						<div class="card-user-img-wrap fll">
							<img class="card-user-img"
								src="./img/member/${comm.memberPicturepath }"
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
								class="article-info"><span class="fc-3"
								style="margin-left: 10px;">조회수 </span> <span class="num fc-3">${comm.readCount }</span>
							</span>
						</div>
					</div>
					<div class="article-info-box">
						<span class="article-info"> 
<!-- 좋아요 -->						
						<c:choose>
							<c:when test="${likeMemberCheck eq 0 }">
								<i class="fa-regular fa-heart icon-wish"></i>
							</c:when>
							<c:otherwise>
								<i class="fa-regular fa-heart icon-wish fa-solid"></i>
							</c:otherwise>
						</c:choose>
							<span>좋아요</span>
							<strong class="num" id="commLikeNum">${comm.commLike }</strong>
						</span>
<!-- 좋아요 -->	
						<span class="article-info"> <i
							class="fa-solid fa-comment fc-6"></i> <span>댓글</span> <strong
							id="cmnt-total2" class="num">${comm.pickCount }</strong>
						</span>
					</div>
				</div>
			</div>
			<!-- article-content -->
			<div class="article-content-wrap">
				<div class="article-cotent" style="margin-top: 40px; margin-bottom:100px;">${comm.commContent }</div>
				<div class="report-wrap">
					<i class="material-symbols-outlined">e911_emergency</i>
					<c:choose>
						<c:when test="${not empty sessionScope.member }">
							<span id="report"><a style="cursor:pointer;"
									onclick="report('${comm.memberNo }','3','${comm.commNo }')">신고하기</a></span>
						</c:when>
						<c:otherwise>
							<span id="report"><a  style="cursor:pointer;" onclick="loginFrm();">신고하기</a></span>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		<!--article-content-wrap end-->

		<div class="attr-wrap">
			<div class="pick-box">
				<div class="card-intro2" style="display:flex; min-height:40px; margin-bottom:40px;">
					<c:choose>
						<c:when test="${comm.pick0Count eq 0 and comm.pick1Count eq 0}">
							<div
								style="text-align: center; padding: 10px; background-color: #cdd8fc; flex-grow: 1;">
								<i class="fa-regular fa-face-laugh-squint"
									style="font-size: 18px; margin-right: 5px; color: #3666f1;"></i>
								<span class="fs-full" style="font-size: 18px; color: #3666f1;">${comm.pick0Count}</span>
							</div>
							<div
								style="text-align: center; padding: 10px; background-color: #fcd4d4; flex-grow: 1;">
								<span class="fs-full" style="font-size: 18px; color: #f05454;">${comm.pick0Count}</span>
								<i class="fa-regular fa-face-smile-wink"
									style="font-size: 18px; margin-left: 5px; color: #f05454;"></i>
							</div>
						</c:when>
						<c:otherwise>
							<div
								style="text-align:center; padding: 10px; background-color:#cdd8fc; flex-grow:${comm.pick0Count};">
								<i class="fa-regular fa-face-laugh-squint"
									style="font-size: 18px; margin-right: 5px; color: #3666f1;"></i>
								<span class="" style="font-size: 18px; ">${comm.advantage}</span>
								<span class="fs-full frr" style="margin:0 10px; font-size: 18px; color: #3666f1;">${comm.pick0Count}</span>
							</div>
							<div
								style="text-align:center; padding: 10px; background-color:#fcd4d4; flex-grow:${comm.pick1Count};">
								<span class="fs-full fll" style="margin:0 10px; font-size: 18px; color: #f05454;">${comm.pick1Count}</span>
								<i class="fa-regular fa-face-smile-wink"
									style="font-size: 18px; margin-right: 5px; color: #f05454;"></i>
								<span class="" style="font-size: 18px; ">${comm.weakness}</span>
							</div>
						</c:otherwise>
					</c:choose>



				</div>
				<c:forEach items="${pickList }" var="p">

					<c:if test="${p.pickCategory eq 0 }">

						<div class="haja-wrap">
							<div class="haja-content">
								<div class="haja-writer">
									<div class="card-user-img-wrap fll" style="margin: 0;">
										<img class="card-user-img"
											src="./img/member/${p.memberPicturepath }"
											style="width: 60px; height: 60px;" />
									</div>
									<c:if test="${sessionScope.member.memberNo eq p.memberNo }">
										<div>
											<input type="hidden" value="${p.pickNo }">
											<button class="pick-btn pick-update-btn">수정</button>
											<span class="pick-btn">|</span>
											<button class="pick-btn pick-delete-btn">삭제</button>
										</div>
									</c:if>
								</div>
								<div class="haja-comment">
									<span class="writer-nick"> <strong
										style="font-size: 15px">${p.memberNick }</strong> <c:if
											test="${p.memberGrade eq 1 }">
											<span class="material-icons verified-icon">verified</span>
										</c:if>
									</span>
									<div class="speech-bubble">${p.pickContent }</div>
									<div class="haja-date-like">
										<input type="hidden" value="${p.pickNo }">
										<c:choose>
											<c:when test="${p.pickLikeMemberCheck eq 0 }">
												<button class="haja-like">
													<i class="material-icons pickLikeBtn">recommend</i> <span>${p.pickLike }</span>
												</button>
											</c:when>
											<c:otherwise>
												<button class="haja-like pickUp">
													<i class="material-icons pickLikeBtn">recommend</i> <span>${p.pickLike }</span>
												</button>
											</c:otherwise>
										</c:choose>

									</div>
								</div>
								<div class="pick-date">${p.pickDate }</div>
							</div>
						</div>

					</c:if>
					<c:if test="${p.pickCategory eq 1 }">
						<div class="malja-wrap">
							<div class="malja-content">
								<div class="pick-date">${p.pickDate }</div>
								<div class="malja-comment">
									<span class="writer-nick"> <strong
										style="font-size: 15px;">${p.memberNick }</strong> <c:if
											test="${p.memberGrade eq 1 }">
											<span class="material-icons verified-icon">verified</span>
										</c:if>
									</span>
									<div class="speech-bubble2">${p.pickContent }</div>
									<div class="malja-date-like">
									<input type="hidden" value="${p.pickNo }">
												<c:choose>
											<c:when test="${p.pickLikeMemberCheck eq 0 }">
												<button class="haja-like">
													<i class="material-icons pickLikeBtn">recommend</i> <span>${p.pickLike }</span>
												</button>
											</c:when>
											<c:otherwise>
												<button class="haja-like pickUp">
													<i class="material-icons pickLikeBtn">recommend</i> <span>${p.pickLike }</span>
												</button>
											</c:otherwise>
										</c:choose>
									</div>
								</div>

								<div class="malja-writer">
									<div class="card-user-img-wrap fll" style="margin-left: 20px;">
										<img class="card-user-img" src="./img/member/${p.memberPicturepath }"
											style="width: 60px; height: 60px" />
									</div>
									<c:if test="${sessionScope.member.memberNo eq p.memberNo }">
										<div class="malja-btn">
											<input type="hidden" value="${p.pickNo }">
											<button class="pick-btn pick-update-btn">수정</button>
											<span class="pick-btn">|</span>
											<button class="pick-btn pick-delete-btn">삭제</button>
										</div>
									</c:if>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
			<!--pick box end-->
		</div>
		<!-- attr-wrap end-->
		<c:if test="${sessionScope.member ne null }">
				<div class="button-wrap" style="margin-top: 50px; width:50%; margin: 0 auto;">
					<!-- 전송 데이터 -->
					<input type="hidden" name="commNo" id="commNo" value="${comm.commNo}">
					<input type="hidden" name="memberNo" id="memberNo" value="${sessionScope.member.memberNo }">
					<input type="hidden" name="pickCategory" id="pickCategory" value="0">
					<!--            -->
					<div>
					<input type="radio" name="accept-offers" id="yes-button"
						class="hidden radio-label" checked> <label
						for="yes-button" class="button-label">${comm.advantage }</label> <input
						type="radio" name="accept-offers" id="no-button"
						class="hidden radio-label"> <label for="no-button"
						class="button-label">${comm.weakness }</label> 
					</div>
						<input type="text"
						name="pickContent" id="pickContent">
					<button class="btn" id="pick-reg"
						style="margin-left:10px; width: 60px; height: 34px; background-color: #3666f1; color: #fff; font-weight: bold;">등록</button>
				</div>
		</c:if>
		<c:if test="${sessionScope.member eq null }">
			<div class="button-wrap" style="margin-top: 50px; width:70%; margin: 0 auto;">
					<!-- 전송 데이터 -->
					<input type="hidden" name="commNo" id="commNo" value="${comm.commNo}">
					<input type="hidden" name="memberNo" id="memberNo" value="${sessionScope.member.memberNo }">
					<input type="hidden" name="pickCategory" id="pickCategory" value="0">
					<!--            -->
				<div>
					<input type="radio" name="accept-offers" id="yes-button"
						class="hidden radio-label" checked> <label
						for="yes-button" class="button-label">${comm.advantage }</label> <input
						type="radio" name="accept-offers" id="no-button"
						class="hidden radio-label"> <label for="no-button"
						class="button-label">${comm.weakness }</label>
				</div> 
						<input type="text"
						name="pickContent" id="pickContent" placeholder="로그인을 하시면 입력할 수 있습니다." readonly onclick="loginFrm();">
					<button class="btn" id="pick-reg"
						style="margin-left:10px; width: 60px; height: 34px; background-color: #3666f1; color: #fff; font-weight: bold;" onclick="loginFrm();">등록</button>
				</div>
		</c:if>
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
				<button class="btn bg-9 fc-5" id="modal-btns-item"
					style="margin-right: 5px;"
					onclick="location.href='/communityDelete.do?category=${comm.commCategory }&commNo=${comm.commNo}'">삭제하기</button>
				<button class="btn bg-4 fc-5 modal-close" id="modal-btns-item"
					style="margin-left: 5px;">취소하기</button>
			</div>
		</div>
	</div>

	<!-- modal end -->
	
		<!-- pick update modal start -->
	<div id="update-modal" class="modal-bg">
		<div class="modal-wrap" style="margin-top: 300px; width:40%;" >
			<div class="modal-head" style="border-bottom: none;">
				<h2 class="fc-1" style="color:#333;">내용 수정하기</h2>
				<input type="text" class="input-form"
						name="pickUpdateContent22" id="pickUpdateContent22" style="">
			</div>
			<div class="modal-btns-container" style="margin: 0 auto;">
				<button class="btn bg-7 fc-5" id="pickUpdateBtn"
					style="margin-right: 5px;"
					name="pickUpdateBtn">수정하기</button>
				<button class="btn bg-4 fc-5 modal-close" id="modal-btns-item"
					style="margin-left: 5px;">취소하기</button>
			</div>
		</div>
	</div>

	<!-- modal end -->
	
	

<script>

$(function(){
	let likeNum = -1;
	//좋아요(wish)
	$(document).on("click",'.haja-like', function() {
		var pickNo = $(this).prev().val();
		var memberNo = $("#memberNo").val();
		var currentValue = $(this).attr("class");
		 if(memberNo > 0){
	         if(currentValue == "haja-like" && memberNo != 0) {
	        	picklikeUp(memberNo, pickNo);
	         }else {
	        	picklikeDown(memberNo, pickNo);
	         }
	 	}else{
			var title = '로그인 후 이용해주세요.';
			var icon = 'info';
	 		toastShow(title, icon);
	 	}
		 
	});
	
	//좋아요(wish) insert
	function picklikeUp(memberNo, pickNo) {
		$.ajax({
				url : "/pickLikeUp.do",
				data : {
					pickNo : pickNo,
					memberNo : memberNo
				},
				async: false,
				success : function(data) {
					$(".attr-wrap").load(location.href + " .attr-wrap");
				},
				error : function() {
					console.log('에러');
				}
			});	
	};
	
	//좋아요(wish) delete
	function picklikeDown(memberNo, pickNo) {
			$.ajax({
				url : "/pickLikeDown.do",
				data : {
					pickNo : pickNo,
					memberNo : memberNo
				},
				async: false,
				success : function(data) {
					$(".attr-wrap").load(location.href + " .attr-wrap");
				},
				error : function() {
					console.log('에러');
				}
			});	
	};
	
	//좋아요(wish)
	$('.icon-wish').on("click", function() {
		var memberNo = $("#memberNo").val();
		var commNo = $("#commNo").val();
		var currentValue = $(this).attr("class");
		 if(memberNo > 0){
	         if(currentValue == "fa-regular fa-heart icon-wish" && memberNo != 0) {
	         	$(this).addClass("fa-solid");
	         	like(memberNo, commNo);
	         }else {
	        	 $(this).removeClass("fa-solid");
	           	 unLike(memberNo, commNo);
	         }
	 	}else{
			var title = '로그인 후 이용해주세요.';
			var icon = 'info';
	 		toastShow(title, icon);
	 	}
		 
		 
	});
	
	//좋아요(wish) insert
	function like(memberNo, commNo) {
		$.ajax({
				url : "/insertLike.do",
				data : {
					commNo : commNo,
					memberNo : memberNo
				},
				success : function(data) {
					$("#commLikeNum").text(data);
				},
				error : function() {
					console.log('에러');
				}
			});	
	};
	
	//좋아요(wish) delete
	function unLike(memberNo, commNo) {
			$.ajax({
				url : "/deleteLike.do",
				data : {
					commNo : commNo,
					memberNo : memberNo
				},
				success : function(data) {
					$("#commLikeNum").text(data);
				},
				error : function() {
					console.log('에러');
				}
			});	
	};
	
	
	$(document).on("click","#yes-button",function(){
		$("#pickCategory").val(0);
		$("#pick-reg").css("background-color", "#3666f1");
	});
	
	$(document).on("click","#no-button",function(){
		$("#pickCategory").val(1);
		$("#pick-reg").css("background-color", "#f05454");
	});
		
	
	//픽 등록하고 특정 div새로고침해서 불러오기
	$(document).on("click","#pick-reg",function(){
		let commNo = $("#commNo").val();
		let memberNo = $("#memberNo").val();
		let pickContent = $("#pickContent").val();
		let pickCategory = $("#pickCategory").val();
		console.log(pickContent);
		console.log(commNo);
		console.log(memberNo);
		console.log(pickCategory);
		
		$.ajax({
			url: "/pickWrite.do",
			type:"post",
			data: {commNo:commNo, memberNo:memberNo, pickContent:pickContent, pickCategory:pickCategory},
			success:function(data){
				$("#pickContent").val("");
				$(".attr-wrap").load(location.href + " .attr-wrap");
			}
		})
			
	});
	
	
	//픽 수정하기
	$(document).on("click",".pick-update-btn", function() {
		var pickUpdateNo = $(this).prev().val();
		showInputalert(pickUpdateNo);
	});
	
	 function showInputalert(pickUpdateNo) {
		 let pickUpdateContent = Swal.fire({
		    title: '내용 수정하기',
		    input: 'text',
		    inputAttributes: {
		        maxlength: 50
		      },
		    showCancelButton: true,
		    confirmButtonColor: '#3865f2',
		    cancelButtonColor: '#d33',
		   confirmButtonText: '수정하기',
		    cancelButtonText: '취소',
		    preConfirm: (pickUpdateContent) => {
		 	   		$.ajax({
		    	    	url: "/pickUpdate.do",
		    			data: {pickNo:pickUpdateNo, pickContent:pickUpdateContent},
		    			success:function(data){
		    				$(".attr-wrap").load(location.href + " .attr-wrap");
		    			}
		 	   		})
		 	   }
		 })
		} 
	
	
	//픽 삭제하기 함수 sweetalert2 사용!!!
	
	$(document).on('click', ".pick-delete-btn", function(){
		var pickDelNo = $(this).prev().prev().prev().val();
		alertFire(pickDelNo);
	});
	
	//alert 함수 띄우기
	function alertFire(pickDelNo){
	  	const alertResult = Swal.fire({
		    title: '삭제 하시겠습니까?',
		    text: "                         ",
		    icon: 'warning',
		    showCancelButton: true,
		    confirmButtonColor: '#3085d6',
		    cancelButtonColor: '#d33',
		    confirmButtonText: '삭제하기',
		    cancelButtonText: '취소'
	 	}).then(result => {
	 	   // 만약 Promise리턴을 받으면,
	 	   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
	 	   		$.ajax({
	 	   			url: "/pickDel.do",
	 	   			data: {pickNo:pickDelNo},
		 	   		success:function(data){
		 	   			$(".attr-wrap").load(location.href + " .attr-wrap");
					}
	 	   		})
	 	   }
	 	});
	} 
	
	//대댓글 쓰기  ////////////////////////////////////////////////////////////////////////////////////////////////// 
	$(document).on("click","#reComment-write-btn",function(){
		let replyCommNo = $("#commNo").val();			//대댓글을 남길 글번호
		let replyParentNo = $(this).prev().val();		//답글다는 조상님의 번호
		let replyMemberNo = $("#memberNo").val();		//답글다는 유저 회원번호
		let replyContent = returnBr();			//댓글 내용 
		let replyLevel = $(this).prev().prev().val();	//1이면 대댓글, 2이면 대대댓글
		let replyNum = $(this).prev().prev().prev().val();	//답글다는 댓글의번호
		
		console.log("조상번호>"+replyParentNo);	
		
		
		console.log("참조번호>"+replyNum);		
		
		
		$.ajax({
			url: "/commCoWrite.do",
			type:"post",
			data: {memberNo:replyMemberNo, cmntContent:replyContent, commNo:replyCommNo, cmntRef:replyNum, cmntLev:replyLevel, cmntGroup:replyParentNo },
			success:function(data){
				$(".comment-list-wrap").load(location.href + " .comment-list-wrap");
				$("#cmnt-total").load(location.href + " #cmnt-total");
				$("#cmnt-total2").load(location.href + " #cmnt-total2");
			}
		})
		
	});
	
	
	//글자수세기 댓글 입력!! 창 함수
	$(document).on("keyup","#comment-textarea",function(){
		 var comment = $("#comment-textarea").val();
		 if(comment <= 0){
			 $("#comment-reg").attr("disabled",true);
		 }else{
			 $("#comment-reg").attr("disabled",false);
		 }
		 console.log(comment.length);
		$("#comment-num").text(comment.length);
	});
//글자수세기 댓글 수정!! 창 함수
	$(document).on("keyup","#comment-updatearea",function(){
		 var UpdateComment = $("#comment-updatearea").val();
		 if(UpdateComment <= 0){
			 $("#comment-update-btn").attr("disabled",true);
			 $("#reComment-write-btn").attr("disabled",true);
		 }else{
			 $("#comment-update-btn").attr("disabled",false);
			 $("#reComment-write-btn").attr("disabled",false);
		 }
		 console.log(UpdateComment.length);
		$("#UpdateComment-num").text(UpdateComment.length);
	});
	
	
}); //문서로딩 후 함수

/////// 대댓글 폼띄우기 함수
function replyFrm(replyLev, replyParentNo, replyNo, replyNick, thisReply){
	$(".comment-cancel-btn").parent().parent().prev().show();
	$(".comment-cancel-btn").parent().parent().remove();
	var writeHtml = "";
	writeHtml += '<div class="comment-write" style="margin-left:60px;")">';
	writeHtml += '<div class="comment-write-head">';
	writeHtml += '<span style="font-family: fs-m; margin:0 0 8px 0; padding-left:2px;">@'+replyNick+' 에게 답글쓰기</span>';
	writeHtml += '<span class="comment-num-box"><span id="UpdateComment-num">0</span>/250</span>';
	writeHtml += '</div>';
	writeHtml += '<textarea id="comment-updatearea" placeholder="답글 입력" onkeyup="resizeUpdatearea(this)" onkeydown="resize(this)" maxlength="250"></textarea>';
	writeHtml += '<div style="float: right;">';
	writeHtml += '<input type="hidden" id="replyNo" value="'+replyNo+'">';
	writeHtml += '<input type="hidden" id="replyLevel" value="'+replyLev+'">';
	writeHtml += '<input type="hidden" id="replyParentNo" value="'+replyParentNo+'">';
	writeHtml += '<button type="button" id="reComment-write-btn" class="comment-write-btn btn fll" disabled>등록</button>';
	writeHtml += '<button type="button" class="comment-cancel-btn btn fc-7">취소</button>';
	writeHtml += '</div>';
	writeHtml += '</div>';
	
	$(thisReply).parent().parent().parent().after(writeHtml);
}


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

function resizeUpdatearea(obj) {
    obj.style.height = '1px';
    obj.style.height = (12 + obj.scrollHeight) + 'px';
    
    //5줄 이상 입력하면 알림창 띄우도록
    var str = $("#comment-updatearea").val();
    var str_arr = str.split("\n");  // 줄바꿈 기준으로 나눔 
    var row = str_arr.length;  // row = 줄 수 
    if(row >10){
   		 //마지막 입력문자 삭제
   		var title = "10줄 이상 작성할 수 없습니다.";
    	var icon = "error";
    	toastShow(title,icon);
	    var lastChar = str.slice(0,-1); //열 
	    $("#comment-updatearea").val(lastChar)
    }
    
}


//textarea 엔터시 <br>로 바꿔주고 히든 input 에 저장하는 함수
function convertbr(){
   var str = document.getElementById("comment-textarea").value;
   var str = str.replace(/\r\n|\n/g,'<br>');
   document.getElementById('cmntContent').value = str;
  }

//textarea 엔터시 <br>로 바꿔주고 문자열을 리턴해주는 함수
function returnBr(){
	var text = document.getElementById("comment-updatearea").value;
	var textBr = text.replace(/\r\n|\n/g,'<br>');
	console.log(textBr);
	return textBr;
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

  		 //sweeatalert2 confirm 함수
		function loginFrm() {
 			Swal.fire({
              title: '로그인이 필요합니다',
              text: "로그인 하시겠습니까?",
              icon: 'warning',
              showCancelButton: true,
              confirmButtonColor: '#3085d6',
              cancelButtonColor: '#d33',
              confirmButtonText: '로그인 하기',
              cancelButtonText: '취소',
              reverseButtons: false, // 버튼 순서 거꾸로
              
            }).then((result) => {
              if (result.isConfirmed) {
            	  location.href="/loginFrm.do";
              }
            })
		}
	
</script>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>


</html>