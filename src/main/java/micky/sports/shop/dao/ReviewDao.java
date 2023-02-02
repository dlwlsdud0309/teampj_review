package micky.sports.shop.dao;

import java.util.ArrayList;

import micky.sports.shop.dto.MemberDto;
import micky.sports.shop.dto.ReviewDto;

public interface ReviewDao {
	public ArrayList<ReviewDto> ReviewDto();
	
	
	public ArrayList<ReviewDto> reviewboard();
//	public void write(String r_title,String r_content,String r_filesrc);
	public void write(String m_id,String r_title,String r_content,String r_filesrc);
	public void delete(String r_no);
	
//	public ArrayList<ReviewDto> mylistview(String account);
	public ArrayList<ReviewDto> mylistview();
	
	public ArrayList<ReviewDto> popupview(String r_no);

}
