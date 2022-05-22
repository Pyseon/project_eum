package kr.or.eum.community.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Community {
	private int comNo;
	private int comCategory;
	private int memberNo;
	private String memberNick;
	private String comTitle; 
	private String comContent;
	private String advantage; 
	private String weakness;
	private int readCount;
	private String comDate;
	private String comLike;
	private String comFilename;
	private String comFilepath;
}
