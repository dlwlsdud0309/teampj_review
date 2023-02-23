package micky.sports.shop.service.review;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.ReviewDao;
import micky.sports.shop.dto.OrderMemberDto;
import micky.sports.shop.dto.ReviewDto;
import micky.sports.shop.service.MickyServiceInter;

public class ReviewMylistviewService implements MickyServiceInter{

	private SqlSession sqlSession;
	private HttpSession httpSession;
	
	public ReviewMylistviewService(SqlSession sqlSession,HttpSession httpsession) {
		this.sqlSession=sqlSession;
		this.httpSession = httpsession;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println(">>>ReviewMylistService");
		
//		model에서 request를 풀어내는 방법
		Map<String, Object> map=model.asMap(); //model을 Map으로 변환
		HttpServletRequest request=
				(HttpServletRequest) map.get("request");
		
		httpSession = request.getSession();
		String loginId = (String)httpSession.getAttribute("loginid");
				
		ReviewDao rdao=sqlSession.getMapper(ReviewDao.class);
//		null값 포함하여 구매내역에서 리뷰작성이 가능한 목록
		ArrayList<OrderMemberDto> review_orderlist=rdao.reviewOrderlist(loginId);
//		null값 제외, 리뷰작성된 목록
		ArrayList<ReviewDto> review_mylist=rdao.mylistview(loginId);
		
		
//		적립가능한 cash/마일리지
		int Mileage=rdao.checkMileage(loginId);
		int checkMileage=0;
		int maxMileage=1000;
		checkMileage=Mileage*maxMileage;
		
		model.addAttribute("review_orderlist", review_orderlist);
		model.addAttribute("review_mylist", review_mylist);
		model.addAttribute("checkMileage", checkMileage);
	}
}
