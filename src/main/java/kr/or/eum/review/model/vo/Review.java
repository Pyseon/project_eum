package kr.or.eum.review.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Review {
	private int memberNo;
	private int productNo;
	private String reviewNo;
	private String reviewContent;
	private int reviewStar;
	
}
