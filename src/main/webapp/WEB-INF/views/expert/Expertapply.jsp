<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전문가신청페이지1</title>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
</head>
<body>
	
	

<div class="page-content">
		<br>
		<form action="/Expertapply2.do" method="post">
		<div>
		
		
		<br>
		<p>
			사업자를 등록하지 않은 개인 자격으로 신청하는경우 선택합니다.
		단, 회계/법률/관세 등 법적으로 겸업 금지인 분야는 소속되어 있는 사업자로만 신청이 가능하여 선택할 수 없습니다.
		</p>
		<!-- 
		<div style="border:1px solid; padding:10px;">
		필요서류 미리보기
		공통 : 분야 별 신청자격에 따른 첨부 서류 
		</div>
		 -->
		<div class="checkedbox">
				<div class="checkbox-s">
					<div><label><input type="checkbox" name = "agreement" value="0" required>(이음)서비스 전문가 이용약관 동의</label><br>
					
					<textarea class="input-form" placeholder="본 이음 전문가 이용약관(이하 ‘이 약관’)은 이음 웹사이트, 애플리케이션 등에서 제공되는 전문가 서비스 이용에 관한 회원과 주식회사 이음(이하 ‘회사’) 사이의 법적 구속력 있는 계약 내용입니다.
			
이음은 전문가회원이 이음에서 상품을 게시하고 판매할 수 있는 온라인 플랫폼입니다. 전문가회원은 이음에서 상품 제작, 편집, 판매에 관하여 회사와 계약을 체결하고 크리에이팅 서비스를 제공받을 수 있으며, 크리에이팅 서비스 수수료 및 상품 판매에  관한 정보를 확인할 수 있습니다.
					
해당 사이트 관련하여 회사는 이 약관 외에도 정산 정책, 크리에이팅 서비스 정책 등(이하 총칭하여 “관련 정책”)을 운영할 수 있으며 관련 정책은 이 약관과 동일한 법적 효력을 가집니다.
					
이 약관 및 정산 정책, 크리에이팅 서비스 정책을  이용 전 확인하시기 바랍니다.
					
					" readonly></textarea><br>
					
					<input type="checkbox" class="agreement" value="0" required> <label>개인정보 수집 및 이용동의</label><br>
					<textarea class="input-form" placeholder="
1.1 등록
크리에이터센터의 여러 기능에 액세스하고 이를 이용하려면 크리에이터회원 등록이 필요합니다. 회사는 기본적으로 회원의 등록신청을 승인합니다. 다만, 회원이 등록에 필요한 정보의 제공을 거부하거나 타인 또는 허위의 정보를 제공하는 경우 승인이 거부될 수 있고, 물리적ㆍ기술적 사유로 승인이 지연될 수 있습니다.
					
1.2 등록해지
회원은 언제든지 크리에이터회원 등록해지신청을 할 수 있습니다. 다만, 회사와 크리에이터회원 간에 권리 또는 의무가 잔존하는 경우에는 등록해지신청의 승인이 거부될 수 있습니다.
					
1.3 회원정보의 갱신
회원은 성명, 연락처, 주소 등 회원정보가 변경된 경우 지체없이 크리에이터센터에 저장된 회원정보를 갱신하여야 합니다. 만일 회원정보를 갱신하지 아니함으로 인하여 회사 또는 회원에게 손해가 발생하는 경우 이에 관한 책임은 회원이 부담합니다.
					" readonly></textarea><br>
					</div>
					<div><input type="checkbox" class="agreement" value="0" required> <label> 상담전문가의 개인정보보호 의무 안내 및 동의</label>
					<textarea class="input-form" placeholder="
