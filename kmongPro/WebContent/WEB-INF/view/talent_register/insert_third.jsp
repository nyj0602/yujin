<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");

  String p_stntitle = request.getParameter("stntitle");
  String p_deltitle = request.getParameter("deltitle");
  String p_pretitle = request.getParameter("pretitle");
  String p_stncontent = request.getParameter("stncontent");
  String p_delcontent = request.getParameter("delcontent");
  String p_precontent = request.getParameter("precontent");
  String p_stnprice = request.getParameter("stnprice");
  String p_delprice = request.getParameter("delprice");
  String p_preprice = request.getParameter("preprice");
  String p_stn_revision = request.getParameter("stn_revision");
  String p_del_revision = request.getParameter("del_revision");
  String p_pre_revision = request.getParameter("pre_revision");
  String p_stn_days = request.getParameter("stn_days");
  String p_del_days = request.getParameter("del_days");
  String p_pre_days = request.getParameter("pre_days");
  String p_fast_ob = request.getParameter("fast_ob");
  String p_fast_days = request.getParameter("fast_days");
  String p_plus_revision = request.getParameter("plus_revision");
  String p_revision_days = request.getParameter("revision_days");
  String p_op_title = request.getParameter("op_title");
  String p_op_content = request.getParameter("op_content");
  String p_op_price = request.getParameter("op_price");
  String p_op_days = request.getParameter("op_days");
  
  
  Cookie cookie_stntitle = 
		    new Cookie("stntitle",URLEncoder.encode(p_stntitle, "UTF-8"));
  cookie_stntitle.setPath("/");
  cookie_stntitle.setMaxAge(-1);
  response.addCookie(cookie_stntitle);

  Cookie cookie_deltitle = 
    		new Cookie("deltitle",URLEncoder.encode(p_deltitle, "UTF-8"));
 cookie_deltitle.setPath("/");
 cookie_deltitle.setMaxAge(-1);
 response.addCookie(cookie_deltitle);
 
 Cookie cookie_pretitle = 
 		new Cookie("pretitle",URLEncoder.encode(p_pretitle, "UTF-8"));
cookie_pretitle.setPath("/");
cookie_pretitle.setMaxAge(-1);
response.addCookie(cookie_pretitle);

Cookie cookie_stncontent = 
	new Cookie("stncontent",URLEncoder.encode(p_stncontent, "UTF-8"));
cookie_stncontent.setPath("/");
cookie_stncontent.setMaxAge(-1);
response.addCookie(cookie_stncontent);

Cookie cookie_delcontent = 
	new Cookie("delcontent",URLEncoder.encode(p_delcontent, "UTF-8"));
cookie_delcontent.setPath("/");
cookie_delcontent.setMaxAge(-1);
response.addCookie(cookie_delcontent);

Cookie cookie_precontent = 
	new Cookie("precontent",URLEncoder.encode(p_precontent, "UTF-8"));
cookie_precontent.setPath("/");
cookie_precontent.setMaxAge(-1);
response.addCookie(cookie_precontent);

Cookie cookie_stnprice = 
new Cookie("stnprice",URLEncoder.encode(p_stnprice, "UTF-8"));
cookie_stnprice.setPath("/");
cookie_stnprice.setMaxAge(-1);
response.addCookie(cookie_stnprice);

Cookie cookie_delprice = 
new Cookie("delprice",URLEncoder.encode(p_delprice, "UTF-8"));
cookie_delprice.setPath("/");
cookie_delprice.setMaxAge(-1);
response.addCookie(cookie_delprice);

Cookie cookie_preprice = 
new Cookie("preprice",URLEncoder.encode(p_preprice, "UTF-8"));
cookie_preprice.setPath("/");
cookie_preprice.setMaxAge(-1);
response.addCookie(cookie_preprice);

Cookie cookie_p_stn_revision = 
new Cookie("stn_revision",URLEncoder.encode(p_stn_revision, "UTF-8"));
cookie_p_stn_revision.setPath("/");
cookie_p_stn_revision.setMaxAge(-1);
response.addCookie(cookie_p_stn_revision);

