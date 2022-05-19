package kr.or.eum.manager.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Question {
	private int qstNo;
	private int memberNo;
	private String qstTitle;
	private long qstContent;
	private String qstEmail;
	private String qstDate;
	private String qstFileName;
	private String qstFilePath;
}
