package micky.sports.shop.dao;

import java.util.ArrayList;

import micky.sports.shop.dto.MemberDto;
import micky.sports.shop.dto.ReviewDto;

public interface ReviewDao {
	public ArrayList<ReviewDto> ReviewDto();
	public ArrayList<MemberDto> MemberDto(); //join처리 위해 썼는데 없어도 됨
	
	public void reviewmember();
	
	public ArrayList<ReviewDto> reviewboard();
	public void write(String r_title,String r_content,String r_filesrc);
}
