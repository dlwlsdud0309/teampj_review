package micky.sports.shop.service.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.Member;
import micky.sports.shop.service.MickyServiceInter;

public class MemberChartService implements MickyServiceInter{

	private SqlSession sqlSession;
	private HttpSession session;
	
	public MemberChartService(SqlSession sqlSession,HttpSession session) {
		this.sqlSession = sqlSession;
		this.session = session;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println("MemberChartService");
		
		int totalMember = 0;
		int maleMember = 0;
		int femaleMember = 0;
		int memberchart1 = 0;
		int memberchart2 = 0;
		int memberchart3 = 0;
		int memberchart4 = 0;
		int memberchart5 = 0;
		int memberchart6 = 0;
		int memberchart7 = 0;
		int memberchart8 = 0;
		int memberchart9 = 0;
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
			
		Member dao = sqlSession.getMapper(Member.class);
		
		totalMember = dao.getTotalMember();
		System.out.println("totalMember확인 : "+totalMember);
		
		maleMember = dao.getMaleMember();
		System.out.println("maleMember확인 : "+maleMember);
		
		femaleMember = dao.getFemaleMember();
		System.out.println("femaleMember확인 : "+femaleMember);
		
		memberchart1 = dao.getmemberchart1();
		memberchart2 = dao.getmemberchart2();
		memberchart3 = dao.getmemberchart3();
		memberchart4 = dao.getmemberchart4();
		memberchart5 = dao.getmemberchart5();
		memberchart6 = dao.getmemberchart6();
		memberchart7 = dao.getmemberchart7();
		memberchart8 = dao.getmemberchart8();
		
		model.addAttribute("totalMember",totalMember);
		model.addAttribute("maleMember",maleMember);
		model.addAttribute("femaleMember",femaleMember);
		
		model.addAttribute("memberchart1",memberchart1);
		model.addAttribute("memberchart2",memberchart2);
		model.addAttribute("memberchart3",memberchart3);
		model.addAttribute("memberchart4",memberchart4);
		model.addAttribute("memberchart5",memberchart5);
		model.addAttribute("memberchart6",memberchart6);
		model.addAttribute("memberchart7",memberchart7);
		model.addAttribute("memberchart8",memberchart8);

		
		
	}

}
