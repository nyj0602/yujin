<%@page import="net.sf.json.JSONObject"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String complete = (String)request.getAttribute("complete");

	JSONObject data = new JSONObject();
	data.put("complete", complete);
	System.out.println("삭제 결과:"+data);
%>
<%=data %>