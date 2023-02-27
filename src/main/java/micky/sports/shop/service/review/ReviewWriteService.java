package micky.sports.shop.service.review;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import micky.sports.shop.dao.ReviewDao;
import micky.sports.shop.service.MickyServiceInter;

public class ReviewWriteService implements MickyServiceInter{

	private SqlSession sqlSession;
	private HttpSession httpsession;
	
	public ReviewWriteService(SqlSession sqlSession,HttpSession httpsession) {
		this.sqlSession=sqlSession;
		this.httpsession = httpsession;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println(">>>>ReviewWriteService");
		
//		model에서 request를 풀어내는 방법
		Map<String, Object> map=model.asMap(); //model을 Map으로 변환
		HttpServletRequest request=
				(HttpServletRequest) map.get("request");
		

		httpsession = request.getSession();
		String loginId = (String)httpsession.getAttribute("loginid");
		
		
//		reviewupload code=================
		String attachPath="resources\\reviewupload\\";
		String uploadPath=request.getSession().getServletContext().getRealPath("/");
		
//		학원에서 작업
		String path="C:\\2022spring\\springwork1\\micky_SportsWear\\src\\main\\webapp\\resources\\reviewupload";
//		노트북에서 작업
//		String path="C:\\2023spring\\springwork1\\micky_SportsWear_review\\src\\main\\webapp\\resources\\reviewupload";
		
		MultipartRequest req=null;
		try {
			req=new MultipartRequest(request, path, 1024*1024*20,"utf-8",
					new DefaultFileRenamePolicy());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String om_cntnum=req.getParameter("om_cntnum");
		String p_no=req.getParameter("p_no");
		System.out.println("om_cntnum : "+om_cntnum);
		System.out.println("p_no : "+p_no);
		
		String r_title=req.getParameter("r_title");
		String r_content=req.getParameter("r_content");
		String r_filesrc=req.getFilesystemName("r_filesrc");
		String r_score=req.getParameter("r_score");
		
		if (r_filesrc==null) {
			r_filesrc="";
		}
		
		HttpSession session=request.getSession();
		session.removeAttribute("r_score");
		
		ReviewDao rdao=sqlSession.getMapper(ReviewDao.class);
		
		rdao.write(loginId,r_title,r_content,r_filesrc,r_score,p_no,om_cntnum);
	}

}
