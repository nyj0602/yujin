<%@page import="net.sf.json.JSONObject"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String complete = (String)request.getAttribute("complete");
	String seq = (String)request.getAttribute("seq");
	String content = (String)request.getAttribute("content");
	String datetime = (String)request.getAttribute("datetime");

	JSONObject data = new JSONObject();
	data.put("complete", complete);
	data.put("seq", seq);
	data.put("content", content);
	data.put("datetime", datetime);
	System.out.println("전송 결과:"+data);
%>
<%=data %>