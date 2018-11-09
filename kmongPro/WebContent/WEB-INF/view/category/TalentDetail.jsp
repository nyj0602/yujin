<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.util.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${tName }</title>
<link rel="stylesheet" href="../css/bootstrap-datepicker3.css" />
<link rel="stylesheet" href="../css/kmong_buy.css" />
<link rel="stylesheet" href="../css/kmong_desktop_v2-6ec7c3f31e.css" />
<link rel="stylesheet" href="../css/kmong_fonts.css" />
<link rel="stylesheet" href="../css/kmong-a9f87b1e91.master_desktop.css" />
<link rel="stylesheet" href="../css/mykmong_main.css" />
<link rel="shortcut icon" href="../css/image/favicon.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 <style>
                iframe {
                    height: 488px;
                    width: 652px;
                }
            </style>
</head>


<body>
<c:forEach items="${message }" var="msg">
	<c:set value="${msg.mr_seq}" var="mr_seq"></c:set>
</c:forEach>
<div id="gig_detail_div">
        <div class="container position-relative">
            <div class="row">
                <div class="col-xs-8 margin-top-40 padding-left-0 gig-detail-left-side-width">
                    <div id="overview">
                                                    <h6 class="font-color-lighter margin-top-0 margin-bottom-10">
                        <c:forEach items="${category }" var="cat" end="0">
                                                                    <a class="plain font-color-lighter sendGAEventClz" href="/kmongPro/category/category.do?category=${cat.big_cat_num }" data-name="breadcrumb - 상위 카테고리">${cat.bigcat }</a>
                                                                                                    &nbsp;<span class="font-color-lighter"></span>&nbsp;
                         </c:forEach>      
                        <c:forEach items="${category }" var="cat" end="0">
                                    &gt;&nbsp;<a class="plain font-color-lighter sendGAEventClz" href="/kmongPro/category/categorylist.do?category=${cat.c_id }" data-name="breadcrumb - 하위 카테고리">${cat.c_group }</a>
                                                                                                    &nbsp;<span class="font-color-lighter "></span>&nbsp;
                         </c:forEach>
                        									 </h6>
                         
                         	<c:forEach items="${image }" var="img" end="0">
                         		<c:set value="${img.image }" var="mainimg"></c:set>
                                                <div class="border-solid border-bottom-none bg-color-white position-relative" style="height: 488px;width:654px;">

                                                            <img class="gig-detail-main-image" src="../server/${img.image }" alt="메인이미지" title="${img.t_name }" itemprop="image" onerror="this.onerror=null;this.src='../css/image/help_gigimg.jpg';">
                            
                        </div>
                        </c:forEach>
           
                        <div class="panel panel-default margin-all-0 border-radius-bottom">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-xs-12">
		                                    <c:set var="kmong" value="${talent.ta }"></c:set>
		           							<c:forEach items="${kmong }" var="dto">
		           							<c:set value="${dto.m_email }" var="email"></c:set>
		           							<c:set value="${dto.t_name }" var="t_name"></c:set>
		           							<c:set value="${dto.t_seq }" var="t_seq"></c:set>
		           							<c:set value="${dto.m_name }" var="m_name"></c:set>
                                        <h3 class="margin-top-0 line-height NGM">${dto.t_name }</h3>
                                        </c:forEach>       
                                    </div>
                                </div>
                                <div class="row margin-top-10">
                                    <div class="col-xs-6">
                                        
                                        <div id="bookmarkBtn" class="inline-block gig-detail-bookmark-active sendGAEventClz" data-name="찜하기 버튼 클릭">
                                            <i class="fa fa-heart-o font-color-lighter font-size-h3"></i>
                                            <i class="fa fa-heart color-red pulse font-size-h3" style="display: none;"></i>
                                        </div>
                             	      </div>
                           		  
                                    <div class="col-xs-6 text-right">
                                        <h3 class="margin-top-0 margin-bottom-0 NGB">
                                        <b>₩
												<c:forEach items="${prices }" var="pri" end="0">
                                                                      <fmt:formatNumber value="${pri.op_price }" pattern="#,###" />
												</c:forEach>
										</b>
                                                                 <span class="font-color-light font-size-h6">부터</span>
                                        </h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="text-center margin-top-20">
                        <c:forEach items="${star }" var="star">
                            <div class="rating-container theme-krajee-fa rating-md rating-disabled rating-margin-none">
                                <div class="rating-stars" style="font-size: 25px;">
                                    <span class="empty-stars">
                                        <span class="star"><i class="fa fa-star color-e3"></i></span>
                                        <span class="star"><i class="fa fa-star color-e3"></i></span>
                                        <span class="star"><i class="fa fa-star color-e3"></i></span>
                                        <span class="star"><i class="fa fa-star color-e3"></i></span>
                                        <span class="star"><i class="fa fa-star color-e3"></i></span>
                                    </span>
                                    <span class="filled-stars" style="width: ${star.avg*20}%;">
                                        <span class="star"><i class="fa fa-star"></i></span>
                                        <span class="star"><i class="fa fa-star"></i></span>
                                        <span class="star"><i class="fa fa-star"></i></span>
                                        <span class="star"><i class="fa fa-star"></i></span>
                                        <span class="star"><i class="fa fa-star"></i></span>
                                    </span>
                                </div>
                            </div>

                            <h6 id="gigDetailRatingBtn" class="margin-none position-relative inline-block font-color-lighter" style="top: -5px;"><b>${star.count }</b>개의 평가</h6>
                       </c:forEach>
                        </div>
                    </div>
                    
