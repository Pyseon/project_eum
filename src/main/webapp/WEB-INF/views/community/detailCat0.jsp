<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이음 :: 커뮤니티</title>
<style>
.reply-btn {
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	align-items: flex-end;
}

.comment-btn-wrap {
	padding-bottom: 10px;
}

.comment-btn-wrap * {
	color: #777 !important;
}

.comment-write {
	background-color: #f9f9fad;
	border: 2px solid #ebecef;
	color: #323232;
	padding: 15px 6px 6px 20px;
	margin-bottom: 25px;
	border-radius: 6px;
	overflow: hidden;
}

.comment-write-head {
	display: flex;
	justify-content: space-between;
}

.comment-num-box {
	color: #757575;
}

#comment-textarea, #comment-updatearea {
	resize: none;
	width: 100%;
	border: none;
	overflow: hidden;
	overflow-wrap: break-word;
	height: 42.5px;
	padding-bottom: 8px;
}

#comment-textarea:focus, #comment-updatearea:focus {
	outline: none;
}

.comment-write-btn {
	float: right;
	background-color: #cdd8fc;
	font-family: fs-m !important;
	color: #1a73e8 !important;
	padding: 4px 12px !important;
}

.comment-update2-btn {
	float: left;
	background-color: #f0f0f0;
	color: #777 !important;
	padding: 4px 12px !important;
	margin-right: 5px;
}

