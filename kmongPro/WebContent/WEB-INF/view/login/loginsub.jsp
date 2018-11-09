<%@page import="org.json.simple.JSONObject"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String errors = (String)request.getAttribute("errors");
	JSONObject data = new JSONObject();
	data.put("errors", errors);
	System.out.println("loginsub넘어온값"+data);
%>
<%=data %>