<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>주문하기 - ${t_name }</title>
<style>
.header-yellow {
	width: 100%;
	height: 59px;
	background-color: #ffd400;
}

.padding-top-15 {
	padding-top: 15px;
}
</style>
<link rel="stylesheet" href="../css/bootstrap-datepicker3.css" />
<link rel="stylesheet" href="../css/kmong_buy.css" />
<link rel="stylesheet" href="../css/kmong_desktop_v2-6ec7c3f31e.css" />
<link rel="stylesheet" href="../css/kmong_fonts.css" />
<link rel="stylesheet" href="../css/kmong-99952b2854.master_desktop.css" />
<link rel="stylesheet" href="../css/mykmong_main.css" />
<link rel="shortcut icon" href="../css/image/favicon.ico">


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<script>
	$(function() {
		

		$(document)
				.on(
						"click",
						".plusvalue",
						function() {

							var number = $(this).prev().text();
							var sum = $('#hiddensum').val();

							number++;

							$(this).prev().html(number);
							var price = $(this).parent().parent().parent()
									.next().next().find("#oldpriceHidden")
									.val();
							var oldprice = $(this).parent().parent().parent()
									.next().next().find("#priceHidden").val(); // 
							var oldpricess = $(this).parent().parent().parent()
									.next().next().find("#oldpriceHidden")
									.val(); // 기본가격저장용

							price *= number;
							var notcomma = price;

							price = price.toLocaleString();
							$(this)
									.parent()
									.parent()
									.parent()
									.next()
									.next()
									.html(
											"<i class='fa fa-krw'> </i>&nbsp;"
													+ price
													+ "<input type='text' hidden='' id='priceHidden' class='pHidden' value="+notcomma+" />	<input type='text' hidden='' id='oldpriceHidden' class='oldpHidden' value="+oldpricess +">");

							sum *= 1;
							oldpricess *= 1;
							sum += oldpricess;
							$('#hiddensum').prop('value', sum);
							var cash = sum * 0.01;
							sum = sum.toLocaleString();
							cash = cash.toLocaleString();
							$('#totalPrice').html(
									'<i class="fa fa-krw"> </i>&nbsp; ' + sum);
							$('#totalServicePrice').html(
									'<i class="fa fa-krw"></i>&nbsp;' + sum);
							$('#addcash').html(
									'<i class="fa fa-krw"></i>&nbsp;' + cash);

						});

		$(document)
				.on(
						"click",
						"#minus",
						function() {
							var number = $(this).next().text();
							var sum = $('#hiddensum').val();
							if (number == 1) {
								event.preventDefault;
							} else {
								number--;

								$(this).next().html(number);

								var price = $(this).parent().parent().parent()
										.next().next().find("#priceHidden")
										.val(); //현재가격
								var oldprice = $(this).parent().parent()
										.parent().next().next().find(
												"#oldpriceHidden").val(); //이전가격
								var oldpricess = $(this).parent().parent()
										.parent().next().next().find(
												"#oldpriceHidden").val(); // 기본가격저장용

								price -= oldprice;

								var notcomma = price;

								price = price.toLocaleString();

								$(this)
										.parent()
										.parent()
										.parent()
										.next()
										.next()
										.html(
												"<i class='fa fa-krw'> </i>&nbsp;"
														+ price
														+ "<input type='text' hidden='' id='priceHidden' class='pHidden' value="+notcomma+" />	<input type='text' hidden='' id='oldpriceHidden' class='oldpHidden' value="+oldpricess +">");
								sum *= 1;
								oldpricess *= 1;
								sum -= oldpricess;
								$('#hiddensum').prop('value', sum);
								var cash = sum * 0.01;
								sum = sum.toLocaleString();
								cash = cash.toLocaleString();
								$('#totalPrice').html(
										'<i class="fa fa-krw"> </i>&nbsp; '
												+ sum);
								$('#totalServicePrice')
										.html(
												'<i class="fa fa-krw"></i>&nbsp;'
														+ sum);

								$('#addcash').html(
										'<i class="fa fa-krw"></i>&nbsp;'
												+ cash);

							}

						});

		$(document)
				.on(
						"click",
						".plusvalues",
						function() {

							if ($(this).parent().parent().parent().prev().find(
									'#checkbox').hasClass("checked")) {

								var number = $(this).prev().text();
								var sum = $('#hiddensum').val();

								number++;

								$(this).prev().html(number);
								var price = $(this).parent().parent().parent()
										.next().next().find("#oldpriceHidden")
										.val();
								var oldprice = $(this).parent().parent()
										.parent().next().next().find(
												"#priceHidden").val(); // 
								var oldpricess = $(this).parent().parent()
										.parent().next().next().find(
												"#oldpriceHidden").val(); // 기본가격저장용

								price *= number;
								var notcomma = price;

								price = price.toLocaleString();
								$(this)
										.parent()
										.parent()
										.parent()
										.next()
										.next()
										.html(
												"<i class='fa fa-krw'> </i>&nbsp;"
														+ price
														+ "<input type='text' hidden='' id='priceHidden' class='pHidden' value="+notcomma+" />	<input type='text' hidden='' id='oldpriceHidden' class='oldpHidden' value="+oldpricess +">");

								sum *= 1;
								oldpricess *= 1;
								sum += oldpricess;
								$('#hiddensum').prop('value', sum);
								var cash = sum * 0.01;
								sum = sum.toLocaleString();

								cash = cash.toLocaleString();
								$('#totalPrice').html(
										'<i class="fa fa-krw"> </i>&nbsp; '
												+ sum);
								$('#totalServicePrice')
										.html(
												'<i class="fa fa-krw"></i>&nbsp;'
														+ sum);
								$('#addcash').html(
										'<i class="fa fa-krw"></i>&nbsp;'
												+ cash);

							} else {
								event.preventDefault;
							}

						});

		$(document)
				.on(
						"click",
						"#minus2",
						function() {

							var number = $(this).next().text();
							var sum = $('#hiddensum').val();
							if (number == 1) {
								event.preventDefault;
							} else {
								number--;

								$(this).next().html(number);

								var price = $(this).parent().parent().parent()
										.next().next().find("#priceHidden")
										.val(); //현재가격
								var oldprice = $(this).parent().parent()
										.parent().next().next().find(
												"#oldpriceHidden").val(); //이전가격
								var oldpricess = $(this).parent().parent()
										.parent().next().next().find(
												"#oldpriceHidden").val(); // 기본가격저장용

								price -= oldprice;

								var notcomma = price;

								price = price.toLocaleString();

								$(this)
										.parent()
										.parent()
										.parent()
										.next()
										.next()
										.html(
												"<i class='fa fa-krw'> </i>&nbsp;"
														+ price
														+ "<input type='text' hidden='' id='priceHidden' class='pHidden' value="+notcomma+" />	<input type='text' hidden='' id='oldpriceHidden' class='oldpHidden' value="+oldpricess +">");
								sum *= 1;
								oldpricess *= 1;
								sum -= oldpricess;
								$('#hiddensum').prop('value', sum);
								var cash = sum * 0.01;
								sum = sum.toLocaleString();
								cash = cash.toLocaleString();
								$('#totalPrice').html(
										'<i class="fa fa-krw"> </i>&nbsp; '
												+ sum);
								$('#totalServicePrice')
										.html(
												'<i class="fa fa-krw"></i>&nbsp;'
														+ sum);
								$('#addcash').html(
										'<i class="fa fa-krw"></i>&nbsp;'
												+ cash);

							}

						});

		$('.chhhe')
				.click(
						function() {

							if ($(this).hasClass("checked")) { //체크되어있을때

								var oldpricess = $(this).parent().parent()
										.parent().next().next().next().find(
												"#oldpriceHidden").val(); // 기본가격저장용

								var sum = $('#hiddensum').val();

								var number = $(this).parent().parent().parent()
										.next().find($('.count')).text();
								var price = $(this).parent().parent().parent()
										.next().next().next().find(
												$('.oldpHidden')).val(); // 기본가격

								var nowprice = $(this).parent().parent()
										.parent().next().next().next().find(
												"#priceHidden").val();

								price = price.toLocaleString();
								if (number != 1) {
									$(this)
											.parent()
											.parent()
											.parent()
											.next()
											.next()
											.next()
											.html(
													"<i class='fa fa-krw'> </i>&nbsp;"
															+ price
															+ "<input type='text' hidden='' id='priceHidden' class='pHidden' value="+price+" />	<input type='text' hidden='' id='oldpriceHidden' class='oldpHidden' value="+price +">")

								} else {

									$(this).parent().parent().parent().next()
											.find('.count').text('1');
								}
								sum *= 1;
								oldpricess *= 1;
								sum -= nowprice;
								$('#hiddensum').prop('value', sum);
								var cash = sum * 0.01;
								sum = sum.toLocaleString();
								cash = cash.toLocaleString();
								$('#totalPrice').html(
										'<i class="fa fa-krw"> </i>&nbsp; '
												+ sum);

								$(this).prop("class",
										"awesome-checkbox-body chhhe");
								$(this).parent().parent().parent().next().find(
										'.count').text('1');
								$('#totalServicePrice')
										.html(
												'<i class="fa fa-krw"></i>&nbsp;'
														+ sum);
								$('#addcash').html(
										'<i class="fa fa-krw"></i>&nbsp;'
												+ cash);

							} else { //체크안되어있을때

								var oldpricess = $(this).parent().parent()
										.parent().next().next().next().find(
												"#oldpriceHidden").val(); // 기본가격저장용

								var sum = $('#hiddensum').val();

								var number = $(this).parent().parent().parent()
										.next().find($('.count')).text();
								var price = $(this).parent().parent().parent()
										.next().next().next().find(
												$('.oldpHidden')).val(); // 기본가격
								price = price.toLocaleString();
								if (number != 1) {
									$(this)
											.parent()
											.parent()
											.parent()
											.next()
											.next()
											.next()
											.html(
													"<i class='fa fa-krw'> </i>&nbsp;"
															+ price
															+ "<input type='text' hidden='' id='priceHidden' class='pHidden' value="+price+" />	<input type='text' hidden='' id='oldpriceHidden' class='oldpHidden' value="+price +">")

								} else {
									$(this).parent().parent().parent().next()
											.find('.count').text('1');
								}
								sum *= 1;
								oldpricess *= 1;
								sum += oldpricess;
								$('#hiddensum').prop('value', sum);
								var cash = sum * 0.01;
								sum = sum.toLocaleString();
								cash = cash.toLocaleString();
								$('#totalPrice').html(
										'<i class="fa fa-krw"> </i>&nbsp; '
												+ sum);

								$(this).prop("class",
										"awesome-checkbox-body chhhe checked");
								$(this).parent().parent().parent().next().find(
										'.count').text('1');
								$('#totalServicePrice')
										.html(
												'<i class="fa fa-krw"></i>&nbsp;'
														+ sum);
								$('#addcash').html(
										'<i class="fa fa-krw"></i>&nbsp;'
												+ cash);
							}
						});

		$('.kmong-funds-btn').click(
				function() {
					var sum = $('#hiddensum').val();
					var Humancash = $('#Humancash').val();

					sum *= 1;
					Humancash *= 1;

					sum -= Humancash;

					var cash = sum * 0.01;
					sum = sum.toLocaleString();
					cash = cash.toLocaleString();
					$('#inputcash').prop('value', Humancash);
					$('#totalPrice').html(
							'<i class="fa fa-krw"> </i>&nbsp; ' + sum);
					$('#totalServicePrice').html(
							'<i class="fa fa-krw"></i>&nbsp;' + sum);
					$('#addcash')
							.html('<i class="fa fa-krw"></i>&nbsp;' + cash);
				});

		$('#inputcash').blur(
				function() {
					var cash = $('#Humancash').val();
					var input = $(this).val();
					
					cash *= 1;
					input *=1;

					if (input > cash) {
						var sum = $('#hiddensum').val();
						var cash = $('#Humancash').val();
						var input = $(this).val();
						sum *= 1;
						cash *= 1;

						sum -= cash;
						var cashs = sum * 0.01;
						sum = sum.toLocaleString();
						cashs = cashs.toLocaleString();

						$(this).prop('value', cash);
						$('#totalPrice').html(
								'<i class="fa fa-krw"> </i>&nbsp; ' + sum);
						$('#totalServicePrice').html(
								'<i class="fa fa-krw"></i>&nbsp;' + sum);
						$('#addcash').html(
								'<i class="fa fa-krw"></i>&nbsp;' + cashs);
					} else {
						var sum = $('#hiddensum').val();
						var cash = $('#Humancash').val();
						var input = $(this).val();
						sum *= 1;
						input *= 1;

						sum -= input;
						var cashs = sum * 0.01;
						sum = sum.toLocaleString();
						cashs = cashs.toLocaleString();

						$('#totalPrice').html(
								'<i class="fa fa-krw"> </i>&nbsp; ' + sum);
						$('#totalServicePrice').html(
								'<i class="fa fa-krw"></i>&nbsp;' + sum);
						$('#addcash').html(
								'<i class="fa fa-krw"></i>&nbsp;' + cashs);

					}
				});

	});
