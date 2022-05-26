package kr.or.eum.manager.model.vo;

import java.util.ArrayList;

import kr.or.eum.product.model.vo.Payment;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class PaymentPageData {
	private ArrayList<Payment> list;
	private String pageNavi;
}
