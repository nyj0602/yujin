<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name ="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/kmong-99952b2854.master_desktop.css" type="text/css">
<link rel="stylesheet" href="css/kmong_desktop_v2-6ec7c3f31e.css" type="text/css">
<link rel="stylesheet" href="css/kmong_fonts.css" type="text/css">
<link rel="stylesheet" href="css/kmong-3f20e872d5.master_desktop.css" type="text/css">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<title></title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script href="m/css/return.js"></script>
</head>
<% String ContextPath = request.getContextPath(); %>
<body id="masert_body">
<%@ include file = "../inc/header/header.jsp" %>
<div style="height:100px"></div>
<form class="sub" method="post">
	<div id="global-body">
		<div id="refundVueDiv" class="container">
		
        <div class="row margin-top-20">
            <div class="col-xs-12">
                <div class="panel panel-default panel-grid">
                    <div class="panel-heading">정보 입력 &nbsp;<span class="color-primary font-size-h6">[필수]</span></div>
                    <div class="panel-body padding-top-0">
                        <div class="row">
                            <div class="col-xs-6">
                                <div class="form-group">
                                    <label for="companyName">환불 예정 금액 (충전 캐시)</label>
                                    <input name="returncash" id="returncash" type="text" class="form-control" value="30000" readonly="">
                                    <!-- <input type="hidden" name="returncash" value="30000" /> -->
                                </div>

                                <div class="row">
                                    <div class="col-xs-12">
                                        <div class="col-xs-3 padding-left-0 padding-right-10">
                                            <div class="form-group">
                                                <label for="companyName">은행명</label>
                                                <select class="form-control" id="returnbank" name="returnbank">
                                                    <option value="">은행</option>
                                                    <c:forEach items="${ bankList }" var="dto">
                                                    <option class="rebank" value="${ dto.b_seq }">${ dto.b_name }</option>
                                                    </c:forEach>         
                                                </select>
                                                <input type="hidden" name="returnbank" value="<%= request.getParameter("returnbank")%>"/>
                                            </div>
                                        </div>
                                        <div class="col-xs-9 padding-left-0 padding-right-0">
                                            <div class="form-group">
                                                <label for="companyName">계좌번호</label>
                                                <input type="text" class="form-control numberOnlyInput" id="account_number" name="account_number">
                                                <input type="hidden" name="account_number" value="<%= request.getParameter("account_number")%>" />
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-xs-12">
                                        <div class="col-xs-3 padding-left-0 padding-right-10">&nbsp;</div>
                                        <div class="col-xs-9 padding-left-0 padding-right-0">
                                            <div class="form-group">
                                                <label for="companyName">예금주</label>
                                                <input type="text" class="form-control" id="account_owner" name="account_owner">
                                                <input type="hidden" name="account_owner" value="<%= request.getParameter("account_owner")%>" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xs-6">
                                <label>환불 사유</label>
                                <div class="margin-bottom-20">
                                    <div class="awesome-radio">
                                        <label>
                                            <input type="radio" name="survey_answer" value="1">
                                            <span class="awesome-radio-body"></span>
                                            <div class="awesome-radio-text">                                                개인 사정으로 구매 계획이 보류됨                                            </div>
                                        </label>
                                    </div>
                                    
                                </div>
                                
                                <div class="margin-bottom-20">
                                    <div class="awesome-radio">
                                        <label>
                                            <input type="radio" name="survey_answer" value="2">
                                            <span class="awesome-radio-body"></span>
                                            <div class="awesome-radio-text">                                                사이트 이용이 불편함                                            </div>
                                        </label>
                                    </div>
                                    
                                </div>
                                
                                <div class="margin-bottom-20">
                                    <div class="awesome-radio">
                                        <label>
                                            <input type="radio" name="survey_answer" value="3">
                                            <span class="awesome-radio-body"></span>
                                            <div class="awesome-radio-text">                                                구매할 서비스가 없음                                            </div>
                                        </label>
                                    </div>
                                    
                                </div>
                                
                                <div class="margin-bottom-20">
                                    <div class="awesome-radio">
                                        <label>
                                            <input type="radio" name="survey_answer" value="4">
                                            <span class="awesome-radio-body"></span>
                                            <div class="awesome-radio-text">                                                희망 전문가의 작업 불가능 통보                                            </div>
                                        </label>
                                    </div>
                                    
                                </div>
                                
                                <div class="margin-bottom-20">
                                    <div class="awesome-radio">
                                        <label>
                                            <input type="radio" name="survey_answer" value="5">
                                            <span class="awesome-radio-body"></span>
                                            <div class="awesome-radio-text">                                                불만족스러운 거래경험                                            </div>
                                        </label>
                                    </div>
                                    
                                </div>
                                
                                <div class="margin-bottom-20">
                                    
                                    <div class="awesome-radio">
                                        <label style="display: block">
                                            <input type="radio" name="survey_answer" value="6">
                                            <span class="awesome-radio-body"></span>
                                            <div class="awesome-radio-text width-90">
                                                <input type="text" class="form-control input-sm width-90" placeholder="기타">
                                            </div>
                                        </label>
                                    </div>
                                </div>
                                	
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

		<!-- 하단 글씨 -->
        <div class="row margin-top-20">
            <div class="col-xs-6 padding-right-0">
                <ul class="order-unordered-list list-unstyled">
                    <li class="padding-all-0 margin-bottom-5">•환불 접수는 평일 오후 4시에 마감되며,접수된 시점에서 영업일 기준 2일 이내에 처리됩니다.</li>
                    <li class="padding-all-0 margin-bottom-5">•환불은 결제 수단에 따라 처리되나, 사유 발생 시 기입하신 계좌로 환불될 수 있습니다.</li>
                    <li class="padding-all-0 margin-bottom-5">•정산 내용은 가입된 메일로 안내됩니다.</li>
                    <li class="padding-all-0 margin-bottom-5">•캐시 환불 신청 시, 충전캐시 전액이 환불되며 부분 환불은 불가능합니다.</li>
                </ul>
            </div>

            <div class="col-xs-6">
                <a id="request_btn" class="btn btn-primary btn-block btn-lg" style=""><i class="fa fa-check"></i>&nbsp;개인정보 수집 이용에 동의하고 환불신청</a>
            </div>
            
        </div>
        
    </div>
</div>
</form>
<%@ include file = "../inc/footer/footer.jsp" %>
</body>
<script>
	$(function(){
		 $("#request_btn").click(function(){
			$('.sub').attr('action','cashreturn.do').submit();
		 });
		});
</script>
</html>