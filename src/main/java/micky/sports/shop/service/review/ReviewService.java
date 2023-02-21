package micky.sports.shop.service.review;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.support.ReplaceOverride;
import org.springframework.ui.Model;

import micky.sports.shop.dao.ReviewDao;
import micky.sports.shop.dto.ReviewDto;
import micky.sports.shop.service.MickyServiceInter;

public class ReviewService implements MickyServiceInter{

	private SqlSession sqlSession;
	private HttpSession httpSession;
	
	public ReviewService(SqlSession sqlSession,HttpSession httpsession) {
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
		
//		총게시글 수
		int totalCount=0;
		totalCount=rdao.totalCount(p_name);
//		별점평균
		double avgStarscore=0;
		avgStarscore=rdao.avgStarscore(p_name);

		
		System.out.println("avgStarscore : "+avgStarscore);
		

		ArrayList<ReviewDto> review_list=rdao.reviewboard(selectType,searchKeyword,p_name);
//		for (ReviewDto reviewDto : review_list) {
//			System.out.println("reviewDto : "+reviewDto.getM_id());
//			System.out.println("getMemberDto_m_id : "+reviewDto.getMemberDto().getM_id());
//			String midcheck=reviewDto.getMemberDto().getM_id().replace(reviewDto.getMemberDto().getM_id(), "M_idcheck");
//			String midcheck=reviewDto.getMemberDto().getM_id().replace(reviewDto.getMemberDto().getM_id(), "M_idcheck");
//			String subStrM_id=midcheck.substring(0, midcheck.length()-2)+"**";
//			System.out.println("substr_mid : "+subStrM_id);
//			model.addAttribute("subStrM_id", subStrM_id);
			
//			String sub_mid=reviewDto.getMemberDto().getM_id();
//			String subStrM_id=sub_mid.substring(0, sub_mid.length()-2)+"**";
//			System.out.println("substr_mid : "+subStrM_id);
//			model.addAttribute("subStrM_id", subStrM_id);
//		}
		
		
		model.addAttribute("review_list", review_list);
//		검색어 유지기능
		model.addAttribute("resk",searchKeyword);
//		총게시글
		model.addAttribute("totalCount", totalCount);
//		별점평균
		model.addAttribute("avgStarscore", avgStarscore);
	}
	
}
