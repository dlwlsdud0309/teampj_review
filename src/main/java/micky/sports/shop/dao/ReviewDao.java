package micky.sports.shop.dao;

import java.util.ArrayList;

import micky.sports.shop.dto.MemberDto;
import micky.sports.shop.dto.ReviewDto;

public interface ReviewDao {
	public ArrayList<ReviewDto> ReviewDto();
	
	
	public ArrayList<ReviewDto> reviewboard(int start, int end);
	
//	public void write(String r_title,String r_content,String r_filesrc);
	public void write(String m_id,String r_title,String r_content,String r_filesrc,String r_point);
	public void delete(String r_no);
	
//	public ArrayList<ReviewDto> mylistview(String account);
	public ArrayList<ReviewDto> mylistview();
//	public ReviewDto mylistview();
	
//	public ArrayList<ReviewDto> popupview(String r_no);
	public ReviewDto popupview(String r_no);
	
//	public ReviewDto popupupdate(String r_no);
	
//	public void modify(String r_no, String m_id, String r_title, String r_content);
	public void modify(String r_no, String r_title, String r_content);

//	public int selectReviewboardTotCount();
	
	public void replyview(String r_no);
	
	public ReviewDto getReview(String r_no);
	
	public Integer selectReviewboardTotCount1(String searchKeyword);
	public Integer selectReviewboardTotCount2(String searchKeyword);
}
