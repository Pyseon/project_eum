/* 신고한사람 > 세션에서 정보 받음
* param1 : 신고받은사람
* param2 : 카테고리
* param3 : 신고한 글의 고유번호(primary key) ex:product_no
*
*/
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
		const modalform = $('<form action="/report.do" type="post">');
		const defendant = $('<input type="hidden" name="defendant" value="'+param1+'">');
		const category = $('<input type="hidden" name="reportCategory" value="'+param2+'">');
		const reportIndex = $('<input type="hidden" name="reportIndex" value="'+param3+'">'); 
		const radiowrap = $('<div class="radio-wrap">');
		const radio1 = $('<div class="radio"><input type="radio" name="reportRadio" value="spam" checked>&nbsp;&nbsp;광고 홍보성<br></input></div>');
		const radio2 = $('<div class="radio"><input type="radio" name="reportRadio" value="slang">&nbsp;&nbsp;비매너/욕설<br></input></div>');
		const radio3 = $('<div class="radio"><input type="radio" name="reportRadio" value="etc">&nbsp;&nbsp;기타<br></input></div>');
		const reportTitle = $('<input type="text" name="reportTitle" class="reportTitle" placeholder="제목을 입력해주세요.(30자 제한)">');
		const reportContent = $('<textarea name="reportContent" class="textarea" maxlength="150" placeholder="신고 사유를 입력해주세요.(150자 제한)">');
		const contentCount = $('<div class="count-wrap"><span class="textCount">0</span> <span class="textTotal">/150</span></div>');
		const btnwrap = $('<div class="btn-wrap">')
		const submitBtn = $('<button class="submitBtn bc1 type="submit">제출</button>');
		modalContentwrap.append(icon);
		modalContentwrap.append(modalTitle);
		radiowrap.append(radio1);
		radiowrap.append(radio2);
		radiowrap.append(radio3);
		divSubwrap.append(closeBtn);
		modalContentwrap.append(radiowrap);
		modalContentwrap.append(reportTitle);
		modalContentwrap.append(reportContent);
		modalContentwrap.append(contentCount);
		modalContentwrap.append(submitBtn);
		modalContentwrap.append(btnwrap);
		modalform.append(modalContentwrap);
		divSubwrap.append(modalform);
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
			divSubwrap.fadeOut();
			divWrap.fadeOut();
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
			
			alert('신고되었습니다. 감사합니다.');

		});
	}

	
	
	
	
	