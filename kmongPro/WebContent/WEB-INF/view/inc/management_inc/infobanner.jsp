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

<div class="col-xs-12">
<c:forEach items="${payment }" var="pay">
	<c:set value="${pay.p_state }" var="state"></c:set>
	<c:set value="${pay.seller }" var="seller"></c:set>
	<c:set value="${pay.buyer }" var="buyer"></c:set>
</c:forEach>
<c:forEach items="${notice }" var="notice">
	<c:set value="${notice.pr_solution }" var="solutionnum"></c:set>
</c:forEach>
	<c:choose>
		<c:when test="${state eq '요청사항 미작성' }">
            <div style="display:block;">
                <div class="track-status-bar-indication" style="margin-top: 102.01px;">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="position-relative">
                                    <div class="track-status-bar-icon">
                                        <img src="../css/image/ribbon_arrow.png" title="#">
                                    </div>
                                    <h3 class="header-margin-none">작업 전 요청사항이 작성되지 않아 작업을 시작할 수 없습니다.</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
</c:when>


    <c:when test="${state eq '발송' }">        
    	<c:if test="${email eq buyer   }">
            <div style="display:block;">
                <div class="track-status-bar-indication" style="margin-top: 102.01px;">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="position-relative">
                                    <div class="track-status-bar-icon">
                                        <img src="../css/image/ribbon_arrow.png" title="#">
                                    </div>

                                    <h3 class="header-margin-none">작업물이 도착했습니다. 평가를 작성해주세요! ( 자동 구매확정)</h3>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
			</c:if>
			<c:if test="${email eq seller}">
            <div style="display:block;">
                <div class="track-status-bar-indication" style="margin-top: 102.01px;">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="position-relative">
                                    <div class="track-status-bar-icon">
                                        <img src="../css/image/ribbon_arrow.png" title="#">
                                    </div>

                                    <h3 class="header-margin-none">작업물이 발송되었습니다. 후기를 기다려주세요! ( 자동 구매확정)</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </c:if>
</c:when>

<c:when test="${state eq '수정' }">
            <div style="display:block;">
                <div class="track-status-bar-indication" style="margin-top: 102.01px;">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="position-relative">
                                    <div class="track-status-bar-icon">
                                        <img src="../css/image/ribbon_arrow.png" title="#">
                                    </div>

                                    <h3 class="header-margin-none">작업물 수정을 요청했습니다!</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
</c:when>

<c:when test="${state eq '취소' }">
            <div style="display:block;">
                <div class="track-status-bar-danger" style="margin-top: 102.01px;">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="position-relative">
                                    <div class="track-status-bar-icon">
                                        <img src="../css/image/ribbon_cancel.png" title="#">
                                    </div>

                                    <h3 class="header-margin-none">상호 합의하에 거래가 취소되었습니다.</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
</c:when>


<c:when test="${solutionnum eq '0'}">
            <div style="display:block;">
                <div class="track-status-bar-indication" style="margin-top: 102.01px;">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="position-relative">
                                    <div class="track-status-bar-icon">
                                        <img src="../css/image/ribbon_arrow.png" title="#">
                                    </div>

                                    <h3 class="header-margin-none">문제해결을 요청했습니다!</h3>

                                    <div class="track-status-bar-indication-btn">
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
</c:when>

<c:when test="${state eq '완료' }">
            <div style="display:block;">
                <div class="track-status-bar-completion" style="margin-top: 102.01px;">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="position-relative">
                                    <div class="track-status-bar-icon">
                                        <img src="../css/image/ribbon_complete.png" title="#">
                                    </div>

                                    <h3 class="header-margin-none">거래가 완료 되었습니다.</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
</c:when>
</c:choose>


        </div>