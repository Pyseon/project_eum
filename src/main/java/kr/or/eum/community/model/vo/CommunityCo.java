package kr.or.eum.community.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class CommunityCo {
	private int cmntNo;
	private int memberNo;
	private String memberNick;
	private String memberGrade;
	private String memberPicturepath;
	private String cmntContent;
	private String cmntDate;
	private int commNo;
	private int cmntRef;
	private String cmntRefNick;
	private int cmntLev;
	private int cmntGroup;
}
