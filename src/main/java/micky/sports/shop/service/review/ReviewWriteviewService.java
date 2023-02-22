package micky.sports.shop.service.review;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.ReviewDao;
import micky.sports.shop.dto.OrderMemberDto;
import micky.sports.shop.service.MickyServiceInter;

public class ReviewWriteviewService implements MickyServiceInter{
	private SqlSession sqlSession;
	private HttpSession httpSession;
	
	public ReviewWriteviewService(SqlSession sqlSession,HttpSession httpsession) {
		this.sqlSession=sqlSession;
		this.httpSession = httpsession;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println(">>>ReviewWriteviewService");
		
		
//		model에서 request를 풀어내는 방법
		Map<String, Object> map=model.asMap(); //model을 Map으로 변환
		HttpServletRequest request=
				(HttpServletRequest) map.get("request");
		
		httpSession = request.getSession();
		String loginId = (String)httpSession.getAttribute("loginid");
		
		String om_cntnum=request.getParameter("om_cntnum");
		String p_no=request.getParameter("p_no");
		System.out.println("reviewWriteview@@om_num : "+om_cntnum);
		System.out.println("reviewWriteview@@p_no : "+p_no);
		
		ReviewDao rdao=sqlSession.getMapper(ReviewDao.class);
		OrderMemberDto reviewWrite_orderlist=rdao.reviewWrite_orderlist(loginId,om_cntnum);
		
		model.addAttribute("reviewWrite_orderlist", reviewWrite_orderlist);
	}

}
