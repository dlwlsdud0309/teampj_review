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

		String om_num=request.getParameter("om_num");
		String p_no=request.getParameter("p_no");
		String om_state=request.getParameter("om_state");
		
		System.out.println("om_num : "+om_num);
		System.out.println("p_no : "+p_no);
		System.out.println("om_state : "+om_state);
		
//		String account=request.getParameter("account");
//		System.out.println("account : "+account);
		
		
		ReviewDao rdao=sqlSession.getMapper(ReviewDao.class);
		ArrayList<ReviewDto> review_mylist=rdao.mylistview(loginId);
		
		
		model.addAttribute("review_mylist", review_mylist);
	}

}
