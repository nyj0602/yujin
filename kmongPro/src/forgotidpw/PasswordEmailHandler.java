package forgotidpw;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;
import com.util.DBConn;
import com.util.JdbcUtil;

import AES128.AES128Cipher;
import command.CommandHandler;

public class PasswordEmailHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		/*String a = (String) request.getAttribute("password");*/
		String SorF = null; // 성공or실패여부
		String email = request.getParameter("email");
		String names = request.getParameter("names");
		String phonenum = request.getParameter("phonenum");
		System.out.println(email);
		System.out.println(names);
		System.out.println(phonenum);
		
		Connection conn =  null;
		
		try {
			String sql = "select M_WDRAING from member where m_email = ?";
			 conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, email);
			ResultSet rs =pstmt.executeQuery();
			String withdraing = null;
			while(rs.next()) {
				withdraing = rs.getString(1);
			}
			
			if(withdraing == null) {
				withdraing = "2";
			}
			
			
			
			
			if(withdraing.equals("1")) {
				SorF = "withdraing";
				request.setAttribute("SorF", SorF);

				return "/WEB-INF/view/forgot_idpw/FindBlank2.jsp";
				
			}else if(withdraing.equals("0")) {
				sql = "select (select m_pwd from member where m_email= ?) from com_member where cm_name=? and cm_phone=?";
				conn = ConnectionProvider.getConnection();
				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, email);
				pstmt.setString(2, names);
				pstmt.setString(3, phonenum);
				 rs = pstmt.executeQuery();
				String password = null;
				while (rs.next()) {
					password = rs.getString(1);
				}
				SorF = "success";
				if (password == null) {
					String sqls = "select (select m_pwd from member where m_email= ?) from per_member where pm_name=? and pm_phone=?";
					pstmt = conn.prepareStatement(sqls);
					pstmt.setString(1, email);
					pstmt.setString(2, names);
					pstmt.setString(3, phonenum);
					rs = pstmt.executeQuery();
					while (rs.next()) {
						password = rs.getString(1);
						System.out.println(password);
					}
					if (password == null) {
						SorF = "false";
						request.setAttribute("SorF", SorF);
						return "/WEB-INF/view/forgot_idpw/FindBlank2.jsp";
					}
				}
				AES128Cipher aes = new AES128Cipher();
				
				password = aes.decAES(password);
				System.out.println(password);
				Properties p = System.getProperties();
				p.put("mail.smtp.starttls.enable", "true");
				p.put("mail.smtp.host", "smtp.gmail.com");
				p.put("mail.smtp.auth", "true");
				p.put("mail.smtp.port", "587");

				Authenticator auth = new MyAuthentication();

				Session session = Session.getDefaultInstance(p, auth);
				MimeMessage msg = new MimeMessage(session);

				try {
					msg.setSentDate(new Date());

					InternetAddress from = new InternetAddress();

					from = new InternetAddress("lvxclmlawe@gmail.com");

					msg.setFrom(from);

					InternetAddress to = new InternetAddress(email);
					msg.setRecipient(Message.RecipientType.TO, to);

					String[] values = email.split("@");
					// System.out.println(values[1]);
					if (values[1].equals("nate.com")) {
						msg.setSubject("안녕하세요. 크몽입니다. 문의하신 비밀번호 입니다.", "EUC-KR");
						msg.setText("안녕하세요. 크몽입니다. <br> 고객님의 패스워드는 [" + password + "] 입니다.", "EUC-KR");
						msg.setHeader("content-Type", "text/html");
					} else {
						msg.setSubject("안녕하세요. 크몽입니다. 문의하신 비밀번호 입니다.");
						msg.setText("안녕하세요. 크몽입니다. <br> 고객님의 패스워드는 [" + password + "] 입니다.");
						msg.setHeader("content-Type", "text/html");
					}
					javax.mail.Transport.send(msg);

				} catch (AddressException addr_e) {
					addr_e.printStackTrace();
				} catch (MessagingException msg_e) {
					msg_e.printStackTrace();
				}
				request.setAttribute("SorF", SorF);

				return "/WEB-INF/view/forgot_idpw/FindBlank2.jsp";
				
			}else if(withdraing.equals("2")) {
				SorF = "false";
				request.setAttribute("SorF", SorF);
				return "/WEB-INF/view/forgot_idpw/FindBlank2.jsp";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
		}
		return null;
		
		
	}

	class MyAuthentication extends Authenticator {
		PasswordAuthentication pa;

		public MyAuthentication() {
			String id = "mailsendKmong@gmail.com";
			String pw = "kmong1234";
			pa = new PasswordAuthentication(id, pw);
		}

		public PasswordAuthentication getPasswordAuthentication() {
			return pa;
		}
	}
}
