package kr.or.eum.community.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Request {
	
	private int memberNo;
	private int reqNo;
	private String reqTitle;
	private String reqTag;
	private String reqNick;
	private String reqContent;
	private int reqCount;
	private String reqRfr;
	private String reqAccept;

}
