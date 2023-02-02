package micky.sports.shop.service.review;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.ReviewDao;
import micky.sports.shop.dto.ReviewDto;
import micky.sports.shop.service.MickyServiceInter;

public class ReviewPopupcontentviewService implements MickyServiceInter{

	SqlSession sqlSession;
	
	public ReviewPopupcontentviewService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println(">>>ReviewPopupviewService");
		
//		model에서 request를 풀어내는 방법
		Map<String, Object> map=model.asMap(); //model을 Map으로 변환
		HttpServletRequest request=
				(HttpServletRequest) map.get("request");
		
		String r_no=request.getParameter("r_no");
//		int r_no1=Integer.parseInt(r_no);
		
		ReviewDao rdao=sqlSession.getMapper(ReviewDao.class);
		ArrayList<ReviewDto> popup_list=rdao.popupview(r_no);
		
		for (ReviewDto reviewDto : popup_list) {
			System.out.println(reviewDto.getR_no()); //결과 확인
		}
		
		model.addAttribute("popup_list", popup_list);
	}

}
