<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
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
<link rel="stylesheet" type="text/css" href="https://kmong.com/build/css/kmong-a9f87b1e91.master_desktop.css">
<title></title>
<style>
	#page_5{
		border-bottom: 4px solid #ffd400;
	}
	#page_1, #page_2, #page_3, #page_4{
		border-bottom: none;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(function (){
	$("#question").change(function(){
		if( $("#question").val()=='MULTI_SELECT' ){
			$("#one_box").prop('style','display: none');
			$("#many_box").prop('style','display: block');
		}else if($("#question").val() =='RADIO'){
			$("#many_box").prop('style','display: none');
			$("#one_box").prop('style','display: block');
		}else if($("#question").val() =='TEXT' || 'FILE'){
			$("#one_box, #many_box").prop('style','display: none');
		}
		/* if( $("question option:eq(1)") ){	
			$("#many_box").css("display","");
		} */
	});
	
	$("#double").click(function(index){
		//$("#many_box").appendTo("<form[name=zzz]>").css("display","block");
		$("#hide").clone().appendTo("#divdiv").css("display","block");
	});
		
	
	$("#double_a").click(function(){
		$("#hide_a").clone().appendTo("#divdiv_a").css("display","block");
	});
	
	$(".deldel").click(function(){
		$(".hide_hi").remove();
		
	});
	
});


</script> 
</head>
<% String ContextPath = request.getContextPath(); %>
<jsp:include page="/WEB-INF/view/inc/header/header_lmain.jsp"></jsp:include>

			<jsp:include page="/WEB-INF/view/inc/header/header_category.jsp"></jsp:include>
<body id="master_body" class="wysihtml5-supported" style="cursor: default;">

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
                <button id="store" class="btn btn-default btn-sm header-button-group padding-top-5 padding-bottom-5">
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

 
        <div id="gigFormContainer" class="container gig-form-container" style="">
            <div style="">
                <div class="row">
    
    <div class="col-xs-9">
        <div class="panel panel-default">
            <ul class="list-group panel-list-group-only">
                <li class="gig-form-list-group-item gigFormTooltip" data-target="instructionsTooltip">
                    <div class="row">
                        <div class="col-xs-3">
                            작업 전 요청사항<span class="font-size-h6 font-color-lighter">&nbsp;(선택)</span>
                        </div>
                        <div class="col-xs-9">
                            <div class="row" style="display: none;">
                                <div class="col-xs-12">
                                    <div class="gig-form-instruction-questions-wrapper">
                                        
                                    </div>
                                </div>
                                <div class="col-xs-12" style="display: none;">
                                    <div class="row instruction-question-plus margin-left-0 margin-right-0 margin-top-10">
                                        <div class="col-xs-12 text-center">
                                            <a class="plain font-color-base" href="javascript:void(0);">
                                                <div class="NGB">
                                                    + 요청사항 추가
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row" id="newIndicationSectionDiv">
                                <div class="gig-form-instruction-questions-wrapper overflow-hidden margin-left-15 margin-right-15">
                                    <div class="col-xs-12" style="padding-bottom: 0 !important;">
                                        <div id="instQuestionDiv" class="form-group">
                                            <label for="instQuestion" class="gig-form-label">질문</label>
                                            <textarea name="plus_question" id="instQuesation" class="form-control border-radius-0 instQuestInput" rows="3" placeholder="의뢰인에게 요청할 질문을 입력해주세요." maxlength="255" onfocus="$('#newInstructionSelectionTypeDiv').show();" spellcheck="false"></textarea>
                                            <span id="instruction-question-title-error" class="help-block hidden"><i class="fa fa-exclamation-triangle"></i>&nbsp;의뢰인에게 요청할 질문 제목을 입력해주세요.</span>
                                        </div>
                                        <h6 class="text-right font-color-lighter">0 / 300 자</h6>
                                    </div>
                                </div>
                            </div>


<!-- 답변 유형 input태그 -->
                            <div id="newInstructionSelectionTypeDiv" class="row margin-top-15" style="display:none">
                                <div class="col-xs-12" style="padding-bottom: 10px !important; padding-top: 0 !important;">
                                    <div id="instTypeDiv" class="form-group">
                                        <label for="instType" class="gig-form-label inline-block">
                                            답변 유형
                                        </label>

                                            <div class="row">
                                                <div class="col-xs-7">
                                                    <div class="select-control">
                                                        <select class="input-sm" id="question" name="sel_box">
                                                            <option value="">질문에 대한 답변 유형을 선택해주세요.</option>
                                                            <option value="MULTI_SELECT">다중선택지</option><option value="RADIO">단일선택지</option><option value="TEXT">서술형</option><option value="FILE">파일첨부</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                    <div class="awesome-checkbox">
                                                <div class="col-xs-5 padding-top-10">
                                                    <label>
                                                            <input id="instructionMandatoryCheckbox" type="checkbox" checked="">
                                                            <span class="awesome-checkbox-body"></span>
                                                            <span class="awesome-checkbox-text">
                                                                의무적으로 답변해야함
                                                            </span>
                                                    </label>
                                                </div>
                                            </div>

                                        </div>

                                    </div>
                                </div>

