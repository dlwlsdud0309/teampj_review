package micky.sports.shop.service.review;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.ReviewDao;
import micky.sports.shop.dto.MemberDto;
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
	
		//request는 검색창에서 필요
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=
				(HttpServletRequest) map.get("request");
		SearchVO searchVO=
				(SearchVO) map.get("searchVO");
		
		String r_no=request.getParameter("r_no");
		
//		페이지 가져오기
		String strPage=request.getParameter("page");
		if (strPage==null) {
			strPage="1";
		}
		
//		=================================================================
//		searchType 가져오기
		String[] selectType=request.getParameterValues("selectType");
		String r_score="";
		if (selectType!=null) {
			for (String val : selectType) {
				if (val.equals("r_score")) {
					r_score="r_score";
				}
			}
		}
		
//		searchKeyword 가져오기
		String searchKeyword=request.getParameter("searchKeyword");
		if (searchKeyword==null) {
			searchKeyword="";
		}

//		int total=0;
//		if (r_score.equals("")) {
//			
//		}
		
//		=================================================================
		
//		setPage 통해 보내기
		int page=Integer.parseInt(strPage);
		searchVO.setPage(page);

		ReviewDao rdao=sqlSession.getMapper(ReviewDao.class);
		
		
		
		int total=rdao.selectReviewboardTotCount();
		System.out.println("total : "+total);
		
		searchVO.pageCalculate(total);
		
		//계산된 내용 출력
		System.out.println("totRow : "+total);
		System.out.println("clickpage : "+page);
		System.out.println("pageStart : "+searchVO.getPageStart());
		System.out.println("pageEnd : "+searchVO.getPageEnd());
		System.out.println("pageTot : "+searchVO.getTotPage());
		System.out.println("rowStart : "+searchVO.getRowStart());
		System.out.println("rowEnd : "+searchVO.getRowEnd());
		
//		for (ReviewDto reviewDto : review_list) {
//			System.out.println(reviewDto.getM_id());
//			System.out.println("왜 안나오는가 : "+reviewDto.getMemberDto().getM_id());
//		}
		
		int rowStart=searchVO.getRowStart();
		int rowEnd=searchVO.getRowEnd();
		
		ArrayList<ReviewDto> review_list=rdao.reviewboard(rowStart,rowEnd);
//		ReviewDto review_list=rdao.reviewboard(rowStart,rowEnd);
		model.addAttribute("review_list", review_list);
		
		model.addAttribute("totRowcnt", total);
		model.addAttribute("searchVO", searchVO);
		

	}

}
