package micky.sports.shop.service.review;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.ReviewDao;
import micky.sports.shop.service.MickyServiceInter;

public class ReviewReplydeleteService implements MickyServiceInter{

	private SqlSession sqlSession;
	
	public ReviewReplydeleteService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println(">>>>ReviewReplydeleteService");
		
//		model에서 request를 풀어내는 방법
		Map<String, Object> map=model.asMap(); //model을 Map으로 변환
		HttpServletRequest request=
				(HttpServletRequest) map.get("request");
		
		String r_no=request.getParameter("r_no");
		
		ReviewDao rdao=sqlSession.getMapper(ReviewDao.class);
	//	rdao.replydelete(r_no);
	}

}
