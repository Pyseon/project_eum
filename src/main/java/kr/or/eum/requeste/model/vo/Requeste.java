package kr.or.eum.requeste.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Requeste {
	
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
