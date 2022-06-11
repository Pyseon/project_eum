package kr.or.eum.request.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Request {
	
	private int reqNo;
	private int memberNo;
	private String reqTitle;
	private String reqCategory;
	private String reqTag;
	private String reqNick;
	private String reqContent;
	private int reqCount;
	private String reqDate;
	private String reqRfr;
	private String reqAccept;
	private String memberPicturepath;
	private int reqAsk;

}
