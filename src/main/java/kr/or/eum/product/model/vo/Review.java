package kr.or.eum.product.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Review {
	private int reviewNo;
	private int payNo;
	private int memberNo;
	private int productNo;
	private String reviewTitle;
	private String reviewContent;
	private int reviewStar;
	private String reviewDate;
}
