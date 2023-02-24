package micky.sports.shop.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.CartDao;
import micky.sports.shop.dao.OrderDao;
import micky.sports.shop.dto.CartDto;
import micky.sports.shop.dto.ProductDto;


public class MickyCartinsertservice implements MickyServiceInter{

	private SqlSession sqlSession;
	private HttpSession session;
	
	public MickyCartinsertservice(SqlSession sqlsession, HttpSession session) {
		this.sqlSession=sqlsession;
		this.session=session;
	}

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map= model.asMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
//		String[] p_no=request.getParameterValues("choice_pno");
		String[] p_no=request.getParameterValues("p_no");
		String[] c_cnt=request.getParameterValues("u_cnt");
//		String[] p_cnt=request.getParameterValues("choice_cnt");
		
		System.out.println("p_no : "+p_no[0]);
		System.out.println("p_cnt : "+c_cnt[0]);
		CartDao dao=sqlSession.getMapper(CartDao.class);
		String m_id=(String)session.getAttribute("loginid");
		if (m_id==null) {
			m_id="";
		}
//		중복검사 1이면 중복o 0이면 중복x
		for (int i = 0; i < p_no.length; i++) {	
			int count=dao.checkCartlist(m_id,p_no[i]);
			System.out.println("count : "+count);
			if (count == 0) {
				dao.insertCart(m_id,p_no[i],c_cnt[i]);							
			}else {
				System.out.println("중복됨");
			}
		}		
			
		
//		if 해당 아이디의 장바구니에 같은 사이즈,상품번호,색깔이 있으면 인서트가 안돌아가게 1이나오고
//		select count(*) from cart where m_id='' and size and color ;
			
		
		
		//같은 상품을 장바구니에 추가했을때에 장바구니에 들어가지 않게 구현
		
//		model.addAttribute("list",list);	
	}
	
}
