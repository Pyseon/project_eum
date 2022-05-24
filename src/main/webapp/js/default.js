$(function () {
  $(document).on("click", ".modal-open-btn", function () {
    $($(this).attr("target")).css("display", "flex");
  });
  $(document).on("click", ".modal-close", function () {
    $(this).parents(".modal-wrap").parent().css("display", "none");
  });  
  $(".sub-navi").prev().parent().hover(function(){
    $(".sub-navi").toggle();
  });
  // $(".login-sub-navi").prev().parent().hover(function(){
  //   $(".login-sub-navi").slideToggle(400);
  // });
});
function alertFunc(icon){
  const Toast = Swal.mixin({
    toast: true,
    position: 'center-center',
    showConfirmButton: false,
    timer: 2500,
    timerProgressBar: true,
    didOpen: (toast) => {
      toast.addEventListener('mouseenter', Swal.stopTimer)
      toast.addEventListener('mouseleave', Swal.resumeTimer)
    }
  })

  Toast.fire({
    icon: icon,
    title: '정상적으로 실행되었습니다.'
    
  })
      //이후 페이지 이동 시 추가
      /*
      .then(function(){
    	 window.location = "${loc}"; 
      });
      */
    };
    
    window.onload=function(){
$(".selectMemberBtn").on("click",function(){
			const selectMemberBtn = this.value;
			$.ajax({
				url : "/selectMember.do?selectMemberBtn="+selectMemberBtn,
				success : function(data){
					const table = $("#resultTbl>table");
					table.empty();
					const titleTr = $("<tr>");
					titleTr.append("<th>번호</th><th>이메일</th><th>닉네임</th><th>포인트</th><th>전화번호</th><th>가입일</th><th>신고 누적 횟수</th><th>블랙리스트 관리</th>");
					table.append(titleTr);
					for(let i=0;i<data.length;i++){
						const tr=$("<tr>");
						tr.append("<td>"+data[i].memberNo+"</td>");
						tr.append("<td>"+data[i].memberId+"</td>");
						tr.append("<td>"+data[i].memberNick+"</td>");
						tr.append("<td>"+data[i].memberPoint+"</td>");
						tr.append("<td>"+data[i].memberPhone+"</td>");
						tr.append("<td>"+data[i].enrollDate+"</td>");
						tr.append("<td>"+data[i].memberReportCount+"</td>");
						if(selectMemberBtn == 4){
							tr.append("<td><button onclick=location='/updateBlackList.do?updateNo=1&memberNo="+data[i].memberNo+"'>블랙리스트 해제</button></td>");
						}else{
							tr.append("<td><button onclick=location='/updateBlackList.do?updateNo=0&memberNo="+data[i].memberNo+"'>블랙리스트 등록</button></td>");	
						}
						table.append(tr);
					}
				}
			});
		});
	};
		