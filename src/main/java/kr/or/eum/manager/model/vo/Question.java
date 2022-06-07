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
	private String qstContent;
	private String qstDate;
	private int ansState;
	
	private String memberId;
}