<form class="payForm" action="payment.do">
<input type="hidden" name="t_seq" value="${t_seq}"/>
<input type="hidden" name="image" value="${mainimg }"/>
<input type="hidden" name="t_name" value="${t_name }"/>
<input type="hidden" name="m_name" value="${m_name }"/>
                    <!-- 3option일때 가격정보 들어오는 부분 -->
                    <c:if test="${separate eq 3 }">
                    	<jsp:include page="/WEB-INF/view/inc/category_inc/3option_price.jsp">
                    		<jsp:param value="${prices }" name="prices"/>
                    	</jsp:include>
                    </c:if>
                    
	<c:forEach items="${kmong }" var="dto">
                    <div id="description" class="informationDiv margin-top-30">
                        <h4 class="margin-none">
                            <b>서비스 설명</b>
                        </h4>

                        <div class="panel panel-default margin-top-10">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="padding-right-20 word-break line-height-2em col-xs-12">${dto.t_service }</div>
                                    
                                </div>

                                <div class="row margin-top-20">
                                <c:forEach items="${image }" var="img" begin="1">
                                    <div class="col-xs-12">
                                        <img class="width-100 margin-top-5" src="../server/${img.image }">
                                    </div>
                               </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
		           		
					<!-- 1option일때 가격정보 들어오는 부분 -->
					 <c:if test="${separate eq 1 }">
                    	<jsp:include page="/WEB-INF/view/inc/category_inc/1option_price.jsp">
                    		<jsp:param value="${prices }" name="prices"/>
                    		<jsp:param value="${option }" name="option"/>
                    	</jsp:include>
                    </c:if>
				
                    <div id="asrule" class="margin-top-30 informationDiv ">
                        <h4><b>A/S 및 환불</b></h4>

                        

                        <div class="panel panel-default margin-top-10">
                            <div class="panel-body" style="word-break: break-all;">${dto.t_as }</div>
                        </div>
                    </div>

 </c:forEach>      
 </form>	             
                    <div id="ratings" class="margin-top-30 informationDiv ">
                        <h4><b>서비스 평가</b></h4>

                        <div class="margin-bottom-30">
                            <div class="text-center margin-top-10">
                                
                                
                                
                                                                <div class="panel panel-default margin-bottom-0">
                                    <div class="margin-top-20 margin-right-20 margin-bottom-20 margin-left-20 bg-color-f5 padding-all-20">
                                        <div class="text-center">
                                        <c:forEach items="${star }" var="star">
                                            <div class="rating-container theme-krajee-fa rating-disabled rating-margin-none">
                                                <div class="rating-stars" style="font-size: 25px;">
                                                    <span class="empty-stars">
                                                        <span class="star"><i class="fa fa-star color-e3"></i></span>
                                                        <span class="star"><i class="fa fa-star color-e3"></i></span>
                                                        <span class="star"><i class="fa fa-star color-e3"></i></span>
                                                        <span class="star"><i class="fa fa-star color-e3"></i></span>
                                                        <span class="star"><i class="fa fa-star color-e3"></i></span>
                                                    </span>
                                                                        <span class="filled-stars" style="width: ${star.avg*20}%;">
                                                        <span class="star"><i class="fa fa-star"></i></span>
                                                        <span class="star"><i class="fa fa-star"></i></span>
                                                        <span class="star"><i class="fa fa-star"></i></span>
                                                        <span class="star"><i class="fa fa-star"></i></span>
                                                        <span class="star"><i class="fa fa-star"></i></span>
                                                    </span>
                                                </div>
                                            </div>

                                            <h6 class="font-color-light margin-top-5"><b>${star.count }</b>개의 평가</h6>
                                            </c:forEach>
                                            		
                                        </div>
                                    </div>
                                </div>
                                                            </div>

                            <div id="ratingsWrapper"><div id="ratesDiv" class="margin-all-0">
        <ul class="list-unstyled padding-left-0 margin-bottom-0">
        
        <!-- 회원별평가 -->
        <c:forEach items="${evaluation }" var="eval">
            <li class="list-group-item padding-all-20 border-radius-none">
            <div class="overflow-hidden">
                <div class="col-xs-2 pull-left padding-left-0 padding-right-0 margin-bottom-10">
                    <img style="height: 70px" class="width-70px border-circle" src="../css/image/${eval.m_profile }" title="${fn:substring(eval.m_email,0,3) }*****" onerror="this.onerror=null;this.src='../image/main_user_gray.png'">
                </div>
                <div class="col-xs-10 padding-left-0 padding-right-0" style="margin-left: -15px !important;">
                    <div class="inline-block">
                        <div class="inline-block font-color-lighter font-size-h6 color-gray-d1">
                            ${eval.e_date }&nbsp;&nbsp;&nbsp;<span class="color-e3">|</span>&nbsp;&nbsp;
                        </div>
                    </div>
                    <div class="font-size-h6 color-yellow inline-block">
                        <div class="rating-container theme-krajee-fa rating-xs rating-disabled rating-margin-none">
                            <div class="rating-stars">
                                    <span class="empty-stars">
                                        <span class="star"><i class="fa fa-star color-e3"></i></span>
                                        <span class="star"><i class="fa fa-star color-e3"></i></span>
                                        <span class="star"><i class="fa fa-star color-e3"></i></span>
                                        <span class="star"><i class="fa fa-star color-e3"></i></span>
                                        <span class="star"><i class="fa fa-star color-e3"></i></span>
                                    </span>
                                <span class="filled-stars" style="width: ${eval.e_star *20}%;">
                                        <span class="star"><i class="fa fa-star"></i></span>
                                        <span class="star"><i class="fa fa-star"></i></span>
                                        <span class="star"><i class="fa fa-star"></i></span>
                                        <span class="star"><i class="fa fa-star"></i></span>
                                        <span class="star"><i class="fa fa-star"></i></span>
                                    </span>
                            </div>
                        </div>
                    </div>
                    <div class="margin-top-10 margin-bottom-10">
                        <div class="gig-detail-rating-text color-black">
                            ${eval.e_content }
                        </div>
                    </div>
                    <div class="font-color-lighter font-size-h6">${fn:substring(eval.m_email,0,3) }*****</div>
                </div>
            </div>
           
          </li><!-- 평가하나당정보 -->
         </c:forEach>           
        </ul>
   
 </div>
