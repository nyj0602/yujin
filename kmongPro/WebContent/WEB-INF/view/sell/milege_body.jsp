
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../mykmong/mykmong_header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="subject" content="크몽 - 당신의 비즈니스를 도와드립니다 " />
<meta name="keywords"
	content="재능기부, 재능마켓, 재능기부사이트, 웹에이전시, 재택알바사이트, 자택알바, 직장인투잡알바, 창업사이트, 재택부업, 부업사이트, 재택근무알바, 직장인부업">
<meta name="description"
	content="디자인, 마케팅, 프로그래밍, 영상제작 등 각 분야 5천 여명의 전문가들이 비즈니스에 도움을 드립니다.">
<title>전문가 마일리지 내역 크몽 - 당신의 비즈니스를 도와드립니다</title>


<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="../css/kmong-99952b2854.master_desktop.css" rel="stylesheet">
<link href="../css/kmong_desktop_v2-6ec7c3f31e.css" rel="stylesheet">
<link href="../css/kmong_fonts.css?v=1.1" rel="stylesheet">
<link href="../css/mykmong_main.css" rel="stylesheet">
<link href="../css/kmong_buy.css" rel="stylesheet">
<link rel="shortcut icon" href="../image/favicon.ico">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="http://jqueryui.com/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>
<body id="master_body">

	<div class="container">
		<div class="row margin-top-30">
			<div class="col-xs-12">
				<h2>
					<b>판매</b>
				</h2>
			</div>
		</div>


		<div class="row margin-top-10">

			<%@ include file="inc/sell_profile.jsp"%>

			<div class="col-xs-9">

				<div class="row">
					<div class="col-xs-12">
						<div class="inline-block">
							<h3 class="margin-top-10 margin-bottom-0 NGB">전문가 마일리지</h3>
						</div>
					</div>
				</div>


				<div
					class="row box-shadow-default-light-gray margin-left-0 margin-right-0 bg-color-white margin-top-10">
					<div class="col-xs-8 bg-color-white padding-left-25 padding-top-20 padding-bottom-20 border-right">
						<div class="row">
							<div class="col-xs-2 padding-right-0">
								<img class="width-100" src="../image/kmong_cash.png" />
							</div>
							<div class="col-xs-8 padding-left-10">
								<h5 class="margin-bottom-0">사용 가능 마일리지</h5>
								<h2 class="margin-top-0 NGB inline-block">${milege } 원</h2>
								<h6 class="font-color-lighter inline-block padding-left-5">
									(1주일 내 소멸예정:&nbsp;<span class="margin-top-0">${refund} 원)</span>
								</h6>
							</div>
						</div>
					</div>
					<div class="col-xs-4 padding-left-0 padding-right-0">
						<a href="#" onclick="sendGAEvent('clickEvent', 'seller', '광고신청 - 광고관리')">
							<img class="width-100 margin-top-10"
							src="../image/mileage_banner.jpg">
						</a>
					</div>
				</div>





				<form method="GET" action="#" accept-charset="UTF-8">
					<div class="row margin-top-20">
						<div class="col-xs-2">
								<select class="form-control input-xs" name="type">
									<option value="전체" ${empty type ? 'selected' : '' }>전체</option>
									<option value="적립" ${type eq '적립' ? 'selected' : '' }>적립</option>
									<option value="사용" ${type eq '사용' ? 'selected' : '' }>사용</option>
									<option value="만료" ${type eq '만료' ? 'selected' : '' }>만료</option>
									<option value="취소" ${type eq '취소' ? 'selected' : '' }>취소</option>
								</select>
						</div>
						<div class="col-xs-10">
							<div class="row">
								<div class="col-xs-2 padding-right-0 padding-left-0 position-relative">
									<input type="text" class="datepicker1 form-control input-xs date-input" name="start_date" value="${start_date}" onkeydown="return false">
									<i class="fa fa-calendar calendar-position" aria-hidden="true"></i>
								</div>
								<div class="col-xs-1 width-35px margin-top-5 text-center padding-left-5 padding-right-5">
									~</div>
								<div class="col-xs-2 padding-left-0 position-relative padding-right-0">
									<input type="text" class="datepicker2 form-control input-xs date-input" name="end_date" value="${end_date}" onkeydown="return false">
									<i class="fa fa-calendar calendar-position" aria-hidden="true"></i>
								</div>
								<div class="col-xs-1 width-10 padding-left-0 padding-right-0 margin-left-15">
									<input type="submit" class="btn btn-black input-xs btn-block border-radius padding-top-5 padding-bottom-5" value="조회">
								</div>
							</div>
						</div>
					</div>
				</form>




				<div class="row margin-top-20">
					<div id="mileageList" class="col-xs-12">
					
						<c:set var="milege" value="${milegelist.milege }"/>
						
						<c:choose>
						<c:when test="${empty milege}">
						<div class="border-solid text-center padding-top-85 padding-bottom-85 margin-top-20">
							<div>
								<img class="width-50px" src="../image/nothing.png" title="내역없음">
							</div>
							<h5 class="font-color-lighter">내역이 없습니다.</h5>
						</div>
						</c:when>
						<c:when test="${not empty milege}">
						<c:forEach var="milege" items="${milege }">

						<div class="panel panel-default margin-top-0 margin-bottom-0">
							<div class="row margin-left-0  margin-right-0">
								<div class="col-xs-1 width-10 border-dashed-right ${milege.ml_sep eq '적립' or milege.ml_sep eq '취소'? 'brand-success' : '' } padding-all-20 font-size-h4 ">
									<div class="seller-mileage-status-body">${milege.ml_sep }</div>
								</div>
								<div class="col-xs-6 width-45 padding-all-20">
									<h6 class="margin-top-0 font-color-lighter">${milege.ml_date }</h6>
									<h4 class="header-margin-none">${milege.ml_state } ${milege.order_num }</h4>
								</div>
								<div class="col-xs-4 width-45  padding-all-20 text-right ${milege.ml_sep eq '적립' or milege.ml_sep eq '취소'? 'brand-success' : '' }">
									<h6 class="margin-top-0 font-color-lighter">&nbsp;</h6>
									<h3 class="header-margin-none">
										<b>${milege.ml_sep eq '적립' or milege.ml_sep eq '취소'? '+' : '-' } ${milege.ml_price } 원</b>
									</h3>
								</div>
							</div>
						</div>
						
						
						</c:forEach>
						</c:when>
						</c:choose>
							
					</div>
				</div>

<%@ include file="milege_intro.jsp" %>

			</div>
		</div>
</body>
</html>
<%@ include file="../inc/footer/footer_notice.jsp" %>
<%@ include file="../inc/footer/footer.jsp" %>