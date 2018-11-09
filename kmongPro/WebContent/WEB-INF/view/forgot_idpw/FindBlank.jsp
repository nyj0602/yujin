<%@page import="com.util.JdbcUtil"%>
<%@page import="net.nurigo.java_sdk.exceptions.CoolsmsException"%>
<%@page import="java.util.HashMap"%>
<%@page import="net.nurigo.java_sdk.api.Message"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.util.ConnectionProvider"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String fullname = request.getParameter("fullname");
	String mobile = request.getParameter("mobile");

	String sql = "select m_email from per_member where pm_name= ? and pm_phone= ? ";
	Connection conn = ConnectionProvider.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);

	pstmt.setString(1, fullname);
	pstmt.setString(2, mobile);
	ResultSet rs = pstmt.executeQuery();
	String email = null;
	String SorF = null;
	while (rs.next()) {
		email = rs.getString(1);
	}
	SorF = "success";
	
	if (email == null) {
		String sqls = "select m_email from com_member where cm_name=? and cm_phone=?";
		pstmt = conn.prepareStatement(sqls);
		pstmt.setString(1, fullname);
		pstmt.setString(2, mobile);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			email = rs.getString(1);
		}
		if (email == null) {
			SorF = "false";
		}
	}
	
	JdbcUtil.close(conn);

 	String api_key = "NCSN4UEWYBPYEFVE";
	String api_secret = "XBGREEM5JZQMM5DEPVVZLQXTUVKNFKRW";
	Message coolsms = new Message(api_key, api_secret);
	
	HashMap<String, String> params = new HashMap<String, String>();
	params.put("to", mobile);
	params.put("from", "01086231904");
	params.put("type", "SMS");
	params.put("text", "[크몽] 이메일은 " + email + " 입니다.");
	params.put("app_version", "test app 1.2");
	
	try {
		JSONObject obj = (JSONObject) coolsms.send(params);
		System.out.println(obj.toString());
	} catch (CoolsmsException e) {
		System.out.println(e.getMessage());
		System.out.println(e.getCode());
	}
  
	JSONObject data = new JSONObject();
	data.put("SorF", SorF);
	System.out.println(data);
%>
<%=data%>