<!-- 답변 유형 select, input 태그 -->

                                <div id="instruction-selection-MULTI_SELECTDiv" class="col-xs-12" style="padding-top: 0 !important; padding-bottom: 0!important;">
                <!-- 다중선택지 -->                 
                                    <div class="instruction-answer-box" id="many_box" style="display:none">
                                    	
                                        <div class="margin-top-10">
                                            <div class="awesome-checkbox">
                                                <label>
                                                    <input type="checkbox" name="instructionCheckbox">
                                                    <span class="awesome-checkbox-body" style="top: 9px;"></span>
                                                    <div class="awesome-checkbox-text width-100">
                                                        <div>
                                                            <input name="qqss" type="text" class="form-control border-radius-0 input-xs" placeholder="의뢰인이 선택할 답변을 입력하세요">
                                                        </div>
                                                        <div class="inline-block">
                                                            <a class="plain-color-default cursor"></a>
                                                        </div>
                                                        
                                                    </div>
                                                </label>
                                            </div>
                                        </div>
                                        
                                        <div class="margin-top-10" id="divdiv">
                                            <div class="awesome-checkbox">
                                                <label>
                                                    <input type="checkbox" name="instructionCheckbox">
                                                    <span class="awesome-checkbox-body" style="top: 9px;"></span>
                                                    <div class="awesome-checkbox-text width-100">
                                                        <div>
                                                            <input name="qqss" type="text" class="form-control border-radius-0 input-xs" placeholder="의뢰인이 선택할 답변을 입력하세요">
                                                        </div>
                                                        <div class="inline-block">
                                                            <a class="plain-color-default cursor"></a>
                                                        </div>
                                                    </div>
                                                </label>
                                            </div>
                                        </div>
                                        
                                         <div id="hide" class="hide_hi margin-top-10" style="display:none">
                                            <div class="awesome-checkbox">
                                                <label>
                                                    <input type="checkbox" name="instructionCheckbox">
                                                    <span class="awesome-checkbox-body" style="top: 9px;"></span>
                                                    <div class="awesome-checkbox-text width-100">
                                                        <div>
                                                            <input name="qqss" type="text" class="form-control border-radius-0 input-xs" placeholder="의뢰인이 선택할 답변을 입력하세요">
                                                        </div>
                                                        <div class="inline-block">
                                                            <a class="plain-color-default cursor"></a>
                                                        </div>
                                                        <div id="delete" class="inline-block">
                                                            <a class="deldel plain-color-default cursor"><img src="<%= ContextPath %>/css/image/ic_delete.png" class="width-15px"></a>
                                                        </div>
                                                    </div>
                                                </label>
                                            </div>
                                        </div>
										
										<div id="twotwo" class="instruction-selection-plus-btn">
                                            <a id="double" class="link-color-dark-blue cursor" href="javascript:void(0);" role="button">+ 항목추가</a>
                                        </div>

                                        <div id="instruction-selection-RADIO-error" class="margin-top-10 margin-left-20 hidden">
                                            <span class=" help-block padding-left-0 color-danger"><i class="fa fa-exclamation-triangle"></i>&nbsp;구매자가 선택할 답변을 2개 이상 입력해주세요.</span>
                                        </div>
                                        
									
                                    </div>  
                                    
                                    
