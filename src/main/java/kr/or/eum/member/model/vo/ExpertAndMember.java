package kr.or.eum.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ExpertAndMember {
	private int expertNo;
	private int memberNo;
	private String expertCategory;
	private String expertTag;
	private String credential;
	private String issuingAuthority;
	private String acquistionDate;
	private String certificateName;
	private String certificatePath;
	private String expertName;
	private String expertPhone;
	private String expertEmail;
	private String expertContent;
	private String jobName;
	private String expertPr;
	private String expertcareer;
	private String expertIntro;
	private String memberId;
	private String memberPw;
	private String memberNick;
	private String memberPhone;
	private int memberPoint;
	private int memberReportCount;
	private int gender;
	private String birth;
	private int agreement;
	private int grade;
	private String memberPictureName;
	private String memberPicturePath;
	private String enrollDate;
}
