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
<div id="problemResolutionModal" class="modal fade" tabindex="-1"style="display: none;">
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
                                                    <c:forEach items="${error }" var="error" begin="5">
                                                    <div class="awesome-radio">
                                                        <label>
                                                            <input type="radio" name="problem" class="resolutionProblem" value="${error.sp_num }">
                                                            <span class="awesome-radio-body"></span>
                                                            <span class="awesome-radio-text">${error.sp_content }</span>
                                                        </label>
                                                    </div>
													</c:forEach>

                                                    <div id="resolutionProblemEtcText" class="margin-left-20" style="display: none;">
                                                        <input type="text" class="form-control input-sm">
                                                    </div>

                                                    <span id="problemResolutionStep0Error" class="help-block padding-left-0 margin-left-20" style="display: none"><i class="fa fa-exclamation-triangle"></i>&nbsp;문제를 선택해주세요</span>
                                                </div>
                                                <div id="problemResolutionStep1" class="item" data-index="1">
                                                <h4 class="header-margin-none padding-top-5">
                                                    <img class="width-15px position-relative margin-right-5" style="top:-3px" src="../css/image/cancel_modal_main_icon_big.png">

                                                    <b>원하는 해결 방법</b>을 선택해주세요
                                                </h4>

                                                <div class="margin-left-10 margin-top-10">
                                                    <div class="inline-block text-center awesome-radio" id="cancelpay">
                                                        <label>
                                                            <input style="display: none;" type="radio" name="resolutionMethod" class="resolutionProblem" value="cancel">
                                                            <div class="cancel-problem-active inline-block margin-right-15 border-solid border-radius padding-all-10">
                                                                
                                                                <span class="awesome-radio-text">
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