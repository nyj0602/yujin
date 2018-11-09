
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../mykmong/mykmong_header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="subject" content="크몽 - 당신의 비즈니스를 도와드립니다 " />

<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="../css/kmong-99952b2854.master_desktop.css" rel="stylesheet">
<link href="../css/kmong_desktop_v2-6ec7c3f31e.css" rel="stylesheet">
<link href="../css/kmong_fonts.css" rel="stylesheet">
<link href="../css/mykmong_main.css" rel="stylesheet">
<link href="../css/kmong_buy.css" rel="stylesheet">
<link rel="shortcut icon" href="../image/favicon.ico">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="http://jqueryui.com/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="http://jqueryui.com/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.2/Chart.min.js"></script>
<script src="http://www.chartjs.org/dist/2.7.2/Chart.bundle.js"></script>


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
					<div class="col-xs-8 margin-top-5">
						<div class="inline-block">
							<h3 class="header-margin-none NGB">수익관리</h3>
						</div>

						<div
							class="panel panel-default  bg-color-f1 margin-none inline-block margin-left-5">
							<div class="panel-body inline-block padding-all-0">
								<div class="inline-block padding-left-5">
									<h6 class="header-margin-none font-color-light">
										예금주:&nbsp;${count.c_name }</h6>
								</div>
								<div class="inline-block">
									<h6 class="header-margin-none font-color-lighter">&nbsp;|&nbsp;</h6>
								</div>
								<div class="inline-block padding-right-5">
									<h6 class="header-margin-none font-color-light">
										출금계좌:&nbsp;${count.c_bank }&nbsp;${count.c_count }</h6>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xs-4 text-right">
						<a class="btn btn-default btn-xss border-radius"
							href="#"
							onclick="sendGAEvent('clickEvent', 'seller', '광고신청 - 수익관리')">
							<h5 class="margin-all-0 font-color-light">광고 신청</h5>
						</a>
					</div>
					
				</div>


				<div class="row">
					<div class="col-xs-12">
						<div class="panel panel-default border-none margin-top-15">
							<div
								class="panel-body bg-color-white border-radius-0 box-shadow-default-light-gray"
								style="padding: 8px;">
								<div class="row">
									<div
										class="col-xs-6 margin-top-10 margin-bottom-10 border-right padding-left-40">
										<div class="row">
											<div class="col-xs-3 padding-right-0">
												<img class="width-80" src="../image/profits.png" />
											</div>
											<div class="col-xs-9 padding-left-0">
												<h5 class="font-color-light margin-top-5">출금가능 수익금</h5>


												<div class="row">
													<div class="col-xs-7">
														<h2 class="NGB margin-top-0">${profit }원</h2>
													</div>
													<div class="col-xs-5 padding-left-0">
														<div
															class="withdrawRequestBtn inline-block position-relative"
															style="top: -1px;">
															
																<button id="withdrawRequestBtn1" style="display: ${with eq 'wait' ? 'none' : 'block'}" class="NGR btn btn-black btn-xss border-radius "
																	role="button" data-toggle="tooltip"
																	data-placement="right"
																	data-original-title="출금신청,취소는 09:00 ~ 17:00까지 가능합니다">
																	출금
																	신청
																</button>
																<button id="withdrawRequestBtn2" style="display: ${with eq 'wait' ? 'block' : 'none'}" class="NGR btn btn-black btn-xss border-radius "
																	role="button" data-toggle="tooltip"
																	data-placement="right"
																	data-original-title="출금신청,취소는 09:00 ~ 17:00까지 가능합니다">
																	출금
																	진행
																</button>
																
														</div>

														
													</div>
												</div>

<script type="text/javascript">
$(function (){
	
	$('#withdrawRequestBtn1').on("click", function (){
		
		$.ajax({
			
			url:"withdraw.do",
			dataType:'json',
			type:'post',
			success:function(data){
				$('#backmon').css("display", "block");
				$('#monback').css("display", "block");
				$('#withdrawRequestBtn1').css("display", "none");
				$('#withdrawRequestBtn2').css("display", "block");
			}
			});
		
	});
	
	$('#backbtn').on("click", function (){
		$('#backmon').css("display", "none");
		$('#monback').css("display", "none");
	});
	
})
</script>


											</div>
										</div>
									</div>
									<div
										class="col-xs-3 margin-top-10 margin-bottom-10 border-right text-center ">
										<h6 class="brand-black">예상 수익금</h6>
										<h5 class="brand-black">${mymoney.ex_money } 원</h5>
									</div>
									<div
										class="col-xs-3 margin-top-10 margin-bottom-10 text-center">
										<h6 class="brand-black">출금 완료 수익금</h6>
										<h5 class="brand-black">${mymoney.com_moeny } 원</h5>
									</div>
								</div>
							</div>
						</div>


