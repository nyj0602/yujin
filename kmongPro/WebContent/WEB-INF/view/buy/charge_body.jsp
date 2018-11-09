
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
<title>크몽캐시 충전 크몽 - 당신의 비즈니스를 도와드립니다</title>


<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="../css/kmong-99952b2854.master_desktop.css" rel="stylesheet">
<link href="../css/kmong_desktop_v2-6ec7c3f31e.css" rel="stylesheet">
<link href="../css/kmong_fonts.css" rel="stylesheet">
<link href="../css/mykmong_main.css" rel="stylesheet">
<link href="../css/kmong_buy.css" rel="stylesheet">
<link rel="shortcut icon" href="../image/favicon.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(function (){
	
	$('input[name=chargeAmount]').click(function (){
		
		var mon = $(this).val();
		var ben = $(this).parent().children().val();
		var tot = parseInt(mon)+parseInt(ben);
		
		$('#selectcash, #pay').text(mon);
		$('#hid').val(mon);
		$('#benefit').text(ben);
		$('#total').text(tot);
		
	});
	
	$('.btn').click(function (){
		
		if ($('#hid').val()!="") {
			$('#payDetails').submit();
		}
		else {$('.btn').prop("href", "#")};
		
	});
	
});
</script>
	
	
<body id="master_body">

	<div id="charge_div" class="container">


		<div class="row margin-bottom-10">
			<div class="col-xs-1">&nbsp;</div>
			<div class="col-xs-10">
				<h3 class="margin-top-50">캐시충전</h3>
			</div>
			<div class="col-xs-1">&nbsp;</div>
		</div>



		<div class="row">
			<div class="col-xs-1">&nbsp;</div>
			<div class="col-xs-7">
			
			
				<ul id="fakeMileageAmountList" class="list-group margin-bottom-0">


					<li
						class="buyer-item list-group-item padding-top-15 padding-bottom-15">
						<label class="margin-all-0 display-block cursor">
							<div class="row">
								<div class="col-xs-12">
									<div class="awesome-radio">
										<label> 
										<input type="hidden"name="chargeAmount" value="0">
											<input type="radio" name="chargeAmount" value="30000"> 
											<span class="awesome-radio-body"></span>
											<div class="awesome-radio-text">
												<i class="fa fa-krw" aria-hidden="true"></i> <b>30,000</b>
												&nbsp;&nbsp;
											</div>
										</label>
									</div>
								</div>
							</div>
					</label>
					</li>


					<li
						class="buyer-item list-group-item padding-top-15 padding-bottom-15">
						<label class="margin-all-0 display-block cursor">
							<div class="row">
								<div class="col-xs-12">
									<div class="awesome-radio">
										<label>
										<input type="hidden"name="chargeAmount" value="0">
										<input type="radio" name="chargeAmount"
											value="50000"> 
											<span class="awesome-radio-body"></span>
											<div class="awesome-radio-text">
												<i class="fa fa-krw" aria-hidden="true"></i> <b>50,000</b>
												&nbsp;&nbsp;
											</div>
										</label>
									</div>
								</div>
							</div>
					</label>
					</li>


					<li
						class="buyer-item list-group-item padding-top-15 padding-bottom-15">
						<label class="margin-all-0 display-block cursor">
							<div class="row">
								<div class="col-xs-12">
									<div class="awesome-radio">
										<label> 
										<input type="hidden"name="chargeAmount" value="0">
										<input type="radio" name="chargeAmount"
											value="100000"> 
											<span class="awesome-radio-body"></span>
											<div class="awesome-radio-text">
												<i class="fa fa-krw" aria-hidden="true"></i> <b>100,000</b>
												&nbsp;&nbsp;
											</div>
										</label>
									</div>
								</div>
							</div>
					</label>
					</li>


					<li
						class="buyer-item list-group-item padding-top-15 padding-bottom-15">
						<label class="margin-all-0 display-block cursor">
							<div class="row">
								<div class="col-xs-12">
									<div class="awesome-radio">
										<label> 
										<input type="hidden"name="chargeAmount" value="0">
										<input type="radio" name="chargeAmount"
											value="200000"> 
											<span class="awesome-radio-body"></span>
											<div class="awesome-radio-text">
												<i class="fa fa-krw" aria-hidden="true"></i> <b>200,000</b>
												&nbsp;&nbsp;
											</div>
										</label>
									</div>
								</div>
							</div>
					</label>
					</li>




					<li
						class="buyer-item list-group-item padding-top-15 padding-bottom-15">
						<label class="margin-all-0 display-block cursor">
							<div class="row">
								<div class="col-xs-12">
									<div class="awesome-radio">
										<label> 
										<input type="hidden" name="chargeAmount" value="0">
										<input type="radio" name="chargeAmount"
											value="300000"> 
											<span class="awesome-radio-body"></span>
											<div class="awesome-radio-text">
												<i class="fa fa-krw" aria-hidden="true"></i> <b>300,000</b>
												&nbsp;&nbsp;
											</div>
										</label>
									</div>
								</div>
							</div>
					</label>
					</li>





					<li
						class="buyer-item list-group-item padding-top-15 padding-bottom-15">
						<label class="margin-all-0 display-block cursor">
							<div class="row">
								<div class="col-xs-12">
									<div class="awesome-radio">
										<label> 
										<input type="hidden"name="chargeAmount" value="0">
										<input type="radio" name="chargeAmount"
											value="500000"> 
											<span class="awesome-radio-body"></span>
											<div class="awesome-radio-text">
												<i class="fa fa-krw" aria-hidden="true"></i> <b>500,000</b>
												&nbsp;&nbsp;
											</div>
										</label>
									</div>
								</div>
							</div>
					</label>
					</li>





					<li
						class="buyer-item list-group-item padding-top-15 padding-bottom-15">
						<label class="margin-all-0 display-block cursor">
							<div class="row">
								<div class="col-xs-12">
									<div class="awesome-radio">
										<label> 
										<input type="hidden"name="chargeAmount" value="10000">
										<input type="radio" name="chargeAmount"
											value="1000000">
											<span class="awesome-radio-body"></span>
											<div class="awesome-radio-text">
												<i class="fa fa-krw" aria-hidden="true"></i> <b>1,000,000</b>
												&nbsp;&nbsp; <span class="label label-danger">+
													10,000원 보너스</span>
											</div>
										</label>
									</div>
								</div>
							</div>
					</label>
					</li>





					<li
						class="buyer-item list-group-item padding-top-15 padding-bottom-15">
						<label class="margin-all-0 display-block cursor">
							<div class="row">
								<div class="col-xs-12">
									<div class="awesome-radio">
										<label> 
										<input type="hidden"name="chargeAmount" value="40000">
										<input type="radio" name="chargeAmount"
											value="2000000">
											 <span class="awesome-radio-body"></span>
											<div class="awesome-radio-text">
												<i class="fa fa-krw" aria-hidden="true"></i> <b>2,000,000</b>
												&nbsp;&nbsp; <span class="label label-danger">+
													40,000원 보너스</span>
											</div>
										</label>
									</div>
								</div>
							</div>
					</label>
					</li>





					<li
						class="buyer-item list-group-item padding-top-15 padding-bottom-15">
						<label class="margin-all-0 display-block cursor">
							<div class="row">
								<div class="col-xs-12">
									<div class="awesome-radio">
										<label> 
										<input type="hidden"name="chargeAmount" value="90000">
										<input type="radio" name="chargeAmount"
											value="3000000"> 
											<span class="awesome-radio-body"></span>
											<div class="awesome-radio-text">
												<i class="fa fa-krw" aria-hidden="true"></i> <b>3,000,000</b>
												&nbsp;&nbsp; <span class="label label-danger">+
													90,000원 보너스</span>
											</div>
										</label>
									</div>
								</div>
							</div>
					</label>
					</li>





					<li
						class="buyer-item list-group-item padding-top-15 padding-bottom-15">
						<label class="margin-all-0 display-block cursor">
							<div class="row">
								<div class="col-xs-12">
									<div class="awesome-radio">
										<label> 
										<input type="hidden"name="chargeAmount" value="200000">
										<input type="radio" name="chargeAmount"
											value="5000000"> 
											<span class="awesome-radio-body"></span>
											<div class="awesome-radio-text">
												<i class="fa fa-krw" aria-hidden="true"></i> <b>5,000,000</b>
												&nbsp;&nbsp; <span class="label label-danger">+
													200,000원 보너스</span>
											</div>
										</label>
									</div>
								</div>
							</div>
					</label>
					</li>

				</ul>

			</div>

			<div class="col-xs-3">
				<div class="panel border-solid bg-color-light-yellow margin-all-0">
					<div class="panel-body" style="height: 510px">
						<div class="row">
							<div class="col-xs-3 padding-right-0">
								<img class="width-100" src="../image/kmong_cash_yellow.png" />
							</div>
							<div class="col-xs-9 margin-top-5">
								<h6 class="margin-all-0">보유캐시</h6>
								<h5 class="margin-top-5 margin-bottom-0 color-primary">
									<b>${sc+cc }원</b>
								</h5>
							</div>
						</div>
						<div class="row margin-top-20">
							<div class="col-xs-12">
								<div class="charge-dashed-bottom"></div>
							</div>
						</div>
						<div class="row margin-top-20">
							<div class="col-xs-5">
								<b>충전 캐시</b>
							</div>
							<div class="col-xs-7 text-right padding-left-0">
								<h5 class="margin-top-5 margin-bottom-0 ">
									<i class="fa fa-krw" aria-hidden="true"></i> <span id="selectcash">0</span> 원
								</h5>
							</div>
						</div>
						<div class="row margin-top-10">
							<div class="col-xs-6 padding-right-0">ㄴ 충전혜택</div>
							<div class="col-xs-6 text-right padding-left-0">
								<h5 class="margin-top-5 margin-bottom-0">
									<i class="fa fa-krw" aria-hidden="true"></i> <span id="benefit">0</span> 원
								</h5>
							</div>
						</div>
						<div class="row margin-top-20">
							<div class="col-xs-5 padding-right-0">
								<b>총 충전 캐시</b>
							</div>
							<div class="col-xs-7 text-right padding-left-0">
								<h5 class="margin-top-5 margin-bottom-0">
									<i class="fa fa-krw" aria-hidden="true"></i> <span id="total">0</span> 원
								</h5>
							</div>
						</div>
						<div class="row margin-top-20">
							<div class="col-xs-12">
								<div class="charge-dashed-bottom"></div>
							</div>
						</div>
						<div class="row margin-top-20">
							<div class="col-xs-12">
								<b>총 결제금액</b>
							</div>
							<div class="col-xs-12 text-right">
								<h2 class="margin-top-5 margin-bottom-0 color-primary margin-top-95 NGB">
									<i class="fa fa-krw" aria-hidden="true"></i> <span id="pay">0</span> 원
								</h2>
								<span class="font-color-lighter font-size-h6">(VAT 포함)</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-1">&nbsp;</div>
		</div>
		<div class="row">
			<div class="col-xs-1">&nbsp;</div>
			<div class="col-xs-10">
				<div class="row">
					<div class="col-xs-12">
						<h3 class="margin-top-25">결제방법</h3>
					</div>
					
					<div class="col-xs-12">
						<div class="panel panel-default margin-top-10">
							<div class="panel-body">
							
							<form action="" method="get" id="payDetails">
					
								<div class="row padding-top-5 padding-bottom-5">
									<div class="col-xs-2">
										<div class="awesome-radio">
											<label> <input type="radio" name="payMethod"
												value="SC0010" checked> <span
												class="awesome-radio-body"></span>
												<div class="awesome-radio-text">신용카드</div>
											</label>
										</div>
									</div>
									<div class="col-xs-3">
										<div class="awesome-radio">
											<label> <input type="radio" name="payMethod"
												value="SC0040"> <span class="awesome-radio-body"></span>
												<div class="awesome-radio-text">무통장입금(가상계좌)</div>
											</label>
										</div>
									</div>
									<div class="col-xs-2">
										<div class="awesome-radio">
											<label> <input type="radio" name="payMethod"
												value="SC0060"> <span class="awesome-radio-body"></span>
												<div class="awesome-radio-text">휴대폰</div>
											</label>
										</div>
									</div>
									<div class="col-xs-3">
										<div class="awesome-radio">
											<label> <input type="radio" name="payMethod"
												value="SC0030"> <span class="awesome-radio-body"></span>
												<div class="awesome-radio-text">실시간 계좌이체</div>
											</label>
										</div>
									</div>
									<div class="col-xs-2 padding-left-0">
										<div class="awesome-radio">
											<label> <input type="radio" name="payMethod"
												value="KAKAOPAY"> <span class="awesome-radio-body"></span>
												<div class="awesome-radio-text">카카오페이</div>
											</label>
										</div>
									</div>
								</div>
								<input type="hidden" id="hid" name="money">
							</form>
								
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-8"></div>
			<div class="col-xs-3">
				<div>
					<a class="btn btn-primary btn-block">충전하기</a>
				</div>
			</div>
			<div class="col-xs-1"></div>
		</div>
		
		<div class="row">
			<div class="col-xs-1"></div>
			<div class="col-xs-10">
				<div
					class="panel bg-color-transparent profits-panel-border border-radius-0">
					<div class="panel-body padding-top-10 padding-bottom-10">
						<h5 class="NGB margin-all-0">
							<i class="fa fa-exclamation-circle" aria-hidden="true"></i> 꼭
							읽어주세요.
						</h5>
						<ul
							class="text-style font-size-h6 font-color-light margin-top-10 padding-left-20 margin-bottom-0">
							<li>충전한 캐시 환불 시 무상으로 지급받은 보너스 캐시는 자동 환수됩니다.</li>
							<li>캐시를 충전하여 발급받은 신용카드 전표/현금영수증은 개인 소득공제용으로만 사용 가능합니다.</li>
							<li>매입세액공제용 영수증이 필요한 의뢰인에게는, '기업 전문가'가 직접 세금계산서를 발행합니다.</li>
							<li>크몽캐시는 ‘통장’의 의미를 가지고 있으며, 사이트 내 거래를 위해 편의상 보관되는 금액이므로
								세금계산서 발행이 불가능합니다.<br /> (크몽으로의 세금계산서 발행요청을 자제부탁드립니다.)
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-xs-1"></div>
		</div>
		
	</div>
	
	<div class="col-xs-1">&nbsp;</div>


</body>
</html>
<%@ include file="../inc/footer/footer_notice.jsp" %>
<%@ include file="../inc/footer/footer.jsp" %>

