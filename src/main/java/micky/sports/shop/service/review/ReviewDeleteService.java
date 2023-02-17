package micky.sports.shop.service.review;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.ReviewDao;
import micky.sports.shop.service.MickyServiceInter;

public class ReviewDeleteService implements MickyServiceInter{

	private SqlSession sqlSession;
	private HttpSession session;
	
	public ReviewDeleteService(SqlSession sqlSession,HttpSession session) {
		this.sqlSession=sqlSession;
		this.session = session;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println(">>>>ReviewDeleteService");
		
//		model에서 request를 풀어내는 방법
		Map<String, Object> map=model.asMap(); //model을 Map으로 변환
		HttpServletRequest request=
				(HttpServletRequest) map.get("request");
		
		String r_no=request.getParameter("r_no");
		
		ReviewDao rdao=sqlSession.getMapper(ReviewDao.class);
		rdao.delete(r_no);
	}

}
