package micky.sports.shop.service.review;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.ReviewDao;
import micky.sports.shop.dto.ReviewDto;
import micky.sports.shop.service.MickyServiceInter;

public class ReviewReplyviewService implements MickyServiceInter{
	private SqlSession sqlSession;
	private HttpSession httpsession;
	
	public ReviewReplyviewService(SqlSession sqlSession,HttpSession httpsession) {
		this.sqlSession=sqlSession;
		this.httpsession = httpsession;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println(">>>ReviewReplyviewService");
		
//		model에서 request를 풀어내는 방법
		Map<String, Object> map=model.asMap(); //model을 Map으로 변환
		HttpServletRequest request=
				(HttpServletRequest) map.get("request");
		
		httpsession = request.getSession();
		String loginId = (String)httpsession.getAttribute("loginid");
		
		String r_no=request.getParameter("r_no");
		
		
		ReviewDao rdao=sqlSession.getMapper(ReviewDao.class);
		ReviewDto replyview=rdao.replyview(r_no);
		
		model.addAttribute("replyview",replyview);
		
	}

}
