package micky.sports.shop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import micky.sports.shop.dao.ProductDao;
import micky.sports.shop.dto.ProductDto;
import micky.sports.shop.service.MickyServiceInter;
import micky.sports.shop.service.product.ProductListService;
import micky.sports.shop.vopage.SearchVO;


@Controller
public class HearderController {
	MickyServiceInter mickyServiceInter;
	
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private HttpSession httpsession;
	
	//관리자 주문관리 현황 리스트
	 @RequestMapping("/header") 
	 public String header(HttpServletRequest request,Model model) { 
		 System.out.println(">>>>>>>>>header<<<<<<<<<<");	 	 
		 model.addAttribute("request",request);
		 
		 return "header"; 
	 }
//	 @RequestMapping("/header2") 
//	 public String header2(HttpServletRequest request,SearchVO searchVO,Model model) { 
//		 System.out.println(">>>>>>>>>header<<<<<<<<<<");
//		 
//		 
//		 model.addAttribute("request",request);
//		 model.addAttribute("searchVo",searchVO);
//		 
//		 return "header2"; //spring jsp 파일 위치
//	 }
	 //상품 검색 리스트
	 @RequestMapping("/search") 
	 public String search(HttpServletRequest request,Model model) { 
		 System.out.println(">>>>>>>>>search<<<<<<<<<<"); 
		 model.addAttribute("request",request);
		 
		 String d=(String)httpsession.getAttribute("loginid");
		 System.out.println(d);
		 String search=request.getParameter("q");
		 
		 ProductDao dao=sqlSession.getMapper(ProductDao.class);
		 if (search==null) {
			 search="";
		 }
		 model.addAttribute("search",search);
		 search=search.toUpperCase().replace(" ", "_");
		 List<ProductDto> pdto=dao.mainsearch(search);
		 model.addAttribute("productlsit",pdto);
		 
		 return "search"; 
	 }
	 @RequestMapping("/category") 
	 public String category(HttpServletRequest request,Model model) { 
		 System.out.println(">>>>>>>>>category<<<<<<<<<<");	 	  
		 model.addAttribute("request",request);
		 
		 String category=request.getParameter("c");
		 if (category==null) {
			 category="";
		 }
		 category=category.replace("-", "_");
		 System.out.println("내가 선택한 카테고리 : "+category);
		 ProductDao dao=sqlSession.getMapper(ProductDao.class);
		 
		 List<ProductDto> pdto=dao.categorylist(category);
		 model.addAttribute("productlsit",pdto);
		 return "category";
	 }
	 
	 
	
	
		 
		
}
