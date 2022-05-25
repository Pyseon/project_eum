package kr.or.eum.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ExpertAndCompany {
	//파일은 제외함
	private int compNo;
	private int expertNo;
	private int compCategory;
	private String compRepName;
	private String compName;
	private String compRegno;
	private String compAddr;
	private String compPhone;
	private String compEmail;
	private int memberNo;
	private String expertCategory;
	private String expertTag;
	private String credential;
	private String issuingAuthority;
	private String acquistionDate;
	private String expertName;
	private String expertPhone;
	private String expertEmail;
	private String expertContent;
	private String jobName;
}
