package kr.or.eum.request.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class RequestAsk {
	private int reqaskNo;
	private int reqNo;
	private int expertNo;
	private int memberNo;
	private String expertName;

}
