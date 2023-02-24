package micky.sports.shop.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.CartDao;


public class MickyCartAllDelete implements MickyServiceInter{

	private SqlSession sqlSession;
	private HttpSession session;
	
	public MickyCartAllDelete(SqlSession sqlsession, HttpSession session) {
		this.sqlSession=sqlsession;
		this.session=session;
	}

	@Override
	public void execute(Model model) {
				
		Map<String, Object> map= model.asMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");		
		CartDao dao=sqlSession.getMapper(CartDao.class);
		String m_id=(String)session.getAttribute("loginid");

//		해당 아이디의 장바구니 전체 삭제 아이디 뽑아오면 넣기
		dao.AllDeletelist(m_id);
	}
	
}
