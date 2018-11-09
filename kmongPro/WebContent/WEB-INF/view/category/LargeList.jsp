<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.util.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" href="../css/kmong-a9f87b1e91.master_desktop.css" />
<link rel="stylesheet" href="../css/mykmong_main.css" />

<link rel="shortcut icon" href="../css/image/favicon.ico">
 <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>

#metaDataCarousel .carousel-indicators {
	position: inherit;
	text-align: inherit;
	margin-left: 0;
	left: 0;
	bottom: 0 !important;
	width: inherit;
}

#metaDataCarousel .carousel-indicators li {
	border: none;
	background-color: #E6E6E6;
	margin-right: 5px;
	width: 7px;
	height: 7px;
}

#metaDataCarousel .carousel-indicators li.active {
	background-color: #ffd400;
	width: 7px;
	height: 7px;
	top: -1px;
}
</style>
</head>

<body id="master_body">
	<div id="category_list_div">
		<div id="categoryListTopBody">
			<div class="container">
				<div class="row">
					<div class="col-xs-12 padding-top-40 padding-bottom-30">
						<div class="row">
							<jsp:include page="/WEB-INF/view/inc/category_inc/categoryName.jsp">
								<jsp:param value="${categoryName }" name="categoryName"/>
							</jsp:include>
						</div>

					</div>
				</div>
			</div>
		</div>
<!--  -->
<form id="checkform">
		<div class="container">
			<div class="row">
				<div class="triangle-demo"></div>

				<div class="col-xs-2">

					<div class="row">
						<div class="col-xs-12">
							<b>카테고리</b>
						</div>
					</div>
					<div class="row margin-top-5">
						<!-- 대분류별 카테고리 -->
				<div class="col-xs-12">
						<jsp:include page="/WEB-INF/view/inc/category_inc/categorylist.jsp">
							<jsp:param value="${categoryName }" name="categoryName"/>
						</jsp:include>
						<!-- 해당 중분류 카테고리 리스트 뿌려주는 부분 -->
						<ul class="margin-none list-unstyled">
						 <c:forEach items="${categoryList }" var="dto2">
						 <li class='padding-right-0 category-list-item sub-category'> 
						 	<a class='plain font-color-light sendGAEventClz' 	href='/kmongPro/category/categorylist.do?category=${dto2.c_id }'
						 		 data-name='사이드 메뉴 - 카테고리 선택 - ${dto2.c_id } '>${dto2.c_group }</a></li>
						</c:forEach>
						</ul>
						</div>
				</div>

					<!-- 전문가 등급 -->

					<div class="padding-all-15">
						<jsp:include page="/WEB-INF/view/inc/category_inc/master_grade.jsp">
							<jsp:param value="${grade }" name="grade"/>
						</jsp:include>
					</div>
					
			
<!-- selectbox에 css안맞는 부분 select-control:after에서 content:""하면 나옴 -->
				<div class="col-xs-10">
					<div class="row">
						<div class="col-xs-2">
							<div class="select-control">
								<select class="input-xs" name="sort">
									<option id="recommendation" value="recommendation" ${sort eq "recommendation"? "selected":""} >추천순</option>
									<option id="ranking" value="ranking" ${sort eq "ranking"? "selected":""}>랭킹순</option>
									<option id="created_at" value="created_at" ${sort eq "created_at"? "selected":""}>신규등록순</option>
								</select>
</div>
						</div>
						<jsp:include page="/WEB-INF/view/inc/category_inc/advertise.jsp">
							<jsp:param value="${category }" name="category"/>
						</jsp:include>
					</div><!-- row -->


				<jsp:include page="/WEB-INF/view/inc/category_inc/talent.jsp">
								<jsp:param value="${ TalentList }" name="TalentList" />
								<jsp:param value="${star }" name="star"/>
							</jsp:include>
	<!-- 재능 뿌리는 div 마지막 -->			
							
								<div class="text-center margin-top-10 pagination-small">
									<ul class="pagination">

										<li><a  href="/kmongPro/category/category.do?category=${category }&sort=${sort }&page=${(page-1)<1 ? 1:(page-1) }&grade=${grade }"rel="next">«</a></li>

										<c:forEach var="i" begin="1" end="${ size/12 +(1-(size/12%1))%1}"> <!-- EL 올림 공식 -->
										<li><a 
											href="/kmongPro/category/category.do?category=${category }&sort=${sort }&page=${i }&grade=${grade }">${i }</a></li>
										</c:forEach>
										<li><a  href="/kmongPro/category/category.do?category=${category }&sort=${sort }&page=${page+1<=(size/12 +(1-(size/12%1))%1)? page+1:page }&grade=${grade }"rel="next">»</a></li>
									</ul>
								</div>
								
					<!-- 페이징 처리 -->
							</div>
						</div>
					</div>
				</div>
</form>
			</div>
		</div>
	</div>
	<!-- category_list_div -->
	
	<script>

			$(function () {
				$("label>.sellerRatingCheckbox, select.input-xs").change(function () {
					$(this).after("<input type='hidden' value='${category}' name='category' 'checked'/><input type='hidden' name='sort' value='${sort }' 'checked'>");
					$(this).after("<input type='hidden' value='${grade}' name='grade' 'checked'/>")
						$("#checkform").prop("action","/kmongPro/category/category.do");
						$("#checkform").submit();
							
					});//change
		});//function
	 
</script>
	<c:import url="http://localhost:8080/kmongPro/QuickMenuModuel.do">
		<c:param name="sessionID" value="${sessionID }"></c:param>
	</c:import>
	
</body>
<footer>
	<jsp:include page="/WEB-INF/view/inc/footer/footer_notice.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/view/inc/footer/footer.jsp"></jsp:include>
	</footer>

</html>