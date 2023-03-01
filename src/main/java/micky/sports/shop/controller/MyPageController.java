package micky.sports.shop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import micky.sports.shop.service.MickyServiceInter;
import micky.sports.shop.service.myPage.MyPageService;

@Controller
@RequestMapping("/myPage")
public class MyPageController {
	MickyServiceInter mickyServiceInter;

	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private HttpSession httpsession;
	
	//마이페이지
	@RequestMapping("/checkIndex")
	public String checkIndex(HttpServletRequest request, Model model) {
		
		model.addAttribute("request",request);
		
		return "myPage/checkIndex";
	}
	//마이페이지
	@RequestMapping("/myPageIntro")
	public String myPage(HttpServletRequest request, Model model) {

		mickyServiceInter = new MyPageService(sqlSession,httpsession);
		mickyServiceInter.execute(model);
		
		return "myPage/myPageIntro";
	}
	

}