<div id="monback" class="sweet-overlay" tabindex="-1" style="opacity: 1.06; display: none;"></div>
<div id="backmon" class="sweet-alert showSweetAlert visible" data-custom-class="" data-has-cancel-button="false" data-has-confirm-button="true" data-allow-outside-click="false" data-has-done-function="true" data-animation="pop" data-timer="null" style="display: none; margin-top: -175px;"><div class="sa-icon sa-error" style="display: none;">
      <span class="sa-x-mark">
        <span class="sa-line sa-left"></span>
        <span class="sa-line sa-right"></span>
      </span>
    </div><div class="sa-icon sa-warning" style="display: none;">
      <span class="sa-body"></span>
      <span class="sa-dot"></span>
    </div><div class="sa-icon sa-info" style="display: none;"></div><div class="sa-icon sa-success animate" style="display: block;">
      <span class="sa-line sa-tip animateSuccessTip"></span>
      <span class="sa-line sa-long animateSuccessLong"></span>

      <div class="sa-placeholder"></div>
      <div class="sa-fix"></div>
    </div><div class="sa-icon sa-custom" style="display: none;"></div><h2>출금신청</h2>
    <p style="display: block;">출금신청이 완료되었습니다.</p>
    <fieldset>
      <input type="text" tabindex="3" placeholder="">
      <div class="sa-input-error"></div>
    </fieldset><div class="sa-error-container">
      <div class="icon">!</div>
      <p>Not valid!</p>
    </div><div class="sa-button-container">
   
      <div class="sa-confirm-button-container">
        <button id="backbtn" class="confirm" tabindex="1" style="display: inline-block; background-color: rgb(140, 212, 245); box-shadow: rgba(140, 212, 245, 0.8) 0px 0px 2px, rgba(0, 0, 0, 0.05) 0px 0px 0px 1px inset;">확인</button><div class="la-ball-fall">
          <div></div>
          <div></div>
          <div></div>
        </div>
      </div>
    </div></div>




					<div class="row">
                            <div class="col-xs-12 text-right">
                                <a id="chart_daily" class="plain NGB" href="javascript:void(0);" onclick="getProfitsChart('daily');">일별</a>&nbsp;
                                <a id="chart_monthly" class="plain" href="javascript:void(0);" onclick="getProfitsChart('monthly');">월별</a>
                            </div>
                            <div class="col-xs-12"><iframe class="chartjs-hidden-iframe" tabindex="-1" style="display: block; overflow: hidden; border: 0px; margin: 0px; top: 0px; left: 0px; bottom: 0px; right: 0px; height: 100%; width: 100%; position: absolute; pointer-events: none; z-index: -1;"></iframe>
                                <canvas id="profit_reports" width="738px" height="276px" style="display: block; width: 738px; height: 276px;"></canvas>
                            </div>
                    </div>
                    
                     
					</div>
				</div>



<script>


    var ctx = $('#profit_reports');
    var profitsChart;

    function getProfitsChart(types) {
        $('#chart_monthly').addClass('NGB')
        $('#chart_daily').removeClass('NGB')

        if (types == 'daily') {
            $('#chart_daily').addClass('NGB')
            $('#chart_monthly').removeClass('NGB')
        }
        
        $.ajax({
            type: 'post',
            url: 'chart.do?types='+types,
            dataType: 'json',
            success: function(data) {
            	
            	
            	
            	
                var data = {
                    labels: data.term, // 달 저장.. 
                    datasets: [{
                        label: '주문완료',
                        data: data.done, // 주문 완료 데이터 저장
                        backgroundColor: "rgba(250,250,0,0.5)",
                        borderColor: "rgba(250,250,0,1)"
                    }, {
                        label: '주문취소',
                        data: data.can, // 주문 취소 데이터 저장
                        backgroundColor: "rgba(220,50,50,0.5)",
                        borderColor: "rgba(220,50,50,0.5)",
                        hidden: true
                    }, {
                        label: '주문시작',
                        data: data.on, // 주문 시작 데이터 저장
                        backgroundColor: "rgba(180,180,180,0.4)",
                        borderColor: "rgba(180,180,180,0.4)",
                        hidden: true
                    }]
                }

                if (window.profitsChart !== undefined) {
                    window.profitsChart.destroy()
                }
                profitsChart = new Chart(ctx,{
                    type: 'bar',
                    data: data,
                    options: {
                    	
                        scales: {
                        	xAxes:[
                        		
                        	],
                            yAxes: [{
                                ticks: {
                                    beginAtZero: true
                                }
                            }]
                        }
                
                
                
                    }

                });
                
                
            }
            
            
            
            
            

        });
    }

    getProfitsChart('monthly')

 
