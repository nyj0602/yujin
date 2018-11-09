package management;

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import command.CommandHandler;

public class FileUploadHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection conn = null;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager .getConnection("jdbc:oracle:thin:@211.63.89.174:1521:xe", "kmong", "kmong");
		PreparedStatement  pstmt = null;
		String content = request.getParameter("content");
		String email =(String)request.getSession().getAttribute("authUser");  //세션에 저장된값 가져오기
		if (email==null) {
			return "/WEB-INF/view/login/login.jsp";
		}
		String file = request.getParameter("file");
		String ordernum = request.getParameter("orderNum");
		System.out.println(file);
		System.out.println(email);
		System.out.println(ordernum);
		System.out.println(content);
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat date = new SimpleDateFormat("yy.MM.dd hh:mm");
		String datetime = date.format(cal.getTime());
		String sql = "";
		try {
sql = " insert into process_list values(PROLIST_SEQ.NEXTVAL,?,'첨부파일 : "+file+" 이(가) 첨부되었습니다',?, sysdate ,1 ,? )";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, file);
			pstmt.setString(3, ordernum);
			pstmt.executeUpdate();
			sql = " insert into process_list values(PROLIST_SEQ.NEXTVAL,?,?,?, sysdate ,1 ,? )";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, content);
			pstmt.setString(3, file);
			pstmt.setString(4, ordernum);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println(e.toString());
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (Exception e) {
				}
			 //if (conn != null) try { conn.close();} catch (Exception e) { }
		}
		request.setAttribute("file", file);
		request.setAttribute("datetime", datetime);
		request.setAttribute("content", content);
		request.setAttribute("complete", "complete");
		return "/WEB-INF/view/management/uploadcheck.jsp";
	}

}
