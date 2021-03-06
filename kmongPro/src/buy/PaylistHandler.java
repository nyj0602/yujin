package buy;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import command.CommandHandler;
import command.PagingDAO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class PaylistHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("paylisthandler");

		Date date = new Date();
		Date date2 = new Date(date.getYear()-1, date.getMonth(), date.getDate());
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String strDate = df.format(date);
		String strDate2 = df.format(date2);
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		
		
		conn=DBConn.getConnection();
		
		String id = "dodo95123@naver.com"; // 세션 받아와서 저장
		String name = "soomin1";
		
		String start_date =  request.getParameter("start_date")==null? strDate2 : request.getParameter("start_date");
		String end_date =  request.getParameter("end_date")==null? strDate : request.getParameter("end_date");
		String type = request.getParameter("type")== null ? "" : request.getParameter("type");
		type = type.equals("전체")?  "" : type;
		
		String query = "select s.sc_money, c.cc_money from save_cash s join charge_cash c on s.m_email=c.m_email where s.m_email=? and c.m_email=?"; 
		pstmt=conn.prepareStatement(query);
		
		pstmt.setString(1, id);
		pstmt.setString(2, id);
				
		rs = pstmt.executeQuery();
		
		
		int sc=0, cc=0;
		while(rs.next()) {
			
			sc = rs.getInt(1);
			cc = rs.getInt(2);
		}


		request.setAttribute("sc", sc);
		request.setAttribute("cc", cc);

		//페이징
		PagingDAO dao = PagingDAO.getInstance();
		int currentPage = request.getParameter("page")==null ? 1 : Integer.parseInt(request.getParameter("page"));
		int start, end;
		int pageSize = request.getParameter("pageSize")== null ? 5 : Integer.parseInt(request.getParameter("pageSize"));
		int pageBlock = 3;

		int totalRecords = dao.getTotalPayRecords(conn,type, id, start_date, end_date);

		// 총 페이지 수 
		int totalPages = (int)Math.ceil((double)totalRecords/pageSize);
		// 시작번호, 끝 번호
		start = (currentPage-1) * pageSize + 1;			
		end = start + pageSize-1 > totalRecords ? totalRecords  : start+pageSize-1 ;

		
		JSONObject jobj = dao.selectPayList(conn, start, end, type, id, start_date, end_date);	
		String paging = dao.pagingProc(currentPage, pageSize, pageBlock, totalPages, "paylist");
		
		request.setAttribute("paging", paging);
		request.setAttribute("paylist", jobj);
		request.setAttribute("name", name);
		request.setAttribute("start_date",start_date);
		request.setAttribute("end_date",end_date);
		request.setAttribute("type", type);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("active", "pay");
		request.setAttribute("start_date", start_date);
		request.setAttribute("end_date", end_date);
		request.setAttribute("pageSize", pageSize);
		
		return "/WEB-INF/view/buy/paylist_body.jsp";
		
		
	}

}
