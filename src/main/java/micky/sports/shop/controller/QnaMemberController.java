package micky.sports.shop.controller;

import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import micky.sports.shop.service.MickyServiceInter;
import micky.sports.shop.service.member.EmailOverlapCheckService;
import micky.sports.shop.service.member.FindIdService;
import micky.sports.shop.service.member.FindPwService;
import micky.sports.shop.service.member.InfoUpdateFormService;
import micky.sports.shop.service.member.InfoUpdateService;
import micky.sports.shop.service.member.JoinIdCheckService;
import micky.sports.shop.service.member.JoinNickNameCheckService;
import micky.sports.shop.service.member.JoinService;
import micky.sports.shop.service.member.LogOutService;
import micky.sports.shop.service.member.LoginService;
import micky.sports.shop.service.member.MainService;
import micky.sports.shop.service.member.MemberChartService;
import micky.sports.shop.service.member.MemberDropCheckService;
import micky.sports.shop.service.member.MemberDropService;
import micky.sports.shop.service.member.TemporaryPwService;
import micky.sports.shop.service.qnamember.AdminQnaListService;
import micky.sports.shop.service.qnamember.MemberDeleteService;
import micky.sports.shop.service.qnamember.MemberListService;
import micky.sports.shop.service.qnamember.MemberUpdateFormService;
import micky.sports.shop.service.qnamember.MemberUpdateService;
import micky.sports.shop.service.qnamember.QnaDeleteService;
import micky.sports.shop.service.qnamember.QnaDetailService;
import micky.sports.shop.service.qnamember.QnaListService;
import micky.sports.shop.service.qnamember.QnaReplyService;
import micky.sports.shop.service.qnamember.QnaWriteService;
import micky.sports.shop.vopage.SearchVO;

@Controller
@RequestMapping("/qnamember")
public class QnaMemberController {

	MickyServiceInter mickyServiceInter;
	
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private HttpSession session;
	
