package kr.or.eum.community.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class PickLike {
	private int pickLikeNo;
	private int memberNo;
	private int pickNo;
}
