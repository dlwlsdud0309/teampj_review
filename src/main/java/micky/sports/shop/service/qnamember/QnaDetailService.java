package micky.sports.shop.service.qnamember;


import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.Member;

import micky.sports.shop.dto.Qna_MemberDto;
import micky.sports.shop.service.MickyServiceInter;

public class QnaDetailService implements MickyServiceInter{

	private SqlSession sqlSession;
	private HttpSession session;
	
	public QnaDetailService(SqlSession sqlSession,HttpSession session) {
		this.sqlSession = sqlSession;
		this.session = session;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println("QnaDetailService");
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String q_mnocheck = request.getParameter("q_mno");
		System.out.println("확인 : "+q_mnocheck);
		int q_mno = Integer.parseInt(q_mnocheck); //qnalist에서 클릭한 문의글의 고유번호
		System.out.println("확인2 : "+q_mnocheck);
		Member dao = sqlSession.getMapper(Member.class);
		
		
		
		Qna_MemberDto dto = dao.qnadetail(q_mno); //
		
		model.addAttribute("qnadetail",dto);
	}

}
