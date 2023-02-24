package micky.sports.shop.service.qnamember;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.Member;
import micky.sports.shop.dto.MemberDto;
import micky.sports.shop.dto.Qna_MemberDto;
import micky.sports.shop.service.MickyServiceInter;
import micky.sports.shop.vopage.SearchVO;

public class QnaListService implements MickyServiceInter{

	private SqlSession sqlSession;
	private HttpSession session;
	
	public QnaListService(SqlSession sqlSession,HttpSession session) {
		this.sqlSession = sqlSession;
		this.session = session;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println("QnaListService");
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		SearchVO searchVo = (SearchVO) map.get("searchvo");
		
		Member dao = sqlSession.getMapper(Member.class);
		
	
		String m_id = (String)session.getAttribute("loginid"); //로그인중인 아이디
		
		
		String strPage = request.getParameter("page");
		if(strPage==null) {
			strPage="1";
		}
		System.out.println("page : "+strPage);
		
		int page = Integer.parseInt(strPage);
		searchVo.setPage(page);;
		//토탈 글의 갯수 구하기
		int total = dao.selectqnalistTotCount(m_id);
		//System.out.println("total : "+total);
		searchVo.pageCalculate(total);
		
		//계산된 내용 출력
		System.out.println("totRow : "+total);
		System.out.println("clickpage : "+page);
		System.out.println("pageStart : "+searchVo.getPageStart());
		System.out.println("pageEnd : "+searchVo.getPageEnd());
		System.out.println("pageTot : "+searchVo.getTotPage());
		System.out.println("rowStart : "+searchVo.getRowStart());
		System.out.println("rowEnd : "+searchVo.getRowEnd());
		
		int rowStart = searchVo.getRowStart();
		int rowEnd = searchVo.getRowEnd();
		
		//System.out.println("qnalistservice 아이디로그인유지확인용 : "+m_id);
		
		ArrayList<Qna_MemberDto> list = dao.getqnalist(m_id,rowStart,rowEnd); //로그인중인 아이디를 조건으로 문의정보 select 후 결과(list)
		
		
		
		model.addAttribute("qnalist",list);
		model.addAttribute("totRowcnt", total);
		model.addAttribute("searchVo", searchVo);
		
	}

}
