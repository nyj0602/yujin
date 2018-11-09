package memberjoin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import AES128.AES128Cipher;
import command.CommandHandler;

public class MemberCJoinHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String m_email = request.getParameter("m_email");
		String m_name = request.getParameter("fullname");
		String m_pwd = request.getParameter("m_pwd");
		String m_sep = request.getParameter("m_sep");
		String cm_phone = request.getParameter("mobile");
		String company_type = request.getParameter("company_type_id_input");
		String c_rn_input = request.getParameter("c_rn_input");
		String c_name_input = request.getParameter("c_name_input");

		if (company_type.equals("1")) {
			company_type = "스타트업";
		} else if (company_type.equals("2")) {
			company_type = "자영업";
		} else if (company_type.equals("3")) {
			company_type = "중소기업";
		} else if (company_type.equals("4")) {
			company_type = "중견기업";
		} else {
			company_type = "대기업";
		}

		cm_phone = makePhoneNumber(cm_phone);
		c_rn_input = makeCompanyNumber(c_rn_input);

		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
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
			

			String sqls = "insert into com_member(m_email, cm_name, cm_phone, cm_nchange, cm_sep, cm_num, cm_operator) ";
			sqls += " values(?,?,?,0,?,?,?)";
			pstmt = conn.prepareStatement(sqls);
			pstmt.setString(1, m_email);
			pstmt.setString(2, m_name);
			pstmt.setString(3, cm_phone);
			pstmt.setString(4, company_type);
			pstmt.setString(5, c_rn_input);
			pstmt.setString(6, c_name_input);

			pstmt.executeUpdate();
			
			
			for (int i = 1; i <= 6; i++) {
				sql = "insert into not_setting values("+i+",?,0,0)";
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
	}

	public static String makePhoneNumber(String phoneNumber) {
		String regEx = "(\\d{3})(\\d{3,4})(\\d{4})";
		if (!Pattern.matches(regEx, phoneNumber))
			return null;
		return phoneNumber.replaceAll(regEx, "$1-$2-$3");

	}

	public static String makeCompanyNumber(String companyNumber) {
		String regEx = "(\\d{3})(\\d{2})(\\d{5})";
		if (!Pattern.matches(regEx, companyNumber))
			return null;
		return companyNumber.replaceAll(regEx, "$1-$2-$3");
	}
}
