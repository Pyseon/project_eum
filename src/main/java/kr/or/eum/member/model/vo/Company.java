package kr.or.eum.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Company {
	private int compNo;
	private int expertNo;
	private int compCategory;
	private String compRepName;
	private String compName;
	private String compRegno;
	private String compFilename;
	private String compFilepath;
	private String compAddr;
	private String compPhone;
	private String compEmail;
}
