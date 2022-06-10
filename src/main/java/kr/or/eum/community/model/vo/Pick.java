package kr.or.eum.community.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Pick {
	private int pickNo;
	private int pickCategory;
	private int memberNo;
	private String memberNick;
	private int memberGrade; 
	private String memberPicturepath;
	private String pickContent;
	private String pickDate;
	private int commNo;
	private int pickLike;
	private int pickLikeMemberCheck;
	
}
