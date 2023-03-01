package micky.sports.shop.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.CartDao;
import micky.sports.shop.dto.CartDto;
import micky.sports.shop.dto.ProductDto;


public class MickyModifyCartOption implements MickyServiceInter{

	private SqlSession sqlSession;
	private HttpSession session;
	
	public MickyModifyCartOption(SqlSession sqlsession, HttpSession session) {
		this.sqlSession=sqlsession;
		this.session=session;
	}

	@Override
	public void execute(Model model) {
				
		Map<String, Object> map= model.asMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		//내가 변경 하려는 p_no
		String p_no=request.getParameter("p_no");
		String p_color=request.getParameter("p_color");
		String p_size=request.getParameter("p_size");
		String c_cnt=request.getParameter("c_cnt");
		String c_no=request.getParameter("c_no");
		String p_category=request.getParameter("p_category");
		String p_name=request.getParameter("p_name");
		CartDao dao=sqlSession.getMapper(CartDao.class);
		
		String m_id=(String)session.getAttribute("loginid");
		
		int num=0;
		CartDto cdto=dao.CartSelectOptionlist(c_no);
		cdto.getProductDto().getP_size();
		System.out.println("변경전 : "+cdto.getProductDto().getP_size());
		System.out.println("변경후 : "+p_size);
//		동일한 상품이 있는지 중복체크 있으면 count=1 없으면 count=0
		int count=dao.checkCartlist2(m_id,p_size,p_color,p_category,c_no,p_name);		
		int resultcnt=dao.cntcheck(p_name,p_color,p_size);
		System.out.println("내가새로고든 상품의 재고 : "+resultcnt);
		int c_cnt2=Integer.parseInt(c_cnt);
		System.out.println("내가고른 수량 : "+c_cnt2);
//		중복이 아닐때		
		if (count == 0) {
//			변경된 상품의 재고가 내가 선택한 수량보다 적으면 옵션변경불가
			if (resultcnt>=c_cnt2) {
				num=dao.CartOptionModify(p_color,p_size,c_cnt,c_no,p_name);				
			}else {
				count=3;				
			}
		}
//		중복일때
		else {
		}
		
		model.addAttribute("count",count);
//		model.addAttribute("num",num);
//		System.out.println("1.색  : "+p_color);
//		System.out.println("2.사이즈 : "+p_size);
//		System.out.println("3.갯수 : "+c_cnt);
//		System.out.println("4.번호확인 : "+c_no);
//		System.out.println("5.분류확인 : "+p_category);
//		System.out.println("6.상품명 : "+p_name);
//		model.addAttribute("list",list);
	}
	
}
