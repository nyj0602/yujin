<!-- 망할 datepicker 빼고 다 됨....  -->

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<title>구매관리 크몽 - 당신의 비즈니스를 도와드립니다</title>


<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="../css/kmong-99952b2854.master_desktop.css" rel="stylesheet">
<link href="../css/kmong_desktop_v2-6ec7c3f31e.css" rel="stylesheet">
<link href="../css/kmong_fonts.css?v=1.1" rel="stylesheet">
<link href="../css/mykmong_main.css" rel="stylesheet">
<link href="../css/kmong_buy.css" rel="stylesheet">
<link rel="shortcut icon" href="../image/favicon.ico">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script></head>

<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="http://jqueryui.com/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>

<%@ include file="../mykmong/mykmong_header.jsp"%>

<body id="master_body">



	<div class="container">


		<div class="row margin-top-30">
			<div class="col-xs-12">
				<h2>
					<b>구매</b>
				</h2>
			</div>
		</div>


		<div class="row margin-top-20">

			<%@ include file="inc/buy_profile.jsp"%>

	


			<div class="col-xs-9">
			
				<div class="row">
					<div class="col-xs-12">
						<h3 class="header-margin-none NGB">구매관리</h3>
					</div>
				</div>


				<div class="row margin-top-20">
					<div class="col-xs-12">
						<ul class="tab-menu-underline list-inline margin-bottom-0" role="tablist" id="tabul">
	
	
							<li role="presentation" class="margin-right-15 position-relative ${state eq '요청'? 'active' : ''} ">
								<a class="plain font-color-lighter" href="buy.do?state=요청" aria-controls="active">
									요청사항 미작성&nbsp; <span class="border-round selling-history-message-count ${state eq '요청'? 'active' : ''}">${count[0]}</span>
								</a>
							</li>
							<li role="presentation" class="margin-right-15 position-relative  ${state eq '진행'? 'active' : ''} ">
								<a class="plain font-color-lighter" href="buy.do?state=진행" aria-controls="active">
									진행중&nbsp; <span class="border-round selling-history-message-count ${state eq '진행'? 'active' : ''} ">${count[1]}</span>
								</a>
							</li>
							
							<li role="presentation" class="margin-right-15 position-relative ${state eq '발송'? 'active' : ''} ">
								<a class="plain font-color-lighter" href="buy.do?state=발송" aria-controls="active">
									발송중&nbsp; <span class="border-round selling-history-message-count ${state eq '발송'? 'active' : ''} ">${count[2]}</span>
								</a>
							</li>
							
							<li role="presentation" class="margin-right-15 position-relative  ${state eq '완료'? 'active' : ''}">
								<a class="plain font-color-lighter" href="buy.do?state=완료" aria-controls="active">
									완료&nbsp; <span class="border-round selling-history-message-count ${state eq '완료'? 'active' : ''}">${count[3]}</span>
								</a>
							</li>
							
							<li role="presentation" class="margin-right-15 position-relative ${state eq '평가'? 'active' : ''} ">
								<a class="plain font-color-lighter" href="buy.do?state=평가" aria-controls="active">
									평가 미작성&nbsp; <span class="border-round selling-history-message-count ${state eq '평가'? 'active' : ''}">${count[4]}</span>
								</a>
							</li>
							
							<li role="presentation" class="margin-right-15 position-relative  ${state eq '취소'? 'active' : ''}">
								<a class="plain font-color-lighter" href="buy.do?state=취소" aria-controls="active">
									취소&nbsp; <span class="border-round selling-history-message-count ${state eq '취소'? 'active' : ''}">${count[5]}</span>
								</a>
							</li>
							
						</ul>
					</div>
				</div>


				<!-- 검색부분 -->
				<form method="GET" action="#" accept-charset="UTF-8" id="searchForm">
					<input type="hidden" name="state" value="${empty state ? '진행' : state }" />
					<div class="row margin-top-20">


	                    <div class="col-xs-2 padding-right-0 position-relative">
	                        <input type="text" class="datepicker1 form-control input-xs" name="start_date" value="${start_date}" onkeydown="return false">
	                        <i class="fa fa-calendar calendar-position" aria-hidden="true"></i>
	                    </div>
	                    
	                    <div class="col-xs-1 width-35px margin-top-5 text-center padding-left-5 padding-right-5">
	                        ~
	                    </div>
	                    
	                    <div class="col-xs-2 padding-left-0 position-relative padding-right-0">
	                        <input type="text" class="datepicker2 form-control input-xs" name="end_date" value="${end_date}" onkeydown="return false">
	                        <i class="fa fa-calendar calendar-position" aria-hidden="true"></i>
	                    </div>
	                    
                    
                    
						<div class="col-xs-3 padding-left-0 margin-left-15">
							<div class="position-relative">
								<i class="fa fa-search header-search-icon" aria-hidden="true"
									style="left: 11px !important; width: 15px;"></i> 
									<input
									type="text" name="keyword" value="${keyword}"
									class="form-control input-xs search_keyword padding-left-30"
									placeholder="서비스 제목">
							</div>
						</div>

						<div class="col-xs-1 padding-left-0 padding-right-0">
							<div>
								<input style="border-radius: 2px !important;" type="submit"
									class="btn btn-default btn-seller-search padding-top-5 border-solid padding-bottom-5 NGB"
									value="검색">
							</div>
						</div>

					</div>
					
				</form>