</Script>
<script type="text/javascript"
	src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	$(function() {
		$('#payGuestloginBtn').click(function() {
			var names = $('#name').text();
			var amount = $('#totalPrice').text();
			var email = $('#sessionID').val();
			amount = amount.replace(/[^0-9]/g, '');
			var cm_name = $('#cm_name').val();
			var cm_phone = $('#cm_phone').val();
			var pm_name = $('#pm_name').val();
			var pm_phone = $('#pm_phone').val();
			var t_seq = $('#t_seq').val();
			var profit = $('#addcash').text();
			var op_seq = $('#SEQserial').serialize();
			profit = profit.replace(/[^0-9]/g, '');
			
			var name;
			var phone;
			if (cm_name == '') {
				name = pm_name;
				phone = pm_phone;
			} else {
				name = cm_name;
				phone = cm_phone;
			}

			IMP.init('imp01171603');
			IMP.request_pay({
				pg : 'html5_inicis',
				pay_method : 'card',
				merchant_uid : new Date().getTime(),
				name : names,
				amount : 100,
				buyer_email : email,
				buyer_name : name,
				buyer_tel : phone
			}, function(rsp) {			
				
				if (rsp.success) { 
					var param = "p_seq="+rsp.merchant_uid + "&p_price="+ rsp.paid_amount + "&p_how=" + rsp.pay_method 
					+ "&p_sep=서비스구매&m_email="+ email + "&t_seq="+t_seq + "&ps_state=결제" + "&profit=" + profit + "&ordernum="+rsp.apply_num + "&"+ op_seq;
					
			 		$.ajax({
						url : "http://localhost:8080/kmongPro/category/paymentend.do",
						dataType : 'json',
						type : 'GET',
						data : param
					}).done(function (data){
						var msg = '결제가 완료되었습니다.';
						msg += '고유ID : ' + rsp.imp_uid;
						msg += '상점 거래ID : ' + rsp.merchant_uid;
						msg += '결제 금액 : ' + rsp.paid_amount;
						location.href = "http://localhost:8080/kmongPro/management/management.do?orderNum=1";
						alert(msg);
					});				 
					

				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
					alert(msg);
				}

			});
		});
	});
