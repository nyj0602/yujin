
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
<title>구매관리 크몽 - 당신의 비즈니스를 도와드립니다</title>


<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="../css/kmong-99952b2854.master_desktop.css" rel="stylesheet">
<link href="../css/kmong_desktop_v2-6ec7c3f31e.css" rel="stylesheet">
<link href="../css/kmong_fonts.css" rel="stylesheet">
<link href="../css/mykmong_main.css" rel="stylesheet">
<link href="../css/kmong_buy.css" rel="stylesheet">
<link rel="shortcut icon" href="../image/favicon.ico">
<script src="https://cdn.jsdelivr.net/algoliasearch/3/algoliasearch.min.js"></script>
<script src="https://cdn.jsdelivr.net/typeahead.js/0.11.1/typeahead.jquery.min.js"></script>
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
					<b>구매</b>
				</h2>
			</div>
		</div>



		<div class="row margin-top-20">

			<%@ include file="inc/buy_profile.jsp"%>

		
			<div class="col-xs-9">

				<div class="row">
					<div class="col-xs-12">
						<div class="inline-block">
							<h3 class="margin-top-10 header-margin-none">캐시내역</h3>
						</div>
					</div>
				</div>



				<form method="GET" action="#" accept-charset="UTF-8">
					<input type="hidden" name="profile" value="false">
					<div class="row margin-top-10">
						<div class="col-xs-2">
							<select class="form-control input-xs" name="type">
								<option value="전체" ${empty type ? 'selected' : '' }>전체</option>
								<option value="적립" ${type eq '적립' ? 'selected' : '' }>적립</option>
								<option value="사용" ${type eq '사용' ? 'selected' : '' }>사용</option>
								<option value="취소" ${type eq '취소' ? 'selected' : '' }>취소</option>
								<option value="만료" ${type eq '만료' ? 'selected' : '' }>만료</option>
							</select>
						</div>
						<div class="col-xs-7">
							<div class="row">
								<div
									class="col-xs-3 padding-right-0 padding-left-0 position-relative">
									<input type="text" class="datepicker1 form-control input-xs date-input"
										name="start_date" value="${start_date}" onkeydown="return false">
									<i class="fa fa-calendar calendar-position" aria-hidden="true"></i>
								</div>
								<div
									class="col-xs-1 width-30px margin-top-5 text-center padding-left-5 padding-right-5">
									~</div>
								<div
									class="col-xs-3 padding-left-0 position-relative padding-right-0">
									<input type="text" class="datepicker2 form-control input-xs date-input"
										name="end_date" value="${end_date}" onkeydown="return false">
									<i class="fa fa-calendar calendar-position" aria-hidden="true"></i>
								</div>

								<div class="col-xs-3">
									<select class="form-control input-xs" name="pageSize">
										<option value="5" ${pageSize eq 5? 'selected' : '' }>5개</option>
										<option value="15" ${pageSize eq 15? 'selected' : '' } >15개</option>
										<option value="30" ${pageSize eq 30? 'selected' : '' }>30개</option>
									</select>
								</div>
								<div class="col-xs-2 padding-left-0 padding-right-0">
									<input type="submit"
										class="btn btn-black input-xs btn-block padding-top-5 padding-bottom-5"
										value="조회">
								</div>
							</div>
						</div>

						<div class="col-xs-3 text-right padding-left-0">
							<div class="pull-right margin-top-5">30일 이내 만료 예정 ${refund }원</div>
						</div>

					</div>
				</form>


				<div class="row margin-top-20">
					<div id="advertisementList" class="col-xs-12">


						<c:choose>
						<c:when test="${empty cashlist.cash }">
							<div class="border-solid text-center padding-top-65 padding-bottom-65">
								<div>
									<img class="width-50px" src="../image/nothing.png" title="내역없음">
								</div>
								<h5 class="font-color-lighter">내역이 없습니다.</h5>
							</div>
						
						</c:when>
						
						<c:when test="${not empty cashlist.cash }">
						<c:forEach var="cash" items="${cashlist.cash }">
						<div class="panel panel-default margin-top-0 border-radius-0">
							<div class="row margin-left-0  margin-right-0">
								<div
									class="col-xs-1 width-10 ${cash.cl_sep eq '적립' or cash.cl_sep eq '충전'? 'brand-success' : ''} padding-left-20 padding-right-20 padding-top-30 padding-bottom-30 font-size-h4 text-center">
									<div class="seller-mileage-status-body NGB">${cash.cl_sep }</div>
								</div>
								<div class="col-xs-9 border-dashed-left width-90 padding-all-20">
									<div class="row">
										<div class="col-xs-12">
											<h6 class="margin-top-0 font-color-lighter margin-bottom-5">${cash.cl_date }</h6>
										</div>
									</div>
									<div class="row">
										<div class="col-xs-9">
											<h3 class="header-margin-none">${cash.cl_state }</h3>
											<c:choose>
												<c:when test="${cash.cl_sep eq '사용'}">
													<h6 class="margin-bottom-0 font-color-lighter text-underline">
														<a class="plain" href="#">${cash.etc }</a>
													</h6>
												</c:when>
												<c:when test="${cash.cl_sep ne '사용'  }">
													<h6 class="margin-bottom-0 font-color-lighter">
														${cash.etc }
													</h6>
												</c:when>
											</c:choose>
				
										</div>
										<div class="col-xs-3 text-right ${cash.cl_sep eq '적립' or cash.cl_sep eq '충전'? 'brand-success' : ''}">
											<h3 class="header-margin-none">
												<b>${cash.cl_sep eq '적립' or cash.cl_sep eq '충전'? '+' : '-'}&nbsp;<i class="fa fa-krw"></i>&nbsp;${cash.cl_price }
												</b>
											</h3>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						</c:forEach>
						${ paging }
						</c:when>
						
						
						</c:choose>



				<div class="row">
					<div class="col-xs-12">
						<div
							class="panel bg-color-kmong-main profits-panel-border border-radius-0 border-solid">
							<div class="panel-body">

								<h6 class="NGB margin-all-0 padding-bottom-5">
									<i class="fa fa-exclamation-circle" aria-hidden="true"></i> <b>크몽캐시
										소개</b>
								</h6>
								<div class="row">
									<div class="col-xs-8">
										<ul
											class="font-color-light margin-top-5 margin-top-5 margin-bottom-0 font-size-h6 padding-left-20">
											<li>크몽캐시는 서비스 구매 후 구매확정 시점 또는 이벤트 등을 통해 적립됩니다.</li>
											<li>크몽캐시는 서비스 구매 시 사용할 수 있으며, cash는 현금 1원의 의미가 있습니다.</li>
											<li>충전캐시가 아닌 무상으로 적립된 크몽캐시는 현금 환불이 불가능합니다.</li>
											<li>크몽캐시의 유효기간은 적립일 기준 10년이며, 만료일 순으로 사용 처리됩니다.</li>
											<li>캐시 환불 신청 시, 충전캐시 전액이 환불되며 부분 환불은 불가능합니다.</li>
											<li>크몽캐시 환불 접수는 평일 오후 4시에 마감되며, 접수된 시점에서 영업일 기준 2일 이내에
												처리됩니다.</li>
											<li>환불 신청하신 금액을 서비스 구매 시에 사용할 경우, 환불 요청이 자동으로 취소됩니다.</li>
										</ul>
									</div>
									<div class="col-xs-4">
										<div class="pull-right margin-top-40">
											<a
												class="btn btn-default btn-sm padding-top-5 padding-bottom-5 margin-top-10"
												href="javascript:void(0);" onclick="askRefund()">캐시 환불</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>
</div>







</body>
</html>

<%@ include file="../inc/footer/footer_notice.jsp" %>
<%@ include file="../inc/footer/footer.jsp" %>