package micky.sports.shop.dto;

import java.util.Date;

//@Setter
//@Getter
public class ReviewDto {
	private int r_no; //리뷰번호
	private String m_id; //회원(member)테이블의 id
	private String r_title; //리뷰제목
	private String r_content; //리뷰내용
	private String r_id; //회원(member)테이블의 관리자 id
	private String r_retitle; //답변제목
	private String r_recontent; //답변내용
	private String r_ynn; //답변유무, 타입 char(1)
	private Date r_date; //작성날짜
	private int r_group; //그룹
	private int r_step; //스텝
	private int r_indent; //인덴트
	private String r_filesrc; //첨부파일
	
	private MemberDto memberDto;
	
	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getR_title() {
		return r_title;
	}

	public void setR_title(String r_title) {
		this.r_title = r_title;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	}

	public String getR_id() {
		return r_id;
	}

	public void setR_id(String r_id) {
		this.r_id = r_id;
	}

	public String getR_retitle() {
		return r_retitle;
	}

	public void setR_retitle(String r_retitle) {
		this.r_retitle = r_retitle;
	}

	public String getR_recontent() {
		return r_recontent;
	}

	public void setR_recontent(String r_recontent) {
		this.r_recontent = r_recontent;
	}

	public String getR_ynn() {
		return r_ynn;
	}

	public void setR_ynn(String r_ynn) {
		this.r_ynn = r_ynn;
	}

	public Date getR_date() {
		return r_date;
	}

	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}

	public int getR_group() {
		return r_group;
	}

	public void setR_group(int r_group) {
		this.r_group = r_group;
	}

	public int getR_step() {
		return r_step;
	}

	public void setR_step(int r_step) {
		this.r_step = r_step;
	}

	public int getR_indent() {
		return r_indent;
	}

	public void setR_indent(int r_indent) {
		this.r_indent = r_indent;
	}

	public String getR_filesrc() {
		return r_filesrc;
	}

	public void setR_filesrc(String r_filesrc) {
		this.r_filesrc = r_filesrc;
	}

	public MemberDto getMemberDto() {
		return memberDto;
	}

	public void setMemberDto(MemberDto memberDto) {
		this.memberDto = memberDto;
	}

	public ReviewDto() {
		// TODO Auto-generated constructor stub
	}
}
