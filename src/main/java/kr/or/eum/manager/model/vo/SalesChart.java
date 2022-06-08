package kr.or.eum.manager.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class SalesChart {
	private int janSales;		//1월달 신규 회원수
	private int febSales;		//2월달 신규 회원수
	private int marSales;		//3월달 신규 회원수
	private int aprSales;		//4월달 신규 회원수
	private int maySales;		//5월달  신규회원수
	private int junSales;		//6월달  신규회원수
	private int julSales;		//7월달  신규회원수
	private int augSales;		//8월달  신규회원수
	private int sepSales;		//9월달  신규회원수
	private int octSales;		//10월달  신규회원수
	private int novSales;		//11월달  신규회원수
	private int decSales;		//12월달  신규회원수
}