.comment-cancel-btn {
	float: left;
	background-color: #f0f0f0;
	color: #777 !important;
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
					<a href="/communityList.do?category=0&reqPage=1" class="fc-7">요즘
						뭐하니 ></a>
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
						class="title-text fs-medium fc-10">요즘 뭐하니?</span>
					<p>${comm.commIntro }</p>
				</div>
				<div class="attr-wrap">
					<!-- ADVANTAGE -->
					<div class="attr-box">
						<div class="attr-title bg-7">
							<i class="fa-solid fa-thumbs-up fc-5 attr-thumbs-up"></i> <span
								class="fc-5">이런분들에게 추천해요!</span>
						</div>
						<c:forTokens var="adv" items="${comm.advantage}" delims="|"
							varStatus="i">
							<div class="attribute adv">
								<i class="fa-regular fa-face-laugh-squint adv-icon"></i> <span>${adv }</span>
							</div>
						</c:forTokens>
					</div>

					<!-- WEAKNESS -->
					<div class="attr-box">
						<div class="attr-title bg-9">
							<i class="fa-solid fa-thumbs-down fc-5 attr-thumbs-down"></i> <span
								class="fc-5">이런 분들에게 비추해요!</span>
						</div>
						<c:forTokens var="weak" items="${comm.weakness}" delims="|"
							varStatus="i">
							<div class="attribute weak">
								<i class="fa-regular fa-face-sad-tear weak-icon"></i> <span>${weak }</span>
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
					id="cmnt-total" class="num cmnt-total">${comm.cmntCount }</strong>
			</div>
		</div>
		<div class="comments-area">
			<div class="comment-list-wrap">
				<c:forEach items="${cmntList }" var="cmnt">
					<c:choose>
						<c:when test="${cmnt.cmntLev eq 0 }">
							<!--comment-->
							<div class="comment-list">
								<div class="single-comment justify-content-between dd-flex">
									<div class="user justify-content-between dd-flex">
										<div class="thumb">
											<img src="./img/member/${cmnt.memberPicturepath }" alt=""
												class="card-user-img" />
										</div>
										<div class="desc">
											<span class="writer-nick"> <strong
												style="font-size: 15px">${cmnt.memberNick }</strong>
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
										<a href="javascript:void(0);" class="btn-reply replyBtn" 
										onclick="replyFrm(1, ${cmnt.cmntNo}, ${cmnt.cmntNo}, '${cmnt.memberNick }',this)">답글쓰기</a>
										<div class="comment-btn-wrap">
											<input type="hidden" class="reply-cmnt-no"
												value="${cmnt.cmntNo}"> 
											<input type="hidden"
												class="reply-writer-no" value="${cmnt.memberNo}">
											<a href ="javascript:void(0);" class="comment-update-btn">수정</a> 
											<span>|</span> 
											<a href="javascript:void(0);" class="comment-del-btn"> 삭제</a>
										</div>
									</div>
								</div>
							</div>
							<!--comment end-->
						</c:when>
						<c:when test="${cmnt.cmntLev ne 0 }">
							<!--Re-comment-->
							<div class="comment-list left-padding">
								<div class="single-comment justify-content-between dd-flex">
									<div class="user justify-content-between dd-flex">
										<div class="thumb">
											<img src="./img/member/${cmnt.memberPicturepath }" alt=""
												class="card-user-img" />
										</div>
										<div class="desc">
											<span class="writer-nick"> <strong
												style="font-size: 15px">${cmnt.memberNick }</strong> <c:if
													test="${cmnt.memberGrade eq 1 }">
													<span class="material-icons verified-icon">verified</span>
												</c:if> <c:if test="${cmnt.memberNo eq comm.memberNo }">
													<span class="reply-writer">작성자</span>
												</c:if>

											</span>

											<c:if test="${cmnt.cmntLev eq 1 }">
												<p class="comment">${cmnt.cmntContent }</p>
											</c:if>

											<c:if test="${cmnt.cmntLev eq 2 }">
												<p class="comment">
													<span class="ref-nick">@${cmnt.cmntRefNick } </span>${cmnt.cmntContent }</p>
											</c:if>

											<p class="date fs-light">${cmnt.cmntDate }</p>
										</div>
									</div>
									<div class="reply-btn">
										<input type="hidden" class="reply-cmnt-no"
											value="${cmnt.cmntNo}"> <input type="hidden"
											class="reply-writer-no" value="${cmnt.memberNo}"> <a
											href="javascript:void(0);" class="btn-reply re-replyBtn"
											onclick="replyFrm(2, ${cmnt.cmntRef}, ${cmnt.cmntNo}, '${cmnt.memberNick }',this)">답글쓰기</a>
										<div class="comment-btn-wrap">
											<input type="hidden" class="reply-cmnt-no"
												value="${cmnt.cmntNo}"> 
											<input type="hidden"
												class="reply-writer-no" value="${cmnt.memberNo}">
											<a href="javascript:void(0);" class="comment-update-btn">수정 </a> <span>|</span>
											<a href="javascript:void(0);" class="comment-del-btn"> 삭제</a>
										</div>
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
				<input type="hidden" name="commNo" id="commNo"
					value="${comm.commNo}"> <input type="hidden"
					name="memberNo" id="memberNo" value="${sessionScope.member.memberNo }"> <input
					type="hidden" name="cmntContent" id="cmntContent"> <input
					type="hidden" name="cmntLev" id="cmntLev" value="0">
				<!--            -->
				<div class="comment-write-head">
					<span
						style="font-family: fs-m; margin: 0 0 8px 0; padding-left: 2px;">댓글
						쓰기</span> <span class="comment-num-box"><span id="comment-num">0</span>/250</span>
				</div>
				<textarea id="comment-textarea" placeholder="댓글 입력"
					onkeyup="resize(this)" onkeydown="resize(this)" maxlength="250"></textarea>
				<button type="button" id="comment-reg" disabled
					class="comment-write-btn btn fc-7">등록</button>
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
	
	
	//댓글등록하고 특정 div새로고침해서 불러오기
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
			type:"post",
			data: {commNo:commNo, memberNo:memberNo, cmntContent:cmntContent, cmntLev:cmntLev},
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
				$("#cmntContent").val("");
				$("#comment-textarea").val("");
				$("#comment-num").text(0);
				$(".comment-list-wrap").load(location.href + " .comment-list-wrap");
				$("#cmnt-total").load(location.href + " #cmnt-total");
				$("#cmnt-total2").load(location.href + " #cmnt-total2");
				
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