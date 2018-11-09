<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.util.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach items="${categoryName }" var="dto">
		<ul class="margin-none list-unstyled">
			<li class="category-list-item root-category inline-block active">
				<img class="width-20px position-relative" style="top: -2px;"
				src="../css/image/ic-arrow-right.png"> ${dto.c_group }
			</li>
		</ul>
</c:forEach>						

							


