package micky.sports.shop.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import micky.sports.shop.service.MickyServiceInter;
import micky.sports.shop.service.product.ProductDetail_ReviewService;
import micky.sports.shop.service.review.ReviewAdminpageService;
import micky.sports.shop.service.review.ReviewChartService;
import micky.sports.shop.service.review.ReviewDeleteService;
import micky.sports.shop.service.review.ReviewModifyService;
import micky.sports.shop.service.review.ReviewModifyviewService;
import micky.sports.shop.service.review.ReviewMylistviewService;
import micky.sports.shop.service.review.ReviewReplyService;
import micky.sports.shop.service.review.ReviewReplydeleteService;
import micky.sports.shop.service.review.ReviewReplyviewService;
import micky.sports.shop.service.review.ReviewWriteService;
import micky.sports.shop.service.review.ReviewWriteviewService;

@Controller
@RequestMapping("/review")
public class ReviewController {
	MickyServiceInter mickyServiceInter;
	
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private HttpSession httpSession;
	
	
//	메인 페이지
//	@RequestMapping(method = RequestMethod.POST, value = "/reviewBoard")
	@RequestMapping("/reviewBoard")
	public String reviewBoard(HttpServletRequest request, Model model) {
		System.out.println("=====reviewBoard====");
		
		model.addAttribute("request", request);
		//mickyServiceInter=new ReviewService(sqlSession,httpSession);
		mickyServiceInter=new ProductDetail_ReviewService(sqlSession,httpSession);
		mickyServiceInter.execute(model);
		
		//return "review/reviewBoard";
		return "product/productDetail";
	}	
	
//	마이페이지-카테고리 리뷰로 접근
	@RequestMapping("/reviewMylistview")
	public String reviewListview(HttpServletRequest request, Model model) {
		System.out.println("=====reviewMylistview====");
		
		model.addAttribute("request", request);
		mickyServiceInter=new ReviewMylistviewService(sqlSession,httpSession);
		mickyServiceInter.execute(model);
		
		return "review/reviewMylistview";
	}
	
//	작성 폼
	@RequestMapping("/reviewWriteview")
	public String reviewWriteview(HttpServletRequest request, Model model) {
		System.out.println("=====reviewWriteview====");
		
		model.addAttribute("request", request);
		mickyServiceInter=new ReviewWriteviewService(sqlSession,httpSession);
		mickyServiceInter.execute(model);

		return "review/reviewWriteview";
	}
	
//	리뷰 작성
	@RequestMapping("/reviewWrite")
	public String reviewWrite(HttpServletRequest request, Model model) {
		System.out.println("=====reviewWrite====");
		
		model.addAttribute("request", request);
		mickyServiceInter=new ReviewWriteService(sqlSession,httpSession);
		
		ServletContext application=request.getSession().getServletContext();
//		scope application 사용한 pname, pfilesrc값 가져오기
		String p_name=(String)application.getAttribute("pname");
		String p_filesrc=(String)application.getAttribute("pfilesrc");
		
		mickyServiceInter.execute(model);
		
		return "redirect:../product/productDetail?"+"pname="+p_name+"&pfilesrc="+p_filesrc;
	}
	
//	reviewMylistview에서 리뷰 삭제
	@RequestMapping("/reviewMylistDelete")
	public String reviewMylistDelete(HttpServletRequest request, Model model) {
		System.out.println("=====reviewDelete====");
		
		model.addAttribute("request", request);
		mickyServiceInter=new ReviewDeleteService(sqlSession,httpSession);
		mickyServiceInter.execute(model);
		
		return "redirect:reviewMylistview";
	}
	
//	ProductDetail에서 리뷰 삭제
	@RequestMapping("/reviewDelete")
	public String reviewDelete(HttpServletRequest request, Model model) {
		System.out.println("=====reviewDelete====");
		
		model.addAttribute("request", request);
		mickyServiceInter=new ReviewDeleteService(sqlSession,httpSession);
		
		ServletContext application=request.getSession().getServletContext();
//		scope application 사용한 pname, pfilesrc값 가져오기
		String p_name=(String)application.getAttribute("pname");
		String p_filesrc=(String)application.getAttribute("pfilesrc");
		
		mickyServiceInter.execute(model);
		
		return "redirect:../product/productDetail?"+"pname="+p_name+"&pfilesrc="+p_filesrc;
	}
	
//	수정하기 폼
	@RequestMapping("/reviewModifyview")
	public String reviewPopupcontentview(HttpServletRequest request, Model model) {
		System.out.println("=====reviewModifyview====");
		
		model.addAttribute("request", request);
		mickyServiceInter=new ReviewModifyviewService(sqlSession,httpSession);
		mickyServiceInter.execute(model);
		
		return "review/reviewModifyview";
	}
		
//	수정하기
	@RequestMapping("/reviewModify")
	public String reviewPopupcontentmodify(HttpServletRequest request, Model model) {
		System.out.println("=====reviewModify====");
		
		model.addAttribute("request", request);
		mickyServiceInter=new ReviewModifyService(sqlSession,httpSession);
		
		ServletContext application=request.getSession().getServletContext();
//		scope application 사용한 pname, pfilesrc값 가져오기
		String p_name=(String)application.getAttribute("pname");
		String p_filesrc=(String)application.getAttribute("pfilesrc");
		
		mickyServiceInter.execute(model);
		
		return "redirect:../product/productDetail?"+"pname="+p_name+"&pfilesrc="+p_filesrc;
	}
		
//	관리자 답글달기, 수정하기
	@RequestMapping("/reviewReply")
	public String reviewPopupreply(HttpServletRequest request, Model model) {
		System.out.println("=====reviewReply====");
		
		model.addAttribute("request", request);
		mickyServiceInter=new ReviewReplyService(sqlSession,httpSession);
		
		ServletContext application=request.getSession().getServletContext();
//		scope application 사용한 pname, pfilesrc값 가져오기
		String p_name=(String)application.getAttribute("pname");
		String p_filesrc=(String)application.getAttribute("pfilesrc");
		
		mickyServiceInter.execute(model);
		
		return "redirect:../product/productDetail?"+"pname="+p_name+"&pfilesrc="+p_filesrc;
	}
	
//	관리자 답글 삭제
	@RequestMapping("/reviewReplydelete")
	public String reviewReplydelete(HttpServletRequest request, Model model) {
		System.out.println("=====reviewReplydelete====");
		
		model.addAttribute("request", request);
		mickyServiceInter=new ReviewReplydeleteService(sqlSession,httpSession);
		
		ServletContext application=request.getSession().getServletContext();
//		scope application 사용한 pname, pfilesrc값 가져오기
		String p_name=(String)application.getAttribute("pname");
		String p_filesrc=(String)application.getAttribute("pfilesrc");
		
		mickyServiceInter.execute(model);
		
		return "redirect:../product/productDetail?"+"pname="+p_name+"&pfilesrc="+p_filesrc;
	}

//	리뷰 관리자 페이지
	@RequestMapping(value = "/reviewAdminpage", method = RequestMethod.GET)
	public String reviewAdminpage(HttpServletRequest request, Model model) {
		System.out.println("=====reviewAdminpage====");
		
		model.addAttribute("request", request);
		mickyServiceInter=new ReviewAdminpageService(sqlSession,httpSession);
		mickyServiceInter.execute(model);
		
		return "review/reviewAdminpage";
	}
	
//	차트 별점순 1~5까지
	@RequestMapping("/reviewChart")
	public String reviewChart(HttpServletRequest request, Model model) {
		System.out.println("=====reviewChart====");
		
		model.addAttribute("request", request);
		mickyServiceInter=new ReviewChartService(sqlSession,httpSession);
		mickyServiceInter.execute(model);
		
		return "review/reviewChart";
	}
	
}
