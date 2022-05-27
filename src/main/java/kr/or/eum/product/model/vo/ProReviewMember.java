package kr.or.eum.product.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ProReviewMember {
	
	private int productNo;
	private int expertNo;
	private int reviewStar;
	private int memberNo;
	private String reviewNo;
	private String reviewContent;
	private String reviewDate;
	private String memberNick;
	private String memberPictureName;
	private String memberPicturePath;
}
