package kr.or.eum.manager.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class FaQ {
	private int FAQNo;
	private String FAQTitle;
	private String FAQContent;
	private int FAQType;
	private String FAQDate;
}
