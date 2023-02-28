package micky.sports.shop.service.qnamember;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import micky.sports.shop.crypt.CryptoUtil;
import micky.sports.shop.dao.Member;
import micky.sports.shop.dto.MemberDto;
import micky.sports.shop.service.MickyServiceInter;

public class MemberUpdateService implements MickyServiceInter{

	private SqlSession sqlSession;
	private HttpSession session;
	
	public MemberUpdateService(SqlSession sqlSession,HttpSession session) {
		this.sqlSession = sqlSession;
		this.session = session;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println("MemberUpdateService");
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		CryptoUtil crypt = (CryptoUtil) map.get("crypt");
		
		String attachPath="resources\\upload\\";
	    String uploadPath=request.getSession().getServletContext().getRealPath("/");
	    System.out.println("uploadpathhhhh:"+uploadPath);
	    String path = "C:\\2022spring\\springwork1\\micky_SportsWear\\src\\main\\webapp\\resources\\upload";
	    MultipartRequest req = null;
	    try {
	    	req=
	  	          new MultipartRequest(request, path, 1024*1024*20, "utf-8",
	  	                new DefaultFileRenamePolicy());
	    	System.out.println("req : "+req);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		
		Member dao = sqlSession.getMapper(Member.class);
		System.out.println("오륭로ㅓ율오류오류오");
		String m_id = req.getParameter("m_id");
		String m_pw = req.getParameter("m_pw");
		String m_name = req.getParameter("m_name");
		String m_tel = req.getParameter("m_tel");
		String m_name2 = req.getParameter("m_name2");
		String m_email = req.getParameter("m_email");
		String m_grade = req.getParameter("m_grade");
		int m_age = Integer.parseInt(req.getParameter("m_age"));
		String m_gender = req.getParameter("m_gender");
		int m_cash = Integer.parseInt(req.getParameter("m_cash"));
		String m_filesrc = req.getFilesystemName("m_filesrc");
		
		
		
		System.out.println("확인용 : "+m_id+m_pw+m_name+m_tel+m_name2+m_email+m_grade+m_age+m_gender+m_cash);
		System.out.println("왜 사진이 안올라가니 : "+m_filesrc);
		String key="";
		try {
			key=CryptoUtil.sha512(m_pw);
		} catch (Exception e) {
			// TODO: handle exception
		}
		System.out.println("sha512방식 암호화 : "+key);
		
		String key2=key;
		String encryStr = "";
		try {
			encryStr = CryptoUtil.encryptAES256(m_pw, key2);
		} catch (Exception e) {
			// TODO: handle exception
		}
		System.out.println("양방향암호화 : "+encryStr);
		
		if(m_filesrc==null) { // 파일첨부안하면 null이라 오류떠서 null상황 배제를 위해 조건을 달아준다
			m_filesrc="";
			dao.memberupdate2(m_id,m_pw,m_name,m_tel,m_name2,m_email,m_grade,m_age,m_gender,m_cash,key,encryStr);
		}else{
			dao.memberupdate(m_id,m_pw,m_name,m_tel,m_name2,m_email,m_grade,m_age,m_gender,m_cash,m_filesrc,key,encryStr);
		}
		
		
		
//		dao.memberupdate(m_id,m_pw,m_name,m_tel,m_name2,m_email,m_grade,m_age,m_gender,m_cash,m_filesrc,key,encryStr);

	}

}
