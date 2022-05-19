package kr.or.eum.manager.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class FaQ {
	private int FaQNo;
	private int memberNo;
	private String FaQTitle;
	private long FaQContent;
	private String FaQType;
	private String FaQDate;
}
