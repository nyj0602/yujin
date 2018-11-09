
<%@page import="com.util.JdbcUtil"%>
<%@page import="com.util.ConnectionProvider"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@page import="net.sf.json.JSONObject"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	//ArrayList search = (ArrayList)request.getAttribute("search");
	String searchKeyword = request.getParameter("searchKeyword");
	String sql = "select f_sub,f_con from faqs where f_sub like '%" + searchKeyword + "%' or f_con like '%"
			+ searchKeyword + "%'";
	System.out.println(sql);
	Connection conn = ConnectionProvider.getConnection();
	Statement pstmt = conn.createStatement();

	ResultSet rs = pstmt.executeQuery(sql);

	/*	ArrayList<FaqsDTO> search = new ArrayList<>();*/

	String f_sub = null;
	String f_con = null;

	/*	while (rs.next()) {
		FaqsDTO dto = new FaqsDTO();
	
		f_sub = rs.getString(1);
		f_con = rs.getString(2);
		System.out.println(f_sub);
		System.out.println(f_con);
		dto.setf_sub(f_sub);
		dto.setf_con(f_con);
		search.add(dto);
	}*/

	JSONObject jobj = new JSONObject();
	JSONArray jarr = new JSONArray();
	while (rs.next()) {
		JSONObject empObj = new JSONObject();

		f_sub = rs.getString(1);
		f_con = rs.getString(2);
		empObj.put("f_sub", f_sub);
		empObj.put("f_con", f_con);

		jarr.add(empObj);
	}
	JdbcUtil.close(conn);
	jobj.put("search", jarr);
%>

<%=jobj%>