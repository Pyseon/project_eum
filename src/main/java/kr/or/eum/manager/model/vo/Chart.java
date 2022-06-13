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
	
	private long totalSales;		//이달 판매 총액
	private long totalChat;		//이달 상담 총액
	private long totalClass;		//이달 클래스 총액
	private long totalIdea;		//이달 지식마켓 총액
}
