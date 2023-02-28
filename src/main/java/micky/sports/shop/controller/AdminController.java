package micky.sports.shop.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import micky.sports.shop.service.MickyServiceInter;
import micky.sports.shop.service.admin.ABuyConfirmModifyService;
import micky.sports.shop.service.admin.ACancleModifyService;
import micky.sports.shop.service.admin.AContentViewService;
import micky.sports.shop.service.admin.ADelCompleteModifyService;
import micky.sports.shop.service.admin.AOrderConfirmModifyService;
import micky.sports.shop.service.admin.AOrderListService;
import micky.sports.shop.service.admin.ARefundCompleteModifyService;
import micky.sports.shop.service.admin.ASearchListService;
import micky.sports.shop.service.admin.ASendMessageService;
import micky.sports.shop.service.admin.MickyAMessageServiceInter;
import micky.sports.shop.vopage.SearchVO;


@Controller
public class AdminController {
	MickyServiceInter mickyServiceInter;
	MickyAMessageServiceInter mickyamsessageServiceInter;//cancle sms 발송
	
	@Autowired
	private SqlSession sqlSession;
	
	//관리자 주문관리 현황 리스트
	 @RequestMapping("/admin_olist") //url 주소줄 
	 public String olist(HttpServletRequest request, SearchVO searchVO, Model model) { 
		 System.out.println(">>>>>>>>>olist<<<<<<<<<<");
		 
		 //DB 
		 model.addAttribute("request",request);
		 model.addAttribute("searchVo",searchVO);
		 		 
		 mickyServiceInter=new AOrderListService(sqlSession);
		 mickyServiceInter.execute(model);

		 return "admin/admin_olist"; //spring jsp 파일 위치
	 }
	 
	 
	//주문취소 목록 검색 기능-시작날짜~종료날짜+취소요청Y 기준
	 @RequestMapping("/search_olist") 
	 public String slist(HttpServletRequest request,Model model) { 
		 System.out.println(">>>>>>>>>search_olist<<<<<<<<<<");
		 String som_cdate=request.getParameter("som_cdate");
		 String eom_cdate=request.getParameter("eom_cdate");
		 String searchKeyword=request.getParameter("om_cancle");
			
		 System.out.println("som_cdate : "+som_cdate);		 
		 System.out.println("eom_cdate : "+eom_cdate);		 
		 System.out.println("Keyword : "+searchKeyword);
		  //DB 
		 model.addAttribute("request",request);
		 
		 mickyServiceInter=new ASearchListService(sqlSession);
		 mickyServiceInter.execute(model);

		 return "admin/search_olist"; 
	 }
	 
	 
	//관리자 주문내역 상세
	 @RequestMapping("/admin_contentview")  
	 public String acontentupdate(HttpServletRequest request, Model model) {
		 System.out.println(">>>>>>>>>acontentview<<<<<<<<<<");
	
		 //DB 
		 model.addAttribute("request",request);
		 
		 mickyServiceInter=new AContentViewService(sqlSession);
		 mickyServiceInter.execute(model);	
		 
		 return "admin/admin_contentview"; 
	}
		 
		 
	//관리자 주문내역 상세 : 결제완료 → 주문취소 변경
	 @RequestMapping(method = RequestMethod.POST, value = "/modify") 
	 public String amodify(HttpServletRequest request, Model model) {
		 System.out.println(">>>>>>>>>amodify<<<<<<<<<<");
		 //acontentview
		 request.getParameter("om_state");
		 
		 //sms
		 request.getParameter("m_id");
		 
		 //DB cancle
		 model.addAttribute("request",request);
		 //확인--null
		 System.out.println(request.getParameter("inputValue"));
		 
		 //acountview select option : view단 select option 선택 값
		 String option=request.getParameter("om_state");
		 //view단 select option 선택값 확인
//		 System.out.println("om_state : "+option);
		 
		 if(option.equals("주문취소")) {
			 mickyServiceInter=new ACancleModifyService(sqlSession);//결제완료 → 주문취소
			 mickyServiceInter.execute(model);
			 //cancle sms
			 mickyamsessageServiceInter=new ASendMessageService(sqlSession);
			 mickyamsessageServiceInter.execute(model);
		 }else if(option.equals("주문확정")) {
			 mickyServiceInter=new AOrderConfirmModifyService(sqlSession);//결제완료 → 주문확정
			 mickyServiceInter.execute(model);
		 }else if(option.equals("배송완료")) {
			 mickyServiceInter=new ADelCompleteModifyService(sqlSession);//결제완료 → 배송완료
			 mickyServiceInter.execute(model);
		 }else if(option.equals("반품완료")) {
			 mickyServiceInter=new ARefundCompleteModifyService(sqlSession);//결제완료 → 반품완료
			 mickyServiceInter.execute(model);
		 }else if(option.equals("구매확정")) {
			 mickyServiceInter=new ABuyConfirmModifyService(sqlSession);//결제완료 → 구매확정
			 mickyServiceInter.execute(model);
		 }
		 		 		
		 return "redirect:admin_olist"; 
		 
	} 
	 
	 //관리자 메인페이지
	 @RequestMapping("/adminmain")  			//Model model
	 public String adminmain(HttpServletRequest request) {
		 System.out.println(">>>>>>>>>adminmain<<<<<<<<<<");
	
		 //DB 
		 mickyServiceInter=new AContentViewService(sqlSession);
		 
		 return "admin/adminmain"; 
	}
	 
	 
	 
	 
	 
	 
		
}
