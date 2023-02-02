package micky.sports.shop.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import micky.sports.shop.service.MickyServiceInter;
import micky.sports.shop.service.review.ReviewDeleteService;
import micky.sports.shop.service.review.ReviewService;
import micky.sports.shop.service.review.ReviewWriteService;

@Controller
@RequestMapping("/review")
public class ReviewController {
	MickyServiceInter mickyServiceInter;
	
	@Autowired
	private SqlSession sqlSession;
	
	
//	임시 메인페이지
	@RequestMapping("/reviewBoard")
	public String reviewBoard(HttpServletRequest request,Model model) {
		System.out.println("=====reviewBoard====");
		
		mickyServiceInter=new ReviewService(sqlSession);
		mickyServiceInter.execute(model);
		
		return "review/reviewBoard";
	}
	
	
//	마이페이지-카테고리 리뷰로 접근
	@RequestMapping("/reviewListview")
	public String reviewListview(Model model) {
		System.out.println("=====reviewListview====");
		
		return "review/reviewListview";
	}
	
//	작성 폼(Popup)
	@RequestMapping("/reviewWriteview")
	public String reviewWriteview(Model model) {
		System.out.println("=====reviewWriteview====");
		
		return "review/reviewWriteview";
	}
	
//	작성
	@RequestMapping("/reviewWrite")
	public String reviewWrite(HttpServletRequest request, Model model) {
		System.out.println("=====reviewWrite====");
		
		model.addAttribute("request", request);
		mickyServiceInter=new ReviewWriteService(sqlSession);
		mickyServiceInter.execute(model);
		
		return "redirect:reviewBoard";
	}
	
//	삭제
	@RequestMapping("/reviewDelete")
	public String reviewDelete(HttpServletRequest request, Model model) {
		System.out.println("=====reviewDelete====");
		
		model.addAttribute("request", request);
		mickyServiceInter=new ReviewDeleteService(sqlSession);
		mickyServiceInter.execute(model);
		
		return "redirect:reviewBoard";
	}
	
}
