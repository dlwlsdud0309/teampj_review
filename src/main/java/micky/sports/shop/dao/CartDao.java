package micky.sports.shop.dao;

import java.util.ArrayList;
import java.util.List;

import micky.sports.shop.dto.CartDto;
import micky.sports.shop.dto.ProductDto;

public interface CartDao {

	public ArrayList<ProductDto> Productlist();

	public ProductDto Detaillist(String p_no);

	public void insertCart(String m_id, String p_no, String p_cnt);

	public ArrayList<CartDto> Cartlist(String m_id);

	public void Deletelist(String c_no);

	public void plusCartcount(String c_no, String p_no);

	public void minusCartcount(String c_no);

//	public ArrayList<CartDto> CartSelectOptionlist(String c_no);
	public CartDto CartSelectOptionlist(String c_no);

	public int CartOptionModify(String p_color, String p_size, String c_cnt, String c_no, String p_name);

	public void AllDeletelist(String c_no);

	public int checkCartlist(String m_id, String p_no);

	public int checkCartlist2(String m_id, String p_no, String c_no, String p_category, String c_no2, String p_name);

	public List<CartDto> cartChartList();
	//해당상품의 사이즈 옵션들
	public List<ProductDto> ProductSizeoption(String p_no);
	
	


	

	

	

}
