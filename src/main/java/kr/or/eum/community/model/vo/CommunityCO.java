package kr.or.eum.community.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class CommunityCO {
	private int cmntNo;
	private int memberNo;
	private String cmntContent;
	private String cmntDate;
	private int comNo;
	private int cmntRef;
}
