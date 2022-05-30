package kr.or.eum.report.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class AnswerReport {
	private int ansrptNo;
	private int reportNo;
	private String ansrptTitle;
	private String ansrptContent;
	private int ansrptIs;
}
