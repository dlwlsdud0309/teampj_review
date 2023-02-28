package micky.sports.shop.service.product;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.ProductDao;
import micky.sports.shop.dao.ReviewDao;
import micky.sports.shop.dto.ProductDto;
import micky.sports.shop.dto.ReviewDto;
import micky.sports.shop.service.MickyServiceInter;

public class ProductDetail_ReviewService implements MickyServiceInter{
	private SqlSession sqlSession;
	private HttpSession httpsession;
	
	public ProductDetail_ReviewService(SqlSession sqlSession,HttpSession httpsession) {
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
		
		String pname=request.getParameter("pname");
		String pfilesrc=request.getParameter("pfilesrc");
		System.out.println("====**"+pfilesrc+pname);
		
		ProductDao Pdao=sqlSession.getMapper(ProductDao.class);
		model.addAttribute("productMain",Pdao.productMain(pname));
		model.addAttribute("product",Pdao.product(pname,pfilesrc));
		
		//하단리뷰
		ServletContext application=request.getSession().getServletContext();
		String p_name=pname;
		String p_filesrc=pfilesrc;
		
		System.out.println("pname : "+p_name);
		System.out.println("pfilesrc : "+p_filesrc);
		
		//String r_no=request.getParameter("r_no");
		
//		검색기능
		String selectType=request.getParameter("selectType");
		
		String r_group="";
		String r_score="";
		
		if (selectType==null||selectType.equals("")) {
			selectType="r_group";
		}
		
//		searchKeyword 가져오기
		String searchKeyword=request.getParameter("searchKeyword");
		if (searchKeyword==null||searchKeyword.equals("")) {
			searchKeyword="";
		}
		System.out.println("sk : "+searchKeyword);

		ReviewDao rdao=sqlSession.getMapper(ReviewDao.class);
		
//		총게시글 수
		int totalCount=0;
		totalCount=rdao.totalCount(p_name);
//		별점평균
		double avgStarscore=0;
		avgStarscore=rdao.avgStarscore(p_name);

		ArrayList<ReviewDto> review_list=rdao.reviewboard(selectType,searchKeyword,p_name);
		
		model.addAttribute("review_list", review_list);
//		검색어 유지기능
		model.addAttribute("resk",searchKeyword);
//		총게시글
		model.addAttribute("totalCount", totalCount);
//		별점평균
		model.addAttribute("avgStarscore", avgStarscore);
		
//		reviewBoard에서 productInfo 사용
		ArrayList<ProductDto> productinfo=rdao.productInfo(p_name,p_filesrc);
		model.addAttribute("productinfo", productinfo);
	}

}