</script>


				<div class="row margin-top-40">
					<div class="col-xs-12">
						<ul class="list-inline tab-menu-underline margin-bottom-0"
							role="tablist">

							<li role="presentation"
								class="margin-right-25 position-relative ${tab eq 'profits'? 'active':'' }"><a
								class="plain font-color-lighter"
								href="profits.do?tab=profits">수익금 내역</a></li>

							<li role="presentation"
								class="margin-right-25 position-relative ${tab eq 'withdraw'? 'active':'' }"><a
								class="plain font-color-lighter"
								href="profits.do?tab=withdraw">출금내역</a>
							</li>

						</ul>
					</div>
				</div>





				<div class="row margin-top-10">
					<div id="taxInvoiceList" class="col-xs-12"></div>
				</div>


				<div class="row margin-top-10">
					<div id="expectedProfitOrderList" class="col-xs-12">

						<form method="GET" action="#" accept-charset="UTF-8">
							<input type="hidden" name="target" value="expected_profits">
							<div class="row margin-bottom-15" style="display: ${tab eq 'profits'?'block':'none'}">
							
								<div class="col-xs-2" >
									<div class="form-group">
										<div class="border-solid">
											<select name="type"
												class="form-control input-xs border-none"
												onchange="this.form.submit()">
												<option value="전체" ${type eq '전체'? 'selected':'' }>
														전체
                                                    </option>
												<option value="완료" ${type eq '완료'? 'selected':'' }>
                                                        완료
                                                    </option>
												<option value="진행중" ${type eq '진행중'? 'selected':'' }>
														진행중
                                                    </option>
												<option value="취소" ${type eq '취소'? 'selected':'' }>
														취소
                                                    </option>
											</select>
										</div>
									</div>
								</div>


								<div class="col-xs-10">
									<div class="row">
										<div class="col-xs-6 pull-right">
											<div class="row">
												<div class="col-xs-12 pull-right padding-top-10">
													<a id="profit_btn" class="profits-link cursor" data-toggle="modal" data-target="#profits-cal-modal">
														<h6 style="color: #2466a4" class="text-underline link-color-blue NGB inline-block pull-right margin-top-0">
															<img class="width-10px margin-right-5" src="../image/ic_calculator.png" />수익금계산기
														</h6>
													</a>
												</div>
											</div>
										</div>
									</div>
								</div>

							</div>
							
						</form>


						<div class="row margin-top-20">
                        	<div id="withdrawnList" class="col-xs-12">

						<c:set var="profits" value="${profits.profitlist }"/>
						<c:choose>
						<c:when test="${empty profits }">
	                            <div class="border-solid text-center padding-top-65 padding-bottom-65">
                                    <div>
                                        <img class="width-50px" src="../image/nothing.png" title="내역없음">
                                    </div>
                                    <h5 class="NGR font-color-lighter">내역이 없습니다.</h5>
                                </div>
						</c:when>
						<c:when test="${not empty profits }">
						<c:forEach var="profits" items="${profits }">
						<div class="expected-profit-order-panel panel panel-default margin-top-0 border-radius-0 margin-bottom-0">
							<div class="row margin-left-0 margin-right-0">
								<div class="col-xs-1 width-10 border-dashed-right text-center padding-top-30 padding-bottom-30 padding-right-10 padding-left-10">
									<h4 class="header-margin-none line-height ${profits.pf_sep eq '예상' ? 'color-green' : profits.pf_sep eq '취소' ? 'font-color-lighter' : ''}">
									${profits.pf_sep eq '예상' ? '진행중' : profits.pf_sep eq '출금가능' or profits.pf_sep eq '출금신청' ? '완료' : profits.pf_sep}</h4>
								</div>

								<div class="col-xs-10 width-90 padding-all-20 ">
									<span class="font-size-h4"> 수익금 
										<span class="link-color-blue">
											<b>${profits.pf_price } 원</b>
										</span>
									</span>

									<h6 class="font-color-lighter margin-top-5 margin-bottom-0">#${profits.order_num }&nbsp;&nbsp;|&nbsp;&nbsp;
									주문 접수일 : ${profits.pd_date }&nbsp;&nbsp;|&nbsp;&nbsp;실 거래 금액 : ${profits.pay_money } 원</h6>
								</div>
							</div>
						</div>
						</c:forEach>
						</c:when>
						</c:choose>						
						
                            </div>
                   		</div>


				<div class="row">
					<div class="col-xs-12">
						<div
							class="panel bg-color-kmong-main profits-panel-border border-radius-0 border-solid">
							<div class="panel-body">
								<h6 class="NGB margin-all-0 padding-bottom-5">
									<i class="fa fa-exclamation-circle padding-right-5"
										aria-hidden="true"></i> 매출신고 방법 안내
								</h6>
								<div
									class="font-color-light margin-top-5 margin-top-5 margin-bottom-0 font-size-h6">
									크몽은 전문가의 매출 신고방법을 따로 안내해 드리지 않으며 매출 신고와 관련된 문의사항은 국세청이나 세무사무실에
									문의바랍니다.<br> 월별 출금내역은 세무 신고 시의 참고이며 반드시 귀사의 회계자료와 비교 후
									처리하시기 바랍니다.
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