Cookie cookie_del_revision = 
new Cookie("del_revision",URLEncoder.encode(p_del_revision, "UTF-8"));
cookie_del_revision.setPath("/");
cookie_del_revision.setMaxAge(-1);
response.addCookie(cookie_del_revision);

Cookie cookie_pre_revision = 
new Cookie("pre_revision",URLEncoder.encode(p_pre_revision, "UTF-8"));
cookie_pre_revision.setPath("/");
cookie_pre_revision.setMaxAge(-1);
response.addCookie(cookie_pre_revision);

Cookie cookie_stn_days = 
new Cookie("stn_days",URLEncoder.encode(p_stn_days, "UTF-8"));
cookie_stn_days.setPath("/");
cookie_stn_days.setMaxAge(-1);
response.addCookie(cookie_stn_days);

Cookie cookie_del_days = 
new Cookie("del_days",URLEncoder.encode(p_del_days, "UTF-8"));
cookie_del_days.setPath("/");
cookie_del_days.setMaxAge(-1);
response.addCookie(cookie_del_days);

Cookie cookie_pre_days = 
new Cookie("pre_days",URLEncoder.encode(p_pre_days, "UTF-8"));
cookie_pre_days.setPath("/");
cookie_pre_days.setMaxAge(-1);
response.addCookie(cookie_pre_days);

Cookie cookie_fast_ob = 
new Cookie("fast_ob",URLEncoder.encode(p_fast_ob, "UTF-8"));
cookie_fast_ob.setPath("/");
cookie_fast_ob.setMaxAge(-1);
response.addCookie(cookie_fast_ob);

Cookie cookie_fast_days = 
new Cookie("fast_days",URLEncoder.encode(p_fast_days, "UTF-8"));
cookie_fast_days.setPath("/");
cookie_fast_days.setMaxAge(-1);
response.addCookie(cookie_fast_days);

Cookie cookie_plus_revision = 
new Cookie("plus_revision",URLEncoder.encode(p_plus_revision, "UTF-8"));
cookie_plus_revision.setPath("/");
cookie_plus_revision.setMaxAge(-1);
response.addCookie(cookie_plus_revision);

Cookie cookie_revision_days = 
new Cookie("revision_days",URLEncoder.encode(p_revision_days, "UTF-8"));
cookie_revision_days.setPath("/");
cookie_revision_days.setMaxAge(-1);
response.addCookie(cookie_revision_days);

Cookie cookie_op_title = 
new Cookie("op_title",URLEncoder.encode(p_op_title, "UTF-8"));
cookie_op_title.setPath("/");
cookie_op_title.setMaxAge(-1);
response.addCookie(cookie_op_title);

Cookie cookie_op_content = 
new Cookie("op_content",URLEncoder.encode(p_op_content, "UTF-8"));
cookie_op_content.setPath("/");
cookie_op_content.setMaxAge(-1);
response.addCookie(cookie_op_content);

Cookie cookie_op_price = 
new Cookie("op_price",URLEncoder.encode(p_op_price, "UTF-8"));
cookie_op_price.setPath("/");
cookie_op_price.setMaxAge(-1);
response.addCookie(cookie_op_price);

Cookie cookie_op_days = 
new Cookie("op_days",URLEncoder.encode(p_op_days, "UTF-8"));
cookie_op_days.setPath("/");
cookie_op_days.setMaxAge(-1);
response.addCookie(cookie_op_days);
 %>
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
<style>
	#page_3{
		border-bottom: 4px solid #ffd400;
	}
	#page_1, #page_2, #page_4, #page_5{
		border-bottom: none;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(document).on('keyup', '#gdesc', function(e){
	    var gdesc = $(this).val();
	    $('#textcount').text(getBytes(gdesc));  
	    if( gdesc.val().length > 100 &&
	    		gdesc.val().length != null){
	    	$("#gdesc").css("border-color","#e6e6e6");
	    }
	});
	function getBytes(str){
	    var cnt = 0;
	    for(var i =0; i<str.length;i++) {
	        cnt += 1;
	    }
	    return cnt;
	}

	$(document).on('keyup', '#followUpStepsTextArea', function(e){
	    var followUpStepsTextArea = $(this).val();
	    $('#textcnt').text(getBytes(followUpStepsTextArea));    
	    if( gdesc.val().length > 20 &&
	    		gdesc.val().length != null){
	    	$("#followUpStepsTextArea").css("border-color","#e6e6e6");
	    }
	});
	function getBytes(str){
	    var pcnt = 0;
	    for(var i =0; i<str.length;i++) {
	        pcnt += 1;
	    }
	    return pcnt;
	}
