package memberjoin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;
import com.util.DBConn;
import com.util.JdbcUtil;

import AES128.AES128Cipher;
import command.CommandHandler;

public class MemberJoinHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String m_email = request.getParameter("m_email");
		String m_name = request.getParameter("fullname");
		String m_pwd = request.getParameter("m_pwd");
		String m_sep = request.getParameter("m_sep");
		String pm_phone = request.getParameter("mobile");
		System.out.println(m_email);
		System.out.println(m_name);
		System.out.println(m_pwd);
		System.out.println(m_sep);
		System.out.println(pm_phone);
		Connection conn = null;
		
		try {

			conn = ConnectionProvider.getConnection();
			
			pm_phone = makePhoneNumber(pm_phone);
			
			AES128Cipher aes = new AES128Cipher();
			
			m_pwd = aes.encAES(m_pwd);
			String sql = "insert into member(m_email, m_name, m_pwd, m_sep, M_WDRAING) ";
			sql += " values(?,?,?,?,0)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_email);
			pstmt.setString(2, m_name);
			pstmt.setString(3, m_pwd);
			pstmt.setString(4, m_sep);

			pstmt.executeUpdate();		
			
			String sqls = "insert into per_member(m_email, pm_name, pm_phone,pm_nchange) ";
			sqls += " values(?,?,?,0)";
			pstmt = conn.prepareStatement(sqls);
			pstmt.setString(1, m_email);
			pstmt.setString(2, m_name);
			pstmt.setString(3, pm_phone);
			
			pstmt.executeUpdate();
			
			int [] a = {1,2,4,6};
			
			for (int i = 0; i < a.length; i++) {
				sql = "insert into not_setting values("+a[i]+",?,0,0)";
				System.out.println(a[i]);
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, m_email);

				pstmt.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
		}
		
		
		
		

		return "/WEB-INF/view/main/main.jsp";
	}public static String makePhoneNumber(String phoneNumber) {
		   String regEx = "(\\d{3})(\\d{3,4})(\\d{4})";
		   if(!Pattern.matches(regEx, phoneNumber)) return null;
		   return phoneNumber.replaceAll(regEx, "$1-$2-$3");

	 }

}
