package kr.or.eum.manager.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class FaQ {
	private int FAQNo;
	private int memberNo;
	private String FAQTitle;
	private long FAQContent;
	private int FAQType;
	private String FAQDate;
}
