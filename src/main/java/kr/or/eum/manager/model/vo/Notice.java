package kr.or.eum.manager.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Notice {
	private int noticeNo;
	private int memberNo;
	private String noticeTitle;
	private String noticeContent;
	private String noticeDate;
	
	private String memberId;
}