<!-- 단일선택지 -->
                                    <div class="instruction-answer-box" id="one_box" style="display:none" >
                                    
                                        <div class="margin-top-10">
                                            <div class="awesome-radio gig-form-instruction-selection-radio">
                                                <label>
                                                    <input type="radio" name="instructionRadio">
                                                    <span class="awesome-radio-body"></span>	
                                                    <div class="awesome-radio-text">
                                                        <div class="inline-block">
                                                            <input name="qqtt" type="text" class="form-control border-radius-0 input-xs" placeholder="의뢰인이 선택할 답변을 입력하세요">
                                                        </div>
                                                        <div class="inline-block">
                                                            <a class="plain-color-default cursor"></a>
                                                        </div>
                                                    </div>
                                                </label>
                                            </div>
                                        </div>
                                        
                                        <div class="margin-top-10" id="divdiv_a">
                                            <div class="awesome-radio gig-form-instruction-selection-radio">
                                                <label>
                                                    <input type="radio" name="instructionRadio">
                                                    <span class="awesome-radio-body"></span>
                                                    <div class="awesome-radio-text">
                                                        <div class="inline-block">
                                                            <input name="qqtt" type="text" class="form-control border-radius-0 input-xs" placeholder="의뢰인이 선택할 답변을 입력하세요">
                                                        </div>
                                                        <div class="inline-block">
                                                            <a class="plain-color-default cursor"></a>
                                                        </div>
                                                    </div>
                                                </label>
                                            </div>
                                        </div>
                                        
                                         <div id="hide_a" class="hide_hi margin-top-10" style="display:none">
                                            <div class="awesome-radio gig-form-instruction-selection-radio">
                                                <label>
                                                    <input type="radio" name="instructionRadio">
                                                    <span class="awesome-radio-body"></span>
                                                    <div class="awesome-radio-text">
                                                        <div class="inline-block">
                                                            <input name="qqtt" type="text" class="form-control border-radius-0 input-xs" placeholder="의뢰인이 선택할 답변을 입력하세요">
                                                        </div>
                                                        <div class="inline-block">
                                                            <a class="plain-color-default cursor"></a>
                                                        </div>
                                                        <div id="delete_a" class="deldel inline-block">
                                                            <a class="plain-color-default cursor"><img src="<%=ContextPath %>/css/image/ic_delete.png" class="width-15px"></a>
                                                        </div>
                                                    </div>
                                                </label>
                                            </div>
                                        </div>

                                        <div id="twotwo_a" class="instruction-selection-plus-btn">
                                            <a id="double_a" class="link-color-dark-blue cursor" href="javascript:void(0);" role="button">+ 항목추가</a>
                                        </div>

                                        <div id="instruction-selection-RADIO-error" class="margin-top-10 margin-left-20 hidden">
                                            <span class=" help-block padding-left-0 color-danger"><i class="fa fa-exclamation-triangle"></i>&nbsp;구매자가 선택할 답변을 2개 이상 입력해주세요.</span>
                                        </div>
                                        
                                    </div>
                                    
                                </div>
								                         

<!-- 취소 / 저장 버튼 -->
                                <div class="col-xs-12 margin-top-15 text-right padding-top-0">
                                    <div class="row">
                                        <div class="col-xs-offset-8 col-xs-2 padding-left-0">
                                            <button class="btn btn-default btn-sm btn-block btn-instruction-cancel">취소</button>
                                        </div>
                                        <div class="col-xs-2 padding-left-0">
                                            <button type="button" class="btn btn-black btn-sm btn-block btn-instruction-complete">저장</button>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="division-for-tooltip"></div>
                        <div id="instructionsTooltip" class="gig-form-tooltip" style="display: none;">
                            <div class="gig-form-tooltip-square"></div>
                            <div class="gig-form-tooltip-body">
                                <h5 class="margin-bottom-20">
                                    <i class="fa fa-info-circle" aria-hidden="true"></i>
                                    <b>요청사항</b>
                                </h5>
                                <ul class="gig-form-tooltip-text">
                                    <li>작업 시작 전 의뢰인으로부터 전달 받아야 하는 필수 정보 및 파일들을 미리 작성해두면, 결제 직후 해당 요청사항이 자동으로 의뢰인에게 발송되어 빠른 거래가 가능합니다.</li>
                                    <li>
                                        질문 예시:<br>
                                        - 로고디자인: 회사 명을 입력해주세요.<br>
                                        - 마케팅: 키워드를 입력해주세요.<br>
                                        - 번역: 번역이 필요한 파일을 첨부해주세요.<br>
                                    </li>
                                    <li>결제를 완료한 의뢰인에게만 보여지며, 작성된 답변은 거래화면에서 확인 가능합니다.</li>
                                    <li>결제 후 요청사항에 답하지 않은 의뢰인의 거래 건은 진행되지 않습니다.</li>
                                </ul>
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
                <button id="next" class="btn btn-black btn-block">서비스 <span>편집</span> 완료</button>
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
            	});	
            	
            	$("#page_3").click(function(){
            		$('.sub').attr('action','page3Cookie.do').submit();
            	});	
            	
            	$("#page_4").click(function(){
            		$('.sub').attr('action','page4Cookie.do').submit();
            	});	
            	
            	$("#next").click(function(){
            		$('.sub').attr('action','register.do').submit();
            	});	
            	
            	$("#back").click(function(){
            		$('.sub').attr('action','page4Cookie.do').submit();
            	});
            	$("#store").click(function(){
            		$(this).attr("type","button");
            		alert("임시저장완료!!");
            	});
            });
</script>
</html>