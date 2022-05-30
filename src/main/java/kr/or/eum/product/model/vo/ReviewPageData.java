package kr.or.eum.product.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@NoArgsConstructor
@AllArgsConstructor
@Data
public class ReviewPageData {
	
	private ArrayList<ProReviewMember> prm;
	private String pageNavi;
}