<!-- 
        <div id="moreGigRates" class="text-center padding-all-15 border-solid bg-color-white cursor sendGAEventClz" onclick="sendGAClickEvent('전문가 평가 더보기')" style="border-top: none !important;">
            <span class="font-color-base text-style-none">+ 더보기</span>
            <input id="page" name="page" type="hidden" value="2">
            <input id="PID" name="PID" type="hidden" value="65620">
    </div>
     -->
 

</div>
                        </div>
                    </div>
                </div>

                

                <div class="col-xs-4 padding-right-0 gig-detail-right-side-width" style="margin-top: 63px !important;">
                    
                  <!-- rightSide옵션들어오는 부분 -->
                  <c:choose>
                 		 <c:when test="${separate eq 1 }">
							<jsp:include page="/WEB-INF/view/inc/category_inc/1option.jsp">
								<jsp:param value="${prices }" name="prices" />
								<jsp:param value="${option }" name="option" />
							</jsp:include>
						</c:when>
						<c:when test="${separate eq 3 }">
							<jsp:include page="/WEB-INF/view/inc/category_inc/3option.jsp">
								<jsp:param value="${prices }" name="prices" />
								<jsp:param value="${vacation }" name="vacation"/>
							</jsp:include>
						</c:when>
					</c:choose>

					<div class="padding-left-15 padding-right-15 padding-top-20 padding-bottom-20 position-relative border-solid font-color-light margin-top-20 margin-bottom-20">
    <div class="pull-left">
        <img class="width-40px" src=" ../css/image/desktop_escro_darker.png" alt="안전">
    </div>
    <h6 class="line-height margin-top-5 margin-bottom-5">
        크몽을 통해 결제하면 거래 완료시까지 결제 대금을 안전하게 보호 받을 수 있습니다.
    </h6>
    <div class="clearfix"></div> <!-- clear both -->
