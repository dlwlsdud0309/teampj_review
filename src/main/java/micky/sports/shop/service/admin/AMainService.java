package micky.sports.shop.service.admin;



import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.Admin;
import micky.sports.shop.dto.OrderMemberDto;
import micky.sports.shop.service.MickyServiceInter;

public class AMainService implements MickyServiceInter{
	private SqlSession sqlSession;

	public AMainService() {
		this.sqlSession=sqlSession;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println("---AMainService");
		
		Map<String , Object> map=model.asMap();
		HttpServletRequest request=
				(HttpServletRequest)map.get("request");	
		
		
//		Admin dao=sqlSession.getMapper(Admin.class);
//		
//		OrderMemberDto dto=dao.acontentview(om_cntnum);
//		model.addAttribute("acontent_view",dto);
		
		
		
	}
}
