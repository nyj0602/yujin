<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="options" class="margin-top-30 informationDiv overflow-hidden">
                        <h4>
                            <b>가격정보</b>
                        </h4>
                        <div class="panel panel-default margin-top-10">
                            <ul class="list-group panel-list-group-only">
								<c:forEach items="${prices }" var="pri">
								<input type="checkbox" checked="checked" value="${pri.op_seq}" name="op_seq" style="display: none;">
                                <li class="list-group-item padding-top-20 padding-bottom-20 border-top-none">
                                    <div class="row">
                                        <div id="${pri.op_sep }InformationDiv" class="col-xs-8">
                                            <div class="row">
                                                <div class="col-xs-12">
                                                    <strong>${pri.op_manual1 }</strong>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-xs-12">            ${pri.op_manual2 }                      </div>
                                            </div>
                                            <div class="row margin-top-15">
                                                <div class="col-xs-12 package-selected-options-list-item">
                                                    <!-- <i class="kmong kmong-check margin-right-5 color-dark-yellow-400" style="font-size: 10px"></i><span class="font-color-light">데이터베이스 연동</span> -->
                                                </div>
                                            </div>
                                            <div class="row margin-top-15 font-color-light">
                                                <div class="col-xs-4">
                                                    <i class="fa fa-calendar margin-right-5"></i>작업일 :
                                                    <span>${pri.op_term }일</span>
                                                    
                                                </div>
                                                <div class="col-xs-6 padding-left-0">
                                                    <i class="fa fa-wrench margin-right-6"></i> 수정 횟수 : <span>${pri.op_change }회</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="${pri.op_sep }PriceDiv" class="col-xs-4" style="padding-top: 57px; padding-bottom: 27px;">
                                            <div class="row">
                                                <div class="col-xs-5 padding-right-0 inline-block">
                                                    <div class="gig-detail-decision-option-btn">
                                                        <a class="plain" >
                                                            <i class="fa fa-minus" aria-hidden="true"></i>
                                                        </a>

                                                        <span class="${pri.op_sep }_${pri.op_seq }">1</span>

                                                        <a class="plain" >
                                                            <i class="fa fa-plus" aria-hidden="true"></i>
                                                        </a>
                                                    </div>
                                                </div>

                                                <div class="col-xs-7 text-right  inline-block">
                                                    ₩ <span id="${pri.op_sep }_${pri.op_seq }" class="${pri.op_price }"><fmt:formatNumber value="${pri.op_price }" pattern="#,###" /></span>
                                                </div>
                                            </div>
                                        </div>

                                        
                                    </div>
                                </li>
						</c:forEach>
						
                                <!-- 빠른작업 -->
                                <c:forEach items="${option }" var="op">
                                <li class="list-group-item padding-top-20 padding-bottom-20">
                                    <div class="row">
                                        <div class="col-xs-8">
                                            <div class="awesome-checkbox">
                                                <label>
                                                    <input type="checkbox" class="extra_fastChkbox valueHidden" id="${op.t_seq }_${op.op_seq }" value="${op.op_seq}" name="op_seq">
                                                    <span class="awesome-checkbox-body"></span>
                                                    <div class="awesome-checkbox-text"> ${op.op_manual1 } </div>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-xs-4">
                                            <div class="row">
                                                <div class="col-xs-5 padding-right-0">
                                                    <div class="gig-detail-decision-option-btn">
                                                        <a class="plain">
                                                            <i class="fa fa-minus" aria-hidden="true"></i>
                                                        </a>

                                                        <span class="${op.op_sep }_${op.op_seq }">1</span>

                                                        <a class="plain">
                                                            <i class="fa fa-plus" aria-hidden="true"></i>
                                                        </a>
                                                    </div>
                                                </div>

                                                <div class="col-xs-7 text-right">
                                                    ₩ <span id="${op.op_sep }_${op.op_seq }" class="${op.op_price }"><fmt:formatNumber value="${op.op_price }" pattern="#,###" /></span>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </li>
					</c:forEach>
                    </div>
					<c:forEach items="${prices }" var="pri">
                            <div class="row">
                                <div class="col-xs-offset-6 col-xs-6 text-right">
                                    <button class="btn btn-brand-yellow btn-block" id="1option" ><b>구매하기 (VAT포함)</b></button>
                                </div>
                            </div>
                        </c:forEach>


		</div>
		
		