package micky.sports.shop.service.member;

import java.lang.ProcessBuilder.Redirect;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.crypt.CryptoUtil;
import micky.sports.shop.dao.Member;
import micky.sports.shop.dto.MemberDto;
import micky.sports.shop.service.MickyServiceInter;

public class MemberDropCheckService implements MickyServiceInter{

	private SqlSession sqlSession;
	private HttpSession session;
	
	public MemberDropCheckService(SqlSession sqlSession,HttpSession session) {
		this.sqlSession = sqlSession;
		this.session = session;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println("MemberDropCheckService");
		
		int memberdropcheck = -1; //회원탈퇴본인인증결과
		//String loginid = ""; 
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		CryptoUtil crypt = (CryptoUtil) map.get("crypt");
		
		String m_id = (String)session.getAttribute("loginid");
		String m_pw = request.getParameter("m_pw"); 
		System.out.println("인증하는 아이디 : "+m_id);
		
		Member dao = sqlSession.getMapper(Member.class);
		
		
			MemberDto dto = dao.getsharsa(m_id);
			String sha = dto.getSha();
			String rsa = dto.getRsa();

			if(dto!=null) {
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
					
					//복호화 처리할때는 암호화에썻던 key2값 써야됨
					

				if(m_pw.equals(decryptStr)) { 
					System.out.println("본인인증완료"); 
					System.out.println("세션등록아이디 확인 : "+session.getAttribute("loginid")); //확인용
					memberdropcheck = 1;
				}else{ //로그인실패일때
					System.out.println("본인인증실패");
					memberdropcheck = 0;
				}
				model.addAttribute("memberdropcheck",memberdropcheck); //로그인확인결과
			}
			
		}

	}


