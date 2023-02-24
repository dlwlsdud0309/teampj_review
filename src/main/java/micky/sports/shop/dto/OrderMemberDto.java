package micky.sports.shop.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;


@Setter
@Getter
public class OrderMemberDto {

	private String om_cntnum; //상품주문번호 yyyymmdd+색상+사이즈
	private String om_num; //주문번호 yyymmdd+seq
	private String p_no; //상품번호
	private int u_cnt; //주문수량
	private String m_id; //아이디
	private Date om_date; //주문일자
	private String om_pay;//결제형태
	private int p_price; //총액
	private String om_state; //처리상태
	private String om_cancle; //주문취소여부
	private Date om_cdate; //주문취소일자
	private String c_reason;//주문취소사유
	private String om_delcancle;//반품요청여부(N,Y)

	private ProductDto productDto; //join  테이블
	private MemberDto memberDto; //join
	private ReviewDto reviewDto; //join
	
	public OrderMemberDto() {
		// TODO Auto-generated constructor stub
	}
	
	//※ AdminDao의 OrderMemberDto dto = new OrderMemberDto와 순서가 동일해야 한다.
	public OrderMemberDto(String om_cntnum, String om_num, String p_no,
			 int u_cnt, String m_id, Date om_date, String om_pay, int p_price, 
			String om_state, String om_cancle, Date om_cdate,String c_reason,String om_delcancle) {
		
		this.om_cntnum = om_cntnum;//상품주문번호
		this.om_num = om_num;//주문번호
		this.p_no = p_no;//상품번호
		this.u_cnt = u_cnt;//주문수량
		this.m_id = m_id;//아이디
		this.om_date = om_date;//주문일자
		this.om_pay = om_pay;//결제형태
		this.p_price = p_price;//총액
		this.om_state = om_state;//처리상태
		this.om_cancle = om_cancle;//주문취소여부
		this.om_cdate = om_cdate;//주문취소일자
		this.c_reason = c_reason;//주문취소사유
		this.om_delcancle = om_delcancle;//반품요청여부(N,Y)
	}
}