</script>

<script>
	/* $("#next").click(function(event){
		event.preventDefault();
		var gdesc = $("#gdesc").val().length();
		var followUpStepsTextArea = $("#followUpStepsTextArea").val().length();
		if( gdesc <= 100 ){
			$("#gdesc").prop("border-color","red");
		}else{
			$("#gdesc").prop("border-color","yellow");
		}
		
		if( followUpStepsTextArea <=20){
			$("#followUpStepsTextArea").prop("border-color","red");
		}else{
			$("#followUpStepsTextArea").prop("border-color","yellow");
		} */
		
		/* $("#next").attr("type","submit");
	}); */
</script>
</head>
<% String ContextPath = request.getContextPath(); %>
<jsp:include page="/WEB-INF/view/inc/header/header_lmain.jsp"></jsp:include>

			<jsp:include page="/WEB-INF/view/inc/header/header_category.jsp"></jsp:include>
<body id="master_body" class="wysihtml5-supported" style="cursor: default;">

<%-- <%@ include file = "../module/header_sec.jsp" %> --%>

<form class="sub" method="post">
<div class="global-body">
    <div id="gig_form">
    
     <div class="gig-form-fixed">
    <div class="container">
        <div class="row">
            <div class="col-xs-9">
                <div id="page_1" class="gig-form-header-item active" >
                    <h5 class="gig-form-header-text">
                        <div id="pageNaviText1">
                            <span class="gig-form-header-page-number">1</span>
                            기본사항
                        </div>
                        <span class="page-1-error gig-form-header-error hidden"><i class="fa fa-exclamation-triangle gig-form-header-font-icon"></i>기본사항</span>
                    </h5>
                </div>
                
                <div id="page_2" class="gig-form-header-item">
                    <h5 class="gig-form-header-text">
                        <div id="pageNaviText2">
                            <span class="gig-form-header-page-number">2</span>
                            가격설정
                        </div>
                        <span class="page-2-error gig-form-header-error hidden"><i class="fa fa-exclamation-triangle gig-form-header-font-icon"></i>가격설정</span>
                    </h5>
                </div>
                
                <div id="page_3" class="gig-form-header-item">
                    <h5 class="gig-form-header-text">
                        <div id="pageNaviText3">
                            <span class="gig-form-header-page-number">3</span>
                            서비스 설명
                        </div>
                        <span class="page-3-error gig-form-header-error hidden"><i class="fa fa-exclamation-triangle gig-form-header-font-icon"></i>서비스 설명</span>
                    </h5>
                </div>
                
                <div id="page_4" class="gig-form-header-item">
                    <h5 class="gig-form-header-text">
                        <div id="pageNaviText4">
                            <span class="gig-form-header-page-number">4</span>
                            이미지
                        </div>
                        <span class="page-4-error gig-form-header-error hidden"><i class="fa fa-exclamation-triangle gig-form-header-font-icon"></i>이미지</span>
                    </h5>
                </div>
                
                
                <div id="page_5" class="gig-form-header-item">
                    <h5 class="gig-form-header-text">
                        <div id="pageNaviText5">
                            <span class="gig-form-header-page-number">5</span>
                            요청사항
                        </div>
                        <span class="page-5-error gig-form-header-error hidden"><i class="fa fa-exclamation-triangle gig-form-header-font-icon"></i>요청사항</span>
                    </h5>
                </div>
                
            </div>
            <div class="col-xs-3 btn-gig-form-header text-right">
                <button id="store" type="button" id="store" class="btn btn-default btn-sm header-button-group padding-top-5 padding-bottom-5">
                    <i class="fa fa-floppy-o" aria-hidden="true"></i>
                    임시저장
                </button>
                <button class="btn btn-default btn-sm header-button-group" style="display: none;">
                    <i class="fa fa-floppy-o" aria-hidden="true"></i>
                    저장
                </button>
                <button type="button" class="btn btn-default btn-sm margin-left-10" style="outline: 0;">
                    <i class="fa fa-desktop" aria-hidden="true"></i>
                    미리보기
                </button>
            </div>
        </div>
    </div>
