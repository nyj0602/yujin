
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="subject" content="크몽 - 당신의 비즈니스를 도와드립니다 " />
<meta name="keywords"
	content="재능기부, 재능마켓, 재능기부사이트, 웹에이전시, 재택알바사이트, 자택알바, 직장인투잡알바, 창업사이트, 재택부업, 부업사이트, 재택근무알바, 직장인부업">
<meta name="description"
	content="디자인, 마케팅, 프로그래밍, 영상제작 등 각 분야 5천 여명의 전문가들이 비즈니스에 도움을 드립니다.">
<title>구매관리 크몽 - 당신의 비즈니스를 도와드립니다</title>


<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="../css/kmong-99952b2854.master_desktop.css" rel="stylesheet">
<link href="../css/kmong_desktop_v2-6ec7c3f31e.css" rel="stylesheet">
<link href="../css/kmong_fonts.css?v=1.1" rel="stylesheet">
<link href="../css/mykmong_main.css" rel="stylesheet">
<link href="../css/kmong_buy.css" rel="stylesheet">
<link rel="shortcut icon" href="../image/favicon.ico">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script src="../js/datepicker.js"></script>
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
							<h3 class="margin-top-10 header-margin-none NGB">광고관리</h3>
						</div>
					</div>
				</div>




				<div
					class="row box-shadow-light margin-top-10 margin-right-0 margin-left-0 box-shadow-default-light-gray">
					<div class="col-xs-8 bg-color-white padding-left-25 padding-top-20 padding-bottom-20 text-left seller-advertisement-active-body border-right">
						<div class="row">
							<div class="col-xs-2 padding-right-0">
								<img class="width-100" src="../image/advertisement_my.png">
							</div>
							<div class="col-xs-8 padding-left-10">
								<h5 class="font-color-base margin-all-0 padding-top-10">현재
									광고중인 상품</h5>
								<h2 class="margin-top-10 header-margin-none NGB font-color-base">
									<a class="font-color-base" href="adver.do?state=광고중">
										${cnt } </a>개
								</h2>
							</div>
						</div>
					</div>
					<div class="col-xs-4 padding-left-0 padding-right-0 bg-color-white padding-bottom-10">
						<a href="#">
							<img class="width-100 margin-top-10"
							src="../image/advertisement_banner.jpg">
						</a>
					</div>
				</div>




				<form method="GET" action="#" accept-charset="UTF-8">
					<div class="row margin-top-20">
						<div class="col-xs-2">
							<div class="border-solid">
								<select class="form-control input-xs border-none" name="state">
									<option value="전체" ${state eq '전체' ? 'selected' : ''}>전체</option>
									<option value="광고중" ${state eq '광고중' ? 'selected' : ''}>광고중</option>
									<option value="광고완료" ${state eq '광고완료' ? 'selected' : ''}>광고완료</option>
								</select>
							</div>
						</div>
						<div class="col-xs-10">
							<div class="row">
								<div class="col-xs-2 padding-right-0 padding-left-0 position-relative">
									<input type="text" class="datepicker1 form-control input-xs date-input" name="start_date" value="${start_date }" onkeydown="return false">
									<i class="fa fa-calendar calendar-position" aria-hidden="true"></i>
								</div>
								<div class="col-xs-1 width-35px margin-top-5 text-center padding-left-5 padding-right-5">
									~</div>
								<div class="col-xs-2 padding-left-0 position-relative padding-right-0">
									<input type="text" class="datepicker2 form-control input-xs date-input" name="end_date" value="${end_date }" onkeydown="return false">
									<i class="fa fa-calendar calendar-position" aria-hidden="true"></i>
								</div>
								<div class="col-xs-1 width-10 padding-left-0 padding-right-0 margin-left-15">
									<input style="border-radius: 2px !important;" type="submit" class="btn btn-primary btn-black input-xs btn-block padding-top-5 padding-bottom-5" value="조회">
								</div>
							</div>
						</div>

					</div>
				</form>


<!--  -->
						<div class="row margin-top-20">
                        	<div id="withdrawnList" class="col-xs-12">
						<c:set var="adlist" value="${ad.adlist }"/>
						<c:choose>
						<c:when test="${empty adlist }">
	                            <div class="border-solid text-center padding-top-65 padding-bottom-65">
                                    <div>
                                        <img class="width-50px" src="../image/nothing.png" title="내역없음">
                                    </div>
                                    <h5 class="NGR font-color-lighter">내역이 없습니다.</h5>
                                </div>
						</c:when>
						<c:when test="${not empty adlist }">
						<c:forEach var="adlist" items="${ adlist}">
						<div class="expected-profit-order-panel panel panel-default margin-top-0 border-radius-0 margin-bottom-0">
							<div class="row margin-left-0 margin-right-0">
								<div class="col-xs-1 width-10 border-dashed-right text-center padding-top-30 padding-bottom-30 padding-right-10 padding-left-10">
									<h4 class="header-margin-none line-height ${adlist.t_ad eq ' ' ? 'font-color-lighter' : 'color-green'  }">
									${adlist.t_ad eq ' ' ? '완료' : '광고중' } 
									</h4>
								</div>

								<div class="col-xs-10 width-90 padding-all-20 ">
									<span class="font-size-h4 color-blue"> ${ adlist.ad_sep } </span>
									<p class="line-height color-black ">
											<b>${ adlist.t_name }</b>
									</p>
									<h6 class="font-color-lighter margin-top-5 margin-bottom-0">${ adlist.ad_term } 주&nbsp;&nbsp;|&nbsp;&nbsp;
									광고 시작일 : ${ adlist.ad_start }&nbsp;&nbsp;|&nbsp;&nbsp;광고 종료일 : ${adlist.ad_end } </h6>
								</div>
							</div>
						</div>
						</c:forEach>
						</c:when>
						</c:choose>	
<!--  -->
                            </div>
                   		</div>


			</div>

		</div>
	</div>




</body>
</html>

<%@ include file="../inc/footer/footer_notice.jsp" %>
<%@ include file="../inc/footer/footer.jsp" %>