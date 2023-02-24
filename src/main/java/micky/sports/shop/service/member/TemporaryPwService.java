package micky.sports.shop.service.member;

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

public class TemporaryPwService implements MickyServiceInter{

	private SqlSession sqlSession;
	private HttpSession session;
	
	public TemporaryPwService(SqlSession sqlSession,HttpSession session) {
		this.sqlSession = sqlSession;
		this.session = session;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println("TemporaryPwService");
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		CryptoUtil crypt = (CryptoUtil) map.get("crypt");
		String check_num = (String) map.get("check_num");
		String m_email = request.getParameter("email");
		
		String key="";
		try {
			key=CryptoUtil.sha512(check_num);
		} catch (Exception e) {
			// TODO: handle exception
		}
		System.out.println("sha512방식 암호화 : "+key);
		
		String key2=key;
		String encryStr = "";
		try {
			encryStr = CryptoUtil.encryptAES256(check_num, key2);
		} catch (Exception e) {
			// TODO: handle exception
		}
		System.out.println("양방향암호화 : "+encryStr);
		
		Member dao = sqlSession.getMapper(Member.class);
		
		dao.temporarypw(check_num,m_email,key,encryStr);

	}

}