4.1 저작권의 이용허락
크리에이터회원은 본인이 단독으로 저작권을 보유하는 클래스에 대하여 회사에게 독점적 또는 비독점적으로 이용을 허락할 수 있고, 제3자와 공동으로 저작권을 보유하는 클래스에 대하여는 모든 공유자의 동의를 받아 회사에게 독점적 또는 비독점적으로 이용을 허락할 수 있습니다. 이용허락과 관련하여 회사의 고의 또는 과실이 없음에도 불구하고 회사와 제3자 사이에 분쟁이 발생하는 경우 크리에이터회원은 자신의 비용과 책임으로 회사를 면책시켜야 합니다. 만일 크리에이터회원이 회사에 대하여 독점적인 클래스 이용허락을 하는 경우 크리에이터회원은 그 이용기간 동안 제3자에게 해당 클래스와 동일하거나 주제, 개요, 소재, 기법 등이 유사한 콘텐츠를 이용하거나 그 이용을 허락할 수 없습니다. 크리에이터회원은 독점적 또는 비독점적 이용허락기간 동안 해당 클래스 저작권의 일부 또는 전부를 제3자에게 양도(신탁을 포함하되 이에 제한하지 아니함)하거나 담보로 제공할 수 없습니다.
					
4.2 저작권의 귀속
크리에이팅 서비스에 의하여 창작되는 클래스 저작권의 전부 또는 일부는 크리에이팅 서비스정책 등 관련 정책에 따라 회사에 귀속됩니다.
					
4.3 제3자 저작물의 이용
클래스에 제3자의 저작물 이용이 포함되어 있는 경우 크리에이터회원은 제3자와의 사이에 저작권 이용에 관한 협의, 정산 등을 완전하게 이행하여야 하며 회사는 이에 대하여 어떠한 형태의 책임도 부담하지 아니합니다. 이와 관련하여 제3자와 회사 간에 법적 분쟁이 발생하는 경우 크리에이터회원은 자신의 비용과 책임으로 회사를 면책시켜야 합니다. 다만, 서비스 지역의 법령, 정책 등에 따라 회사가 저작권신탁관리업자 등 제3자에게 클래스 판매량에 비례하는 저작권 이용에 대한 대가를 지급하여야 하는 경우 회사는 이용대가를 지급하고 크리에이터회원에게 지급할 정산금에서 그 이용대가를 공제할 수 있습니다.
					
4.4 마케팅, 홍보 등을 위한 저작물 이용
회사는 클래스를 포함하여 크리에이터로부터 이용허락 받은 저작물을 마케팅, 홍보를 위하여 자유롭게 이용할 수 있으며, 필요한 범위 내에서 2차적저작물을 작성하고 이용할 수 있습니다. 다만, 특정 클래스에 대한 크리에이팅 서비스가 중단되는 경우 회사는 그 클래스 또는 이와 관련한 2차적저작물을 더이상 이용할 수 없습니다.
					" readonly></textarea>
					</div>
					
				</div>
			</div>
			
		<br>
		<input type="hidden" name = "memberNo" value="${sessionScope.member.memberNo}">
		<button class="btn bc1 bs5" type="submit" >다음</button>
	</div>
	</form>
</div>

	
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<script src="https://kit.fontawesome.com/2fade9eaba.js" crossorigin="anonymous">
$(function(){
	$('#man').click();
})

	
	function formCheck(){
		checkAll = true;
		console.log("인풋체크> "+inputCheck);
		for(let i = 0; i < inputCheck.length; i++){
			if(inputCheck[i] == false){
				checkAll = false;
			}
		}
		console.log("체크올> "+checkAll);
		if(checkAll){
			$("#joinButton").attr("disabled",false);
		}else{
			$("#joinButton").attr("disabled",true);
		}
	}
	
//1.button 활성화
//2.submit 유효성
let inputCheck = new Array(7).fill(true);
let checkAll = true;
console.log(checkAll);


//체크박스 전체선택 해제
$('.mainagreement').on('click',function(){ 
    $('.agreement:not(:disabled)').not(this).prop('checked', this.checked);
});
//체크박스 개별요소
$('.agreement').on('click',function(){ 
    if($('.agreement:not(:disabled)').length == $('.agreement:checked').length){
        $('.mainagreement').prop('checked',true);
    }else{
        $('.mainagreement').prop('checked',false);
    }
});
//val 전체 값 0,1 변경
$("input[name=chkall]").change(function(){
	var chk = $(this).prop("checked");
	if(chk){
		$(this).val(1);
		$(".agreement").val(1);
	}else{
		$(this).val(0);
		$(".agreement").val(0);
	}
});
//val 값 0,1 변경
$(".agreement").change(function(){
	var chk = $(this).prop("checked");
	if(chk){
		$(this).val(1);
	}else{
		$(this).val(0);
	}
});

</script>
</body>
</html>