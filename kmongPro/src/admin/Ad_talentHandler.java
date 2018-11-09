package admin;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import command.CommandHandler;
import net.sf.json.JSONObject;

public class Ad_talentHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("Ad_talentHandler");
		

		Connection conn = null;
		conn=DBConn.getConnection();
		
		String sep = request.getParameter("sep") == null? "승인중" : request.getParameter("sep");
		String cates = request.getParameter("cate")==null?"0":request.getParameter("cate");
		String keyword = request.getParameter("keyword")==null? "" : request.getParameter("keyword");
		keyword = keyword.equals("전체")? "" : keyword;
		
		int cate = Integer.parseInt(cates);
		
		request.setAttribute("keyword", keyword);
		request.setAttribute("sep", sep);
		request.setAttribute("cate", cate);

		AdminPaging dao = AdminPaging.getInstance();
		
		int currentPage = request.getParameter("page")==null? 1 :Integer.parseInt(request.getParameter("page"));
		int start, end;
		int pageSize = request.getParameter("pageSize")== null? 10 : Integer.parseInt(request.getParameter("pageSize"));
		int pageBlock = 10;
		
		int totalRecords = dao.getTotalTalRecords(conn,keyword,cate,sep);
		
		int totalPages = (int)Math.ceil((double)totalRecords/pageSize);
		
		start = (currentPage-1) * pageSize + 1;			
		end = start + pageSize-1 > totalRecords ? totalRecords  : start+pageSize-1 ;
	
		JSONObject jobj = dao.selectTalentList(conn,start,end,keyword,cate,sep);
		
		String paging = dao.pagingTalProc(currentPage, pageSize, pageBlock, totalPages, "ad_tal",cate, keyword, sep);
	
	
		request.setAttribute("paging", paging);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("talent", jobj);
		request.setAttribute("pageSize", pageSize);
		
		
		if (sep.contains("승인중")) {

			return "/WEB-INF/view/admin/admin_tal.jsp";
		
		} else {

			return "/WEB-INF/view/admin/admin_Alltal.jsp";
			
		}
		
		
	}

}
