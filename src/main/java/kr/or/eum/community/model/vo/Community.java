package kr.or.eum.community.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Community {
	private int commNo;
	private int commCategory;
	private int memberNo;
	private String memberNick;
	private String memberGrade;
	private String memberPicturepath;
	private String commTitle; 
	private String commIntro;
	private String commContent;
	private String advantage; 
	private String weakness;
	private int readCount;
	private String commDate;
	private String commLike;
	private String commFilename;
	private String commFilepath;
	private int cmntCount;
}