</script>

</head>
<body id="master_body">


	<%-- <jsp:include page="../header/header_notthing.jsp"></jsp:include> --%>

	<div class="fake_global_body"></div>
	<div class="global-body">





		<style>
body {
	background: #fafafa !important;
	font-size: 14px;
}

.font-size-h1, h1 {
	font-size: 22px !important;
}

.font-size-h2, h2 {
	font-size: 20px !important;
}

.font-size-h3, h3 {
	font-size: 18px !important;
}

.font-size-h4, h4 {
	font-size: 16px !important;
}

.font-size-h5, h5 {
	font-size: 14px !important;
}

.font-size-h6, h6 {
	font-size: 12px !important;
}

.card-font-size-default, p {
	font-size: 13px !important;
}

.card-font-size-small {
	font-size: 11px !important;
}

.panel, .panel-heading, .form-control {
	border-radius: 0;
}

.border-radius-none {
	border-radius: 0 !important;
}

.border-radius {
	border-radius: 4px !important;
}

.modal-content {
	border-radius: 0 !important;
	border: none !important;
}

.awesome-checkbox input[type=checkbox]:checked+.awesome-checkbox-body::after,
	.awesome-checkbox input[type=radio]:checked+.awesome-checkbox-body::after
	{
	font-family: kmong-icon;
	content: url("../css/image/check.png");
}

