package kr.or.eum.product.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Counsel {
	private int counselNo;
	private int memberNo;
	private int expertNo;
	private int productNo;
	private int limitTime;
}
