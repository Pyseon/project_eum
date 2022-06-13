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
	private String expertName;
	private String expertCategory;
	private String memberPicturepath;
	private int selectExpert;
}