	@Autowired
	private JavaMailSender mailSender;
	
	
	//에러처리
	@RequestMapping("/500error")
	public String error500(HttpServletRequest request, Model model) {
		System.out.println("@@@MemberController/500error()@@@");

					
		return "/error/500error";
	}		
	@RequestMapping("/404error")
	public String error404(HttpServletRequest request, Model model) {
		System.out.println("@@@MemberController/404error()@@@");

					
		return "/error/404error";
	}
	/*
	 * //메인화면
	 * 
	 * @RequestMapping("/main") public String main(HttpServletRequest request, Model
	 * model) { System.out.println("@@@MemberController/main()@@@");
	 * mickyServiceInter = new MainService(sqlSession,session);
	 * mickyServiceInter.execute(model);
	 * 
	 * return "/member/main"; }
	 */
	
	
	/*
	 * //로그인화면
	 * 
	 * @RequestMapping("/loginform") public String loginform(Model model) {
	 * System.out.println("@@@MemberController/loginform()@@@");
	 * 
	 * return "/member/loginform"; }
	 */
	
	
	/*
	 * //로그인기능
	 * 
	 * @RequestMapping(value="/login",method = RequestMethod.GET)
	 * 
	 * @ResponseBody public int login(HttpServletRequest request,Model model) {
	 * System.out.println("@@@MemberController/login()@@@"); //controller 신호확인
	 * 
	 * model.addAttribute("request",request); mickyServiceInter = new
	 * LoginService(sqlSession,session); mickyServiceInter.execute(model);
	 * 
	 * Map<String, Object> map = model.asMap(); int logincheck_result = (Integer)
	 * map.get("logincheck_result"); //ajax return으로 data 줘야해서 model을 다시 풀음
	 * 
	 * return logincheck_result; }
	 */
	
	
	/*
	 * //로그아웃기능
	 * 
	 * @RequestMapping("/logout") public String logout(HttpServletRequest
	 * request,Model model) { System.out.println("@@@MemberController/logout()@@@");
	 * 
	 * //model.addAttribute("request",request); mickyServiceInter = new
	 * LogOutService(sqlSession,session); mickyServiceInter.execute(model);
	 * 
	 * return "/member/main"; }
	 */
	
	
	/*
	 * //회원가입화면
	 * 
	 * @RequestMapping("/joinform") public String joinform(Model model) {
	 * System.out.println("@@@MemberController/joinform()@@@"); return
	 * "/member/joinform"; }
	 */
	
	
	/*
	 * //아이디중복검사기능
	 * 
	 * @RequestMapping(value="/joinidcheck",method = RequestMethod.GET)
	 * 
	 * @ResponseBody public int joinidcheck(HttpServletRequest request,Model model)
	 * { System.out.println("@@@MemberController/joinidcheck()@@@");
	 * 
	 * model.addAttribute("request",request); mickyServiceInter = new
	 * JoinIdCheckService(sqlSession); mickyServiceInter.execute(model);
	 * 
	 * Map<String, Object> map = model.asMap(); int overlapcheck_result = (Integer)
	 * map.get("overlapcheck_result"); //ajax return으로 data 줘야해서 model을 다시 풀음
	 * 
	 * // String overlapcheck_result = request.getParameter("count");
	 * 
	 * System.out.println("결과 : "+overlapcheck_result); //확인용
	 * 
	 * return overlapcheck_result; //return 한 값이 ajax success (data)로 간다 }
	 */
	
	
	/*
	 * //닉네임중복검사기능
	 * 
	 * @RequestMapping(value="/joinnicknamecheck",method = RequestMethod.GET)
	 * 
	 * @ResponseBody public int joinnicknamecheck(HttpServletRequest request,Model
	 * model) { System.out.println("@@@MemberController/joinnicknamecheck()@@@");
	 * 
	 * model.addAttribute("request",request); mickyServiceInter = new
	 * JoinNickNameCheckService(sqlSession); mickyServiceInter.execute(model);
	 * 
	 * Map<String, Object> map = model.asMap(); int overlapcheck_result = (Integer)
	 * map.get("overlapcheck_result");
	 * 
	 * // String overlapcheck_result = request.getParameter("count");
	 * 
	 * System.out.println("결과 : "+overlapcheck_result);
	 * 
	 * return overlapcheck_result; }
	 */	
	
	
	/*
	 * //회원가입기능
	 * 
	 * @RequestMapping("/join") public String join(HttpServletRequest request,Model
	 * model) { System.out.println("@@@MemberController/join()@@@"); //String m_id=
	 * request.getParameter("m_id");
	 * //System.out.println("파람확인 joincontrol : "+m_id);
	 * model.addAttribute("request",request); mickyServiceInter = new
	 * JoinService(sqlSession); mickyServiceInter.execute(model);
	 * 
	 * return "/member/loginform"; }
	 */
	
	
	/*
	 * //마이페이지화면
	 * 
	 * @RequestMapping("/mypageform") public String mypageform(HttpServletRequest
	 * request,Model model) {
	 * System.out.println("@@@MemberController/mypageform()@@@");
	 * 
	 * return "/member/mypageform"; }
	 */
	
	
	//관리자페이지화면
	@RequestMapping("/adminpage")
	public String adminpage(HttpServletRequest request,Model model) {
		System.out.println("@@@MemberController/adminpage()@@@");
							
		return "/qnamember/adminpage";
	}
	
	
	//회원목록화면
	@RequestMapping("/memberlist")
	public String memberlist(HttpServletRequest request,Model model,SearchVO searchVo) {
		System.out.println("@@@MemberController/memberlist()@@@");
		model.addAttribute("request",request);
		model.addAttribute("searchvo",searchVo);
		mickyServiceInter = new MemberListService(sqlSession,session);		
		mickyServiceInter.execute(model);	
				
		return "/qnamember/memberlist";		
	}
	
	
	//회원정보수정화면
	@RequestMapping("/memberupdateform")
	public String memberupdateform(HttpServletRequest request,Model model) {
		System.out.println("@@@MemberController/memberupdateform()@@@");
		model.addAttribute("request", request);
		mickyServiceInter = new MemberUpdateFormService(sqlSession,session);
		mickyServiceInter.execute(model);	
				
		return "/qnamember/memberupdateform";		
	}
	
	
	//회원정보수정기능
	@RequestMapping("/memberupdate")
	public String memberupdate(HttpServletRequest request,Model model) {
		System.out.println("@@@MemberController/memberupdate()@@@");
		model.addAttribute("request", request);
		mickyServiceInter = new MemberUpdateService(sqlSession,session);
		mickyServiceInter.execute(model);	
				
		return "redirect:/qnamember/memberlist";		
	}
	
	
	//회원정보삭제기능
	@RequestMapping("/memberdelete")
	public String memberdelete(HttpServletRequest request,Model model) {
		System.out.println("@@@MemberController/memberdelete()@@@");
		model.addAttribute("request", request);
		mickyServiceInter = new MemberDeleteService(sqlSession,session);
		mickyServiceInter.execute(model);	
				
		return "redirect:/qnamember/memberlist";		
	}
	
	
	//마이페이지의 문의게시판리스트
	@RequestMapping("/qnalist")
	public String qnalist(HttpServletRequest request,Model model,SearchVO searchVo) {
		System.out.println("@@@MemberController/qnalist()@@@");
		
		model.addAttribute("request", request);	
		model.addAttribute("searchvo",searchVo);
		//System.out.println("현재로그인중인아이디확인 : "+session.getAttribute("loginid"));
		
		mickyServiceInter = new QnaListService(sqlSession,session);
		mickyServiceInter.execute(model);	
		return "/qnamember/qnalist";		
	}
	
	
	//마이페이지의 문의게시판글작성화면
	@RequestMapping("/qnawriteform")
	public String qnawriteform(HttpServletRequest request,Model model) {
		System.out.println("@@@MemberController/qnawriteform()@@@");
		//model.addAttribute("request", request);	
		//mickyServiceInter = new QnaWriteFormService(sqlSession,session);
		//mickyServiceInter.execute(model);	
		return "/qnamember/qnawriteform";		
	}
	
	
	//마이페이지의 문의게시판글작성기능
	@RequestMapping("/qnawrite")
	public String qnawrite(HttpServletRequest request,Model model) {
		System.out.println("@@@MemberController/qnawrite()@@@");
		model.addAttribute("request", request);	

		mickyServiceInter = new QnaWriteService(sqlSession,session);
		mickyServiceInter.execute(model);	
		return "redirect:/qnamember/qnalist";		
	}
	
	
	//마이페이지의 문의글 디테일
	@RequestMapping("/qnadetail")
	public String qnadetail(HttpServletRequest request,Model model) {
		System.out.println("@@@MemberController/qnadetail()@@@");
		model.addAttribute("request", request);	
			
			
		mickyServiceInter = new QnaDetailService(sqlSession,session);
		mickyServiceInter.execute(model);	
		return "/qnamember/qnadetail";		
	}
	
	
	//마이페이지의 문의답변화면
	@RequestMapping("/qnareplyform")
	public String qnareplyform(HttpServletRequest request,Model model) {
		System.out.println("@@@MemberController/qnareplyform()@@@");
		model.addAttribute("request", request);	
			
			
		mickyServiceInter = new QnaDetailService(sqlSession,session);
		mickyServiceInter.execute(model);	
		return "/qnamember/qnareplyform";		
	}
	
	
	//마이페이지의 문의답변하기기능
	@RequestMapping("/qnareply")
	public String qnareply(HttpServletRequest request,Model model) {
		System.out.println("@@@MemberController/qnareply()@@@");
		model.addAttribute("request", request);	
			
			
		mickyServiceInter = new QnaReplyService(sqlSession,session);
		mickyServiceInter.execute(model);	
		return "redirect:/qnamember/adminqnalist";		
	}
	
	
	/*
	 * //마이페이지의 내정보수정화면
	 * 
	 * @RequestMapping("/infoupdateform") public String
	 * infoupdateform(HttpServletRequest request,Model model) {
	 * System.out.println("@@@MemberController/infoupdateform()@@@");
	 * model.addAttribute("request", request);
	 * 
	 * 
	 * mickyServiceInter = new InfoUpdateFormService(sqlSession,session);
	 * mickyServiceInter.execute(model); return "/member/infoupdateform"; }
	 * 
	 * 
	 * //마이페이지의 내정보수정
	 * 
	 * @RequestMapping("/infoupdate") public String infoupdate(HttpServletRequest
	 * request,Model model) {
	 * System.out.println("@@@MemberController/infoupdate()@@@");
	 * model.addAttribute("request", request);
	 * 
	 * 
	 * mickyServiceInter = new InfoUpdateService(sqlSession,session);
	 * mickyServiceInter.execute(model); return "/member/mypageform"; }
	 * 
	 * 
	 * //이메일중복확인
	 * 
	 * @RequestMapping(value="/emailoverlapcheck",method = RequestMethod.GET)
	 * 
	 * @ResponseBody public int emailoverlapcheck(HttpServletRequest request,Model
	 * model) { System.out.println("@@@MemberController/emailoverlapcheck()@@@");
	 * model.addAttribute("request", request);
	 * 
	 * 
	 * mickyServiceInter = new EmailOverlapCheckService(sqlSession,session);
	 * mickyServiceInter.execute(model);
	 * 
	 * Map<String, Object> map = model.asMap(); int overlapcheck_result = (Integer)
	 * map.get("overlapcheck_result"); //ajax return으로 data 줘야해서 model을 다시 풀음
	 * 
	 * // String overlapcheck_result = request.getParameter("count");
	 * 
	 * System.out.println("결과 : "+overlapcheck_result); //확인용
	 * 
	 * return overlapcheck_result; //return 한 값이 ajax success (data)로 간다 }
	 * 
	 * 
	 * //이메일인증
	 * 
	 * @RequestMapping(value="/emailcheck",method = RequestMethod.GET)
	 * 
	 * @ResponseBody public String emailcheck(HttpServletRequest request,Model
	 * model) { System.out.println("@@@MemberController/emailcheck()@@@");
	 * 
	 * String email = request.getParameter("email");
	 * 
	 * System.out.println("컨트롤러에 인증신청 이메일 확인 : "+email); //확인용
	 * 
	 * Random random = new Random(); int check_num = random.nextInt(888888) +
	 * 111111; System.out.println("인증번호발급확인 : "+check_num); //확인용
	 * 
	 * // 이메일 보내기 String setFrom = "ssfhc594@gmail.com"; String toMail = email;
	 * String title = "회원가입 인증 이메일 입니다."; String content = "홈페이지를 방문해주셔서 감사합니다." +
	 * "<br><br>" + "인증 번호는 " + check_num + "입니다." + "<br>" +
	 * "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
	 * 
	 * try {
	 * 
	 * MimeMessage message = mailSender.createMimeMessage(); MimeMessageHelper
	 * helper = new MimeMessageHelper(message, true, "utf-8");
	 * helper.setFrom(setFrom); helper.setTo(toMail); helper.setSubject(title);
	 * helper.setText(content,true); mailSender.send(message);
	 * 
	 * }catch(Exception e) { e.printStackTrace(); }
	 * 
	 * String num = Integer.toString(check_num); return num; }
	 * 
	 * 
	 * //회원탈퇴진입전비밀번호본인인증화면
	 * 
	 * @RequestMapping("/memberdropcheckform") public String
	 * memberdropcheckform(HttpServletRequest request, Model model) {
	 * System.out.println("@@@MemberController/memberdropcheckform()@@@");
	 * //mickyServiceInter = new MainService(sqlSession,session);
	 * //mickyServiceInter.execute(model);
	 * 
	 * return "/member/memberdropcheckform"; }
	 * 
	 * 
	 * //회원탈퇴진입전비밀번호본인인증
	 * 
	 * @RequestMapping(value="/memberdropcheck",method = RequestMethod.GET)
	 * 
	 * @ResponseBody public int memberdropcheck(HttpServletRequest request, Model
	 * model) { System.out.println("@@@MemberController/memberdropcheckform()@@@");
	 * model.addAttribute("request",request); mickyServiceInter = new
	 * MemberDropCheckService(sqlSession,session); mickyServiceInter.execute(model);
	 * 
	 * Map<String, Object> map = model.asMap(); int memberdropcheck = (Integer)
	 * map.get("memberdropcheck");
	 * 
	 * // String overlapcheck_result = request.getParameter("count");
	 * 
	 * System.out.println("결과 : "+memberdropcheck);
	 * 
	 * return memberdropcheck; }
	 * 
	 * 
	 * //회원탈퇴기능
	 * 
	 * @RequestMapping("/memberdrop") public String memberdrop(HttpServletRequest
	 * request,Model model) {
	 * System.out.println("@@@MemberController/memberdrop()@@@");
	 * model.addAttribute("request", request); mickyServiceInter = new
	 * MemberDropService(sqlSession,session); mickyServiceInter.execute(model);
	 * 
	 * return "redirect:/member/main"; }
	 */
	
	
	//마이페이지의 문의게시판리스트
	@RequestMapping("/adminqnalist")
	public String adminqnalist(HttpServletRequest request,Model model,SearchVO searchVo) {
		System.out.println("@@@MemberController/adminqnalist()@@@");		
		model.addAttribute("request", request);	
		model.addAttribute("searchvo",searchVo);
		
		mickyServiceInter = new AdminQnaListService(sqlSession,session);
		mickyServiceInter.execute(model);	
		return "/qnamember/adminqnalist";		
	}
	
	
	//마이페이지의 문의게시판 문의글삭제기능
	@RequestMapping("/qnadelete")
	public String qnadelete(HttpServletRequest request,Model model) {
		System.out.println("@@@MemberController/qnadelete()@@@");		
		model.addAttribute("request", request);	
			
		mickyServiceInter = new QnaDeleteService(sqlSession,session);
		mickyServiceInter.execute(model);	
		return "/qnamember/qnalist";		
	}
	
