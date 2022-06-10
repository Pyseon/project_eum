package kr.or.eum.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Expert {
	private int expertNo;				//전문가 번호
	private int memberNo;				//회원 번호
	private String expertCategory;		//카테고리
	private String expertTag;			//태그
	private String credential;			//자격증 명
	private String issuingAuthority;	//발급기관
	private String acquistionDate;		//취득일시
	private String certificateName;		//자격증 사본 이름
	private String certificatePath;		//자격증 사본 경로
	private String expertName;			//전문가 이름
	private String expertPhone;			//전문가 전화 번호
	private String expertEmail;			//전문가 이메일
	private String expertContent;		//상세 설명
	private String jobName;				//직업명
	private String expertPr;			//자기소개
	private String expertcareer;		//경력
	private String expertIntro;			//자기소개 한마디
	private int expertApp;				//승인상태
}
