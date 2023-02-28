package micky.sports.shop.dao;

import java.util.ArrayList;

import micky.sports.shop.dto.MemberDto;
import micky.sports.shop.dto.Qna_MemberDto;

public interface Member {
	
	//회원가입
	public void join(String m_id,String m_pw,String m_name,String m_tel,String m_name2,String m_email,
			String m_grade,int m_age,String m_gender,String m_filesrc,String key,String encryStr);
	
	public MemberDto getsharsa(String m_id);
	
	//로그인
	public int login(String loginform_inputid);
	
	//아이디중복검사
	public int joinidcheck(String m_id);
	
	//회원목록
	public ArrayList<MemberDto> getmemberlist(int start,int end,String searchKeyword,String selNum);
	
	//회원정보수정화면
	public MemberDto memberupdateform(String m_id);
	
	//회원정보수정
	public void memberupdate(String m_id, String m_pw, String m_name, String m_tel, String m_name2, String m_email, String m_grade,
			int m_age, String m_gender, int m_cash, String m_filesrc, String sha, String rsa);
	//회원정보수정2
		public void memberupdate2(String m_id, String m_pw, String m_name, String m_tel, String m_name2, String m_email, String m_grade,
				int m_age, String m_gender, int m_cash, String sha, String rsa);
	
	//회원정보삭제
	public void memberdelete(String m_id);
	
	//마이페이지(회원)문의리스트
	public ArrayList<Qna_MemberDto> getqnalist(String m_id,int start,int end);
	
	//마이페이지(회원)문의글쓰기
	public void qnawrite(String q_mtitle,String q_mcontent,String q_mid);
	
	//문의글디테일
	public Qna_MemberDto qnadetail(int q_mno);
	
	//닉네임중복검사
	public int joinnicknamecheck(String m_name2);
	
	//이미지가져오기
	public MemberDto getimg(String m_id);
	
	//마이페이지(회원)내정보수정
	public void infoupdate(String m_id,String m_pw,String m_tel,String m_name2,String m_email,String m_filesrc,String sha,String rsa);
	public void infoupdat2(String m_id,String m_pw,String m_tel,String m_name2,String m_email,String sha,String rsa);
//	public void infoupdat3(String m_id,String m_pw,String m_name2,String m_email,String sha,String rsa);
//	public void infoupdat4(String m_id,String m_pw,String m_tel,String m_email,String sha,String rsa);
//	public void infoupdat5(String m_id,String m_tel,String m_name2,String m_email,String sha,String rsa);
//	public void infoupdat6(String m_id,String m_pw,String m_tel,String m_name2,String sha,String rsa);
	
	//마이페이지(회원)회원탈퇴 진입시 본인확인
	//public int memberdropcheck(String m_id);
	
	//관리자페이지 모든회원의 문의리스트
	public ArrayList<Qna_MemberDto> getadminqnalist(int start,int end,String searchKeyword,String selNum);
	
	//문의에 답변하면 답변유무 업데이트
	public void qnareplyupdate(String q_mno);
	
	//문의에 답변하기
	public void qnareply(String q_mtitle,String q_mcontent,
			String q_mreply,String q_mid,int q_mgroup,int q_mstep,int q_mindent);
	
	//문의 답변 들여쓰기
	public void qnareplyshape(int q_mgroup,int q_mstep);
	
	//문의글 삭제하기
	public void qnadelete(String q_mno);
	
	//해당 이메일 사용중인지 검색
	public int emailoverlapcheck(String m_email);
	
	//비밀번호찾기로 임시비밀번호 발송되면 회원정보에서 비밀번호를 임시비밀번호로 업데이트
	public void temporarypw(String check_num,String m_email,String sha,String rsa);
	
	//비밀번호찾기
	public int findpw(String m_id,String m_email);
	
	//아이디찾기
	public String findid(String m_name,String m_email);
	
	
	public int selectmemberTotCount(String searchKeyword);
	public int selectmemberTotCount2(String searchKeyword);
	public int selectmemberTotCount3(String searchKeyword);
	public int selectmemberTotCount4(String searchKeyword);
	
	public int selectqnalistTotCount(String m_id);
	
	public int selectadminqnalistTotCount();
	
	public int selectadminqnalistTotCount(String searchKeyword);
	public int selectadminqnalistTotCount2(String searchKeyword);
	public int selectadminqnalistTotCount3(String searchKeyword);
	public int selectadminqnalistTotCount4(String searchKeyword);
	
	//차트
	public int getTotalMember();
	public int getMaleMember();
	public int getFemaleMember();
	
	public int getmemberchart1();
	public int getmemberchart2();
	public int getmemberchart3();
	public int getmemberchart4();
	public int getmemberchart5();
	public int getmemberchart6();
	public int getmemberchart7();
	public int getmemberchart8();
	

}
