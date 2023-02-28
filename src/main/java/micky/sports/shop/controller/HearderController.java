package micky.sports.shop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import micky.sports.shop.dao.ProductDao;
import micky.sports.shop.service.MickyServiceInter;
import micky.sports.shop.vopage.SearchVO;


@Controller
public class HearderController {
	MickyServiceInter mickyServiceInter;
	
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private HttpSession session;
	
	//관리자 주문관리 현황 리스트
	 @RequestMapping("/header") 
	 public String header(HttpServletRequest request,SearchVO searchVO,Model model) { 
		 System.out.println(">>>>>>>>>header<<<<<<<<<<");
		 
		 
		 model.addAttribute("request",request);
		 model.addAttribute("searchVo",searchVO);
		 
		 String search=request.getParameter("q");
		 
		 ProductDao dao=sqlSession.getMapper(ProductDao.class);
		 if (search==null) {
			 search="";
		 }
		 model.addAttribute("search",search);
		 search=search.toUpperCase().replace(" ", "_");
		 int searchCount=dao.mainsearch(search);
		 model.addAttribute("searchcount",searchCount);
		 System.out.println("검색된 갯수 : "+searchCount);
		 return "header"; //spring jsp 파일 위치
	 }
	 @RequestMapping("/header2") 
	 public String header2(HttpServletRequest request,SearchVO searchVO,Model model) { 
		 System.out.println(">>>>>>>>>header2<<<<<<<<<<");
		 
		 
		 model.addAttribute("request",request);
		 model.addAttribute("searchVo",searchVO);
		 		 
//		 mickyServiceInter=new AOrderListService(sqlSession);
//		 mickyServiceInter.execute(model);
		 System.out.println("ㅙ더");
		 return "header2"; //spring jsp 파일 위치
	 }
	 
	
	
		 
		
}
