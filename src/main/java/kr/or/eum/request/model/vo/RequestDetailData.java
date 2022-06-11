package kr.or.eum.request.model.vo;

import java.util.ArrayList;

import kr.or.eum.member.model.vo.Member;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class RequestDetailData {
	private Request req;
	private String[] tag;
	private ArrayList<RequestAsk> reqaskList;

}
