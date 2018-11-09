<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="rightSidePriceDiv" style="">
                        <div class="panel panel-default margin-top-0 border-top-none">
                            <ul class="list-group panel-list-group-only">
                                
								<c:forEach items="${prices }" var="pri">
                                <li class="list-group-item padding-all-20">
                                    <div class="row">
                                        <div class="col-xs-12"><strong> ${pri.op_manual1 }</strong></div>
                                        <div class="col-xs-12"> ${pri.op_manual2 }</div>
                                    </div>
                                    
                                    <div class="row margin-top-15 font-color-light">
                                        <div class="col-xs-6">
                                            <i class="fa fa-calendar margin-right-5"></i>작업일 :
                                            <span>${pri.op_term }일</span>
                                            
                                        </div>
                                        <div class="col-xs-6">
                                            <i class="fa fa-wrench margin-right-5"></i>수정 횟수 : <span>${pri.op_change } 회</span>
                                        </div>
                                    </div>
                                </li>
								</c:forEach>
								
                                <li class="list-group-item padding-all-20" style="">
                                    <div class="row margin-bottom-20">
                                        <div class="col-xs-12">
                                            <div class="select-control">
                                                <select id="optionDropMenu" class="input-xs" style="height: 35px;">
                                                    <option value="">옵션을 선택하세요</option>
                                                    <c:forEach items="${option }" var="op">
                                                    <option id="${op.t_seq }_${op.op_seq }" value="${op.op_sep }" class="oplist" >${op.op_manual1 }</option>
                                                	</c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div id="selectedOptionsDiv" class="panel panel-default border-radius-0 margin-bottom-0 margin-top-0" style="overflow-y:scroll; height: 230px;">
                                        <ul class="list-group panel-list-group-only">
                                            <c:forEach items="${prices }" var="pri">
                                            <li class="list-group-item padding-top-20 padding-bottom-20 bg-color-gig-standard border-top-none"><!-- 추가옵션은 list-group-item padding-top-20 padding-bottom-20 bg-color-fa -->

                                                <div class="row margin-bottom-5">
                                                    <div class="col-xs-12">
                                                        
                                                        <span>${pri.op_manual1 }</span>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-xs-6">
                                                        <div class="gig-detail-decision-option-btn">
                                                            <a class="plain ">
                                                                <i class="fa fa-minus" aria-hidden="true"></i>
                                                            </a>

                                                            <span class="${pri.op_sep }_${pri.op_seq }">1</span>

                                                            <a class="plain ">
                                                                <i class="fa fa-plus" aria-hidden="true"></i>
                                                            </a>
                                                        </div>
                                                    </div>

                                                    <div class="col-xs-6 text-right">
                                                        ₩ <span id="${pri.op_sep }_${pri.op_seq }" class="${pri.op_price }"><fmt:formatNumber value="${pri.op_price }" pattern="#,###" /></span>
                                                    </div>
                                                </div>
                                            </li>
									</c:forEach>
									<c:forEach items="${option }" var="op">
									<li class="list-group-item padding-top-20 padding-bottom-20 bg-color-fa" id="${op.t_seq }_${op.op_seq }" style="display: none;" >

                                                <div class="row margin-bottom-5">
                                                    <div class="col-xs-12">
                                                        <i class="fa fa-minus-circle cursor margin-right-5" aria-hidden="true"></i>
                                                         ${op.op_manual1 }
                                                    </div>
                                                    
                                                </div>

                                                <div class="row">
                                                    <div class="col-xs-6">
                                                        <div class="gig-detail-decision-option-btn">
                                                            <a class="plain ">
                                                                <i class="fa fa-minus" aria-hidden="true"></i>
                                                            </a>

                                                            <span class="${op.op_sep }_${op.op_seq }">1</span>

                                                            <a class="plain ">
                                                                <i class="fa fa-plus" aria-hidden="true"></i>
                                                            </a>
                                                        </div>
                                                    </div>

                                                    <div class="col-xs-6 text-right">
                                                        ₩<span id="${op.op_sep }_${op.op_seq }" class="${op.op_price }"> <fmt:formatNumber value="${op.op_price }" pattern="#,###" /></span>
                                                    </div>
                                                </div>
                                            </li>
                                          </c:forEach>  
                                            </ul>

                                <li class="list-group-item border-top-none padding-top-0 padding-bottom-20">
                                    <div class="row">
                                        <div class="col-xs-12">
                                               <c:forEach items="${prices }" var="pri">                                          
                                                <div>
                                                        <a class="btn btn-brand-yellow btn-block" role="button" id="buybtn">
                                                            <b>구매하기 (VAT포함)</b>
                                                        </a>
                                                  </div>
                                                </c:forEach>
                                            
                                        </div>
                                    </div>
                                </li>

                                <li class="list-group-item font-size-h6 border-top-solid padding-top-10 padding-bottom-10 bg-color-white">

                                    <i class="kmong kmong-cash-mileage vertical-align-middle font-size-h4 position-relative" style="top: 1px;"></i>&nbsp;
                                    <span class="vertical-align-middle">
                                        구매혜택: 크몽캐시 <b><span class="color-red">2%</span></b> 적립
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
            <img style="width: 550px;" src="../css/image/lguplus_1803.jpg">
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
                                </li>
                            </ul>
                        </div>

                        

                        
                    </div>