input[type=checkbox].styled:checked+.awesome-checkbox-body:after, input[type=checkbox].styled:checked+.awesome-radio-body:after,
	input[type=radio].styled:checked+.awesome-checkbox-body:after, input[type=radio].styled:checked+.awesome-radio-body:after
	{
	font-family: kmong-icon;
	content: url("../css/image/check.png");
}

.fa-check:before {
	content: url("../css/image/uncheck.PNG");
}

.fa-minus:before {
	content: url("../css/image/minus.png");
}

.fa-plus:before {
	content: url("../css/image/plus.png");
}
</style>
		<style>
.panel-list:last-child {
	border-bottom: 1px solid #e6e6e6 !important;

	/*& > div > div > div {*/
	/*border-bottom: none !important;*/
	/*}*/
}
</style>

		<div id="orderTempDiv" class="text-center"
			style="height: 350px; margin-top: 300px; display: none;">
			<img src="css/image/kmong_loading_f.gif">
		</div>

		<div id="orderDiv" style="">
			<div class="container">
				<div class="row">
					<div class="col-xs-offset-1 col-xs-10">
						<div class="row">
							<div class="col-xs-12">

								<h2>주문하기</h2>
							</div>
						</div>


						<div class="row">
							<div class="col-xs-12">
								<div
									class="panel panel-default border-radius-none margin-top-30">
									<div class="panel-body">

										<div>
											<!--  재능이미지 -->
											<div class="pull-left margin-right-20">
												<img class="width-120px border-radius"
													src="../server/${image }" title="">
											</div>

											<div>
												<!-- 재능명 -->
												<h4 class="order-info-gig-body margin-top-0" id="name">${t_name }</h4>

												<div class="margin-top-20 color-primary">
													<!-- 프로필사진 -->
													<img class="border-round width-20px" src="css/image/"
														title=""
														onerror="this.onerror=null;this.src='/img/tools/main_user.png';">
													<!-- 판매자명 -->
													<span class="font-color-lighter">${m_name }</span>
												</div>
											</div>
										</div>


										<table class="order-table">
											<colgroup>
												<col width="60%">
												<col width="15%">
												<col width="10%">
												<col width="15%">
											</colgroup>
											<thead class="order-package">
												<tr>
													<th>기본항목</th>
													<th class="text-center">수량선택</th>
													<th class="text-center">작업일</th>
													<th class="text-right">가격</th>
												</tr>
											</thead>
											<tbody class="order-option choice">



												<c:forEach items="${OptionValue }" var="option" varStatus="status"> 
													<%-- <div>${option.op_sep }</div>
													<div></div>
													<div></div>
													<div>${option.op_change }</div>
													<div></div>
													<div>${option.op_manual2 }</div> --%>

													<tr>
														<td>
															<!--  기본항목명 --> <span>${option.op_manual1 }</span>

															<ul class="list-unstyled orderBill">




																<li
																	class="padding-left-5  padding-bottom-0 padding-right-10 font-color-light padding-bottom-0">
																	<i class="fa fa-check" aria-hidden="true"></i>&nbsp;<span>
																</span> <span></span> &nbsp;${option.op_manual2 }<i
																	class="fa fa-question-circle cursor postion-relative"
																	aria-hidden="true" data-toggle="tooltip"
																	data-placement="right" data-title="기본 제공되는 시안의 개수입니다."
																	style="display: none;" data-original-title="" title=""></i>
																</li>




															</ul>
														</td>
														<td>
															<!-- 수량선택 -->
															<div
																class="gig-detail-default-option margin-right-10 margin-top-0">
																<div class="pull-right gig-detail-decision-option-btn">
																	<a id="minus"><i class="fa fa-minus"
																		aria-hidden="true"></i> </a> <span class="count" title="">1</span><a
																		id="plus" class="plusvalue"> <i class="fa fa-plus"
																		aria-hidden="true"></i>
																	</a>
																</div>
															</div>
														</td>



														<!-- 작업일 -->
														<td class="text-center">&nbsp;${option.op_term }</td>
														<!-- 가격 -->
														<td class="text-right price"><i class="fa fa-krw"></i>&nbsp;
															<fmt:formatNumber value="${option.op_price }"
																pattern="#,###" /> <input type="text" hidden=""
															id="priceHidden" class="pHidden"
															value="${option.op_price }" /> <input type="text"
															hidden="" id="oldpriceHidden" class="oldpHidden"
															value="${option.op_price }" /></td>


													</tr>
													
													<c:set var="sum" value="${sum + option.op_price}" />
												

												</c:forEach>
												<input type="text" hidden=" " value="${sum }" id="hiddensum" />
											</tbody>
										</table>

										<c:if test="${ !empty OptionValue2}">
											<table class="order-table margin-top-20" style="">
												<colgroup>
													<col width="60%">
													<col width="15%">
													<col width="10%">
													<col width="15%">
												</colgroup>
												<thead class="order-option">
													<tr>
														<th>옵션항목</th>
														<th class="text-center">수량선택</th>
														<th class="text-center">작업일</th>
														<th class="text-right">가격</th>
													</tr>
												</thead>

												<tbody class="order-option">


													<c:forEach items="${OptionValue2 }" var="opt">
														<tr>
															<td>
																<div class="awesome-checkbox">
																	<label> <input type="checkbox"> <span
																		class="awesome-checkbox-body chhhe" id="checkbox"></span>
																		<div class="awesome-checkbox-text orderOptionTool">
																			${opt.op_manual1 }</div>
																	</label>
																</div>
															</td>
															<td>
																<div
																	class="gig-detail-default-option margin-right-10 margin-top-0">
																	<div class="pull-right gig-detail-decision-option-btn">
																		<a id="minus2"> <i class="fa fa-minus"
																			aria-hidden="true"></i> <fmt:formatNumber value=""
																				groupingUsed="true" />
																		</a> <span class="count" title=""><b>1</b></span> <a
																			id="plus2" class="plusvalues"> <i
																			class="fa fa-plus" aria-hidden="true"></i>
																		</a>
																	</div>
																</div>
															</td>
															<td class="text-center">&nbsp;${opt.op_term }</td>
															<td class="price" style="text-align: right;"><i
																class="fa fa-krw"></i>&nbsp;<fmt:formatNumber
																	value="${opt.op_price }" pattern="#,###" /> <input
																type="text" hidden="" id="priceHidden" class="pHidden"
																value="${opt.op_price }" /> <input type="text"
																hidden="" id="oldpriceHidden" class="oldpHidden"
																value="${opt.op_price }" /></td>
														</tr>

													</c:forEach>

												</tbody>
											</table>
										</c:if>

									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								<div class="panel panel-default margin-top-0">
									<div class="panel-heading bg-color-gray">결제금액</div>
									<div class="panel-body color-light-yellow">
										<div class="row">
											<div class="col-xs-7 border-dashed-right">
												<div class="row">
													<div class="col-xs-12">
														<strong>총 서비스 금액</strong> <span id="totalServicePrice"
															class="pull-right" title=""><i class="fa fa-krw"></i>&nbsp;<fmt:formatNumber
																value="${sum }" pattern="#,###" /> <!-- 총서비스금액 --></span>



													</div>
												</div>
												<div class="row margin-top-5">
													<div class="col-xs-12">
														<div style="">
															<h6 class="margin-none">
																<span>ㄴ 적립 예정 캐시</span> <span id="addcash"
																	class="pull-right"><i class="fa fa-krw"></i>&nbsp;<fmt:formatNumber
																		value="${sum * 0.01}" pattern="#,###" /> <!-- 적립예정캐시 --></span>
															</h6>
														</div>
													</div>
												</div>
												<div class="row margin-top-20">
													<div class="col-xs-12">
														<h5 class="margin-none">
															<b>캐시 사용</b> <span id="hCash" title="">(보유 크몽캐시 :
																<!-- 보유중인캐시금액 --> <b><fmt:formatNumber
																		value="${cc_money}" pattern="#,###" /></b>)
															</span> <input type="text" hidden="" value="${cc_money }"
																id="Humancash" />
														</h5>
													</div>
												</div>
												<div class="row margin-top-10">
													<div class="col-xs-12">
														<c:set var="texts" value="${cc_money }" />
														<input type="text"
															class="form-control input-xs width-100 position-relative"
															maxlength="${fn:length(texts)}" id="inputcash"> <img
															id="totallyUseFundsDelete" style="display: none"
															class="width-15px position-absolute top-10 right-95 cursor"
															src="css/image/profits_cal_icon.png">
														<div class="kmong-funds-btn">전액사용</div>
													</div>
												</div>
											</div>
											<div class="col-xs-5">
												<h3 class="margin-none">
													<b>총 결제금액</b> <span class="font-size-h5">(VAT 포함)</span>
												</h3>
												<h2 class="text-center margin-top-40 color-red"
													style="font-size: 30px !important;">


													<strong id="totalPrice" title=""> <i
														class="fa fa-krw"></i>&nbsp; <fmt:formatNumber
															value="${sum }" pattern="#,###" /> <!-- 총결제금액 -->
													</strong>



												</h2>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-xs-12">
								<div class="panel panel-default margin-top-0">
									<div class="panel-heading bg-color-gray">결제방법</div>
									<div class="panel-body">
										<ul class="list-inline margin-bottom-0">
											<li>
												<div class="awesome-radio margin-left-25">
													<label> <input type="radio"
														name="payMethodRadioButton" id="payMethod_SC0010"
														checked=""> <span class="awesome-radio-body"></span>
														<div class="awesome-radio-text">신용카드</div>
													</label>
												</div>
											</li>
											<li>
												<div class="awesome-radio margin-left-25">
													<label> <input type="radio"
														name="payMethodRadioButton" id="payMethod_SC0030">
														<span class="awesome-radio-body"></span>
														<div class="awesome-radio-text">실시간 계좌이체</div>
													</label>
												</div>
											</li>
											<li>
												<div class="awesome-radio margin-left-25">
													<label> <input type="radio"
														name="payMethodRadioButton" id="payMethod_SC0040">
														<span class="awesome-radio-body"></span>
														<div class="awesome-radio-text">무통장입금</div>
													</label>
												</div>
											</li>
											<li>
												<div class="awesome-radio margin-left-25">
													<label> <input type="radio"
														name="payMethodRadioButton" id="payMethod_SC0060">
														<span class="awesome-radio-body"></span>
														<div class="awesome-radio-text">휴대폰</div>
													</label>
												</div>
											</li>
											<li>
												<div class="awesome-radio margin-left-25">
													<label> <input type="radio"
														name="payMethodRadioButton" id="payMethod_KAKAOPAY">
														<span class="awesome-radio-body"></span>
														<div class="awesome-radio-text">카카오페이</div>
													</label>
												</div>
											</li>
											<li>
												<div class="awesome-radio margin-left-25">
													<label> <input type="radio"
														name="payMethodRadioButton" id="payMethod_PAYNOW">
														<span class="awesome-radio-body"></span>
														<div class="awesome-radio-text">페이나우</div>
													</label>
												</div>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-xs-12">
								<div class="panel panel-default margin-top-0">
									<div class="panel-heading bg-color-gray padding-left-15">세금계산서</div>
									<div class="panel-body padding-left-15">

										<!--개인사업자일때-->
										<div class="row orderBill">
											<div class="col-xs-12">
												<ul class="padding-left-20 margin-bottom-0">
													<li>개인 전문가이므로 세금계산서 발행이 불가능합니다.</li>
													<li>현금영수증(사업자지출증빙) / 신용카드 매입전표는 <b>매입세액공제 사용이 불가능</b>합니다.
														[매입세액공제 안내] <i class="fa fa-question-circle"
														aria-hidden="true" data-toggle="tooltip" title=""
														data-placement="right"
														style="font-size: 15px; color: #666"
														data-original-title="* 매입세액공제를 받으시려면 반드시 ‘기업전문가‘ 에게 서비스 구매 후 세금계산서 발행을 요청하세요! (결제방법에 상관없음)<br/><br/>
                                                      * 신용카드 영수증 / 현금영수증(지출증빙용)을 발급 받으셨더라도 중개업체인 “크몽”의 이름으로 발행이 되어 매입세액 공제를 받지 못합니다 . 거래주체인 “전문가“ 이름으로 발행된 세금계산서만이 매입세액공제가 가능합니다."></i>
													</li>
													<li>현금영수증 / 신용카드 영수증은 개인 소득 공제용으로만 사용하실 수 있습니다.</li>
												</ul>
											</div>
										</div>
										<style>
