package micky.sports.shop.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import micky.sports.shop.service.MickyServiceInter;
import micky.sports.shop.service.member.InfoUpdateFormService;
import micky.sports.shop.service.member.JoinIdCheckService;
import micky.sports.shop.service.member.JoinNickNameCheckService;
import micky.sports.shop.service.member.JoinService;
import micky.sports.shop.service.member.LogOutService;
import micky.sports.shop.service.member.LoginService;
import micky.sports.shop.service.member.MemberDeleteService;
import micky.sports.shop.service.member.MemberListService;
import micky.sports.shop.service.member.MemberUpdateFormService;
import micky.sports.shop.service.member.MemberUpdateService;
import micky.sports.shop.service.member.QnaDetailService;
import micky.sports.shop.service.member.QnaListService;
import micky.sports.shop.service.member.QnaWriteService;

@Controller
@RequestMapping("/member")
public class MemberController {

	MickyServiceInter mickyServiceInter;
	
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private HttpSession session;
	
	//메인화면
	@RequestMapping("/main")
	public String main(Model model) {
		System.out.println("@@@MemberController/main()@@@");
			
		return "/member/main";
	}
	//로그인화면
	@RequestMapping("/loginform")
	public String loginform(Model model) {
		System.out.println("@@@MemberController/loginform()@@@");
		
		return "/member/loginform";
	}
	//로그인기능
	@RequestMapping("/login")
	public String login(HttpServletRequest request,Model model) {
		System.out.println("@@@MemberController/login()@@@"); //controller 신호확인
			
		model.addAttribute("request",request); 
		mickyServiceInter = new LoginService(sqlSession,session);
		mickyServiceInter.execute(model);
			
		return "/member/main";
	}
	//로그아웃기능
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request,Model model) {
		System.out.println("@@@MemberController/logout()@@@");
				
		//model.addAttribute("request",request);
		mickyServiceInter = new LogOutService(sqlSession,session);
		mickyServiceInter.execute(model);
				
		return "/member/main";
	}
	//회원가입화면
	@RequestMapping("/joinform")
	public String joinform(Model model) {
		System.out.println("@@@MemberController/joinform()@@@");
		return "/member/joinform";
	}
	//아이디중복검사기능
	@RequestMapping(value="/joinidcheck",method = RequestMethod.GET)
	@ResponseBody
	public int joinidcheck(HttpServletRequest request,Model model) {
		System.out.println("@@@MemberController/joinidcheck()@@@");
		
		model.addAttribute("request",request);
		mickyServiceInter = new JoinIdCheckService(sqlSession);
		mickyServiceInter.execute(model);
		
		Map<String, Object> map = model.asMap();
		int overlapcheck_result = (Integer) map.get("overlapcheck_result");
		
//		String overlapcheck_result = request.getParameter("count");
		
		System.out.println("결과 : "+overlapcheck_result);
		
		return overlapcheck_result;
	}
	//닉네임중복검사기능
	@RequestMapping(value="/joinnicknamecheck",method = RequestMethod.GET)
	@ResponseBody
	public int joinnicknamecheck(HttpServletRequest request,Model model) {
		System.out.println("@@@MemberController/joinnicknamecheck()@@@");
		
		model.addAttribute("request",request);
		mickyServiceInter = new JoinNickNameCheckService(sqlSession);
		mickyServiceInter.execute(model);
		
		Map<String, Object> map = model.asMap();
		int overlapcheck_result = (Integer) map.get("overlapcheck_result");
		
//		String overlapcheck_result = request.getParameter("count");
		
		System.out.println("결과 : "+overlapcheck_result);
		
		return overlapcheck_result;
	}	
	//회원가입기능
	@RequestMapping("/join")
	public String join(HttpServletRequest request,Model model) {
		System.out.println("@@@MemberController/join()@@@");
			
		model.addAttribute("request",request);
		mickyServiceInter = new JoinService(sqlSession);
		mickyServiceInter.execute(model);
			
		return "/member/loginform";
	}
	//마이페이지화면
	@RequestMapping("/mypageform")
	public String mypageform(HttpServletRequest request,Model model) {
		System.out.println("@@@MemberController/mypageform()@@@");
				
				
		return "/member/mypageform";
	}
	//관리자페이지화면
	@RequestMapping("/adminpage")
	public String adminpage(HttpServletRequest request,Model model) {
		System.out.println("@@@MemberController/adminpage()@@@");
			
				
		return "/member/adminpage";
	}
	//회원목록화면
	@RequestMapping("/memberlist")
	public String memberlist(HttpServletRequest request,Model model) {
		System.out.println("@@@MemberController/memberlist()@@@");
		mickyServiceInter = new MemberListService(sqlSession,session);
		mickyServiceInter.execute(model);	
				
		return "/member/memberlist";		
	}
	//회원정보수정화면
	@RequestMapping("/memberupdateform")
	public String memberupdateform(HttpServletRequest request,Model model) {
		System.out.println("@@@MemberController/memberupdateform()@@@");
		model.addAttribute("request", request);
		mickyServiceInter = new MemberUpdateFormService(sqlSession,session);
		mickyServiceInter.execute(model);	
				
		return "/member/memberupdateform";		
	}
	//회원정보수정기능
	@RequestMapping("/memberupdate")
	public String memberupdate(HttpServletRequest request,Model model) {
		System.out.println("@@@MemberController/memberupdate()@@@");
		model.addAttribute("request", request);
		mickyServiceInter = new MemberUpdateService(sqlSession,session);
		mickyServiceInter.execute(model);	
				
		return "redirect:/member/memberlist";		
	}
	//회원정보삭제기능
	@RequestMapping("/memberdelete")
	public String memberdelete(HttpServletRequest request,Model model) {
		System.out.println("@@@MemberController/memberdelete()@@@");
		model.addAttribute("request", request);
		mickyServiceInter = new MemberDeleteService(sqlSession,session);
		mickyServiceInter.execute(model);	
				
		return "redirect:/member/memberlist";		
	}
	//마이페이지의 문의게시판리스트
	@RequestMapping("/qnalist")
	public String qnalist(HttpServletRequest request,Model model) {
		System.out.println("@@@MemberController/qnalist()@@@");
		
		model.addAttribute("request", request);	
		
		//System.out.println("현재로그인중인아이디확인 : "+session.getAttribute("loginid"));
		
		mickyServiceInter = new QnaListService(sqlSession,session);
		mickyServiceInter.execute(model);	
		return "/member/qnalist";		
	}
	//마이페이지의 문의게시판글작성화면
	@RequestMapping("/qnawriteform")
	public String qnawriteform(HttpServletRequest request,Model model) {
		System.out.println("@@@MemberController/qnawriteform()@@@");
		//model.addAttribute("request", request);	
		//mickyServiceInter = new QnaWriteFormService(sqlSession,session);
		//mickyServiceInter.execute(model);	
		return "/member/qnawriteform";		
	}
	//마이페이지의 문의게시판글작성기능
	@RequestMapping("/qnawrite")
	public String qnawrite(HttpServletRequest request,Model model) {
		System.out.println("@@@MemberController/qnawrite()@@@");
		model.addAttribute("request", request);	

		mickyServiceInter = new QnaWriteService(sqlSession,session);
		mickyServiceInter.execute(model);	
		return "redirect:/member/qnalist";		
	}
	//마이페이지의 문의글 디테일
	@RequestMapping("/qnadetail")
	public String qnadetail(HttpServletRequest request,Model model) {
		System.out.println("@@@MemberController/qnadetail()@@@");
		model.addAttribute("request", request);	
			
			
		mickyServiceInter = new QnaDetailService(sqlSession,session);
		mickyServiceInter.execute(model);	
		return "/member/qnadetail";		
	}
	//마이페이지의 문의답변화면
	@RequestMapping("/qnareplyform")
	public String qnareplyform(HttpServletRequest request,Model model) {
		System.out.println("@@@MemberController/qnareplyform()@@@");
		model.addAttribute("request", request);	
			
			
		mickyServiceInter = new QnaDetailService(sqlSession,session);
		mickyServiceInter.execute(model);	
		return "/member/qnareplyform";		
	}
	//마이페이지의 문의답변화면
	@RequestMapping("/infoupdateform")
	public String infoupdateform(HttpServletRequest request,Model model) {
		System.out.println("@@@MemberController/infoupdateform()@@@");
		model.addAttribute("request", request);	
			
			
		mickyServiceInter = new InfoUpdateFormService(sqlSession,session);
		mickyServiceInter.execute(model);	
		return "/member/infoupdateform";		
	}	
	
}