<script type="text/javascript">

$(function (){
		
	var dateFormat = "yy-mm-dd", 
	from = $('.datepicker1').datepicker({
		defaultDate : "+1w",
		dateFormat: 'yy-mm-dd',
		changeMonth:true,
	    autoclose: true,
	    todayHighlight: true,
	    language: "kr",
	    showOtherMonths: true,
	    selectOtherMonths: true,
	    showButtonPanel: true
		
	})
	.on("change", function (){
		to.datepicker("option", "minDate", getDate(this));
	}),
	to = $('.datepicker2').datepicker({
		defaultDate : "+1w",
		dateFormat: 'yy-mm-dd',
		changeMonth:true,
	    autoclose: true,
	    todayHighlight: true,
	    language: "kr",
	    showOtherMonths: true,
	    selectOtherMonths: true,
	    showButtonPanel: true
	})
	.on("change", function(){
		from.datepicker("option", "maxDate", getDate(this));
	});
	
	
	function getDate(element){
		var date;
		try{
			date = $.datepicker.parseDate( dateFormat, element.value );
	      } catch( error ) {
	        date = null;
	      }
	 
	      return date;
	    }
	
});
</script>


				<!-- *** 내역이 있고 없고에 따라 뿌려주는게 다름... 갯수도 다르기 때문에 동적셍성 해줘야 함.  -->

				<div class="row">
					<div class="col-xs-12 margin-top-15">
					
						<c:set var="tal" value="${talent.tal }"/>
						
						<c:choose>
						<c:when test="${empty tal}">
					
						<div class="border-solid text-center padding-top-85 padding-bottom-85 margin-top-20">
							<div>
								<img class="width-50px" src="../image/nothing.png" title="내역없음">
							</div>
							<h5 class="font-color-lighter">내역이 없습니다.</h5>
						</div>
												
						</c:when>
						
						<c:when test="${not empty tal }">
						
						<c:forEach items="${tal}" var="tal" >
						
						<div class="sellingPanels panel-list  margin-bottom-0 border-bottom-solid ">
							<div class="row">
								<div class="col-xs-12">
									<div class="row margin-left-0 margin-right-0 border-bottom-solid padding-bottom-30  border-none ">

										<!-- 재능 이미지 부분 -->
										<div class="col-xs-2 padding-right-0 padding-left-0">
											<!-- 클릭하면 구매상세페이지로 넘어감 -->
											<a class="plain" href="#"> 
												<img title="${tal.t_name}" class="width-115px" onerror="this.onerror=null;this.src='../image/no_gig_sm_image.jpg';" src="${tal.image}">
											</a>
										</div>

										<div class="col-xs-10 padding-left-25">
											<!-- 클릭하면 구매상세페이지로 넘어감 -->
											<a class="plain" href="#">
												<div class="row">
													<div class="col-xs-12">
														<h6 class="font-color-lighter margin-top-0">#${tal.order_num}</h6>
													</div>
												</div>

												<div class="row">
													<div class="col-xs-9 padding-right-0">
														<h5 class="header-margin-none line-clamp-default-1">${tal.t_name}</h5>
													</div>
													<div class="col-xs-3 padding-side-0 text-right">
														<h5 class="header-margin-none inline-block text-right">
															<b>${tal.op_price} 원</b>
														</h5>
													</div>
												</div>

												<div class="row" style="margin-top: 22px;">
													<div class="col-xs-9">
														<h5 class="margin-bottom-0 margin-top-5 font-color-lighter">
															<img title="회원닉네임" class="width-20px border-round" onerror="this.onerror=null;this.src='../image/main_user_gray.png';" src=""> 
															<span class="font-size-h6 font-color-lighter">&nbsp;${tal.m_name}</span>
														</h5>
													</div>
												</div>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
							
						</c:forEach>					
						</c:when>			
						</c:choose>
					
					</div>
				</div>
				
				
						<%@ include file="inc/tax_notice.jsp"%>
			</div>



		</div>
	</div>
</body>
</html>
<%@ include file="../inc/footer/footer_notice.jsp" %>
<%@ include file="../inc/footer/footer.jsp" %>