</div>
                    
                    
                    <div class="row">
    <div class="col-xs-12">
        <div class="text-center panel panel-default margin-bottom-0 margin-top-0">
            <div class="panel-body padding-top-30">

                <c:forEach items="${kmong }" var="dto">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="inline-block position-relative">
                            <a class="plain sendGAEventClz" href="#${dto.m_name }" data-name="전문가 프로필 - 프로필 사진 클릭">
                                <img class="user-profile-image" src="../css/image/${dto.m_profile }" title="${dto.m_name }" onerror="this.onerror=null;this.src='../image/main_user.png';">
                            </a>

                            <div class="user-profile-ranking userProfileRanking_${dto.gs_name }">
                                <a href="#전문가등급" class="sendGAEventClz" data-name="전문가 프로필 - 등급 클릭">
                                    <img src="../css/image/kmong_grade_${fn:toUpperCase(dto.gs_name)}.png" data-toggle="tooltip" data-placement="right" title="" data-original-title="${dto.gs_name }">
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                
                <div class="row margin-top-15">
                    <div class="col-xs-12">
                        <h2 class="header-margin-none">
                            <a class="plain sendGAEventClz" href="#전문가프로필${dto.m_email }" data-name="전문가 프로필 - 전문가 닉네임 클릭">
                                ${dto.m_name }
                            </a>
                        </h2>
                        <div class="width-30px inline-block" style="border-bottom: 2px solid #ffd400"></div>
                    </div>
                </div>

              </c:forEach>  
                <div class="row">
                    <div class="col-xs-12">
                                                    <h5 class="margin-bottom-5">
                                <i class="kmong kmong-phone"></i>
                                결제전 비공개
                            </h5>
                            <c:forEach items="${time }" var="t">
                            <h5 class="header-margin-none font-color-lighter">연락가능시간&nbsp;:&nbsp;${t.time_1 }시&nbsp;~&nbsp;${t.time_2 }시</h5>
                            </c:forEach>
                                            </div>
                </div>

