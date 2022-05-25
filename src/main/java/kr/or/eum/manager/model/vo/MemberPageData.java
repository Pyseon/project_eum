package kr.or.eum.manager.model.vo;

import java.util.ArrayList;

import kr.or.eum.member.model.vo.Member;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MemberPageData {
	private ArrayList<Member> list;
	private String pageNavi;
}
