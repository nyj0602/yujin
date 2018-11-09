
<%@page import="com.util.JdbcUtil"%>
<%@page import="com.util.ConnectionProvider"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%	
	System.out.println("넘어옴");
	String m_email = request.getParameter("m_email");
	String sql = "select count(*) from member where m_email= ?";
	Connection conn = ConnectionProvider.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, m_email);
	ResultSet rs = pstmt.executeQuery();

	JSONObject data = new JSONObject();
	rs.next();
	data.put("count", rs.getInt(1));

	System.out.println(data);
	//request.setAttribute("data", data);
	JdbcUtil.close(conn);
%>
<%= data %>
