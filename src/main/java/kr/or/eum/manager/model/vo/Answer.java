package kr.or.eum.manager.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Answer {
	private int ansNo;
	private int qstNo;
	private int memberNo;
	private String ansTitle;
	private String ansContent;
	private String ansEmail;
	private String ansDate;
	private int ansState;
	
	private String memberNick;
}
