<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이음 :: 커뮤니티</title>
<style>
.pick-box{
}

.pick-box {
	padding: 30px;
	width: 70%;
	border: 1px dashed #eee;
	border-radius: 6px;
	background-color: #f9f9fa;
}

.speech-bubble {
	position: relative;
	background: #cdd8fc;
	border-radius: 0.4em;
	min-height: 50px;
	box-shadow: rgba(50, 50, 93, 0.25) 0px 13px 27px -5px,
		rgba(0, 0, 0, 0.3) 0px 8px 16px -8px;
	/* color: #fff; */
	padding: 15px;
}

.haja-nick {
	margin-top: 5px;
	margin-bottom: 3px;
}

.pick-date {
	display: flex;
	flex-direction: column-reverse;
	padding: 0 15px 28px 15px;
	color: #979797;
}

.speech-bubble:after {
	content: '';
	position: absolute;
	left: 0;
	top: 50%;
	width: 0;
	height: 0;
	border: 15px solid transparent;
	border-right-color: #cdd8fc;
	border-left: 0;
	border-top: 0;
	margin-top: -12px;
	margin-left: -15px;
}

.speech-bubble2 {
	position: relative;
	background: #fcd4d4;
	border-radius: .4em;
	min-height: 50px;
	box-shadow: rgba(50, 50, 93, 0.25) 0px 13px 27px -5px,
		rgba(0, 0, 0, 0.3) 0px 8px 16px -8px;
	/* color: #fff; */
	padding: 15px;
}

.speech-bubble2:after {
	content: '';
	position: absolute;
	right: 0;
	top: 50%;
	width: 0;
	height: 0;
	border: 15px solid transparent;
	border-left-color: #fcd4d4;
	border-right: 0;
	border-top: 0;
	margin-top: -12px;
	margin-right: -15px;
}

.ali-right {
	float: right;
}

.haja-content {
	display: flex;
	margin-bottom: 8px;
}

.haja-writer {
	display: flex;
	flex-direction: column;
	margin-right: 20px;
	padding-top: 15px;
	text-align: center;
}

.malja-writer {
	display: flex;
	flex-direction: column;
	text-align: right;
}

.haja-comment {
	max-width: 60%;
}

.malja-content {
	display: flex;
	justify-content: flex-end;
	margin-bottom: 25px;
}

.malja-comment {
	max-width: 50%;
	display: flex;
	flex-direction: column;
	align-items: flex-end;
}

.pick-btn {
	background-color: transparent;
	border: none;
	padding: 0;
	margin-top: 6px;
	font-size: 13px;
	color: #979797;
}

.malja-btn {
	padding-right: 10px;
}

.malja-date-like {
	display: flex;
	justify-content: flex-start;
}

.haja-like {
	background-color: #fff;
	border: none;
	border-radius: 20px;
	box-shadow: rgba(50, 50, 93, 0.25) 0px 13px 27px -5px,
		rgba(0, 0, 0, 0.3) 0px 8px 16px -8px;
	height: 22px;
	margin-top: 3px;
}

.haja-like>i {
	color: orangered;
	font-size: 20px;
}

.haja-like>span {
	vertical-align: top;
}

* {
	/* box-sizing: border-box; */
	
}

.button-label {
	cursor: pointer;
	border-radius: 0.25em;
	box-shadow: 0 3px 10px rgba(0, 0, 0, 0.2), inset 0 -3px 0
		rgba(0, 0, 0, 0.22);
	transition: 0.3s;
	padding: 10px 15px;
}

.button-label:hover {
	box-shadow: 0 3px 10px rgba(0, 0, 0, 0.2), inset 0 -3px 0
		rgba(0, 0, 0, 0.32);
}

.button-label:active {
	transform: translateY(2px);
	box-shadow: 0 3px 10px rgba(0, 0, 0, 0.2), inset 0px -1px 0
		rgba(0, 0, 0, 0.22);
}

#yes-button:checked+.button-label {
	background-color: #3666f1;
	color: #eee;
}

#yes-button+.button-label:hover {
	background-color: #2c4fbf;
	color: #eee;
}

#no-button:checked+.button-label {
	background-color: #f05454;
	color: #eee;
}

#no-button+.button-label:hover {
	background-color: #bd4242;
	color: #eee;
}

