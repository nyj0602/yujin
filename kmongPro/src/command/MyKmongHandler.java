package command;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;

import net.sf.json.JSONArray;
import service.BuyCount;
import service.HeartInfo;
import service.HeartService;
import service.MonthAddMoney;
import service.MyTotalTalent;
import service.MystarAVG;
import service.MystarAVGInfo;
import service.ProfileComplete;
import service.ResTime;
import service.Res_rateService;
import service.SuccessOrderRate;
import service.TotalHaveCash;
import service.WorkKeepRate;
import service.WorkService;

public class MyKmongHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String m_email = (String) request.getSession().getAttribute("authUser");

		Connection conn = ConnectionProvider.getConnection();

		String sql = "select m_profile,m_name " + " from member" + " where m_email=? ";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, m_email);
		rs = pstmt.executeQuery();

		String m_profile = null;
		String m_name = null;
		if (rs.next()) {

			m_profile = rs.getString(1);
			m_name = rs.getString(2);
		}

		request.setAttribute("m_profile", m_profile);
		request.setAttribute("m_name", m_name);
		request.setAttribute("m_profile", m_profile);
		request.setAttribute("m_name", m_name);

		MyTotalTalent myTotalTalent = new MyTotalTalent();
		int myTotalTalentcount = myTotalTalent.selectTalentCount(conn, m_email);
		request.setAttribute("myTotalTalentcount", myTotalTalentcount);

		TotalHaveCash totalHaveCash = new TotalHaveCash();
		int hCash = totalHaveCash.calTotalHaveCash(conn, m_email);
		request.setAttribute("haveCash", hCash);
		System.out.println(hCash);

		MonthAddMoney monthAddMoney = new MonthAddMoney();
		int addMoney = monthAddMoney.totalcalmony(conn, m_email);
		request.setAttribute("addMoney", addMoney);

		BuyCount buyCount = new BuyCount();
		int buycount = buyCount.selectCount(conn, m_email);
		request.setAttribute("buycount", buycount);

		SuccessOrderRate successOrderRate = new SuccessOrderRate();
		int successRate = successOrderRate.calsucessrate(conn, m_email);
		request.setAttribute("successRate", successRate);

		WorkKeepRate workKeepRate = new WorkKeepRate();
		int WKRate = workKeepRate.calworkkeeprate(conn, m_email);
		request.setAttribute("WKRate", WKRate);

		HeartService heartService = new HeartService();
		ArrayList<HeartInfo> heartInfoList = new ArrayList<>();
		heartInfoList = heartService.getHeartInfo(conn, m_email);
		request.setAttribute("heartInfoList", heartInfoList);

		MystarAVG mystarAVG = new MystarAVG();
		MystarAVGInfo mystaravg = mystarAVG.calmystar(conn, m_email);
		request.setAttribute("mystaravg", mystaravg);

		ProfileComplete profileComplete = new ProfileComplete();
		int profilecompletenum = profileComplete.calCompleteprofile(conn, m_email);
		request.setAttribute("profilecompletenum", profilecompletenum);

		/*
		 * Res_rateService res_rateService = new Res_rateService(); int
		 * res_rate=res_rateService.calResRate(conn,m_email);
		 * request.setAttribute("res_rate", res_rate);
		 */

		/*
		 * ResTime resTime = new ResTime(); String restime =
		 * resTime.calrestime(conn,m_email); request.setAttribute("restime", restime);
		 */
		int totRate = WKRate + successRate;
		if (totRate == 0) {

		} else {
			totRate = totRate / 3;
		}
		request.setAttribute("totRate", totRate);
		return "/WEB-INF/view/my_kmong/my_kmong.jsp";
	}

}
