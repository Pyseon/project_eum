package kr.or.eum.request.model.vo;

import java.util.ArrayList;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class RequestAskPageData {
	private ArrayList<RequestAsk>list;
}
