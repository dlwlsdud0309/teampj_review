package micky.sports.shop.service.review;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.ReviewDao;
import micky.sports.shop.dto.ReviewDto;
import micky.sports.shop.service.MickyServiceInter;

public class ReviewPopupcontentmodifyService implements MickyServiceInter{

	SqlSession sqlSession;
	
	public ReviewPopupcontentmodifyService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println(">>>ReviewPopupcontentmodifyService");
		
		
//		model에서 request를 풀어내는 방법
		Map<String, Object> map=model.asMap(); //model을 Map으로 변환
		HttpServletRequest request=
				(HttpServletRequest) map.get("request");
		
		String r_no=request.getParameter("r_no");
//		String m_id=request.getParameter("m_id");
		String r_title=request.getParameter("r_title");
		String r_content=request.getParameter("r_content");
//		String r_score=request.getParameter("r_score");
		
		
		ReviewDao rdao=sqlSession.getMapper(ReviewDao.class);
//		rdao.modify(r_no,m_id,r_title,r_content);
		
		rdao.modify(r_no,r_title,r_content);
//		rdao.modify(r_no,r_title,r_content,r_score);
				
	}

}
