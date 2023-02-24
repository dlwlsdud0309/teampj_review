package micky.sports.shop.service.qnamember;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.Member;
import micky.sports.shop.dto.MemberDto;
import micky.sports.shop.service.MickyServiceInter;
import micky.sports.shop.vopage.SearchVO;

public class MemberListService implements MickyServiceInter{

	private SqlSession sqlSession;
	private HttpSession session;
	
	public MemberListService(SqlSession sqlSession,HttpSession session) {
		this.sqlSession = sqlSession;
		this.session = session;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println("MemberListService");
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		SearchVO searchVo = (SearchVO) map.get("searchvo");
		
		Member dao = sqlSession.getMapper(Member.class);

		
		String brdtitle = request.getParameter("searchType");
		
		
		if(brdtitle == null) {
			brdtitle="";
		}
//		if(brdtitle!=null) { //checkbox 체크되어있을때 작동 확인용
//			for (int i = 0; i < brdtitle.length; i++) {
//				System.out.println("checkbox : "+brdtitle[i]);
//			}
//		}
		
		
//		String mid = "";
//		String memail = "";
		
//		if(brdtitle!=null) {
//			for (String val : brdtitle) {
//				if(val.equals("mid")) {
//					model.addAttribute("mid","true");
//					mid="mid";
//				}else if(val.equals("memail")) {
//					model.addAttribute("memail","true");
//					memail="memail";
//				}
//			}
//		}
		
		//키워드 가져오기
		String searchKeyword = request.getParameter("sk");
		if(searchKeyword==null) {
			searchKeyword="";
			
		}
		model.addAttribute("resk",searchKeyword);
		System.out.println("keyword : "+searchKeyword);
		
		
		String strPage = request.getParameter("page");
		if(strPage==null) {
			strPage="1";
		}
		System.out.println("page : "+strPage);
		
		int page = Integer.parseInt(strPage);
		searchVo.setPage(page);;
		
		int total=0;
//	      if(mid.equals("mid") && memail.equals("")) {
//	         total=dao.selectmemberTotCount(searchKeyword);
//	      }else if(mid.equals("") && memail.equals("memail")) {
//	         total=dao.selectmemberTotCount2(searchKeyword);
//	      }else if(mid.equals("mid") && memail.equals("memail")) {
//	         total=dao.selectmemberTotCount3(searchKeyword);
//	      }else if(mid.equals("") && memail.equals("")) {
//	         total=dao.selectmemberTotCount4(searchKeyword);
//	      }
		 if(brdtitle.equals("아이디")) {
	         total=dao.selectmemberTotCount(searchKeyword);
	      }else if(brdtitle.equals("이메일")) {
	         total=dao.selectmemberTotCount2(searchKeyword);
	      }else if(brdtitle.equals("아이디+이메일")) {
	         total=dao.selectmemberTotCount3(searchKeyword);
	      }else if(brdtitle.equals("")) {
	         total=dao.selectmemberTotCount4(searchKeyword);
	      }
		
		//토탈 글의 갯수 구하기
		//int total = dao.selectmemberTotCount();
		System.out.println("total : "+total);
		searchVo.pageCalculate(total);
		
		//계산된 내용 출력
		System.out.println("totRow : "+total);
		System.out.println("clickpage : "+page);
		System.out.println("pageStart : "+searchVo.getPageStart());
		System.out.println("pageEnd : "+searchVo.getPageEnd());
		System.out.println("pageTot : "+searchVo.getTotPage());
		System.out.println("rowStart : "+searchVo.getRowStart());
		System.out.println("rowEnd : "+searchVo.getRowEnd());
		
		int rowStart = searchVo.getRowStart();
		int rowEnd = searchVo.getRowEnd();
		
		//ArrayList<MemberDto> list = dao.getmemberlist(rowStart,rowEnd);
		
		if(brdtitle.equals("아이디")) {
	         //list = dao.list(rowStart,rowEnd,searchKeyword,"1");
			model.addAttribute("member", dao.getmemberlist(rowStart,rowEnd,searchKeyword,"1")); //다르게 표현해보기
	      }else if(brdtitle.equals("이메일")) {
	    	 // list = dao.list(rowStart,rowEnd,searchKeyword,"2");
	    	  model.addAttribute("member", dao.getmemberlist(rowStart,rowEnd,searchKeyword,"2"));
	      }else if(brdtitle.equals("아이디") && brdtitle.equals("이메일")) {
	    	 // list = dao.list(rowStart,rowEnd,searchKeyword,"3");
	    	  model.addAttribute("member", dao.getmemberlist(rowStart,rowEnd,searchKeyword,"3"));
	      }else if(brdtitle.equals("") && brdtitle.equals("")) {
	    	 // list = dao.list(rowStart,rowEnd,searchKeyword,"4");
	    	  model.addAttribute("member", dao.getmemberlist(rowStart,rowEnd,searchKeyword,"4"));
	      }		
		
		//model.addAttribute("member",list);
		model.addAttribute("totRowcnt", total);
		model.addAttribute("searchVo", searchVo);
		model.addAttribute("searchtype",brdtitle);

		
	}

}
