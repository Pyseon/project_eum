/* 신고한사람 > 세션에서 정보 받음
* param1 : 신고받은사람
* param2 : 카테고리
* param3 : 신고한 글의 고유번호(primary key) ex:product_no
*
*/

	function loginNeed(){
		alert('로그인 후 이용해주세요.');
		location.href="/loginFrm.do";
	}

	function report(param1,param2,param3) {
	console.log(param1);
	console.log(param2);
	console.log(param3);
	
		const divWrap = $('<div class="report-modal-back">');
		const divSubwrap = $('<div class="modal-sub-wrap">');
		const modalContentwrap = $('<div class="modal-content-wrap">');
		const closeBtn = $('<div class="con"><span class="material-icons icon-close">close</span></div>');
		const icon = $('<img id="icon-report-modal" src="img/product/icon-report.png">');
		const modalTitle = $('<div class="modal-title fc-9">신고하시겠습니까?</div>');
		
		const defendant = $('<input type="hidden" name="defendant" value="'+param1+'">');
		const reportCategory = $('<input type="hidden" name="reportCategory" value="'+param2+'">');
		const reportIndex = $('<input type="hidden" name="reportIndex" value="'+param3+'">'); 
		const radiowrap = $('<div class="radio-wrap">');
		const radio1 = $('<div class="radio"><input type="radio" name="reportRadio" value="광고" checked>&nbsp;&nbsp;광고 홍보성<br></input></div>');
		const radio2 = $('<div class="radio"><input type="radio" name="reportRadio" value="비매너">&nbsp;&nbsp;비매너/욕설<br></input></div>');
		const radio3 = $('<div class="radio"><input type="radio" name="reportRadio" value="기타">&nbsp;&nbsp;기타<br></input></div>');
		const reportTitle = $('<input type="text" name="reportTitle" class="reportTitle" placeholder="제목을 입력해주세요.(30자 제한)">');
		const reportContent = $('<textarea name="reportContent" class="textarea" maxlength="150" placeholder="신고 사유를 입력해주세요.(150자 제한)">');
		const contentCount = $('<div class="count-wrap"><span class="textCount">0</span> <span class="textTotal">/150</span></div>');
		const btnwrap = $('<div class="btn-wrap">')
		const submitBtn = $('<button class="submitBtn bc1" type="button">제출</button>');
		
		modalContentwrap.append(icon);
		modalContentwrap.append(modalTitle);
		radiowrap.append(radio1);
		radiowrap.append(radio2);
		radiowrap.append(radio3);
		divSubwrap.append(closeBtn);
		modalContentwrap.append(radiowrap);
		modalContentwrap.append(defendant);
		modalContentwrap.append(reportCategory);
		modalContentwrap.append(reportIndex);
		modalContentwrap.append(reportTitle);
		modalContentwrap.append(reportContent);
		modalContentwrap.append(contentCount);
		modalContentwrap.append(submitBtn);
		modalContentwrap.append(btnwrap);
		divSubwrap.append(modalContentwrap);
		divWrap.append(divSubwrap);
		$('body').append(divWrap);
		 
		
		$('.textarea').keyup(function() {
			let content = $(this).val();
			
			// 글자수 세기
		    if (content.length == 0 || content == '') {
		    	$('.textCount').text('0');
		    } else {
		    	$('.textCount').text(content.length);
		    }
			
			// 글자수 제한
		    if(content.length > 150) {
		        $(this).val($(this).val().substring(0, 150));
		        alert('150자 까지 입력 가능합니다.');
		    };
		});
		
		$('.reportTitle').keyup(function() {
			let content = $(this).val();
			// 글자수 제한
		    if(content.length > 30) {
		        $(this).val($(this).val().substring(0, 30));
		        alert('30자 까지 입력 가능합니다.');
		    };
		});
		
		$('.icon-close').on('click', function(){
			$('.modal-sub-wrap').fadeOut( "slow", function() {
				$('.modal-sub-wrap').remove();
			});
			$('.report-modal-back').fadeOut( "slow", function() {
				$('.report-modal-back').remove();
			});
		});
		
		$('.submitBtn').on('click',function(){
			
			if($('.reportTitle').val() == ""){
		        alert("제목을 입력해주세요.");
		        return false;
		    }
			if($('.textarea').val() == ""){
		        alert("내용을 입력해주세요.");
		        return false;
		    } 
		    
		    const data1 = defendant.val();
		    const data2 = reportContent.val();
		    const data3 = reportCategory.val();
		    const data4 = reportIndex.val();
		    const data5 = reportTitle.val();
		    const data6 = $('[name=reportRadio]:checked').val();
		    
		    console.log(data1);
		    console.log(data2);
		    console.log(data3);
		    console.log(data4);
		    console.log(data5);
		    console.log(data6);
		    
			$.ajax({
				url : "/report.do",
				type : "post",
				data : {
					   defendant:data1,
					   reportContent:data2,
					   reportCategory:data3,
					   reportIndex:data4,
					   reportTitle:data5,
					   reportRadio:data6
					   },
				success : function(data) {
					if(data == 0) {
						alert('이미 신고 접수 되었습니다. 감사합니다.');
						$('.modal-sub-wrap').fadeOut( "slow", function() {
							$('.modal-sub-wrap').remove();
						});
						$('.report-modal-back').fadeOut( "slow", function() {
							$('.report-modal-back').remove();
						});
					}else {
						alert('신고되었습니다. 감사합니다.');
						$('.modal-sub-wrap').fadeOut( "slow", function() {
							$('.modal-sub-wrap').remove();
						});
						$('.report-modal-back').fadeOut( "slow", function() {
							$('.report-modal-back').remove();
						});
					}
				},
				error : function() {
					alert('잘못된 접근입니다.');
					$('.modal-sub-wrap').fadeOut( "slow", function() {
						$('.modal-sub-wrap').remove();
					});
					$('.report-modal-back').fadeOut( "slow", function() {
						$('.report-modal-back').remove();
					});
				}
			});
		});
	}

	
	
	
	
	