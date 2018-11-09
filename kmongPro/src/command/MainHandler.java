package command;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;
import com.util.DBConn;
import com.util.JdbcUtil;

import category.CategoryDAO;
import category.CategoryDTO;
import member.MemberDAO;
import member.MemberDTO;
import service.MasterRankInfo;
import service.MasterRankService;

public class MainHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String m_email = (String) request.getSession().getAttribute("authUser");
		
		
		Connection conn = ConnectionProvider.getConnection();
		System.out.println("maihandler~~");
		ArrayList<CategoryDTO> categoryList = new ArrayList<>();
		ArrayList<MasterRankInfo> masterRankList = new ArrayList<>();
		try {
			CategoryDAO categoryDAO = new CategoryDAO();
			
			categoryList = categoryDAO.selectAll_category(conn);
			request.setAttribute("categoryList", categoryList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {

		}
		
		MasterRankService masterRankService = new MasterRankService();
		masterRankList = masterRankService.getMasterTop5(conn);
		request.setAttribute("masterRankList", masterRankList);
		
		return "/WEB-INF/view/main/main.jsp";
	}
	
}
