package kr.or.eum.product.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Ideamarket {
	
	private int productNo;
	private int marketfileNo;
	private int marketType;
	private String marketName;
	private String marketPath;
}
