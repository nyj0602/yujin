package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MystarAVG {

	public MystarAVGInfo calmystar(Connection conn, String m_email) throws SQLException {
		String sql = "select distinct ord.order_num, e_star\r\n" + "from\r\n" + "(select *\r\n" + "from talent\r\n"
				+ "where m_email=?) t\r\n" + "join t_option opt\r\n" + "on opt.t_seq=t.t_seq\r\n"
				+ "join payment_list pl\r\n" + "on pl.t_seq=opt.t_seq and pl.op_seq=opt.op_seq\r\n"
				+ "join payment p\r\n" + "on p.p_seq=pl.p_seq\r\n" + "join t_order ord\r\n" + "on ord.p_seq=p.p_seq\r\n"
				+ "join evaluation e\r\n" + "on e.order_num=ord.order_num ";
//nyj0602@naver.com
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, m_email);

		rs = pstmt.executeQuery();

		int ordernumcount = 0;
		int order_num = 0;
		int a = 0;
		int b = 0;
		int c = 0;
		int d = 0;
		double starscoresum = 0;
		double re = 0;
		String satisfaction = "아직몰라요";
		MystarAVGInfo mystarAVGInfo=new MystarAVGInfo();
		while (rs.next()) {
			ordernumcount++;
			order_num = rs.getInt("order_num");
			starscoresum += rs.getInt("e_star");
			System.out.println("e_star : " + rs.getInt("e_star"));
			d++;// 전체
			
			if (starscoresum == 0) {
				satisfaction = "평가없음";
				c++;
			} else{
				re = starscoresum / ordernumcount;
				if (re >= 2.5) {
					satisfaction = "긍정";
					a++;
				} else if (re < 2.5) {
					satisfaction = "부정";
					b++;
				}
			}
			
			mystarAVGInfo = new MystarAVGInfo(a,b,c,d);
			
		}
		mystarAVGInfo.setSatisfaction(satisfaction);
/*		System.out.println("satisfaction2 : " + satisfaction);
		System.out.println("ordernumcount : "+ordernumcount);
		System.out.println("starscoresum : "+starscoresum);
		System.out.println("전체 :  " + d);
		System.out.println("긍정 :  " + a);
		System.out.println("부정 :  " + b);
		System.out.println("평가없음 :  " + c);
		*/
		return mystarAVGInfo;
	}

}
