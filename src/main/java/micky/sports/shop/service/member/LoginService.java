package micky.sports.shop.service.member;

import java.io.UnsupportedEncodingException;
import java.lang.ProcessBuilder.Redirect;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Map;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.crypt.CryptoUtil;
import micky.sports.shop.dao.Member;
import micky.sports.shop.dto.MemberDto;
import micky.sports.shop.service.MickyServiceInter;

public class LoginService implements MickyServiceInter {

	private SqlSession sqlSession;
	private HttpSession session;
	
	public LoginService(SqlSession sqlSession,HttpSession session) {
		this.sqlSession = sqlSession;
		this.session = session;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println("LoginService@@@");
		
		int logincheck_result = -1; //로그인 확인결과
		
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		CryptoUtil crypt = (CryptoUtil) map.get("crypt");
	
		Member dao = sqlSession.getMapper(Member.class);
		
		String m_id = request.getParameter("loginform_input_id"); //loginform에서 입력받은 id값
		String m_pw = request.getParameter("loginform_input_pw"); //loginform에서 입력받은 password값
		
//		logincheck_result = dao.login(m_id);
		
//		if(logincheck_result == 0) {
//			model.addAttribute("logincheck_result",logincheck_result); //로그인확인결과
//		}else{
			MemberDto dto = dao.getsharsa(m_id);
			if(dto==null) {
				logincheck_result = 0;
				System.out.println("회원정보에아이디없음 확인용");
				model.addAttribute("logincheck_result",logincheck_result); //로그인확인결과
			}else {
				String sha = dto.getSha();
				String rsa = dto.getRsa();
				System.out.println("확인용 : "+sha+rsa);			
				
				String decryptStr = "";
							
				System.out.println("============================ ");
					try {
						decryptStr=CryptoUtil.decryptAES256(rsa,sha );
						System.out.println("복호화된 데이터 : "+decryptStr);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
						System.out.println("복호화된 데이터실패 : ");
					} 
					System.out.println("============================ ");
					

				if(m_pw.equals(decryptStr)) { //로그인성공일때
					System.out.println("로그인완료"); //확인용
					session = request.getSession();
					session.setAttribute("loginid", m_id); //세션에 아이디등록
					System.out.println("세션등록아이디 확인 : "+session.getAttribute("loginid")); //확인용
					logincheck_result = 1;
				}else{ //로그인실패일때
					System.out.println("비밀번호틀림확인용");
					logincheck_result = 0;
				}
				model.addAttribute("logincheck_result",logincheck_result); //로그인확인결과
			}
			
		}
		
		
		
		//logincheck_result = dao.login(m_id, m_pw); //입력한id,password를 조건으로 회원정보에 select count(*) 후 결과(int)
		
		
		}
	


