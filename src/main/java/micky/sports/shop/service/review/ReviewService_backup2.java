package micky.sports.shop.service.review;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.ReviewDao;
import micky.sports.shop.dto.ReviewDto;
import micky.sports.shop.service.MickyServiceInter;

public class ReviewService_backup2 implements MickyServiceInter{

	private SqlSession sqlSession;
	private HttpSession httpSession;
	
	public ReviewService_backup2(SqlSession sqlSession,HttpSession httpsession) {
		this.sqlSession=sqlSession;
		this.httpSession = httpsession;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println(">>>>ReviewService");
	
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=
				(HttpServletRequest) map.get("request");
		
		httpSession = request.getSession();
		String loginId = (String)httpSession.getAttribute("loginid");
		
		
		ServletContext application=request.getSession().getServletContext();
		String p_name=(String)application.getAttribute("pname");
		String p_filesrc=(String)application.getAttribute("pfilesrc");
		
		System.out.println("pname : "+p_name);
		System.out.println("pfilesrc : "+p_filesrc);
		
		String r_no=request.getParameter("r_no");
		
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
		
		int totalCount=0;
		totalCount=rdao.totalCount(p_name);
//		int totalStarscore=rdao.totalStarscore(p_name);
		double avgStarscore=0;
		avgStarscore=rdao.avgStarscore(p_name);

		
//		if(avgStarscore!=Double.NaN) {
//			avgStarscore=rdao.avgStarscore(p_name);
//			System.out.println("avgStarscore : "+avgStarscore);
//		}else {
//			int a=(int)avgStarscore;
//			a=(int)rdao.avgStarscore(p_name);
//			System.out.println("a : "+a);
//		}
		
		
//		if (avgStarscore!=Double.NaN) {
//			avgStarscore=rdao.avgStarscore(p_name);
//			System.out.println("확인! avgStarscore"+avgStarscore);
//		}else {
//			String ass=String.valueOf(avgStarscore);
//			System.out.println("ass : "+ass);
//		}
		
		System.out.println("avgStarscore : "+avgStarscore);
		
//		if(Double.valueOf(avgStarscore) instanceof Double) {
//			System.out.println("avgStarscore : "+avgStarscore);
//			model.addAttribute("avgStarscore", avgStarscore=rdao.avgStarscore(p_name));
//		}else if(avgStarscore==0.0){
//			int avgIntStarscore=(int) rdao.avgStarscore(p_name);
//			System.out.println("int로 형변환 avgIntStarscore :"+avgIntStarscore);
//			model.addAttribute("avgStarscore", avgIntStarscore);
//		}
		
		ArrayList<ReviewDto> review_list=rdao.reviewboard(selectType,searchKeyword,p_name);
		
		model.addAttribute("review_list", review_list);
//		검색어 유지기능
		model.addAttribute("resk",searchKeyword);
//		총게시글
		model.addAttribute("totalCount", totalCount);
//		별점평균
		model.addAttribute("avgStarscore", avgStarscore);
//		model.addAttribute("avgStarscore", tmp);
	}
	
//	private int parseStringToDouble(String value) {
//	    return value == Double.NaN ? Integer.parseInt(value) : Double.parseDouble(value);
//	}
	
}
