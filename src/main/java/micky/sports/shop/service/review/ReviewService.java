package micky.sports.shop.service.review;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.ReviewDao;
import micky.sports.shop.dto.ReviewDto;
import micky.sports.shop.service.MickyServiceInter;
import micky.sports.shop.vopage.SearchVO;

public class ReviewService implements MickyServiceInter{

	private SqlSession sqlSession;
	
	public ReviewService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println(">>>>ReviewService");
	
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=
				(HttpServletRequest) map.get("request");
		
		String r_no=request.getParameter("r_no");
//		String pname=request.getParameter("pname");
//		System.out.println("pname : "+pname);
		
		
//		검색기능
		String selectType=request.getParameter("selectType");
		System.out.println("selectType : "+selectType);
		
//		searchKeyword 가져오기
		String searchKeyword=request.getParameter("searchKeyword");
		if (searchKeyword==null) {
			searchKeyword="";
		}
		System.out.println("sk : "+searchKeyword);
		
//		검색어 유지기능
		model.addAttribute("resk",searchKeyword);
		


		ReviewDao rdao=sqlSession.getMapper(ReviewDao.class);
//		ArrayList<ReviewDto> review_list=rdao.reviewboard();
		ArrayList<ReviewDto> review_list=rdao.reviewboard(selectType,searchKeyword);


		
		model.addAttribute("review_list", review_list);
	}

}
