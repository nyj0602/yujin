
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
<title>판매관리 크몽 - 당신의 비즈니스를 도와드립니다</title>


<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="../css/kmong-99952b2854.master_desktop.css" rel="stylesheet">
<link href="../css/kmong_desktop_v2-6ec7c3f31e.css" rel="stylesheet">
<link href="../css/kmong_fonts.css" rel="stylesheet">
<link href="../css/mykmong_main.css" rel="stylesheet">
<link href="../css/kmong_buy.css" rel="stylesheet">
<link rel="shortcut icon" href="../image/favicon.ico">
<link href="../css/bootstrap-datepicker3.css" rel="stylesheet">
<link href="../css/kmong-3f20e872d5.master_desktop.css" rel="stylesheet">
<script src="../js/common-b8e57eb3f0.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="http://jqueryui.com/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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
					<div class="col-xs-12">
						<h3 class="header-margin-none NGB">판매관리</h3>
					</div>
				</div>


				<div class="row margin-top-20">
					<div class="col-xs-12">
						<ul class="tab-menu-underline list-inline margin-bottom-0" role="tablist">
							
							<li role="presentation" class="margin-right-15 position-relative ${state eq '요청'? 'active':'' } ">
								<a class="plain font-color-lighter" href="sellmanage.do?state=요청" aria-controls="active">
									요청사항 미작성&nbsp; 
									<span class="border-round selling-history-message-count ${state eq '요청'? 'active':'' }">${count[0]}</span>
								</a>
							</li>
							
							<li role="presentation" class="margin-right-15 position-relative ${state eq '진행'? 'active':'' }">
								<a class="plain font-color-lighter" href="sellmanage.do?state=진행" aria-controls="active">
									진행중&nbsp; 
									<span class="border-round selling-history-message-count ${state eq '진행'? 'active':'' } ">${count[1]}</span>
								</a>
							</li>
							
							<li role="presentation" class="margin-right-15 position-relative  ${state eq '발송'? 'active':'' } ">
								<a class="plain font-color-lighter" href="sellmanage.do?state=발송" aria-controls="active">
									발송중&nbsp; 
									<span class="border-round selling-history-message-count  ${state eq '발송'? 'active':'' }">${count[2]}</span>
								</a>
							</li>
							
							<li role="presentation" class="margin-right-15 position-relative ${state eq '늦은발송'? 'active':'' }  ">
								<a class="plain font-color-lighter" href="sellmanage.do?state=늦은발송" aria-controls="active">
									늦은 발송&nbsp; 
									<span class="border-round selling-history-message-count ${state eq '늦은발송'? 'active':'' }">${count[3]}</span>
								</a>
							</li>
							
							<li role="presentation" class="margin-right-15 position-relative ${state eq '완료'? 'active':'' }  ">
								<a class="plain font-color-lighter" href="sellmanage.do?state=완료" aria-controls="active">
									완료&nbsp; 
									<span class="border-round selling-history-message-count ${state eq '완료'? 'active':'' }">${count[4]}</span>
								</a>
							</li>
							
							<li role="presentation" class="margin-right-15 position-relative ${state eq '취소'? 'active':'' }  ">
								<a class="plain font-color-lighter" href="sellmanage.do?state=취소" aria-controls="active">
									취소&nbsp; 
									<span class="border-round selling-history-message-count ${state eq '취소'? 'active':'' }">${count[5]}</span>
								</a>
							</li>
							
						</ul>
					</div>
				</div>


				<!-- 검색부분 -->
				<form method="GET" action="#" accept-charset="UTF-8" id="searchForm">
					<input type="hidden" name="state" value="${empty state ? '진행' : state }" />
					<div class="row margin-top-20">
					
						<div class="col-xs-3 padding-right-0" style="display: ${state eq '완료' or state eq '취소'? 'inline' : 'none'};">
							<div class="border-solid">

									<div class="btn-group bootstrap-select show-tick select-picker-xs width-100 selling-history-search-border border-none">
		                                
	                                <select style="border: 0 !important;" class="selectpicker select-picker-xs width-100 selling-history-search-border border-none" multiple="" name="gigs" data-title="검색할 서비스를 선택해주세요" tabindex="-98">
	                                	
	                                	<c:set var="service" value="${talent.service }"/>
	                                	<c:choose>
		                                	<c:when test="${empty service }"></c:when>
		                                	<c:when test="${not empty service }">
			                                	<c:forEach var="service" items="${service}">
			                                	<option value="${service.t_seq }" class="selected">${service.t_name }</option>
			                                	</c:forEach>
		                                	</c:when>
	                                	</c:choose>
	                                	
	                                </select>
	                                
	                                </div>


							</div>
						</div>

                       
						<div class="col-xs-3 padding-left-0 margin-left-15">
							<div class="position-relative">
								<i style="right: inherit; left: 10px;" class="fa fa-search header-search-icon cursor" aria-hidden="true"></i> 
									<input type="text" name="keyword" value="${empty keyword? '' : keyword }" class="form-control input-xs search_keyword padding-left-30" placeholder="의뢰인 닉네임">
							</div>
						</div>
						
						<div class="col-xs-1 padding-left-0 padding-right-0">
							<div>
								<input style="border-radius: 2px !important;" type="submit" class="btn btn-default border-solid btn-seller-search padding-top-5 padding-bottom-5" value="검색">
							</div>
						</div>
						
					</div>
				</form>






				<div class="row">
					<div class="col-xs-12 margin-top-15">
					
					
						<c:set var="tal" value="${talent.tal }"/>
						
						
						<c:choose>
						<c:when test="${empty tal }">
						<div class="border-solid text-center padding-top-85 padding-bottom-85 margin-top-20">
							<div>
								<img class="width-50px" src="../image/nothing.png" title="내역없음">
							</div>
							<h5 class="font-color-lighter">내역이 없습니다.</h5>
						</div>
						</c:when>
						<c:when test="${not empty tal }">
						<c:forEach items="${tal }" var="tal">
						<div class="sellingPanels panel-list bg-color-white  margin-bottom-0 border-bottom-solid  ">
							<div class="row margin-left-0 margin-right-0 border-bottom-solid padding-bottom-30  border-none ">

								<a class="plain" href="#">
									<div class="col-xs-2 padding-right-0 padding-left-0 text-center">
										<div>
											<img class="width-55px border-round" src="${tal.m_profile }" title="${tal.m_name }" onError="this.onerror=null;this.src='../image/main_user_gray.png';">
										</div>
										<span class="margin-top-5 font-size-h6 font-color-lighter width-55px ellipsis margin-auto" data-toggle="tooltip" data-title="${tal.m_name }" data-placement="top">${tal.m_name }</span>
									</div>
								</a>

								<div class="col-xs-10 padding-left-0">
									<a class="plain" href="#">
										<div class="row">
											<div class="col-xs-9">
												<h6 class="font-color-lighter margin-top-0 margin-bottom-5">
													#${tal.order_num }</h6>
												<h5 class="header-margin-none line-height">${tal.t_name }</h5>
											</div>
											<div class="col-xs-3 text-right margin-top-20">


												<h5 class="header-margin-none inline-block line-height">
													<b>${tal.pf_price } 원</b>
												</h5>
											</div>
										</div>
									</a>
									

									<div class="row">
										<div class="col-xs-12">
											<h5 class="margin-bottom-0 margin-top-10 font-color-lighter">
												<span class="NGR font-size-h6 font-color-light">
												${state eq '완료' ? '작업 완료일 :' : state eq '취소' ? '취소 신청일' : '마지막 작업일'}  ${tal.date }</span>
											</h5>
										</div>
									</div>



								</div>
							</div>
						</div>
						</c:forEach>
						</c:when>
						</c:choose>
						
	
						<div class="text-center"></div>

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
</html>
<%@ include file="../inc/footer/footer_notice.jsp" %>
<%@ include file="../inc/footer/footer.jsp" %>