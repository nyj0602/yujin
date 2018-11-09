package quickmenu;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;
import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import command.CommandHandler;
import dto.FaqsDTO;

public class FAQSHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			String sql = "select * from (select f_sub,f_con,fs_seq from faqs) A left outer join (select fs_seq,fs_con from faqseparate) B on a.fs_seq = b.fs_seq order by A.fs_seq";
			conn = ConnectionProvider.getConnection();
			 stmt = conn.createStatement();
			 rs = stmt.executeQuery(sql);
			try {

				ArrayList<FaqsDTO> Faqs = new ArrayList<>();
				String f_sub = null;
				String f_con = null;
				String f_seq = null;
				String fs_con = null;

				while (rs.next()) {
					FaqsDTO dto = new FaqsDTO();
					f_sub = rs.getString(1);
					f_con = rs.getString(2);
					f_seq = rs.getString(3);
					fs_con = rs.getString(5);

					dto.setf_sub(f_sub);
					dto.setf_con(f_con);
					dto.setf_seq(f_seq);
					dto.setfs_con(fs_con);

					Faqs.add(dto);

				}

				request.setAttribute("Faqs", Faqs);
			} catch (Exception e) {
			}finally {

				rs.close();
				stmt.close();
				conn.close();
			}

			sql = "select fs_seq, fs_con from faqseparate";
			conn = ConnectionProvider.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			ArrayList<FaqsDTO> Fs_Con = new ArrayList<>();
			String fs_seq = null;
			String fs_con = null;

			while (rs.next()) {
				FaqsDTO dto = new FaqsDTO();
				fs_seq = rs.getString(1);
				fs_con = rs.getString(2);

				dto.setFs_seq(fs_seq);
				dto.setfs_con(fs_con);

				Fs_Con.add(dto);
			}

			request.setAttribute("Fs_Con", Fs_Con);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			rs.close();
			stmt.close();
			conn.close();
		}

		return "/WEB-INF/view/inc/QuickMenu/FAQS.jsp";
	}

}
