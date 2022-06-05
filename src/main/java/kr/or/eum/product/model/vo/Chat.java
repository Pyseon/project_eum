package kr.or.eum.product.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Chat {
	private int chatNo;
	private int counselNo;
	private int memberNo;
	private String chatContent;
	private String chatDate;
	private String chatTime;
	private int chatReadcheck;
}
