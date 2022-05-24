package kr.or.eum.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Member {
	private int memberNo;
	private String memberId;
	private String memberPw;
	private String memberNick;
	private String memberPhone;
	private int memberPoint;
	private int memberReportcount;
	private int gender;
	private String birth;
	private int agreement;
	private int grade;
	private String memberPicturename;
	private String memberPicturepath;
	private String enrolldate;
}
