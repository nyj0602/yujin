<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="packages" class="margin-top-30" style="">
                        <h4>
                            <b>가격정보</b>
                        </h4>

                        <table class="table table-bordered table-hover-vertical package-table">
                            <colgroup>
                                <col width="25%">
                                <col width="25%">
                                <col width="25%">
                                <col width="25%">
                            </colgroup>

                            <tbody>
                            <tr class="package-price">
                                <td class="package-option-title"></td>
                                <c:forEach items="${prices }" var="pri">
                                <td class="package-option-title text-center position-relative">
                                    <div class="package-title-arrow">
                                        <span class="font-color-light card-font-size-default">${pri.op_sep }</span><br>
                                        <span class="font-size-h3 font-color-base"><b>₩&nbsp;<fmt:formatNumber value="${pri.op_price }" pattern="#,###" /></b></span> <br>
                                        <span class="card-font-size-small font-color-lighter">(VAT포함)</span>
                                    </div>
                                </td>
                                </c:forEach>
                            </tr>

                            <tr class="package-title">
                              <td class="package-option-title" rowspan="2">패키지 설명</td>
                                <c:forEach items="${prices }" var="pri">
                               	 	<td class="package-option-0 package-option-data vertical-align-top"><h5 class="word-break" style="line-height: 1.5"><strong>${pri.op_manual1 }</strong></h5></td>
                                </c:forEach>
                            </tr>
                            <tr class="package-description">
                            	 <c:forEach items="${prices }" var="pri">
                            		<td class="package-option-0 package-option-data vertical-align-top word-break"> ${pri.op_manual2 } </td>
                            	</c:forEach>
                            </tr>

                            <tr class="package-revisions">
                                <td class="package-option-title">
                                    수정 횟수
                                </td>
                                <c:forEach items="${prices }" var="pri">
                                <td class="package-option-0 package-option-data text-center">
                                    <span>${pri.op_change }</span>
                                </td>
                                </c:forEach>
                            </tr>

                            <tr class="package-delivery">
                                <td class="package-option-title">
                                    작업 기간
                                </td>
                                 <c:forEach items="${prices }" var="pri">
                                <td class="package-option-0 package-option-data">
                                    
                                    <div class="text-center">                                        ${pri.op_term }                                    </div>
                                </td>
                                </c:forEach>
                                
                            </tr>

                            

                            <tr>
                                <td class="package-option-title"></td>
                                <c:forEach items="${prices }" var="pri">
                                <td class="package-option-0 package-option-data" data-index="0">
                                    <button
							class="btn btn-block btn-brand-yellow  padding-left-10 padding-right-10 sendGAEventClz"
							data-name="패키지 테이블 구매하기 - ${pri.op_sep }" id="${pri.op_sep }">
							<b>구매</b><span style="display: none" />${pri.op_seq}</span></button>
					</td>
                                </c:forEach>
                            </tr>
                            </tbody>
                        </table>
                    </div>