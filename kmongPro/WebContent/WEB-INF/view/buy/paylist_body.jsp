<!-- 망할 datepicker랑 페이징처리 빼곤 다 됨 -->
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
						<h3 class="margin-top-10 header-margin-none">결제내역</h3>
					</div>
				</div>
			</div>



			<form method="GET" action="#" accept-charset="UTF-8">
				<div class="row margin-top-10">
					<div class="col-xs-2">
						<select class="form-control input-xs" name="type">
							<option value="전체" ${empty type ? 'selected' : ''}>전체</option>
							<option value="결제"${type eq '결제'? 'selected' : '' }>결제</option>
							<option value="환불"${type eq '환불'? 'selected' : '' }>환불</option>
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
									<option value="5" ${pageSize eq '5'? 'selected' : ''}>5개</option>
									<option value="15" ${pageSize eq '15'? 'selected' : '' }>15개</option>
									<option value="30" ${pageSize eq '30'? 'selected' : '' }>30개</option>
								</select>
							</div>
							
						
							
							<div class="col-xs-2 padding-left-0 padding-right-0">
								<input type="submit"
									class="btn btn-black input-xs btn-block padding-top-5 padding-bottom-5"
									value="조회">
							</div>
						</div>
					</div>

					<div class="col-xs-3 text-right"></div>
				</div>
			</form>



<script type="text/javascript">

$(function (){
		
	var dateFormat = "yy-mm-dd", 
	from = $('.datepicker1').datepicker({
		defaultDate : "+1w",
		dateFormat: 'yy-mm-dd',
		changeMonth:true,
	    autoclose: true,
	    todayHighlight: true,
	    language: "kr",
	    showOtherMonths: true,
	    selectOtherMonths: true,
	    showButtonPanel: true
		
	})
	.on("change", function (){
		to.datepicker("option", "minDate", getDate(this));
	}),
	to = $('.datepicker2').datepicker({
		defaultDate : "+1w",
		dateFormat: 'yy-mm-dd',
		changeMonth:true,
	    autoclose: true,
	    todayHighlight: true,
	    language: "kr",
	    showOtherMonths: true,
	    selectOtherMonths: true,
	    showButtonPanel: true
	})
	.on("change", function(){
		from.datepicker("option", "maxDate", getDate(this));
	});
	
	
	function getDate(element){
		var date;
		try{
			date = $.datepicker.parseDate( dateFormat, element.value );
	      } catch( error ) {
	        date = null;
	      }
	 
	      return date;
	    }
	
});
</script>



			<div class="row margin-top-20">
				<div id="advertisementList" class="col-xs-12">

				
				<c:choose>
				<c:when test="${empty paylist.pay}">
				
					<div
						class="border-solid text-center padding-top-65 padding-bottom-65">
						<div>
							<img class="width-50px" src="../image/nothing.png" title="내역없음">
						</div>
						<h5 class="font-color-lighter">내역이 없습니다.</h5>
					</div>
				
				</c:when>
				
				
				<c:when test="${not empty paylist.pay }">
				
				<c:forEach var="pay" items="${paylist.pay}"  >
				<div class="panel panel-default margin-top-0 border-radius-0">
						<div class="row margin-left-0  margin-right-0">
							<div
								class="col-xs-1 width-10 border-dashed-right padding-left-20 padding-right-20 padding-top-10 padding-bottom-5 font-size-h4 ">
								<div class="${pay.ps_state eq '결제'? 'brand-success':'font-color-lighter' } seller-mileage-status-body NGB  ">${pay.ps_state }</div>
							</div>
							<div class="col-xs-10 width-90 padding-all-20">
								<div class="row">
									<div class="col-xs-12">
										<h6 class="margin-top-0 margin-bottom-5 font-color-lighter"> ${pay.ps_state eq '환불'? pay.ps_date : pay.pd_date } </h6>
									</div>
									<div class="col-xs-9">
										<h3 class="margin-all-0">${pay.p_sep }</h3>
										<h6 class="margin-top-5 font-color-lighter">
											${pay.t_seq } ${pay.t_name}<br />
										</h6>
									</div>
									<div class="col-xs-3 text-right">
										<h3 class="margin-all-0">
											<b class="${pay.ps_state eq '결제'? 'brand-success':'' }">${pay.ps_state eq '환불'? '-' : '+' }&nbsp;<i class="fa fa-krw"></i>&nbsp;${pay.p_price }
											</b>
										</h3>
									</div>
								</div>
								<div class="row">
									<div class="col-xs-12">
										<div class="panel bg-color-fa margin-bottom-0">
											<div class="panel-body padding-all-10 font-size-h6 font-color-lighter">
												L 결제방법:&nbsp; ${pay.p_how } 
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				
				</c:forEach>
				${ paging }
				</c:when>
				
				</c:choose>
				
	
					

				</div>
			</div>

			<%@ include file="inc/tax_notice.jsp"%>

		</div>

	</div>
	</div>

</body>
</html>

<%@ include file="../inc/footer/footer_notice.jsp" %>
<%@ include file="../inc/footer/footer.jsp" %>