<div id="profits-cal-modal" class="modal fade modal-square in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false" style="display: none;">
    <div class="modal-dialog modal-position" style="width:690px" role="document">
        <div class="modal-content border-none border-radius-0 bg-color-black position-relative">
            <button id="profitsclose" type="button" class="close position-absolute top-20 right-5" style="z-index: 1" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
            <div class="row">
                <div class="col-xs-3">
                    <div class="padding-left-25 padding-top-25">
                        <h2 class="color-white line-height" id="myModalLabel">전문가<br>수익금 계산기</h2>
                    </div>
                </div>
                <div class="col-xs-9 bg-color-white padding-side-0">
                    <div class="modal-body padding-top-60">
                        <div class="row">
                            <div class="col-xs-12 padding-side-40">
                                
                                
                                <div class="row">
                                    <div class="col-xs-12">
                                        <div class="padding-bottom-35">
                                            <span class="NGB">카테고리</span>
                                            <div class="input-group margin-top-10 position-relative width-100 border-solid">
                                                <select id="op_cate" class="form-control border-none">
                                                    <option value="">선택하세요.</option>
                                                    <option value="1">디자인</option>
                                                    <option value="6">IT &amp; 프로그래밍</option>
                                                    <option value="7">컨텐츠 제작</option>
                                                    <option value="2">마케팅</option>
                                                    <option value="3">번역 &amp; 통역</option>
                                                    <option value="4">문서작성</option>
                                                    <option value="9" >상담 &amp; 컨설팅</option>
                                                    <option value="10">레슨</option>
                                                    <option value="11">핸드메이드</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row margin-top-15">
                                    <div class="col-xs-12">
                                        <div class="padding-bottom-35">
                                            <span class="NGB">거래 완료 금액</span>
                                            <div class="input-group margin-top-10 position-relative width-100">
                                                <input id="kmongProfitsCal" placeholder="0" type="text" maxlength="12" class="form-control single-form-group width-100 padding-right-40 radius-none" autocomplete="off">
                                                <div class="position-absolute top-15 right-20" style="z-index: 11">
                                                    <img class="width-15px margin-right-10 cursor" src="/img/promotion/profits_cal_icon.png" style="display: none;">
                                                    <span>원</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="row" id="tax_is">
                                    <div class="col-xs-12">
                                        <table class="profits-table padding-bottom-40 width-100">
                                            <tbody>
                                            
	                                            <tr>
	                                                <th class="text-left width-35">금액</th>
	                                                <th class="text-center width-30">수수료</th>
	                                                <th class="text-right width-35">전문가 수익</th>
	                                            </tr>
	                                            
	                                            <tr>
	                                                <td>1 원 ~ 500,000 원</td>
	                                                <td>20%</td>
	                                                <td id="tab1" class="NGB">0 원</td>
	                                            </tr>
	                                            
	                                            <tr>
	                                                <td>500,001 원 ~ 1,000,000 원</td>
	                                                <td>10%</td>
	                                                <td id="tab2" class="NGB">0 원</td>
	                                            </tr>
	                                            
	                                            <tr>
	                                                <td>1,000,001 원 ~ </td>
	                                                <td>5%</td>
	                                                <td id="tab3" class="NGB">0 원</td>
	                                            </tr>
	                                           	
                                            
                                        	</tbody>
                                        </table>
                                    </div>
                                </div>
                                
                                <div class="row" style="display: none" id="tax_none">
                                    <div class="col-xs-12">
                                        <table class="profits-table padding-bottom-40 width-100">
                                            <tbody>
	                                            <tr>
	                                                <td class="text-left width-35">금액</td>
	                                                <td class="text-center width-30">수수료</td>
	                                                <td class="text-right width-35">전문가 수익</td>
	                                            </tr>
	    
	                                            <tr>
	                                                <td>1 원 ~ </td>
	                                                <td>0%</td>
	                                                <td class="NGB">0 원</td>
	                                            </tr>

                                        	</tbody>
                                        </table>
                                    </div>
                                </div>
                                
                                
                                <div class="row padding-top-25 padding-bottom-30">
                                    <div class="col-xs-4 padding-top-5"><span class="NGB">전문가 총 수익</span></div>
                                    <div class="col-xs-8 text-right">
                                                <span id="result" class="font-size-h1 NGB color-red">0 원</span>
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

