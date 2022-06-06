package kr.or.eum.manager.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Chart {
	private int genderMale;		//남자수
	private int genderFemale;	//여자수
	private int unknownGender;	//성별 확인 불가
	
	private int memberCount;	//총 회원수
	private int generalMember;	//일반 회원수
	private int expertCount;	//총 전문가수
	private int blackCount;		//블랙리스트 수
	private int memberMonth;	//이달 회원수
	private int janMember;		//1월달 신규 회원수
	private int febMember;		//2월달 신규 회원수
	private int marMember;		//3월달 신규 회원수
	private int aprMember;		//4월달 신규 회원수
	private int mayMember;		//5월달  신규회원수
	private int junMember;		//6월달  신규회원수
	private int julMember;		//7월달  신규회원수
	private int augMember;		//8월달  신규회원수
	private int sepMember;		//9월달  신규회원수
	private int octMember;		//10월달  신규회원수
	private int novMember;		//11월달  신규회원수
	private int decMember;		//12월달  신규회원수
	
	private int totalSales;		//이달 판매 총액
	private int totalChat;		//이달 상담 총액
	private int totalClass;		//이달 클래스 총액
	private int totalIdea;		//이달 지식마켓 총액
}