#pickContent {
	margin-left: 20px;
	width: 65%;
	min-height: 35px;
	border-radius: 0.4em;
	border: 1.5px solid #aaa;
	padding-left: 10px;
	outline: none;
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
					<button class="btn bc6 bs5 fc-1"
						onclick="location.href='/communityUpdateFrm.do?commNo=${comm.commNo}'">수정</button>
					<button class="btn bc6 bs5 fc-1  modal-open-btn"
						target="#del-modal">삭제</button>
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
						<span class="article-info"> <i class="fa-regular fa-heart"></i>
							<i class="fa-solid fa-heart"></i> <span>좋아요</span> <strong
							class="num">${comm.commLike }</strong>
						</span> <span class="article-info"> <i
							class="fa-solid fa-comment fc-6"></i> <span>댓글</span> <strong
							id="cmnt-total2" class="num">${comm.cmntCount }</strong>
						</span>
					</div>
				</div>
			</div>
			<!-- article-content -->
			<div class="article-content-wrap">
				<div class="article-intro">
					<i class="fa-solid fa-circle-question"></i> <span
						class="title-text fs-medium fc-10">어떤게 고민이니?</span>
					<p>${comm.commIntro }</p>
				</div>


				<div class="article-cotent">${comm.commContent }</div>
				<div class="report-wrap">
					<i class="material-symbols-outlined">e911_emergency</i> <span>신고하기</span>
				</div>
			</div>
		</div>
		<!--article-content-wrap end-->



		<div class="attr-wrap">
			<div class="pick-box">
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
											<button class="pick-btn">수정</button>
											<span class="pick-btn">|</span>
											<button class="pick-btn">삭제</button>
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
										<button class="haja-like">
											<i class="material-icons">recommend</i> <span>${p.pickLike }</span>
										</button>
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
										<button class="haja-like">
											<i class="material-icons">recommend</i> <span>${p.pickLike }</span>
										</button>
									</div>
								</div>

								<div class="malja-writer">
									<div class="card-user-img-wrap fll" style="margin-left: 20px;">
										<img class="card-user-img" src="./img/member/${p.memberPicturepath }"
											style="width: 60px; height: 60px" />
									</div>
									<c:if test="${sessionScope.member.memberNo eq p.memberNo }">
										<div class="malja-btn">
											<button class="pick-btn">수정</button>
											<span class="pick-btn">|</span>
											<button class="pick-btn">삭제</button>
										</div>
									</c:if>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>

				<div class="button-wrap" style="margin-top: 50px;">
					<!-- 전송 데이터 -->
					<input type="hidden" name="commNo" id="commNo" value="${comm.commNo}">
					<input type="hidden" name="memberNo" id="memberNo" value="${sessionScope.member.memberNo }">
					<input type="hidden" name="pickCategory" id="pickCategory" value="0">
					<!--            -->
					<input type="radio" name="accept-offers" id="yes-button"
						class="hidden radio-label" checked> <label
						for="yes-button" class="button-label">해봐!</label> <input
						type="radio" name="accept-offers" id="no-button"
						class="hidden radio-label"> <label for="no-button"
						class="button-label">하지마!</label> 
						<input type="text"
						name="pickContent" id="pickContent">
					<button class="btn" id="pick-reg"
						style="width: 60px; height: 35px; background-color: yellow; color: #222; font-weight: bold;">전송</button>
				</div>



			</div>
			<!--pick box end-->
		</div>
		<!-- attr-wrap end-->


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

	<script>