</div>       
            <div id="sellerNewEvent" class="container" style="margin-top: 130px !important;">
                <div class="row ">
                    <div class="col-xs-12 padding-right-5">
                        <img class="width-100" src="<%= ContextPath %>/css/image/seller_mykmong.jpg">
                    </div>
                </div>
            </div>
<%-- 
<%
  Cookie [] cookies = request.getCookies();
  if( cookies != null && cookies.length > 0){
	  for(int i=0; i< cookies.length ; i++){
%>
    > <%= cookies[i].getName() %> =
      <%= URLDecoder.decode(cookies[i].getValue(),"UTF-8") %><br>
<%		  
	  }
  }
%>
 --%>
        <div id="gigFormContainer" class="container gig-form-container margin-top-0" style="">
            
            <div style="">
                <div class="row">
    
    <div class="col-xs-9">
        <div class="panel panel-default">
            <ul class="list-group panel-list-group-only">
                <li class="gig-form-list-group-item gigFormTooltip">
                    <div class="">
                        <div class="row">
                            <div class="col-xs-3">
                                서비스 설명
                            </div>
                            <div id="gdescDiv" class="col-xs-9">
                                <div>
                                    <ul class="wysihtml5-toolbar" style=""><li>
  <div class="btn-group">
    <a class="btn btn-sm btn-default btn-xs" data-wysihtml5-command="bold" title="CTRL+B" tabindex="-1" href="javascript:;" unselectable="on">굵게</a>
    <a class="btn btn-sm btn-default btn-xs" data-wysihtml5-command="italic" title="CTRL+I" tabindex="-1" href="javascript:;" unselectable="on">기울게</a>
    <a class="btn btn-sm btn-default btn-xs" data-wysihtml5-command="underline" title="CTRL+U" tabindex="-1" href="javascript:;" unselectable="on">밑줄</a>
    
  </div>
</li>
</ul>

<textarea name="service_content" id="gdesc" class="form-control border-radius-0" rows="8" placeholder="" spellcheck="false"></textarea>


                                    <!-- <input id="gdescInput" type="hidden" v-model="gdesc"> -->


                                    <div id="redtext" class="col-xs-9 padding-left-0" style="visibility: hidden;">
                                        <span style="color: #FF7262" class="gdesc-error help-block padding-left-0"><i class="fa fa-exclamation-triangle"></i>&nbsp;서비스 설명을 최소 100글자 이상 입력해주세요.</span>
                                        <span class="gdesc-keyword-error help-block padding-left-0 hidden"></span>
                                    </div>
                                    <div class="col-xs-3 padding-right-0">
                                        <h6 class="text-right">
                                            <span id="textcount" class="color-red">0</span><span> / 최소 100 자</span>
                                        </h6>
                                    </div>
                                </div>
                            </div>

                            <div class="division-for-tooltip"></div>
                            <div id="descriptionTooltip" class="gig-form-tooltip" style="display: none;">
                                <div class="gig-form-tooltip-square"></div>
                                <div class="gig-form-tooltip-body">
                                    <h5 class="margin-bottom-20">
                                        <i class="fa fa-info-circle" aria-hidden="true"></i>
                                        <b>서비스 설명</b>
                                    </h5>
                                    <ul class="gig-form-tooltip-text">
                                        <li>간단 인삿말과 함께 제공되는 서비스와 그에 따른 금액을 간략하고 명확하게 작성해주세요.</li>
                                        <li>외부 연락처 (전화번호, 카톡ID, 이메일, 링크 등)은 삽입이 제한됩니다.</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>

                <li class="gig-form-list-group-item gigFormTooltip">
                    <div class="gig-form-basic-border-dashed">
                        <div class="row">
                            <div class="col-xs-3">
                                A/S 및 환불
                            </div>
                            <div id="followUpStepsDiv" class="col-xs-9">
                                <textarea name="AS_context" id="followUpStepsTextArea" class="form-control border-radius-0" rows="8" placeholder="" spellcheck="false"></textarea>
                                <div class="row">
                                    <div id="redtext1" class="col-xs-9" style="visibility: hidden;">
                                        <span style="color: #FF7262" class="followUpSteps-error help-block padding-left-0"><i class="fa fa-exclamation-triangle"></i>&nbsp;A/S 및 환불에 대한 내용을 최소 20글자 이상 입력해주세요.</span>
                                    </div>
                                    <div class="col-xs-3">
                                        <h6 class="text-right">
                                            <span id="textcnt" class="color-red">0</span><span> / 최소 20 자</span>
                                        </h6>
                                    </div>
                                </div>
                            </div>

                            <div class="division-for-tooltip"></div>
                            <div id="asruleTooltip" class="gig-form-tooltip" style="display: none;">
                                <div class="gig-form-tooltip-square"></div>
                                <div class="gig-form-tooltip-body">
                                    <h5 class="margin-bottom-20">
                                        <i class="fa fa-info-circle" aria-hidden="true"></i>
                                        <b>A/S 및 환불</b>
                                    </h5>
                                    <ul class="gig-form-tooltip-text">
                                        <li>무료 A/S 가능 범위와 횟수를 정확히 명시해 주세요.</li>
                                        <li>추가 수정에 따른 추가금이 발생될 경우, 이를 명시해 주세요.</li>
                                        <li>환불 관련 규정을 정확히 명시해 주세요</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-xs-3">
                <button id="back" class="btn btn-default width-70">뒤로</button>
            </div>
            <div class="col-xs-offset-5 col-xs-4">
                <button id="next" class="btn btn-black btn-block"><span>저장 및 </span>다음단계</button>
            </div>
        </div>
    </div>

    <div class="col-xs-3 margin-top-20">
    </div>
