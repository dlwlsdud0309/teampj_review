package micky.sports.shop.service.review;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.ReviewDao;
import micky.sports.shop.dto.ProductDto;
import micky.sports.shop.dto.ReviewDto;
import micky.sports.shop.service.MickyServiceInter;

public class ReviewChartService implements MickyServiceInter{

	private SqlSession sqlSession;
	private HttpSession httpSession;
	
	public ReviewChartService(SqlSession sqlSession,HttpSession httpsession) {
		this.sqlSession=sqlSession;
		this.httpSession = httpsession;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println(">>>>ReviewChartService");
		
//		model에서 request를 풀어내는 방법
		Map<String, Object> map=model.asMap(); //model을 Map으로 변환
		HttpServletRequest request=
				(HttpServletRequest) map.get("request");
		
		httpSession = request.getSession();
		String loginId = (String)httpSession.getAttribute("loginid");
		
		ReviewDao rdao=sqlSession.getMapper(ReviewDao.class);
		ArrayList<ReviewDto> chartScore_top5=rdao.chartScore_top5();
		
		ArrayList<ProductDto> maleScore_top5=rdao.maleScore_top5();
		ArrayList<ProductDto> femaleScore_top5=rdao.femaleScore_top5();
		
		
//		for (ReviewDto val : chartScore_top5) {
//			System.out.println(val.getProductDto().getP_name());
//		}
		
		for (ProductDto val : maleScore_top5) {
		System.out.println("남자순위"+val.getP_name());
		}
		
		model.addAttribute("chartScore_top5", chartScore_top5);
		model.addAttribute("maleScore_top5", maleScore_top5);
		model.addAttribute("femaleScore_top5", femaleScore_top5);
	}

}
