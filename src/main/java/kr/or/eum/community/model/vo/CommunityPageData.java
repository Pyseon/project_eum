package kr.or.eum.community.model.vo;

import lombok.Data;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class CommunityPageData {
	private ArrayList<Community> list;
	private String pageNavi;
}