$(function(){
	$(document).on("click","#yes-button",function(){
		$("#pickCategory").val(0);
	});
	
	$(document).on("click","#no-button",function(){
		$("#pickCategory").val(1);
	});
		
	
	//댓글등록하고 특정 div새로고침해서 불러오기
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
				/*
				cmntHtml += '<div class="comment-list"><div class="single-comment justify-content-between dd-flex"><div class="user justify-content-between dd-flex"><div class="thumb">';
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
				*/
				$("#pickContent").val("");
				//$(".attr-wrap").load(location.href + " .attr-wrap");
				$(".pick-box").load(location.href + " .pick-box");
				$(".haja-wrap").load(location.href + " .haja-wrap");
				$(".malja-wrap").load(location.href + " .malja-wrap");
				
				
			}
		})
			
	});
	
	
	
	//댓글 수정폼 띄우기
	let updateCmntNo = 0;
	let updatememberNo = 0;
	$(document).on("click",".comment-update-btn", function() {
		//기존창 살리고 입력창 없애기 (중복생성방지)
		$(".comment-cancel-btn").parent().parent().prev().show();
		$(".comment-cancel-btn").parent().parent().remove();
		
		updateCmntNo = $(this).prev().prev().val();
		updatememberNo = $(this).prev().val();
		
		console.log("수정폼띄움!");
		console.log("댓글번호 > "+updateCmntNo);
		console.log("멤버번호 > "+updatememberNo);
		
		var writeHtml = "";
		writeHtml += '<div class="comment-write">';
		writeHtml += '<div class="comment-write-head">';
		writeHtml += '<span style="font-family: fs-m; margin:0 0 8px 0; padding-left:2px;">댓글 수정</span>';
		writeHtml += '<span class="comment-num-box"><span id="UpdateComment-num">0</span>/250</span>';
		writeHtml += '</div>';
		writeHtml += '<textarea id="comment-updatearea" placeholder="댓글 입력" onkeyup="resize(this)" onkeydown="resize(this)" maxlength="250"></textarea>';
		writeHtml += '<div style="float: right;">';
		writeHtml += '<button type="button" id="comment-update-btn" class="comment-write-btn btn fll" disabled>수정</button>';
		writeHtml += '<button type="button" class="comment-cancel-btn btn fc-7">취소</button>';
		writeHtml += '</div>';
		writeHtml += '</div>';
		
		$(this).parent().parent().parent().hide();
		$(this).parent().parent().parent().parent().append(writeHtml);
		
	})
	
	
	//댓글 수정 취소시 -> 되돌리기
	$(document).on("click",".comment-cancel-btn", function() {
		$(this).parent().parent().prev().show();
		$(this).parent().parent().remove();
		
	})
	
	
	
	//댓글수정하기 함수
	$(document).on("click","#comment-update-btn", function() {
		console.log("업데이트 버튼 누름!");
		console.log("수정댓글번호 > "+updateCmntNo);
		console.log("수정멤버번호 > "+updatememberNo);
		//returnBr()이라는 함수를 통해서 엔터값을 br로바꿔주고 리턴받아서 저장해줌
		let commentUpdateText = returnBr();
		console.log("최종업데이트전 문자열>>"+commentUpdateText);
		$.ajax({
			url: "/commCoUpdate.do",
			data: {cmntNo:updateCmntNo, cmntContent:commentUpdateText},
			success:function(data){
				$("#comment-updatearea").val("");
				$(".comment-list-wrap").load(location.href + " .comment-list-wrap");
			}
		})
		
	})
	
	
	
	//댓글 삭제하기 함수 sweetalert2 사용!!!
	
	$(document).on('click', ".comment-del-btn", function(){
		let deleteCmntNo = $(this).prev().prev().prev().prev().val();
		alertFire(deleteCmntNo);
	});
	
	//alert 함수 띄우기
	function alertFire(deleteCmntNo){
	  	const alertResult = Swal.fire({
		    title: '댓글을 삭제 하시겠습니까?',
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
	 	   		console.log("삭제할게!");
	 	   		console.log("삭제댓글번호 > "+deleteCmntNo);
	 	   		var commentDelContent = "[ 사용자가 삭제한 댓글 입니다. ]";
	 	   		//삭제안하고 내용만 바꾸려고할때 (추후 답글있을때만 하도록 구현)
	 	   		/*
	 	   		$.ajax({
	 	   			url: "/commCoUpdate.do",
	 	   			data: {cmntNo:deleteCmntNo, cmntContent:commentDelContent},
		 	   		success:function(data){
						$(".comment-list-wrap").load(location.href + " .comment-list-wrap");
					}
	 	   		})
	 	   		*/
	 	   		
	 	   		//그냥 삭제할때
	 	   		$.ajax({
	 	   			url: "/commCoDelete.do",
	 	   			data: {cmntNo:deleteCmntNo},
		 	   		success:function(data){
						$(".comment-list-wrap").load(location.href + " .comment-list-wrap");
						$("#cmnt-total").load(location.href + " #cmnt-total");
						$("#cmnt-total2").load(location.href + " #cmnt-total2");
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
	

	console.log("===============================");
	console.log(replyLev);
	console.log(replyParentNo);
	console.log(replyNo);
	console.log(replyNick);
	console.log("this");
	
	console.log("===============================");
	
	
	
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



	
</script>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>


</html>