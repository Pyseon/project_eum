package kr.or.eum.report.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Report {
	private int reportNo;
	private int defendant;		//신고받은사람
	private int plaintiff;		//신고한 사람
	private String reportContent;
	private String reportDate;
	private int reportCategory;
	private int reportIndex;
	private String reportTitle;
	
	private String defendantId;
	private String plaintiffId;
}
