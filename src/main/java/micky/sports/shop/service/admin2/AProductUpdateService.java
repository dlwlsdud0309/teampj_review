package micky.sports.shop.service.admin2;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import micky.sports.shop.dao.Admin2;
import micky.sports.shop.service.MickyServiceInter;

//관리자 주문관리 현황 리스트
@Service
public class AProductUpdateService implements MickyServiceInter{
	private SqlSession sqlSession;
	
	public AProductUpdateService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println("---AProductDeleteService");
		
		Map<String , Object> map=model.asMap();
		HttpServletRequest request=
				(HttpServletRequest)map.get("request");
		
		Admin2 dao=sqlSession.getMapper(Admin2.class);
		String p_name=request.getParameter("p_name");
		String p_price=request.getParameter("p_price");
		String p_cnt=request.getParameter("p_cnt");
		String p_no=request.getParameter("p_no");
		System.out.println("나올까?   :"+p_name);
		System.out.println("나올까?   :"+p_price);
		System.out.println("나올까?   :"+p_cnt);
		System.out.println("나올까?   :"+p_no);
		
		dao.aProductUpdate(p_name,p_price,p_cnt,p_no);
		
	}
}
