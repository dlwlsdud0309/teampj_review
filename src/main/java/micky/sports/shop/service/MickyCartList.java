package micky.sports.shop.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.CartDao;
import micky.sports.shop.dto.CartDto;


public class MickyCartList implements MickyServiceInter{

	private SqlSession sqlSession;
	private HttpSession session;
	
	
	public MickyCartList(SqlSession sqlsession, HttpSession session) {
		this.sqlSession=sqlsession;
		this.session=session;
	}

	@Override
	public void execute(Model model) {
				
		Map<String, Object> map= model.asMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		CartDao dao=sqlSession.getMapper(CartDao.class);
		String c_no=request.getParameter("c_no");
		String m_id=(String)session.getAttribute("loginid");
		if (m_id==null) {
			m_id="";
		}
		System.out.println("m_id : "+m_id);
		ArrayList<CartDto> list=dao.Cartlist(m_id);
		
		
		
		System.out.println("Cartlist 서비스");
		int sum=0;
		for (CartDto cartDto : list) {
			System.out.println("가격  : "+cartDto.getProductDto().getP_price());
			
			sum +=cartDto.getProductDto().getP_price()*cartDto.getC_cnt();
//			System.out.println("총합 : "+sum);
			model.addAttribute("totalprice",sum);
		}
		model.addAttribute("list",list);	
	}
	
}