</div>

            </div>
        </div>
    </div>
</div>
</form>
<script type="text/javascript" src="https://wcs.naver.net/wcslog.js"> </script>
<%@ include file = "../inc/footer/footer.jsp" %>
</body>
<script>
            $(function(){
            	$("#page_1").click(function(){
            		$('.sub').attr('action','page1Cookie.do').submit();
            	});	     
            	
            	$("#page_2").click(function(){
            		$('.sub').attr('action','page2Cookie.do').submit();
					/* $('method','post') */
            		/* $('enctype','multipart/form-data') */
            		
            	});	
            	
            	$("#next, #page_4").click(function(e){
            		if( $("#gdesc").val().length <= 100 || $("#gdesc").val().length == null	){
            			/* e.preventDefault(); */
            			$("#next").attr("type","button");
            			$("#gdesc").css("border-color","#FF7262");
            			$("#redtext").css("visibility","visible");
            		}else if( $("#gdesc").val().length > 100 && $("#followUpStepsTextArea").val().length > 20 ){
            			$("#gdesc").css("border-color","#e6e6e6");
            			$("#redtext").css("visibility","hidden");
            			$("#next").attr("type","submit");
            			$('.sub').attr('action','page4Cookie.do');
            		}
            	});
            		
            		$("#next, #page_4").click(function(e){
            		if( $("#followUpStepsTextArea").val().length <= 20 ||
            			$("#followUpStepsTextArea").val().length == null){
              			$("#next").attr("type","button");
            			$("#followUpStepsTextArea").css("border-color","#FF7262");
            			$("#redtext1").css("visibility","visible");
            		}else if( $("#gdesc").val().length > 100 && $("#followUpStepsTextArea").val().length > 20 ){
            			$("#followUpStepsTextArea").css("border-color","#e6e6e6");
            			$("#redtext1").css("visibility","hidden");
            			$("#next").attr("type","submit");
            			$('.sub').attr('action','page4Cookie.do');
            		}
            	});
            		
            	$("#page_5").click(function(){
            		$('.sub').attr('action','page5Cookie.do').submit();
            	});	
            	
            	$("#back").click(function(){
            		$('.sub').attr('action','page2Cookie.do').submit();
            	});
            	
            	$("#store").click(function(){
            		$(this).attr("type","button");
            		alert("임시저장완료!!");
            	});
            	
            });
</script>
</html>