package micky.sports.shop.service.review;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.ReviewDao;
import micky.sports.shop.dto.ReviewDto;
import micky.sports.shop.service.MickyServiceInter;

public class ReviewAdminpageService implements MickyServiceInter{

	private SqlSession sqlSession;
	private HttpSession httpSession;
	
	public ReviewAdminpageService(SqlSession sqlSession,HttpSession httpsession) {
		this.sqlSession=sqlSession;
		this.httpSession = httpsession;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println(">>>>ReviewAdminpageService");
		
//		model에서 request를 풀어내는 방법
		Map<String, Object> map=model.asMap(); //model을 Map으로 변환
		HttpServletRequest request=
				(HttpServletRequest) map.get("request");
		
		httpSession = request.getSession();
		String loginId = (String)httpSession.getAttribute("loginid");
		
		ReviewDao rdao=sqlSession.getMapper(ReviewDao.class);
		
//		평균별점으로 제품 나열
//		ArrayList<ReviewDto> reviewChartScoreDesc=rdao.reviewChartScoreDesc();
		//reviewChartScoreDesc=rdao.reviewChartScoreDesc();
		
//		String avgscore="";
//		for (ReviewDto val : reviewChartScoreDesc) {
//			if (val.equals("avgscore")) {
//				model.addAttribute(avgscore, "avgscore");
//				System.out.println("아무것도안나오나여 : "+avgscore);
//			}
//		}
		
	//	model.addAttribute("reviewChartScoreDesc", reviewChartScoreDesc);
	}

}
