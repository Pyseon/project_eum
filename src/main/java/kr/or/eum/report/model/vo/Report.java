package kr.or.eum.report.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Report {
	private int reportNo;
	private int memberNo;
	private String reportContent;
	private String reportDate;
	private int reportCategory;
	private int reportIndex;
	private String reportTitle;
}