<script>

$(function (){
	
	$('.tax_none').css("display", "none");   
	
    $('#profit_btn').on("click", function (){
    	$('#profits-cal-modal').css("background-color", "rgba(0,0,0,0.4)");
    	$('#profits-cal-modal').css("display", "block");
    });
	
    $('#profitsclose').on("click", function (){
    	$('#profits-cal-modal').hide();
    });
    
    
    $('#op_cate').on("change", function (){
    	
    	if($('#op_cate > option:selected').val() == 10 || $('#op_cate > option:selected').val() == 11 ){
    	    	
    		$('#tax_is').css("display", "none");
    		$('#tax_none').css("display", "block");
    	
    	} else {
    		$('#tax_is').css("display", "block");
    		$('#tax_none').css("display", "none");
    		
    	}
    });
	
    $('#kmongProfitsCal').on("keyup", function (){
    	
    	var one = event.keyCode;
    	
    	if (!(one >= 48 && one <= 57)) {
    		 $('#kmongProfitsCal').val("");
		};
    	
    	if ($('#op_cate > option:selected').val() == 10 || $('#op_cate > option:selected').val() == 11 ) {
    		if ($('#kmongProfitsCal').val() >= 5000 ) {
	    		$('#result').text($('#kmongProfitsCal').val());
    		}
		} else {
			if ($('#kmongProfitsCal').val() >= 5000 ) {
			
				var tab1=0, tab2=0, tab3=0;
				
			if($('#kmongProfitsCal').val() <= 500000) {
				tab1 = $('#kmongProfitsCal').val()*0.8;
				$('#tab1').text( numberFormat(tab1)+"원" );
			}else if ( $('#kmongProfitsCal').val() <= 1000000 && $('#kmongProfitsCal').val() >= 500001) {
				tab1 = 500000*0.8;
				tab2 = ($('#kmongProfitsCal').val()-500000)*0.9
				$('#tab1').text(numberFormat(tab1)+"원");
				$('#tab2').text(numberFormat(tab2)+"원");
			}else {
				tab1 = 500000*0.8
				tab2 = 500000*0.9
				tab3 = ($('#kmongProfitsCal').val()-1000000)*0.95
				$('#tab1').text(numberFormat(tab1)+"원");
				$('#tab2').text(numberFormat(tab2)+"원");
				$('#tab3').text(numberFormat(tab3)+"원");
			}
				
			$('#result').text(numberFormat(tab1+tab2+tab3)+"원");
			
						
			}
		}


    	
    	
    });
    
	function numberFormat(number) {
	    var string = number.toString();
	    var length = string.length;
	    var standard = (length % 3 === 0) ? 3 : length % 3;
	    var arr = [];

	    var start = 0;

	    while (true) {
	        var temp = string.substr(start, standard);

	        if (temp === "") break;

	        arr.push(temp);

	        start = start + standard;
	        standard = 3;
	    }

	    var result = arr.join(",");

	    return result;
	}
	
	
	
});
    
</script>
</html>

<%@ include file="../inc/footer/footer_notice.jsp" %>
<%@ include file="../inc/footer/footer.jsp" %>