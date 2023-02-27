package micky.sports.shop.dao;

import java.util.ArrayList;

import micky.sports.shop.dto.OrderMemberDto;
import micky.sports.shop.dto.ProductDto;
import micky.sports.shop.dto.ReviewDto;

public interface ReviewDao {
	public ArrayList<ReviewDto> reviewboard(String selectType, String searchKeyword, String p_name);
	public void write(String loginid, String r_title, String r_content, String r_filesrc, String r_score, String p_no, String om_cntnum);
	public void delete(String r_no);
	public ArrayList<OrderMemberDto> reviewOrderlist(String loginid);
	public OrderMemberDto reviewWrite_orderlist(String loginid,String om_cntnum);
	public ArrayList<ReviewDto> mylistview(String loginid);
	public ReviewDto popupview(String r_no);
	public void modify(String r_no, String r_title, String r_content, String r_score, String r_filesrc);
	public void modify2(String r_no, String r_title, String r_content, String r_score);
	public ReviewDto replyview(String r_no);
	public void replyUpdate(String r_no, String r_id, String r_retitle, String r_recontent);
	public ReviewDto getReview(String r_no);
	public int totalCount(String p_name);
	public void replydelete(String r_no);
	public double avgStarscore(String p_name);
	public int checkMileage(String loginid);
	public ArrayList<ReviewDto> chartScore_top5();
	public ArrayList<ReviewDto> reviewAdmin_ScoreDesc();
	public ArrayList<ProductDto> productInfo(String p_name, String p_filesrc);
}
