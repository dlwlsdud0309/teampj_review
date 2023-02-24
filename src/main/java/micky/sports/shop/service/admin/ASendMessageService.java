package micky.sports.shop.service.admin;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.springframework.ui.Model;

import micky.sports.shop.dao.Admin;
import micky.sports.shop.dto.MemberDto;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
//admin sms
public class ASendMessageService implements MickyAMessageServiceInter{
	private SqlSession sqlSession;
	
	public ASendMessageService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println("---ASendMessageService");
		Map<String , Object> map=model.asMap();
		HttpServletRequest request=
				(HttpServletRequest)map.get("request");

		String om_cntnum=request.getParameter("om_cntnum");//admin_olist(ordermemberdto)
		
		Admin dao=sqlSession.getMapper(Admin.class);
		MemberDto sendcsms=dao.sendcsms(om_cntnum);
		//출력확인
		System.out.println("om_cntnum : "+om_cntnum);
		//member
		System.out.println("m_id : "+sendcsms.getM_id());
		System.out.println("m_tel : "+sendcsms.getM_tel());
//		model.addAttribute("send_csms",sendcsms);
		
		 
//		 String api_key = "#";//api key
//		 String api_secret = "#";//secret key
//		 Message coolsms = new Message(api_key,api_secret);
//		 HashMap<String, String> params = new HashMap<String, String>();
//		 params.put("type","SMS");//type
//		 params.put("text","[MickySporsWear]주문이 취소되었습니다.");//content
//		 params.put("to","010-0000-0000");//user
//		 params.put("from","010-0000-0000");//admin
//		 try{
//		 	JSONObject obj = (JSONObject) coolsms.send(params);
//		 	System.out.println("sms전송성공");
//		 	System.out.println(obj.toString());
//		 } catch(CoolsmsException e){
//		 	System.out.println("sms전송실패");
//		 	
//		 }
		
	}
}