	@RequestMapping("/memberchart")

	public String memberchart(HttpServletRequest request,Model model) {
		System.out.println("@@@MemberController/memberchart()@@@");
		model.addAttribute("request", request);	
		mickyServiceInter = new MemberChartService(sqlSession,session);
		mickyServiceInter.execute(model);
		
		
		
		return "/qnamember/chartchart"; //return 한 값이 ajax success (data)로 간다
	}
	/*
	 * //비밀번호찾기화면
	 * 
	 * @RequestMapping("/findpwform") public String findpwform(HttpServletRequest
	 * request, Model model) {
	 * System.out.println("@@@MemberController/findpwform()@@@"); //
	 * mickyServiceInter = new MainService(sqlSession,session); //
	 * mickyServiceInter.execute(model);
	 * 
	 * return "/member/findpwform"; }
	 * 
	 * 
	 * //비밀번호찾기기능
	 * 
	 * @RequestMapping(value="/findpw",method = RequestMethod.GET)
	 * 
	 * @ResponseBody public int findpw(HttpServletRequest request,Model model) {
	 * System.out.println("@@@MemberController/findpw()@@@");
	 * model.addAttribute("request", request);
	 * 
	 * 
	 * mickyServiceInter = new FindPwService(sqlSession,session);
	 * mickyServiceInter.execute(model);
	 * 
	 * Map<String, Object> map = model.asMap(); int overlapcheck_result = (Integer)
	 * map.get("overlapcheck_result"); //ajax return으로 data 줘야해서 model을 다시 풀음
	 * 
	 * 
	 * System.out.println("결과 : "+overlapcheck_result); //확인용
	 * 
	 * return overlapcheck_result; //return 한 값이 ajax success (data)로 간다 }
	 * 
	 * 
	 * //비밀번호찾기 임시비번전송
	 * 
	 * @RequestMapping(value="/sendpwemail",method = RequestMethod.GET)
	 * 
	 * @ResponseBody public String sendpwemail(HttpServletRequest request,Model
	 * model) { System.out.println("@@@MemberController/sendpwemail()@@@");
	 * model.addAttribute("request", request);
	 * 
	 * String email = request.getParameter("email");
	 * 
	 * System.out.println("sendpwemail 이메일 확인 : "+email); //확인용
	 * 
	 * 
	 * Random random = new Random(); int check_num = random.nextInt(888888) +
	 * 111111; model.addAttribute("check_num",check_num);
	 * 
	 * mickyServiceInter = new TemporaryPwService(sqlSession,session);
	 * mickyServiceInter.execute(model);
	 * System.out.println("임시비밀번호확인 : "+check_num); //확인용
	 * 
	 * // 이메일 보내기 String setFrom = "ssfhc594@gmail.com"; String toMail = email;
	 * String title = "임시비밀번호 발급 이메일 입니다."; String content = "홈페이지를 방문해주셔서 감사합니다." +
	 * "<br><br>" + "임시비밀번호는 " + check_num + "입니다." + "<br>" +
	 * "해당 번호로 로그인 후 비밀번호 변경하여 주세요.";
	 * 
	 * try {
	 * 
	 * MimeMessage message = mailSender.createMimeMessage(); MimeMessageHelper
	 * helper = new MimeMessageHelper(message, true, "utf-8");
	 * helper.setFrom(setFrom); helper.setTo(toMail); helper.setSubject(title);
	 * helper.setText(content,true); mailSender.send(message);
	 * 
	 * }catch(Exception e) { e.printStackTrace(); }
	 * 
	 * String num = Integer.toString(check_num); return num; }
	 * 
	 * 
	 * //아이디찾기화면
	 * 
	 * @RequestMapping("/findidform") public String findidform(HttpServletRequest
	 * request, Model model) {
	 * System.out.println("@@@MemberController/findidform()@@@"); //
	 * mickyServiceInter = new MainService(sqlSession,session); //
	 * mickyServiceInter.execute(model);
	 * 
	 * return "/member/findidform"; }
	 * 
	 * 
	 * //아이디찾기기능
	 * 
	 * @RequestMapping(value="/findid",method = RequestMethod.GET)
	 * 
	 * @ResponseBody public String findid(HttpServletRequest request,Model model) {
	 * System.out.println("@@@MemberController/findid()@@@");
	 * model.addAttribute("request", request);
	 * 
	 * 
	 * mickyServiceInter = new FindIdService(sqlSession,session);
	 * mickyServiceInter.execute(model);
	 * 
	 * Map<String, Object> map = model.asMap(); String overlapcheck_result =
	 * (String) map.get("overlapcheck_result"); //ajax return으로 data 줘야해서 model을 다시
	 * 풀음 if(overlapcheck_result==null) { overlapcheck_result=""; }
	 * 
	 * System.out.println("결과 : "+overlapcheck_result); //확인용
	 * 
	 * return overlapcheck_result; //return 한 값이 ajax success (data)로 간다 }
	 * 
	 * 
	 * //내정보수정진입전비밀번호본인인증화면
	 * 
	 * @RequestMapping("/membercheckform") public String
	 * membercheckform(HttpServletRequest request, Model model) {
	 * System.out.println("@@@MemberController/membercheckform()@@@");
	 * //mickyServiceInter = new MainService(sqlSession,session);
	 * //mickyServiceInter.execute(model);
	 * 
	 * return "/member/membercheckform"; }
	 * 
	 * 
	 * //내정보수정진입전비밀번호본인인증
	 * 
	 * @RequestMapping(value="/membercheck",method = RequestMethod.GET)
	 * 
	 * @ResponseBody public int membercheck(HttpServletRequest request, Model model)
	 * { System.out.println("@@@MemberController/membercheck()@@@");
	 * model.addAttribute("request",request); mickyServiceInter = new
	 * MemberDropCheckService(sqlSession,session); mickyServiceInter.execute(model);
	 * 
	 * Map<String, Object> map = model.asMap(); int membercheck = (Integer)
	 * map.get("memberdropcheck");
	 * 
	 * // String overlapcheck_result = request.getParameter("count");
	 * 
	 * System.out.println("결과 : "+membercheck);
	 * 
	 * return membercheck; }
	 */
}