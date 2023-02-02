package micky.sports.shop.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import micky.sports.shop.service.MickyServiceInter;
import micky.sports.shop.service.review.ReviewService;
import micky.sports.shop.service.review.ReviewWriteService;

@Controller
@RequestMapping("/review")
public class ReviewController {
	MickyServiceInter mickyServiceInter;
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/reviewBoard")
	public String reviewBoard(HttpServletRequest request,Model model) {
		System.out.println("=====reviewBoard====");
		
		mickyServiceInter=new ReviewService(sqlSession);
		mickyServiceInter.execute(model);
		
		return "review/reviewBoard";
	}
	
	@RequestMapping("/reviewWriteview")
	public String reviewWriteview(Model model) {
		System.out.println("=====reviewWriteview====");
		
		return "review/reviewWriteview";
	}
	
	@RequestMapping("/reviewWrite")
	public String reviewWrite(HttpServletRequest request, Model model) {
		System.out.println("=====reviewWrite====");
		
		model.addAttribute("request", request);
		mickyServiceInter=new ReviewWriteService(sqlSession);
		mickyServiceInter.execute(model);
		
		return "redirect:reviewBoard";
	}
}