<!-- 메세지창으로 넘어가는곳 -->
                <div class="row margin-top-20 margin-bottom-20">
                    <div class="col-xs-12">
                                                    <a href="/kmongPro/message/relation.do?mr_seq=${mr_seq eq null? 0:mr_seq }&t_seq=${num}" role="button" data-name="전문가 프로필 - 전문가에게 문의" class="btn btn-black btn-sm btn-block sendGAEventClz"  style="">
                                <i class="kmong kmong-message font-size-h3"></i>
                                전문가에게 문의
                            </a>
                                            </div>
                </div>

                <div class="row">
                    <div class="col-xs-12">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="pull-left inline-block width-25 border-right">
                                <c:forEach items="${complete }" var="com">
                                    <h5 class="margin-top-0">${com.count }건</h5>
                                    <h6 class="font-color-lighter margin-none opacity-half">총작업개수</h6>
                                   </c:forEach>
                                </div>
                                <div class="pull-left inline-block width-20 border-right">
                                	<h5 class="margin-top-0">
		                                 <c:forEach items="${evaluation }" var="eval">
		                                    <fmt:formatNumber value = "${eval.e_star*2}" pattern="0"></fmt:formatNumber></c:forEach>0%
		                             </h5>
                                    <h6 class="font-color-lighter margin-none opacity-half">만족도</h6>
                                </div>
                                <div class="pull-left inline-block width-30 border-right">
                                    <h5 class="margin-top-0">아직 모름</h5>
                                    <h6 class="font-color-lighter margin-none opacity-half">평균응답시간</h6>
                                </div>
                                <c:forEach items="${kmong }" var="dto">
                                <div class="pull-left inline-block width-25">
                                    <h5 class="margin-top-0">
                                                                                    ${dto.m_sep }
                                                                            </h5>
                                    <h6 class="font-color-lighter margin-none opacity-half">회원구분</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                
                                <div id="gigDetailSellerInfo" class="row margin-top-20">
                    <div class="col-xs-12">
                        <ul class="list-unstyled text-left border-dashed-top padding-top-20 margin-all-0">
                            <li class="padding-left-0 padding-right-0">
                                <h6 class="font-color-lighter margin-all-0 padding-bottom-5">전문가 소개</h6>
                                <h5 class="margin-all-0 width-100 line-height">
                                    <div id="memberDescription" class="word-break">
                                       ${dto.m_intros }
                                    </div>
                                </h5>
                            </li>
                            <li id="descMoreBtn" class="padding-left-0 padding-right-0" style="display: none;" data-isshow="false">
                                <h6 class="text-right margin-right-10 margin-top-10">
                                    <a class="link-color-blue sendGAEventClz" href="javascript:void(0);" data-name="전문가 프로필 - 자기소개 더보기">
                                        자기소개 더 보기
                                        <i class="fa fa-sort-desc gig-detail-desc-icon" aria-hidden="true"></i>
                                    </a>
                                </h6>
                            </li>
                        </ul>
                    </div>
                </div>
              </c:forEach>  
                
                <div class="row margin-top-20" style="display:none;">
                    <div class="col-xs-12">
                        <h6 class="header-margin-none padding-top-10 text-left line-height text-style border-dashed-top">
                            
                        </h6>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

                </div>
            </div>
        </div>
        <!-- 비슷한 서비스 들어가는곳 -->
     
          <!-- 비슷한 서비스 -->
    </div>
<c:import url="http://localhost:8080/kmongPro/QuickMenuModuel.do">
		<c:param name="sessionID" value="${sessionID }"></c:param>
	</c:import>
</body>
<script type="text/javascript">