.orderBill .tooltip-inner {
	padding: 10px;
	max-width: 350px;
	text-align: left;
	/* If max-width does not work, try using width instead */
	width: 350px;
}
</style>
										<!--개인사업자일때-->
									</div>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-xs-12">
								<div class="panel panel-default" style="display: none;">
									<div class="panel-body">
										<div class="row">
											<div class="col-xs-6 border-right">
												<div class="row margin-top-20">
													<span class="col-xs-4"> 회사명 (법인명) </span> <span
														class="col-xs-8"> 사업자등록번호 </span>
												</div>
												<div class="row margin-top-5">
													<div id="c_nameDiv" class="col-xs-4">
														<input type="text" class="form-control"
															placeholder="ex) (주)크몽">
													</div>
													<div id="c_rnDiv" class="col-xs-8">
														<input type="text" class="form-control"
															placeholder="123-45-67890">
													</div>
												</div>
												<div class="row margin-top-20">
													<span class="col-xs-4"> 대표자명 </span> <span class="col-xs-4">
														업태 </span> <span class="col-xs-4"> 종목 </span>
												</div>
												<div class="row margin-top-5">
													<div id="c_pnameDiv" class="col-xs-4">
														<input type="text" class="form-control" placeholder="박크몽">
													</div>
													<div id="c_typeDiv" class="col-xs-4">
														<input type="text" class="form-control"
															placeholder="도매 및 소매">
													</div>
													<div id="c_kindDiv" class="col-xs-4">
														<input type="text" class="form-control"
															placeholder="전자상거래">
													</div>
												</div>
												<div class="row margin-top-20">
													<span class="col-xs-12"> 사업장 주소 </span>
												</div>
												<div class="row margin-top-5">
													<div id="c_addrDiv" class="col-xs-12">
														<input type="text" class="form-control"
															placeholder="서울특별시 강남구 역삼로17길 51 미드타운센터 4층">
													</div>
												</div>
											</div>
											<div class="col-xs-6">
												<div class="row margin-top-20">
													<span class="col-xs-12"> 세금계산서 이메일 </span>
												</div>
												<div class="row margin-top-5">
													<div id="c_emailDiv" class="col-xs-12">
														<input type="text" class="form-control"
															placeholder="ex) kmong@example.com">
													</div>
												</div>
												<div class="row margin-top-20">
													<span class="col-xs-4"> 담당자명 </span> <span class="col-xs-8">
														담당자 연락처 </span>
												</div>
												<div class="row margin-top-5">
													<div id="c_mnameDiv" class="col-xs-4">
														<input type="text" class="form-control"
															placeholder="ex) 박크몽">
													</div>
													<div id="c_mcontactDiv" class="col-xs-8">
														<input type="text" class="form-control"
															placeholder="1544-6254">
													</div>
												</div>
											</div>
										</div>
										<div class="row margin-top-10">
											<div class="col-xs-12 text-center">
												<span id="tax_history_error"
													class="ssn-error error-required help-block hidden color-red"><i
													class="fa fa-exclamation-triangle"></i>&nbsp;세금계산서 정보는 모두
													입력해 주셔야 합니다.</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>


						<div class="row">
							<div class="col-xs-8">
								<div class="position-relative">
									<img class="safe-payment margin-right-10"
										src="../css/image/desktop_escro.png">
									<ul class="list-unstyled inline-block">
										<li class="padding-left-0 padding-bottom-0"><strong>크몽은
												에스크로 결제 서비스를 이용하여 안전한 거래 환경을 제공합니다.</strong></li>
										<li class="padding-left-0 color-dark-gray padding-top-0">크몽을
											통해 결제 진행 시 관련 정책에 의해 보호 받을 수 있습니다.</li>
									</ul>
								</div>
							</div>
							<div class="col-xs-4">
								<a class="plain">
									<button id="payGuestloginBtn" class="btn btn-black btn-block">결제하기</button>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="hiddentag">
		<form id="SEQserial">
	<c:forEach items="${op_seq }" var="seq" varStatus="status"> 
			<input type="text" hidden="" value="${seq }" id="hiddenSEQ${status.index }" class="hiddenSEQs" name="op_seq"/>
		</c:forEach>
		</form>
		<input type="text" hidden="" value="${sessionID }" id="sessionID" /> <input
			type="text" hidden="" value="${cm_name }" id="cm_name" /> <input
			type="text" hidden="" value="${cm_phone }" id="cm_phone" /> <input
			type="text" hidden="" value="${pm_name }" id="pm_name" /> <input
			type="text" hidden="" value="${pm_phone }" id="pm_phone" /><input
			type="text" hidden="" value="${t_seq }" id="t_seq" /></div>
		<form method="post" name="LGD_PAYINFO" id="LGD_PAYINFO" action=""></form>

		<form name="payForm" id="payForm" action="" method="post"
			accept-charset="">
			<input type="hidden" name="SPU" value=""> <input
				type="hidden" name="SPU_SIGN_TOKEN" value=""> <input
				type="hidden" name="MPAY_PUB" value=""> <input type="hidden"
				name="NON_REP_TOKEN" value="">
		</form>

		<div id="kakaopay_layer" style="display: none"></div>
		<iframe name="txnIdGetterFrame" id="txnIdGetterFrame" src="" width="0"
			height="0"></iframe>

		<script language="javascript"
			src="https://xpay.uplus.co.kr/xpay/js/xpay_crossplatform.js"
			type="text/javascript"></script>









	</div>





	<div id="criteo-tags-div" style="display: none;"></div>
</body>
</html>