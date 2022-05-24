package kr.or.eum.product.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Review {
	private int memberNo;
	private int payNo;
	private String reviewNo;
	private String reviewContent;
	private int reviewStar;
	
}
