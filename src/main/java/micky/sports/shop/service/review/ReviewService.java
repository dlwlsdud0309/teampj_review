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
		
//		총게시글
//		int totalCount=rdao.totalCount();
//		System.out.println(totalCount);
		
//		전체글 수와 검색했을 때 나온 글 수 구별
		int totalCount=0;
		if(r_group.equals("r_group") && r_score.equals("")) {
			totalCount=rdao.totalCount1(searchKeyword);
		}else if(r_group.equals("") && r_score.equals("r_score")) {
			totalCount=rdao.totalCount2(searchKeyword);
		}if(r_group.equals("") && r_score.equals("")) {
			totalCount=rdao.totalCount3(searchKeyword);
		}
		
		ArrayList<ReviewDto> review_list=rdao.reviewboard(selectType,searchKeyword);
		model.addAttribute("review_list", review_list);
//		검색어 유지기능
		model.addAttribute("resk",searchKeyword);
//		총게시글
		model.addAttribute("totalCount", totalCount);
	}

}
