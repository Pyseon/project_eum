package kr.or.eum.manager.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MemberChart {
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
}