$(function () {

	//페이지 시작하자 마자 디럭스 가격은 펼쳐져있게	
	 $("div#packageAccordion>div:nth-of-type(2)").children("a").removeClass("collapsed");
	 $("div#packageAccordion>div:nth-of-type(2)").children("div").addClass(" in").attr("aria-expanded","true");
	 
	 //다른 가격 정보 헤더를 클릭하면 그 가격정보만 보이고 나머지 가격정보는 다시 숨겨짐
		$("div.panel-heading").click(function () {
			if ($('#packageAccordion div.panel-collapse').hasClass('in')) {
			    $("div.panel-collapse").removeClass('in').attr("aria-expanded","false");
			    $(this).parent("a").addClass("collapsed");
			}
			$(this).parent("a").removeClass("collapsed");
			$(this).parent("a").siblings("div.panel-collapse").addClass(" in").attr("aria-expanded","true");
		});
	 
	$("span.pull-right>div.btn-group>a.font-color-lighter").click(function () {
		//alert("test");
		$(this).parent().toggleClass(" open");
		$('div.list-group-item>div.btn-group>a.font-color-lighter').attr("aria-expanded",'true');
	});
	$('div.interest-close>img.width-15px').click(function () {
		$(this).closest("div.btn-group").removeAttr('class').attr('calss',"btn-group display-block text-left");
		$(this).closest('a.font-color-lighter').attr("aria-expanded",'false');
	});
	/* 옵션1일때  */
	$("select#optionDropMenu").change(function () {
		var find = $('#optionDropMenu option:selected').attr("id");
		console.log("find : " + find);
		$("input.extra_fastChkbox[id="+find+"]").attr("checked",true);
		$("li.list-group-item[id="+find+"]").css("display","block");
	});
	
	$('i.fa-minus-circle').click(function () {
		$(this).closest("li").css("display","none");
	});
	
	$(function () {
		$("a.plain>i.fa-plus").click(function name() {
			var name = $(this).parents('div.gig-detail-decision-option-btn').children("span").attr("class") ;
			var price=  parseInt( $("span[id="+name+"]").attr("class"));
			
			var count = parseInt( $(this).parents('div.gig-detail-decision-option-btn').children("span").text() );
			var name = $(this).parents('div.gig-detail-decision-option-btn').children("span").attr("class") ;
			//var price = parseInt( $("div.col-xs-6>span[id="+name+"]").text());
			console.log("name : " + name);
			console.log("price : " + price);
			if (count<99) {
				$(this).parents('div.gig-detail-decision-option-btn').children("span").text(count+1);
			}
			$("span[id="+name+"]").text( addComma(price*(count+1) ) );
		});
		
		$("a.plain>i.fa-minus").click(function name() {
			var name = $(this).parents('div.gig-detail-decision-option-btn').children("span").attr("class") ;
			var price=  parseInt( $("span[id="+name+"]").attr("class"));
			var count = parseInt( $(this).parents('div.gig-detail-decision-option-btn').children("span").text() );
			console.log("name : " + name);
			console.log("price : " + price);
			
			if (count>1) {
				$(this).parents('div.gig-detail-decision-option-btn').children("span").text(count-1)
			}
			$("span[id="+name+"]").text( addComma( price*(count-1) ) );
		});
		
		/* 증감버튼 클릭후 사라지는 콤마삽입 함수 */
			function addComma(num) {
			  var regexp = /\B(?=(\d{3})+(?!\d))/g;
			   return num.toString().replace(regexp, ',');
			}
		//standard 만 판매하는 재능 구매하기버튼 클릭했을때
		$("div.row>div.col-xs-offset-6>#1option").click(function () {
			$('form.payForm').submit();
		});
		
		$("a#buybtn").click(function (event) {
			event.preventDefault();
			$('form.payForm').submit();
		});
		
		//3개 다 팔때
		$("button#standard").click(function (event) {
			event.preventDefault();
			var standard = $(this).children('span').text();
			$('form.payForm').append("<input type='hidden' name='op_seq' value='"+standard+"'>");
			$('form.payForm').submit();
		});
		$("button#deluxe").click(function (event) {
			event.preventDefault();
			var deluxe = $(this).children('span').text();
			$('form.payForm').append("<input type='hidden' name='op_seq' value='"+deluxe+"'>");
			$('form.payForm').submit();
		});
		$("button#premium").click(function (event) {
			event.preventDefault();
			var premium = $(this).children('span').text();
			$('form.payForm').append("<input type='hidden' name='op_seq' value='"+premium+"'>");
			$('form.payForm').submit();
		});
		
	});
	
	
});//function

</script>

	<footer>
	<jsp:include page="/WEB-INF/view/inc/footer/footer_notice.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/view/inc/footer/footer.jsp"></jsp:include>
	</footer>
	
</html>