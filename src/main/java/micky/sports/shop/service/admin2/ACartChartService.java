package micky.sports.shop.service.admin2;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.apache.velocity.runtime.directive.Parse;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import micky.sports.shop.dao.Admin2;
import micky.sports.shop.dao.CartDao;
import micky.sports.shop.dto.CartDto;
import micky.sports.shop.service.MickyServiceInter;

//관리자 주문관리 현황 리스트
@Service
public class ACartChartService implements MickyServiceInter{
	private SqlSession sqlSession;
	
	public ACartChartService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println("---ACartChartService");
		
		
		Map<String , Object> map=model.asMap();
		HttpServletRequest request=
				(HttpServletRequest)map.get("request");
		
		CartDao dao=sqlSession.getMapper(CartDao.class);

		
		List<CartDto> clist=dao.cartChartList();
//		JSONArray arr=new JSONArray();
//		for (CartDto clist : list) {
//			JSONObject obj=new JSONObject();
//			String goods=clist.getProductDto().getP_name();
//			String sum=""+clist.getTotalcnt();
//			obj.put("goods", goods);
//			obj.put("sum", sum);
//			if (obj!=null) 
//				arr.add(obj);
//			
//			model.addAttribute("arr",arr);
//		}
		
		model.addAttribute("list",clist);			
	
		
		
		
	}
}
