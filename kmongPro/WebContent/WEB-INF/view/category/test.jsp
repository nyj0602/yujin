<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.util.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>2018. 2. 22.-오전 11:19:52</title>
<link rel="stylesheet" href="../css/bootstrap-datepicker3.css" />
<link rel="stylesheet" href="../css/kmong_buy.css" />
<link rel="stylesheet" href="../css/kmong_desktop_v2-6ec7c3f31e.css" />
<link rel="stylesheet" href="../css/kmong_fonts.css" />
<link rel="stylesheet" href="../css/kmong-99952b2854.master_desktop.css" />
<link rel="stylesheet" href="../css/mykmong_main.css" />
<link rel="shortcut icon" href="../css/image/favicon.ico">
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>

<%-- <c:set var="tal" value="${talent.tal }"/> --%>
<c:forEach items="${testArray }" var="dto">
<ul id="test">
		<li>c_id - ${dto.c_id }</li>
		<li>c_superid - ${dto.c_superid }</li>
		<li>c_level - ${dto.c_level }</li>
		<li>c_group - ${dto.c_group }</li>
</ul>
	</c:forEach>
<form >
<input type="button" name="num" value="2"/>
</form>

<script type="text/javascript">
	$(function () {
		$('input[type=button]').on('click',function(){
				var params = $("form").serialize();
				var num = $('input').val();
				$.ajax({
					url:"/kmongPro/category/test.do",
					dataType:"json",
					type:"post",
					data: {params,num
						
								}
						, 
					success: function (testArray) {
						alert("넘어갔다");
						$("ul>li").remove(); 
						$(testArray).each(function(index,value){
							$("#test").append("<li>" +value.c_group+"</li>");
						});
					}
				});//ajax
		});//click
	});

</script>
</body>
</html>