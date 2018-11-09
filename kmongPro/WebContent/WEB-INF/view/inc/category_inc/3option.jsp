<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:forEach items="${prices }" var="pri" end="0">
	<c:set value="${pri.m_email }" var="pr_email"></c:set>
</c:forEach>
  <c:forEach items="${vacation }" var="vac">
  <c:set value="${vac.m_email }" var="va_email"></c:set>
  <c:set value="${vac.v_state }" var="state"></c:set>
  </c:forEach>
<div id="rightSidePriceDiv" style="">
                        <div>
                            <div class="panel-group package-group margin-bottom-10" id="packageAccordion" role="tablist" aria-multiselectable="true">
               <c:forEach items="${prices }" var="pri">
                                <div class="panel panel-default border-radius-0"><!-- 비 활성화된 슬라이드 :plain collapsed -->
                                    <a class="plain collapsed" data-toggle="collapse" data-parent="#packageAccordion" aria-expanded="true" aria-controls="collapse${pri.op_sep }">
                                        <div class="panel-heading" role="tab" id="heading${pri.op_sep }">
                                            <h3 class="header-margin-none font-color-base">
                                                <span class="font-color-base"><b>₩ <fmt:formatNumber value="${pri.op_price }" pattern="#,###" /></b></span>
                                                <span class="font-color-lighter">${pri.op_sep }</span>
                                                <!-- <div class="pull-right font-size-h6 margin-top-5">
                                                    <i class="kmong kmong-angel-bottom kmong-xlg"></i>
                                                </div> -->
                                            </h3>
                                        </div>
                                    </a>
                                    <!-- panel-collapse package-body collapse in -->
                                    <div class="panel-collapse package-body collapse" role="tabpanel" id="collapse${pri.op_sep }" aria-labelledby="heading${pri.op_sep }" aria-expanded="false" style=""><!-- 비활성화되면: false ,height: 0px;-->
                                        <div class="package-detail-border"></div>
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-xs-12 word-break"><strong>${pri.op_manual1 }</strong></div>
                                                <div class="col-xs-12 word-break">${pri.op_manual2 }</div>
                                            </div>

                                            <div class="row margin-top-15">
                                              
                                                
                                            </div>

                                            <div class="row  margin-top-20 font-color-light">
                                                <div class="col-xs-6">
                                                    <i class="fa fa-calendar margin-right-5"></i>
                                                    작업일 :
                                                    <span> ${pri.op_term } 일</span>
                                                    
                                                </div>
                                                <div class="col-xs-6">
                                                    <i class="fa fa-wrench margin-right-5"></i>수정 횟수 : <span>${pri.op_change } 회</span>
                                                </div>
                                            </div>

                                          
                                            
                                            	<c:choose>
                                            		<%-- <<c:when test="${vac.v_state  eq '휴가'}">
                                            			<div>
				                                            <div class="list-group-item padding-top-15 padding-bottom-15 font-size-h5" style="border: 0px;">
				                                                                                                    <button class="btn btn-danger btn-block vacation-request-button">
				                                                        <img class="width-15px" src="../imeage/ic_check.png">
				                                                        &nbsp;판매전환하기
				                                                    </button>
				                                            </div>
				                                        </div>
                                            		</c:when> --%>
                                            		<c:when test='${pr_email  eq va_email and state eq "휴가"}'>
                                            		<c:forEach items="${vacation }" var="vac">
                                            			<div>
														<div class="list-group-item padding-top-15 padding-bottom-15 font-size-h5" style="border: 0px;">
													        <div>
													        <button class="btn btn-danger btn-block vacation-request-button">
													            <img class="width-15px" src="../css/imeage/ic_check.png">
													            <span>&nbsp;복귀 알림 받기</span>
													            
													        </button>
													
													        <div class="margin-top-20">
													            <p class="font-size-h6 text-style padding-left-10" style="border-left: 0.3em solid #F46865; color: #F46865;">                 ${vac.v_reason }<br>                            ${vac.v_end } 판매를 재개할 예정입니다 				</p>
													                </div>
													            </div>
													        
													    </div>
													</div>
													</c:forEach>
                                            		</c:when>
                                            		<c:otherwise>
                                            			  <div class="row margin-top-15">
			                                                <div class="col-xs-12 3option">
			                                                    <button class="btn btn-brand-yellow btn-block padding-left-10 padding-right-10" id="${pri.op_sep }" ><b>구매하기 (VAT포함)</b><span style="display: none"/>${pri.op_seq}</span></button>
			                                                </div>
			                                            </div>
                                            		</c:otherwise>
                                            	</c:choose>
                                            	
												
                                        </div>
                   
                                        <div class="row margin-left-0 margin-right-0">
                                            <div class="list-group-item font-size-h6 border-none border-radius-0 padding-top-10 padding-bottom-10 bg-color-white" style="border-top: 1px solid #e6e6e6 !important;">

                                                <i class="kmong kmong-cash-mileage vertical-align-middle font-size-h4 position-relative" style="top: 1px;"></i>&nbsp;
                                                <span class="vertical-align-middle">
                                                    구매혜택 :
                                                    <span>크몽캐시 <b class="color-red">2%</b> 적립</span>
                                                </span>
                                                <span class="pull-right">
                                                    
                                                    <div class="btn-group display-block text-left">
														    <a class="font-color-lighter cursor font-size-h6" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
														        무이자 할부 혜택 <span class="caret"></span>
														    </a>
														    <div class="padding-all-30 interest-box">
														        <div class="interest-close display-inline cursor">
														            <img class="width-15px" src="../css/image/gig_detail_close.png">
														        </div>
														        <h4 class="font-color-base"><b>LGUPLUS</b></h4>
														        <div class="text-center margin-top-10 margin-bottom-10">
														            <img style="width: 550px;" src="../css/imgae/lguplus_1803.jpg">
														        </div>
														
														        <h4 class="font-color-base"><b>카카오페이</b></h4>
														
														
														        <div style="width: 700px">
														            1. 행사일시 : 2018년 03월 01일~02월 31일<br>
														            <br>
														            2. 카드사: 비씨, 현대, 삼성, KB, 롯데, 하나, 신한, 농협카드<br>
														            -비씨  : BC마크 있는 카드<br>
														            -하나  : 구 외환카드+구 하나카드<br>
														            <br>
														            3. 할부적용금액: 5만원 이상<br>
														            <br>
														            4. 할부개월<br>
														            - 2~6개월 이자행사 카드사 : 신한, KB국민, 삼성<br>
														            - 2~5개월 무이자행사 카드사 : 현대, NH농협, 비씨, 하나, 롯데<br>
														            * 6, 10개월 분담 무이자 또는 다이어트할부행사는 각 카드사의 정책에 따름 (카드사로 문의요망)<br>
														            <br>
														            5. 유의사항<br>
														            - LG CNS 카카오페이 등 당사업자 가맹점 거래에 한함<br>
														            - 법인(기업)/체크/선불/기프트/은행계열카드 제외 (BC마크가 없는 NON BC카드 불가)<br>
														            - 본 행사 는 카드사 사정에 따라 변경 또는 중단 될 수 있음<br>
														            - 무이자 할부 결제 시 포인트, 마일리지 적립 제외<br>
														            - 온라인 PG업종 외 거래는 적용 불가<br>
														            - 직계약(중계) 가맹점, 상점부담 무이자 가맹점, 특별제휴가맹점등 일부 제외<br>
														        </div>
														    </div>
														</div>                                                    
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                           
           </c:forEach>        
 </div>     
