package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import command.CommandHandler;
import net.sf.json.JSONObject;

public class AdminHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("adminhandler");
		

		Connection conn = null;
		conn=DBConn.getConnection();

		String sep = request.getParameter("sep")==null?"전체":request.getParameter("sep");
		String keyword = request.getParameter("keyword")==null? "" : request.getParameter("keyword");
		
		request.setAttribute("keyword", keyword);
		request.setAttribute("sep", sep);
		
		AdminPaging dao = AdminPaging.getInstance();
		
		int currentPage = request.getParameter("page")==null? 1 :Integer.parseInt(request.getParameter("page"));
		int start, end;
		int pageSize = request.getParameter("pageSize")== null? 10 : Integer.parseInt(request.getParameter("pageSize"));
		int pageBlock = 10;
		
		int totalRecords = dao.getTotalMemRecords(conn,keyword, sep);
		
		int totalPages = (int)Math.ceil((double)totalRecords/pageSize);
		
		start = (currentPage-1) * pageSize + 1;			
		end = start + pageSize-1 > totalRecords ? totalRecords  : start+pageSize-1 ;
	
		
		JSONObject jobj = dao.selectMemberList(conn,start,end,keyword, sep);
		
		String paging = dao.pagingMemProc(currentPage, pageSize, pageBlock, totalPages, "admin", keyword, sep);
	
		
		request.setAttribute("paging", paging);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("member", jobj);
		request.setAttribute("pageSize", pageSize);
		

		
		return "/WEB-INF/view/admin/admin_body.jsp";
	}

}

