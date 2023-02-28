package micky.sports.shop.service.product;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.ProductDao;
import micky.sports.shop.dao.ReviewDao;
import micky.sports.shop.dto.ProductDto;
import micky.sports.shop.dto.ReviewDto;
import micky.sports.shop.service.MickyServiceInter;

public class ProductChartService implements MickyServiceInter{
	private SqlSession sqlSession;
	private HttpSession httpsession;
	
	public ProductChartService(SqlSession sqlSession,HttpSession httpsession) {
		this.sqlSession=sqlSession;
		this.httpsession = httpsession;
	}
		@Override
	public void execute(Model model) {
		
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=
				(HttpServletRequest)map.get("request");	

		//로그인 세션
		httpsession = request.getSession();
		String loginId = (String)httpsession.getAttribute("loginid");
	
		
		ProductDao Pdao=sqlSession.getMapper(ProductDao.class);
		model.addAttribute("productChart",Pdao.productChart());
		
		//시간별
		Date today=new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("HH");
		String simpleTime = simpleDateFormat.format(today);
		
		model.addAttribute("pdtTimeChart", Pdao.pdtTimeChart(simpleTime));
	
		//리뷰
		ReviewDao rdao=sqlSession.getMapper(ReviewDao.class);
		ArrayList<ReviewDto> chartScore_top5=rdao.chartScore_top5();
		
		ArrayList<ProductDto> maleScore_top5=rdao.maleScore_top5();
		ArrayList<ProductDto> femaleScore_top5=rdao.femaleScore_top5();

		model.addAttribute("chartScore_top5", chartScore_top5);
		model.addAttribute("maleScore_top5", maleScore_top5);
		model.addAttribute("femaleScore_top5", femaleScore_top5);
		
	}

}
