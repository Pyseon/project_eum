package kr.or.eum.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ExpertAndMember {
	private int expertNo;
	private String expertName;
	private int memberNo;
	private String memberPictureName;
	private String memberPicturePath;
}
