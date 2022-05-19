package kr.or.eum.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Expert {
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
}
