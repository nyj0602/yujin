<%@page import="net.sf.json.JSONObject"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String star = (String)request.getAttribute("star");

	JSONObject result = new JSONObject();
	result.put("star", star);
	System.out.println("별 체크:"+result);
%>
<%=result %>