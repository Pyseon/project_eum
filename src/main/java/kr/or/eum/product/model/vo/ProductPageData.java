package kr.or.eum.product.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ProductPageData {
	private ArrayList<Product>list;
	private String pageNavi;

}
