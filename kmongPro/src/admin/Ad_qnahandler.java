package admin;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import command.CommandHandler;
import net.sf.json.JSONObject;

public class Ad_qnahandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {


		System.out.println("Ad_qnahandler");
		

		Connection conn = null;
		conn=DBConn.getConnection();
		

		AdminPaging dao = AdminPaging.getInstance();
		
		int currentPage = request.getParameter("page")==null? 1 :Integer.parseInt(request.getParameter("page"));
		int start, end;
		int pageSize = request.getParameter("pageSize")== null? 10 : Integer.parseInt(request.getParameter("pageSize"));
		int pageBlock = 10;
		
		int totalRecords = dao.getTotalQnaRecords(conn);
		
		int totalPages = (int)Math.ceil((double)totalRecords/pageSize);
		
		start = (currentPage-1) * pageSize + 1;			
		end = start + pageSize-1 > totalRecords ? totalRecords  : start+pageSize-1 ;
	
		
		JSONObject jobj = dao.selectQnaList(conn,start,end);
		
		String paging = dao.pagingRepProc(currentPage, pageSize, pageBlock, totalPages, "ad_QNA");
	
		
		request.setAttribute("paging", paging);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("qna", jobj);
		request.setAttribute("pageSize", pageSize);

		
		
		
		
		
		return "/WEB-INF/view/admin/admin_qna.jsp";
	}

}
