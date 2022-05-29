package kr.or.eum.community.model.vo;

import java.util.ArrayList;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class CommunityDetailData {
	private Community comm;
	private ArrayList<CommunityCo> cmntList;
}
