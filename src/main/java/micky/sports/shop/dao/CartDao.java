package micky.sports.shop.dao;

import java.util.ArrayList;

import micky.sports.shop.dto.CartDto;
import micky.sports.shop.dto.ProductDto;

public interface CartDao {

	public ArrayList<ProductDto> Productlist();

	public ProductDto Detaillist(String p_no);

	public void insertCart(String p_no);

	public ArrayList<CartDto> Cartlist(String p_no);

	

	

}
