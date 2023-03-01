package micky.sports.shop.service.myPage;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.Member;
import micky.sports.shop.dao.OrderDao;
import micky.sports.shop.dto.OrderMemberDto;
import micky.sports.shop.service.MickyServiceInter;

public class MyPageService implements MickyServiceInter{
	private SqlSession sqlSession;
	private HttpSession httpsession;
	
	public MyPageService(SqlSession sqlSession,HttpSession httpsession) {
		this.sqlSession=sqlSession;
		this.httpsession=httpsession;
	}
	
	@Override
	public void execute(Model model) {
		
		//로그인 세션
		String loginId = (String)httpsession.getAttribute("loginid");
	
		OrderDao odao = sqlSession.getMapper(OrderDao.class);

		model.addAttribute("myList",odao.ordersMember(loginId));
		
		model.addAttribute("myPage",odao.myPage(loginId));
		
		//결제완료 주문취소 배송완료 구매확정
		ArrayList<OrderMemberDto> myPages =odao.myPage(loginId);
		int state1=0;
		int state2=0;
		int state3=0;
		int state4=0;
		int[] stateList=new int[4];
		String state;
		for (OrderMemberDto orderMemberDto : myPages) {
			state=orderMemberDto.getOm_state();
			System.out.println(state);
			if (state=="결제완료" || state.equals("결제완료")) {
				state1=state1+1;
			}else if(state=="주문취소"|| state.equals("주문취소")) {
				state2=state2+1;
			}else if(state=="배송완료"|| state.equals("배송완료")) {
				state3=state3+1;
			}else if(state=="구매확정"|| state.equals("구매확정")) {
				state4=state4+1;
			}
		}
		stateList[0]=state1;
		stateList[1]=state2;
		stateList[2]=state3;
		stateList[3]=state4;
		
		for (int i : stateList) {
			System.out.println(i);
		}
		model.addAttribute("stateList",stateList);

	}

}
