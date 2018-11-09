<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<c:set value="0" var="sum"></c:set>
<c:forEach items="${payment }" var="pay">
	<c:set value="${sum+pay.op_price}" var="sum"></c:set>
</c:forEach>
<form id="errorForm">
<input type="hidden" value="${ordernum }" name="ordernum">
<input type="hidden" value="${sum+'' }" name="refund">
<div id="problemResolutionModal" class="modal fade" tabindex="-1" >
    <div class="vertical-alignment-helper">
        <div class="modal-dialog vertical-align-center" role="document">
            <div class="modal-content border-radius-0 vertical-align-modal-content" style="width: 655px !important;">
                <div class="modal-body padding-all-0">
                    <div id="problumWrappContent" class="bg-gradient-yellow cancel-clear-fix" style="width: 655px !important;">
                        <div class="pull-left padding-top-30 padding-left-30 padding-right-0" style="width: 200px !important;">
                            
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="font-size-20 NGB color-brown">문제해결</div>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-xs-11 padding-right-0">
                                    <div class="row margin-none">
                                        <div class="col-xs-12 padding-left-0 padding-right-0">
                                            <div id="resolutionHeader0" class="track-problem-resolution active">
                                                <h4 class="header-margin-none margin-top-15">
                                                    <span class="track-problem-resolution-page-number underline text-center">1</span>
                                                    문제 선택
                                                </h4>
                                            </div>
                                        </div>
                                        
                                        <div class="col-xs-12 padding-left-0 padding-right-0">
                                            <div id="resolutionHeader2" class="track-problem-resolution">
                                                <h4 class="header-margin-none margin-top-15">
                                                    <span class="track-problem-resolution-page-number text-center">2</span>
                                                    요청
                                                </h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div id="rightContentHeight" class="pull-left bg-color-white padding-top-30 padding-right-15 padding-left-15 position-relative" style="width: 455px !important;min-height: 450px; max-height: 750px;">
                            
                            <div class="row position-relative" style="min-height: 300px;" id="error">
                                <button type="button" class="close cancel-close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                <div class="col-xs-12">
                                    <div id="problemResolutionCarousel" class="carousel slide" data-ride="carousel">
                                        <div class="carousel-inner" role="listbox">
                                            <div id="problemResolutionStep0" class="item active" style="margin-left:1px" data-index="0">
                                                <h4 class="header-margin-none padding-top-5">
                                                    <img class="width-15px position-relative margin-right-5" style="top:-3px" src="../css/image/cancel_modal_main_icon_big.png">
                                                    <b>거래 중 발생된 문제</b>를 선택해주세요
                                                </h4>

                                                <div class="margin-top-10">
                                                <c:forEach items="${error }" var="error" end="4">
                                                    <div class="awesome-radio">
                                                        <label>
                                                            <input type="radio" name="problem" class="resolutionProblem" value="${error.sp_num }">
                                                            <span class="awesome-radio-body"></span>
                                                            <span class="awesome-radio-text">${error.sp_content }</span>
                                                        </label>
                                                    </div>
													</c:forEach>
                                                    <div id="resolutionProblemEtcText" class="margin-left-20" style="display: none">
                                                        <input type="text" class="form-control input-sm">
                                                    </div>

                                                    <span id="problemResolutionStep0Error" class="help-block padding-left-0 margin-left-20" style="display: none"><i class="fa fa-exclamation-triangle"></i>&nbsp;문제를 선택해주세요</span>
                                                </div>
                                                <div id="problemResolutionStep1" class="item active" data-index="1">
                                                <h4 class="header-margin-none padding-top-5">
                                                    <img class="width-15px position-relative margin-right-5" style="top:-3px" src="../css/image/cancel_modal_main_icon_big.png">
                                                    <b>원하는 해결 방법</b>을 선택해주세요
                                                </h4>

                                                <div class="margin-left-10 margin-top-10">
                                                   <div class="inline-block text-center awesome-radio"  id="addpay">
                                                        <label>
                                                            <input style="display: none;" type="radio" name="resolutionMethod" class="resolutionProblem" value="addpay">
                                                            <div class="cancel-problem-active inline-block margin-right-15 border-solid border-radius padding-all-10 padding-mutual-cancellation">
                                                                
                                                                <span class="awesome-radio-text">
                                                                    <img src="../css/image/additional_pay_request.png">
                                                                    <div class="margin-top-5">추가 결제 요청</div>
                                                                </span>
                                                            </div>
                                                        </label>
                                                    </div><div class="inline-block text-center awesome-radio" id="cancelpay">
                                                        <label>
                                                            <input style="display: none;" type="radio" name="resolutionMethod" class="resolutionProblem" value="cancel">
                                                            <div class="cancel-problem-active inline-block margin-right-15 border-solid border-radius padding-all-10">
                                                                
                                                                <span class="awesome-radio-text">
                                                                    <img src="../css/image/mutual_cancellation.png">
                                                                    
                                                                    
                                                                    <div class="margin-top-5">거래 취소 요청</div>
                                                                </span>
                                                            </div>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="margin-top-10">
                                                    <span id="problemResolutionStep1Error" class="help-block padding-left-0 margin-left-10" style="display: none"><i class="fa fa-exclamation-triangle"></i>&nbsp;해결방법을 선택해주세요</span>
                                                </div>
                                            </div>
                                           
                                            
                                            
                                            </div>
                                           
											<div id="additionalOptionsBody" style="display: none;">
                                                <h4 class="margin-all-0 padding-top-5">
                                                    <img class="width-15px position-relative margin-right-5" style="top:-3px" src="../css/image/cancel_modal_main_icon_big.png">
                                                    <b>추가 결제</b>
                                                        <div class="message-box-request-gigs-wrapper track-option-scroll border-top-solid padding-all-0">
                                                            <table class="resolution-additional-pay-table width-100">
                                                                <colgroup>
                                                                    <col width="45%">
                                                                    <col width="20%">
                                                                    <col width="15%">
                                                                    <col width="20%">
                                                                </colgroup>
                                                                <thead class="order-option">
                                                                    <tr>
                                                                        <th class="bg-color-gray">옵션항목</th>
                                                                        <th class="bg-color-gray text-center">작업일</th>
                                                                        <th class="bg-color-gray text-right">가격</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody class="order-option">
                                                                <tr>
                                                                    <td colspan="4" class="padding-all-0">
                                                                        <div class="row margin-none padding-top-10 color-light-yellow border-top-solid">
                                                                            <div class="col-xs-12 padding-left-10 padding-right-10">
                                                                                <div class="group form-group input-text-group">
                                                                                    <span class="input-inner-text-sm" style="top:11px;">경우</span>
                                                                                    <div class="awesome-checkbox">
                                                                                        <label>
                                                                                            <input id="customOptionCheckbox" class="addtionalOptionRequestCheckbox" type="checkbox">
                                                                                            <span class="awesome-checkbox-body margin-top-10"></span>
                                                                                            <div class="awesome-checkbox-text">
                                                                                                <div class="row">
                                                                                                    <div class="col-xs-2 padding-right-0 margin-top-10">
                                                                                                        맞춤옵션
                                                                                                    </div>
                                                                                                    <div class="col-xs-10">
                                                                                                        <input type="text" name="content" class="form-control input-sm" style="padding-right: 45px !important; text-align: left;" placeholder="ex) 인물 일러스트 1장, 원본파일, 상업적 사용을 추가할">
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </label>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="row margin-none padding-top-5 padding-bottom-5 color-light-yellow">
                                                                            <div class="col-xs-12 padding-left-10 padding-right-10">
                                                                                <div class="row">
                                                                                    <div class="col-xs-3 padding-right-0 padding-top-10 padding-left-40 padding-bottom-10">
                                                                                        작업일
                                                                                    </div>
                                                                                    <div class="col-xs-4 padding-left-0">
                                                                                        <div class="group form-group input-text-group">
                                                                                            <span class="input-inner-text-sm-no-label">일</span>
                                                                                            <input class="form-control input-sm numberOnlyInput" placeholder="10" type="text" name="term">
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-xs-1 padding-left-0 padding-right-0 padding-top-10 padding-bottom-10">
                                                                                        금액
                                                                                    </div>
                                                                                    <div class="col-xs-4 padding-left-0">
                                                                                        <div class="form-group input-text-group">
                                                                                            <span class="input-inner-text-sm-no-label">원</span>
                                                                                            <input class="form-control input-sm numberOnlyInput" placeholder="최소 1,000" type="text" name="price">
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                               
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                        <span id="additionalOptionsError" class="help-block padding-left-0" style="display: none"><i class="fa fa-exclamation-triangle"></i>&nbsp;추가결제 요청할 옵션을 선택해주세요</span>
                                                    </div>
                                                </h4>
                                                <div class="panel panel-default bg-color-gray border-none margin-top-5 margin-bottom-0" style="display: none;">
                                                    <div class="panel-body padding-all-10">                                                                                                            </div>
                                                </div>

                                                <div class="padding-top-10">
                                                    
                                                    <div id="resolutionMessageBody" class="row margin-top-20 margin-bottom-80">
                                                        
                                                        <div class="col-xs-12" style="display: none;">
                                                            <ul class="list-unstyled font-size-h6 font-color-light margin-top-10">
                                                                <li class="padding-left-0 padding-bottom-0 padding-top-0">* 상대가 24시간 내에 수락/거절하지 않을 경우, 거래가 자동 취소됩니다.</li>
                                                                <li class="padding-left-0 padding-bottom-0 padding-top-0">* 거래 금액은 취소 후 의뢰인의 크몽캐시로 환불되며, [크몽캐시]페이지에서 결제 수단으로 환불 받으실 수 있습니다.</li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="row margin-none problem-footer padding-all-10">
                                <div class="col-xs-3 padding-right-20 padding-left-0 pull-right" style="display: block;">
                                    <button class="btn btn-primary btn-sm btn-block" id="errorsubmit">요청</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

		</form>
