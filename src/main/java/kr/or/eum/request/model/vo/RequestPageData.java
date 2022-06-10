package kr.or.eum.request.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class RequestPageData {
	private ArrayList<Request> list;
	private String pageNavi;
	
}
