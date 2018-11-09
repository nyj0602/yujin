<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Array"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");


  // 쿠키 저장할 값 가져오기
  String p_gtitleInput = request.getParameter("gtitleInput");
  String p_sel_first = request.getParameter("sel_first");
  String p_sel_second = request.getParameter("sel_second");
  String p_sel_third = request.getParameter("sel_third");
  String p_gigMetadataLink1 = request.getParameter("gigMetadataLink1");
  String p_five = request.getParameter("metadata_1");
  
  //String [] p_gigMetadataLink1 = request.getParameterValues("gigMetadataLink1");
  //String [] p_five = request.getParameterValues("metadata_1");
  
  // 쿠키생성!!
  Cookie cookie_gtitleInput = 
		    new Cookie("gtitleInput",URLEncoder.encode(p_gtitleInput, "UTF-8"));
  cookie_gtitleInput.setPath("/");
  cookie_gtitleInput.setMaxAge(-1);
  response.addCookie(cookie_gtitleInput);

  Cookie cookie_sel_first = 
    		new Cookie("sel_first",URLEncoder.encode(p_sel_first, "UTF-8"));
 cookie_sel_first.setPath("/");
 cookie_sel_first.setMaxAge(-1);
 response.addCookie(cookie_sel_first);
 
 Cookie cookie_sel_second = 
 		new Cookie("sel_second",URLEncoder.encode(p_sel_second, "UTF-8"));
cookie_sel_second.setPath("/");
cookie_sel_second.setMaxAge(-1);
response.addCookie(cookie_sel_second);

Cookie cookie_sel_third = 
	new Cookie("sel_third",URLEncoder.encode(p_sel_third, "UTF-8"));
cookie_sel_third.setPath("/");
cookie_sel_third.setMaxAge(-1);
response.addCookie(cookie_sel_third);

//if( p_gigMetadataLink1 != null && p_gigMetadataLink1.length > 0){
//for(int i=0;i<p_gigMetadataLink1.length ;i++){
	/* Cookie cookie_gigMetadataLink1 = new Cookie("p_gigMetadataLink1"+i,"");
	cookie_gigMetadataLink1.setMaxAge(0);
	response.addCookie(cookie_gigMetadataLink1); */
Cookie cookie_gigMetadataLink1 = 
//new Cookie("p_gigMetadataLink1" + i,URLEncoder.encode(p_gigMetadataLink1[i], "UTF-8"));
new Cookie("p_gigMetadataLink1",URLEncoder.encode(p_gigMetadataLink1, "UTF-8"));
cookie_gigMetadataLink1.setPath("/");
cookie_gigMetadataLink1.setMaxAge(-1);
response.addCookie(cookie_gigMetadataLink1); 
//}
//}

//if( p_five != null && p_five.length > 0){
//for(int i=0;i<p_five.length ;i++){
	/* Cookie cookie_five = new Cookie("five"+i,"");
	cookie_five.setMaxAge(0);
	response.addCookie(cookie_five); */	
Cookie cookie_five = 
//new Cookie("five"+ i ,URLEncoder.encode(p_five[i], "UTF-8"));
new Cookie("five",URLEncoder.encode(p_five, "UTF-8"));
cookie_five.setPath("/");
cookie_five.setMaxAge(-1);
response.addCookie(cookie_five); 
//}
//}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name ="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/kmong-99952b2854.master_desktop.css" type="text/css">
<link rel="stylesheet" href="css/kmong_desktop_v2-6ec7c3f31e.css" type="text/css">
<link rel="stylesheet" href="css/kmong-3f20e872d5.master_desktop.css" type="text/css">
<link rel="stylesheet" href="css/kmong_fonts.css" type="text/css">
<link rel="stylesheet" href="css/kmong-a9f87b1e91.master_desktop.css" type="text/css">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<title></title>
<style>
	#page_2{
		border-bottom: 4px solid #ffd400;
	}
	#page_1, #page_3, #page_4, #page_5{
		border-bottom: none;
	}
</style>
<style>
	.modalal{
		display: none;
		position: fixed;
		z-index: 1;		/* 다른거보다 젤 높아야되것다 얘는 */
		padding-top: 100px;,
		left: 0;
		top: 0;
		width: 100%;
		height: 100%;
		overflow: auto;
		background-color: rgb(0,0,0);
		background-color: rgba(0,0,0,0.4);		/* 투명도 0.4 */
		/* 다 검은 색으로 줄꺼고 거기에 투명도만 좀 주겠다 */
	}
	.momodal{
		background-color: #fefefe;
		margin: auto;
		padding: 20px;
		border: solid 1px #888;
		width: 80%;
	}
	.closeModal{
		color: #aaaaaa;
		float: right;
		font-size: 28px;
		font-weight: bold;
	}
	.closeModal:hover, .closeModal:focus{
		color: #000;
		text-decoration: none;
		cursor: pointer;
	}
	
	/* */
	@-webkit-keyframes zoom{
		from{ -webkit-transform:scale(0)}
		to{-webkit-transform:scale(1)}
	}
	@keyframes zoom{
		from{ transform:scale(0)}
		to{transform:scale(1)}
	}
	.momodal,{ 		 	/*  .modal{ */
		animation-name: zoom;
		animation-duration: 0.6s;
		
		-webkit-animation-name: zoom;
		-webkit-animation-duration: 0.6s;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- <script>
	var modal = document.getElementById("profitsCalculatorModal");
	var span = modal.getElementsByClassName("closeModal")[0];
	var btn = document.getElementById("mya");
	
	btn.onclick = function(){
		modal.style.display="block";
	}
	
	span.onclick = function(){
		modal.style.display="none";
	}
	
	window.onclick = function(e){
		if(e.target == modal)
			modal.style.display="none";
	}
</script> -->
 
<script>
	$(function (){
		
		$("#package_modal").click(function(){
			$("#toto").click();
			$("#packageBlinder").css("display","none");
			
		});
		
		$("#option_plus").click(function(){
		$("#extra").clone().appendTo("#plus_op").css("display","");
		});
		
		$(document).on('keyup', '#stntitle', function(e){
		    var stntitle = $(this).val();
		    $('#textcount1').text(getBytes(stntitle));  
		});
		
		$(document).on('keyup', '#deltitle', function(e){
		    var deltitle = $(this).val();
		    $('#textcount2').text(getBytes(deltitle));
		});
		
		$(document).on('keyup', '#pretitle', function(e){
		    var pretitle = $(this).val();
		    $('#textcount3').text(getBytes(pretitle));
		});
		
		$(document).on('keyup', '#stncontent', function(e){
		    var stncontent = $(this).val();
		    $('#textcount4').text(getBytes(stncontent));
		});
		
		$(document).on('keyup', '#delcontent', function(e){
		    var delcontent = $(this).val();
		    $('#textcount5').text(getBytes(delcontent));
		});
		
		$(document).on('keyup', '#precontent', function(e){
		    var precontent = $(this).val();
		    $('#textcount6').text(getBytes(precontent));
		});

		function getBytes(str){
		    var cnt = 0;
		    for(var i =0; i<str.length;i++) {
		        cnt += 1;
		    }
		    return cnt;
		}
	});
	
	
</script>

    <style>
        .gig-image .tooltip-inner  {
            padding: 5px;
            text-align: center;
            max-width: 100px;
            width: 100px;
        }
    </style>
    
</head>
<jsp:include page="/WEB-INF/view/inc/header/header_lmain.jsp"></jsp:include>

			<jsp:include page="/WEB-INF/view/inc/header/header_category.jsp"></jsp:include>
<% String ContextPath = request.getContextPath(); %>
<body id="master_body" class="wysihtml5-supported" style="cursor: default;">


<form class="sub" method="post">
<!-- 기본 가격,설명 입력 -->
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
        <div id="gigFormContainer" class="container gig-form-container margin-top-0" style="">
            <div style="">
                <div>
                    <div class="row margin-top-25">

    <div class="col-xs-9">
        <div class="alert alert-danger package-price-increase-error hidden" role="alert">
            <i class="fa fa-exclamation-triangle"></i>&nbsp;패키지 금액은 1,000원 단위로만 등록 가능하며 점차 증액되어야합니다.
        </div>
    </div>
    <div class="col-xs-3"></div>

    <div class="col-xs-9">
        <div id="gigType_PACKAGE" class="row" style="">
            <div style="">
                
            <div class="col-xs-12 margin-top-10">
                <h4 class="inline-block">
                    <b>패키지</b>
                    <a id="exam1" href="javascript:void(0);" class="font-size-h6 text-underline link-color-blue NGB" data-toggle="modal" data-target="#packagesExampleModal">(예시)</a>
                </h4>

                <div class="package-setting-switch">
                    <div class="pull-left">
                        <span>패키지 설정</span>
                        <label class="vacation-switch">
                            <input id="packageMode" type="checkbox" >
                            <div id="toto" class="vacation-switch-slider round" onclick="$('#packageBlinder').toggle();"></div>
                        </label>
                    </div>
                    <div class="pull-right">
                        <a id="mya" class="btn btn-default btn-sm padding-top-5 padding-bottom-5 NGB cursor margin-left-10" data-toggle="modal" data-target="#profitsCalculatorModal">수익금 계산기</a>
                    </div>
                </div>
                <div id="packageTableWrapper" class="position-relative">
                    <table class="table table-bordered table-hover-vertical package-table margin-top-0">
                        <colgroup>
                            <col width="19.6%">
                            <col width="26.8%">
                            <col width="26.8%">
                            <col width="26.8%">
                        </colgroup>
						<div style="height=50px"></div>
                        <tbody>
                        <tr class="package-price">
                            <td class="package-example-option-title"></td>
                            <td class="package-example-option-title text-center position-relative">
                                <div class="package-title-arrow">
                                    <span class="font-color-base">STANDARD</span>
                                </div>
                            </td><td class="package-example-option-title text-center position-relative">
                                <div class="package-title-arrow">
                                    <span class="font-color-base">DELUXE</span>
                                </div>
                            </td><td class="package-example-option-title text-center position-relative">
                                <div class="package-title-arrow">
                                    <span class="font-color-base">PREMIUM</span>
                                </div>
                            </td>
                        </tr>

                        <tr class="">
                            <td class="package-example-option-title" rowspan="2">설명</td>
                            <td class="package-option-data package-option-input" id="package-STANDARD-titleDiv">
                                <div class="position-relative">
                                    <div class="package-option-input-maxlength"><span id="textcount1">0</span><span>/ 20</span></div>
                                    <div class="package-option-input-pencil">
                                        <i class="fa fa-pencil"></i>
                                    </div>
                                    <textarea id="stntitle" name="stntitle" class="form-control" placeholder="제목을 입력해주세요." maxlength="20" id="STANDARDPackageTitleTextArea" spellcheck="false"></textarea>

                                </div>
                            </td><td class="package-option-data package-option-input" id="package-DELUXE-titleDiv">
                                <div class="position-relative">
                                    <div class="package-option-input-maxlength"><span id="textcount2">0</span><span>/ 20</span></div>
                                    <div class="package-option-input-pencil">
                                        <i class="fa fa-pencil"></i>
                                    </div>
                                    <textarea id="deltitle" name="deltitle" class="form-control" placeholder="제목을 입력해주세요." maxlength="20" id="DELUXEPackageTitleTextArea" spellcheck="false" ></textarea>

                                </div>
                            </td><td class="package-option-data package-option-input" id="package-PREMIUM-titleDiv">
                                <div class="position-relative">
                                    <div class="package-option-input-maxlength"><span id="textcount3">0</span><span>/ 20</span></div>
                                    <div class="package-option-input-pencil">
                                        <i class="fa fa-pencil"></i>
                                    </div>
                                    <textarea id="pretitle" name="pretitle" class="form-control" placeholder="제목을 입력해주세요." maxlength="20" id="PREMIUMPackageTitleTextArea" spellcheck="false"></textarea>

                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="package-option-data package-option-input package-option-description" id="package-STANDARD-descriptionDiv">
                                <div class="position-relative">
                                    <div class="package-option-input-maxlength"><span id="textcount4">0</span><span>/ 60</span></div>
                                    <div class="package-option-input-pencil">
                                        <i class="fa fa-pencil"></i>
                                    </div>
                                    <textarea id="stncontent" name="stncontent" class="form-control" placeholder="상세 설명을 입력해주세요." maxlength="60" id="STANDARDPackageDescriptionTextArea" spellcheck="false"></textarea>
                                </div>
                            </td><td class="package-option-data package-option-input package-option-description" id="package-DELUXE-descriptionDiv">
                                <div class="position-relative">
                                    <div class="package-option-input-maxlength"><span id="textcount5">0</span><span>/ 60</span></div>
                                    <div class="package-option-input-pencil">
                                        <i class="fa fa-pencil"></i>
                                    </div>
                                    <textarea id="delcontent" name="delcontent" class="form-control" placeholder="상세 설명을 입력해주세요." maxlength="60" id="DELUXEPackageDescriptionTextArea" spellcheck="false"></textarea>
                                </div>
                            </td><td class="package-option-data package-option-input package-option-description" id="package-PREMIUM-descriptionDiv">
                                <div class="position-relative">
                                    <div class="package-option-input-maxlength"><span id="textcount6">0</span><span>/ 60</span></div>
                                    <div class="package-option-input-pencil">
                                        <i class="fa fa-pencil"></i>
                                    </div>
                                    <textarea id="precontent" name="precontent" class="form-control" placeholder="상세 설명을 입력해주세요." maxlength="60" id="PREMIUMPackageDescriptionTextArea" spellcheck="false"></textarea>
                                </div>
                            </td>
                        </tr>
                        <tr class="packageOptionTooltip">
                            <td class="package-example-option-title">
                                금액 (VAT 포함)

                                <div class="division-for-tooltip"></div>
                                <div class="package-form-tooltip" style="display: none">
                                    <div class="gig-form-tooltip-square"></div>
                                    <div class="gig-form-tooltip-body">
                                        <h5 class="margin-bottom-20">
                                            <i class="fa fa-info-circle" aria-hidden="true"></i>
                                            <b>금액 설정</b>
                                        </h5>
                                        <ul class="gig-form-tooltip-text">
                                            <li>패키지 금액은 낮음 &gt; 중간 &gt; 높음 순으로 설정해주세요.</li>
                                            <li>해당 패키지 이외의 옵션가격은 아래 추가 옵션에서 설정하실 수 있습니다.</li>
                                        </ul>
                                    </div>
                                </div>
                            </td>

                            <td class="package-option-data package-option-input package-option-input-number package-option-textarea-price has-error" id="package-STANDARD-priceDiv">
                                <div class="position-relative">
                                    <span class="inner-text" style="display: block;">원</span>
                                    <div class="package-option-input-pencil">
                                        <i class="fa fa-pencil"></i>
                                    </div>
                                    <textarea name="stnprice" style="border-color:#e6e6e6" class="form-control" rows="1" placeholder="최소 5,000" onfocus="$(this).parent().children().first().hide();" onblur="$(this).parent().children().first().show();" spellcheck="false"></textarea>
                                </div>
                            </td><td class="package-option-data package-option-input package-option-input-number package-option-textarea-price" id="package-DELUXE-priceDiv">
                                <div class="position-relative">
                                    <span class="inner-text">원</span>
                                    <div class="package-option-input-pencil">
                                        <i class="fa fa-pencil"></i>
                                    </div>
                                    <textarea name="delprice" class="form-control" rows="1" placeholder="최소 5,000" onfocus="$(this).parent().children().first().hide();" onblur="$(this).parent().children().first().show();" spellcheck="false"></textarea>
                                </div>
                            </td><td class="package-option-data package-option-input package-option-input-number package-option-textarea-price" id="package-PREMIUM-priceDiv">
                                <div class="position-relative">
                                    <span class="inner-text">원</span>
                                    <div class="package-option-input-pencil">
                                        <i class="fa fa-pencil"></i>
                                    </div>
                                    <textarea name="preprice" class="form-control" rows="1" placeholder="최소 5,000" onfocus="$(this).parent().children().first().hide();" onblur="$(this).parent().children().first().show();" spellcheck="false"></textarea>
                                </div>
                            </td>
                        </tr>
                        <tr class="package-revisions">
                            <td class="package-example-option-title">
                                수정 횟수
                            </td>
                            <td class="package-option-data package-option-dropdown" id="package-STANDARD-revisionsDiv">
                                <div class="select-control">
                                    <select name="stn_revision" class="text-center" id="STANDARD_revisions">
                                        <option value="">선택해주세요</option>
                                        <option value="0">0</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option>
                                        <option value="99">제한없음</option>
                                    </select>
                                </div>
                            </td><td class="package-option-data package-option-dropdown" id="package-DELUXE-revisionsDiv">
                                <div class="select-control">
                                    <select name="del_revision" class="text-center" id="DELUXE_revisions">
                                        <option value="">선택해주세요</option>
                                        <option value="0">0</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option>
                                        <option value="99">제한없음</option>
                                    </select>
                                </div>
                            </td><td class="package-option-data package-option-dropdown" id="package-PREMIUM-revisionsDiv">
                                <div class="select-control">
                                    <select name="pre_revision" class="text-center" id="PREMIUM_revisions">
                                        <option value="">선택해주세요</option>
                                        <option value="0">0</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option>
                                        <option value="99">제한없음</option>
                                    </select>
                                </div>                            </td>
                        </tr>

                        <tr class="package-delivery">
                            <td class="package-example-option-title">
                                작업 기간
                            </td>
                            <td class="package-option-data package-option-dropdown" id="package-STANDARD-daysDiv">
                                <div class="select-control">
                                    <select name="stn_days" class="text-center" id="STANDARD_days">
                                        <option value="">선택해주세요</option>
                                        <option value="1">1 일</option><option value="2">2 일</option><option value="3">3 일</option><option value="4">4 일</option><option value="5">5 일</option><option value="6">6 일</option><option value="7">7 일</option><option value="8">8 일</option><option value="9">9 일</option><option value="10">10 일</option><option value="11">11 일</option><option value="12">12 일</option><option value="13">13 일</option><option value="14">14 일</option><option value="15">15 일</option><option value="16">16 일</option><option value="17">17 일</option><option value="18">18 일</option><option value="19">19 일</option><option value="20">20 일</option><option value="21">21 일</option><option value="22">22 일</option><option value="23">23 일</option><option value="24">24 일</option><option value="25">25 일</option><option value="26">26 일</option><option value="27">27 일</option><option value="28">28 일</option><option value="29">29 일</option><option value="30">30 일</option>
                                    </select>
                                </div>
                            </td><td class="package-option-data package-option-dropdown" id="package-DELUXE-daysDiv">
                                <div class="select-control">
                                    <select name="del_days" class="text-center" id="DELUXE_days">
                                        <option value="">선택해주세요</option>
                                        <option value="1">1 일</option><option value="2">2 일</option><option value="3">3 일</option><option value="4">4 일</option><option value="5">5 일</option><option value="6">6 일</option><option value="7">7 일</option><option value="8">8 일</option><option value="9">9 일</option><option value="10">10 일</option><option value="11">11 일</option><option value="12">12 일</option><option value="13">13 일</option><option value="14">14 일</option><option value="15">15 일</option><option value="16">16 일</option><option value="17">17 일</option><option value="18">18 일</option><option value="19">19 일</option><option value="20">20 일</option><option value="21">21 일</option><option value="22">22 일</option><option value="23">23 일</option><option value="24">24 일</option><option value="25">25 일</option><option value="26">26 일</option><option value="27">27 일</option><option value="28">28 일</option><option value="29">29 일</option><option value="30">30 일</option>
                                    </select>
                                </div>
                            </td><td class="package-option-data package-option-dropdown" id="package-PREMIUM-daysDiv">
                                <div class="select-control">
                                    <select name="pre_days" class="text-center" id="PREMIUM_days">
                                        <option value="">선택해주세요</option>
                                        <option value="1">1 일</option><option value="2">2 일</option><option value="3">3 일</option><option value="4">4 일</option><option value="5">5 일</option><option value="6">6 일</option><option value="7">7 일</option><option value="8">8 일</option><option value="9">9 일</option><option value="10">10 일</option><option value="11">11 일</option><option value="12">12 일</option><option value="13">13 일</option><option value="14">14 일</option><option value="15">15 일</option><option value="16">16 일</option><option value="17">17 일</option><option value="18">18 일</option><option value="19">19 일</option><option value="20">20 일</option><option value="21">21 일</option><option value="22">22 일</option><option value="23">23 일</option><option value="24">24 일</option><option value="25">25 일</option><option value="26">26 일</option><option value="27">27 일</option><option value="28">28 일</option><option value="29">29 일</option><option value="30">30 일</option>
                                    </select>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    
          
                    
          <!--  모달모달 -->
                    <div id="packageBlinder" class="package-gig-type-standard" style="height: 413px;padding-top: 190px;padding-bottom: 190px;">
                        <div class="position-absolute modal-position">
                            <div class="font-size-h4">
                                <strong>패키지를 이용하면<br>더 많은 수익을 얻을수 있습니다</strong>
                            </div>
                            <div class="margin-top-15" >
                                <div class="btn btn-black btn-sm" id="package_modal">패키지 만들기</div>
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>

<!-- 추가옵션, 맞춤옵션 -->    
    
    
    
    
        <div class="row">
            <div class="col-xs-12">
                <h4><b>추가 옵션</b> <a href="javascript:void(0);" class="font-size-h6 text-underline link-color-blue NGB" data-toggle="modal" data-target="#extraOptionsExampleModal">(예시)</a></h4>
                <div class="panel panel-default border-radius-0 border-top-none">
    <ul id="plus_op" class="list-group panel-list-group-only">
    
    <!-- 빠른작업 -->
        <li class="extra-option-list-group-item border-radius-0 extraOptionTooltip">
            <div class="division-for-tooltip"></div>
            <div class="extra-option-form-tooltip" style="display: none">
                <div class="gig-form-tooltip-square"></div>
                <div class="gig-form-tooltip-body">
                    <h5 class="margin-bottom-20">
                        <i class="fa fa-info-circle" aria-hidden="true"></i>
                        <b>빠른 작업</b>
                    </h5>
                    <ul class="gig-form-tooltip-text"><li>급한 작업이 필요한 의뢰인을 위해 빠른 작업을 제공할 경우, 해당 옵션을 선택해주세요.</li><li>설정된 기한 안에 작업을 마치지 못 하실 경우 패널티가 부과될 수 있습니다.</li></ul>
                </div>
            </div>

            <div class="row">
                <div id="check_1" class="col-xs-4 align-input-xs">
                    <div class="awesome-checkbox" >
                        <label>
                            <input type="checkbox">
                            <span class="awesome-checkbox-body"></span>
                            <div class="awesome-checkbox-text"  onclick="$('#fast').toggle();">                                빠른 작업                            </div>
                        </label>
                    </div>
                </div>
                <div class="col-xs-8 extra-option-list-item padding-left-0">
                    <div id="fast" class="bg-color-fa padding-top-15 padding-left-30 padding-bottom-15 padding-right-15 border-solid" style="display: none">
                        <div class="margin-top-10" >
                                <div  class="row">
                                    <div class="col-xs-2 align-input-xs padding-left-0 padding-right-0"><span>STANDARD</span></div>
                                    <div class="col-xs-10">
                                        <div class="row">
                                            <div class="col-xs-12 padding-side-0">
                                                <div class="pull-left" id="STANDARD-extra_fast-priceDiv">
                                                    <input type="text" name="fast_ob" replaceholder="최소 1,000" class="form-control border-radius-0 input-xs width-105px text-right">
                                                </div>
                                                <span class="pull-left margin-top-5 margin-left-5">원 추가시  작업일 </span>
                                                <div class="pull-left margin-left-5" id="STANDARD-extra_fast-daysDiv">
                                                    <div class="border-solid">
                                                        <select name="fast_days" class="form-control border-none input-xs width-105px text-right">
                                                            <option value="">선택해주세요</option>
                                                            <option value="1">1 일</option><option value="2">2 일</option><option value="3">3 일</option><option value="4">4 일</option><option value="5">5 일</option><option value="6">6 일</option><option value="7">7 일</option><option value="8">8 일</option><option value="9">9 일</option><option value="10">10 일</option><option value="11">11 일</option><option value="12">12 일</option><option value="13">13 일</option><option value="14">14 일</option><option value="15">15 일</option><option value="16">16 일</option><option value="17">17 일</option><option value="18">18 일</option><option value="19">19 일</option><option value="20">20 일</option><option value="21">21 일</option><option value="22">22 일</option><option value="23">23 일</option><option value="24">24 일</option><option value="25">25 일</option><option value="26">26 일</option><option value="27">27 일</option><option value="28">28 일</option><option value="29">29 일</option><option value="30">30 일</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <span class="pull-left margin-top-5 margin-left-5">안에 작업</span>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <span class="STANDARD-extra_fast-price-none-error help-block color-danger margin-bottom-0 hidden"><i class="fa fa-exclamation-triangle">&nbsp;옵션 금액을 입력해주세요.</i></span>
                                            <span class="STANDARD-extra_fast-days-bigger-error help-block color-danger margin-bottom-0 hidden"><i class="fa fa-exclamation-triangle">&nbsp;빠른 작업은 기본 작업일보다 클 수 없습니다.</i></span>
                                        </div>
                                    </div>
                                </div>
                        </div>
                        
                        <div class="margin-top-10" style="display: none;">
                                <div class="row">
                                    <div class="col-xs-2 align-input-xs padding-left-0 padding-right-0"><span>DELUXE</span></div>
                                    <div class="col-xs-10">
                                        <div class="row">
                                            <div class="col-xs-12 padding-side-0">
                                                <div class="pull-left" id="DELUXE-extra_fast-priceDiv">
                                                    <input type="text" replaceholder="최소 1,000" class="form-control border-radius-0 input-xs width-105px text-right">
                                                </div>
                                                <span class="pull-left margin-top-5 margin-left-5">원 추가시  작업일 </span>
                                                <div class="pull-left margin-left-5" id="DELUXE-extra_fast-daysDiv">
                                                    <div class="border-solid">
                                                        <select class="form-control border-none input-xs width-105px text-right">
                                                            <option value="">선택해주세요</option>
                                                            <option value="1">1 일</option><option value="2">2 일</option><option value="3">3 일</option><option value="4">4 일</option><option value="5">5 일</option><option value="6">6 일</option><option value="7">7 일</option><option value="8">8 일</option><option value="9">9 일</option><option value="10">10 일</option><option value="11">11 일</option><option value="12">12 일</option><option value="13">13 일</option><option value="14">14 일</option><option value="15">15 일</option><option value="16">16 일</option><option value="17">17 일</option><option value="18">18 일</option><option value="19">19 일</option><option value="20">20 일</option><option value="21">21 일</option><option value="22">22 일</option><option value="23">23 일</option><option value="24">24 일</option><option value="25">25 일</option><option value="26">26 일</option><option value="27">27 일</option><option value="28">28 일</option><option value="29">29 일</option><option value="30">30 일</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <span class="pull-left margin-top-5 margin-left-5">안에 작업</span>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <span class="DELUXE-extra_fast-price-none-error help-block color-danger margin-bottom-0 hidden"><i class="fa fa-exclamation-triangle">&nbsp;옵션 금액을 입력해주세요.</i></span>
                                            <span class="DELUXE-extra_fast-days-bigger-error help-block color-danger margin-bottom-0 hidden"><i class="fa fa-exclamation-triangle">&nbsp;빠른 작업은 기본 작업일보다 클 수 없습니다.</i></span>
                                        </div>
                                    </div>
                                </div>
                        </div>
                        
                        <div class="margin-top-10" style="display: none;">
                                <div class="row">
                                    <div class="col-xs-2 align-input-xs padding-left-0 padding-right-0"><span>PREMIUM</span></div>
                                    <div class="col-xs-10">
                                        <div class="row">
                                            <div class="col-xs-12 padding-side-0">
                                                <div class="pull-left" id="PREMIUM-extra_fast-priceDiv">
                                                    <input placeholder="최소 1,000" class="form-control border-radius-0 input-xs width-105px text-right">
                                                </div>
                                                <span class="pull-left margin-top-5 margin-left-5">원 추가시  작업일 </span>
                                                <div class="pull-left margin-left-5" id="PREMIUM-extra_fast-daysDiv">
                                                    <div class="border-solid">
                                                        <select class="form-control border-none input-xs width-105px text-right">
                                                            <option value="">선택해주세요</option>
                                                            <option value="1">1 일</option><option value="2">2 일</option><option value="3">3 일</option><option value="4">4 일</option><option value="5">5 일</option><option value="6">6 일</option><option value="7">7 일</option><option value="8">8 일</option><option value="9">9 일</option><option value="10">10 일</option><option value="11">11 일</option><option value="12">12 일</option><option value="13">13 일</option><option value="14">14 일</option><option value="15">15 일</option><option value="16">16 일</option><option value="17">17 일</option><option value="18">18 일</option><option value="19">19 일</option><option value="20">20 일</option><option value="21">21 일</option><option value="22">22 일</option><option value="23">23 일</option><option value="24">24 일</option><option value="25">25 일</option><option value="26">26 일</option><option value="27">27 일</option><option value="28">28 일</option><option value="29">29 일</option><option value="30">30 일</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <span class="pull-left margin-top-5 margin-left-5">안에 작업</span>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <span class="PREMIUM-extra_fast-price-none-error help-block color-danger margin-bottom-0 hidden"><i class="fa fa-exclamation-triangle">&nbsp;옵션 금액을 입력해주세요.</i></span>
                                            <span class="PREMIUM-extra_fast-days-bigger-error help-block color-danger margin-bottom-0 hidden"><i class="fa fa-exclamation-triangle">&nbsp;빠른 작업은 기본 작업일보다 클 수 없습니다.</i></span>
                                        </div>
                                    </div>
                                </div>
                        </div>
                    </div>

                    <div style="display: none;">
                        <div class="row">
                            <div class="col-xs-offset-2 col-xs-10">
                                <div class="pull-left" id="extraOption-extra_fast-priceDiv">
                                    <input name="plus_revision" placeholder="최소 1,000" class="form-control border-radius-0 input-xs width-105px text-right">
                                </div>
                                <span class="pull-left margin-top-5 margin-left-5">원 추가 및 작업일</span>
                                <div class="pull-left margin-left-5" id="extraOption-extra_fast-daysDiv">
                                    <div class="select-control">
                                        <select name="revision_days" class="input-xs width-105px text-right">
                                            <option value="">선택해주세요</option>
                                            <option value="0">0 일</option>
                                            <option value="1">1 일</option><option value="2">2 일</option><option value="3">3 일</option><option value="4">4 일</option><option value="5">5 일</option><option value="6">6 일</option><option value="7">7 일</option><option value="8">8 일</option><option value="9">9 일</option><option value="10">10 일</option><option value="11">11 일</option><option value="12">12 일</option><option value="13">13 일</option><option value="14">14 일</option><option value="15">15 일</option><option value="16">16 일</option><option value="17">17 일</option><option value="18">18 일</option><option value="19">19 일</option><option value="20">20 일</option><option value="21">21 일</option><option value="22">22 일</option><option value="23">23 일</option><option value="24">24 일</option><option value="25">25 일</option><option value="26">26 일</option><option value="27">27 일</option><option value="28">28 일</option><option value="29">29 일</option><option value="30">30 일</option>
                                        </select>
                                    </div>
                                </div>
                                <span class="pull-left margin-top-5 margin-left-5">추가</span>
                            </div>
                        </div>
                        
                        <div class="row margin-top-10">
                            <div class="col-xs-offset-2 col-xs-10">
                                <span class="extraOption-extra_fast-price-none-error help-block color-danger padding-left-0 margin-bottom-0 hidden margin-left-0"><i class="fa fa-exclamation-triangle">&nbsp;옵션 금액을 입력해주세요.</i></span>
                                <span class="extraOption-extra_fast-days-none-error help-block color-danger padding-left-0 margin-bottom-0 hidden margin-left-0"><i class="fa fa-exclamation-triangle">&nbsp;옵션 작업일을 선택해주세요.</i></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </li>
        
        
       <!-- 추가수정 -->
        <li id="alert_plus" class="extra-option-list-group-item border-radius-0 extraOptionTooltip">
            <div class="division-for-tooltip"></div>
            <div class="extra-option-form-tooltip" style="display: none">
                <div class="gig-form-tooltip-square"></div>
                <div class="gig-form-tooltip-body">
                    <h5 class="margin-bottom-20">
                        <i class="fa fa-info-circle" aria-hidden="true"></i>
                        <b>추가 수정</b>
                    </h5>
                    <ul class="gig-form-tooltip-text"><li>기본 수정 횟수 이상의 추가 수정을 제공할 경우, 해당 옵션을 선택해주세요.</li></ul>
                </div>
            </div>

            <div class="row">
                <div class="col-xs-4 align-input-xs">
                    <div id="alert" class="awesome-checkbox">
                        <label>
                            <input type="checkbox">
                            <span class="awesome-checkbox-body"></span>
                            <div class="awesome-checkbox-text"  onclick="$('#plus').toggle();">                                추가 수정                            </div>
                        </label>
                    </div>
                </div>
                
                <div class="col-xs-8 extra-option-list-item padding-left-0">
                        <div id="plus" class="row" style="display: none">
                            <div class="col-xs-offset-2 col-xs-10">
                                <div class="pull-left" id="extraOption-extra_revision-priceDiv">
                                    <input type="text" name="plus_revision" placeholder="최소 1,000" class="form-control border-radius-0 input-xs width-105px text-right">
                                </div>
                                <span class="pull-left margin-top-5 margin-left-5">원 추가 및 작업일</span>
                                <div class="pull-left margin-left-5" id="extraOption-extra_revision-daysDiv">
                                    <div class="select-control">
                                        <select name="revision_days" class="input-xs width-105px text-right">
                                            <option value="">선택해주세요</option>
                                            <option value="0">0 일</option>
                                            <option value="1">1 일</option><option value="2">2 일</option><option value="3">3 일</option><option value="4">4 일</option><option value="5">5 일</option><option value="6">6 일</option><option value="7">7 일</option><option value="8">8 일</option><option value="9">9 일</option><option value="10">10 일</option><option value="11">11 일</option><option value="12">12 일</option><option value="13">13 일</option><option value="14">14 일</option><option value="15">15 일</option><option value="16">16 일</option><option value="17">17 일</option><option value="18">18 일</option><option value="19">19 일</option><option value="20">20 일</option><option value="21">21 일</option><option value="22">22 일</option><option value="23">23 일</option><option value="24">24 일</option><option value="25">25 일</option><option value="26">26 일</option><option value="27">27 일</option><option value="28">28 일</option><option value="29">29 일</option><option value="30">30 일</option>
                                        </select>
                                    </div>
                                </div>
                                <span class="pull-left margin-top-5 margin-left-5">추가</span>
                            </div>
                        </div>
                        
                        <div class="row margin-top-10">
                            <div class="col-xs-offset-2 col-xs-10">
                                <span class="extraOption-extra_revision-price-none-error help-block color-danger padding-left-0 margin-bottom-0 hidden margin-left-0"><i class="fa fa-exclamation-triangle">&nbsp;옵션 금액을 입력해주세요.</i></span>
                                <span class="extraOption-extra_revision-days-none-error help-block color-danger padding-left-0 margin-bottom-0 hidden margin-left-0"><i class="fa fa-exclamation-triangle">&nbsp;옵션 작업일을 선택해주세요.</i></span>
                            </div>
                        </div>
            </div>
        </li>
        
        
	<!-- 맞춤옵션 태그 -->
        <li id="extra" style="display:none" class="extra-option-list-group-item border-radius-0 extraOptionTooltip" v-for="extraOption in extraOptions" v-if="!((extraOption.id == 'extra_fast' || extraOption.id == 'extra_revision') && selectedRootCategory == 10)" v-show="(extraOption.isIncludedPackageOptions == false || (extraOption.isIncludedPackageOptions == true && gigType == 'STANDARD'))">
			<div class="division-for-tooltip"></div>
			            <div>
			                <div class="row">
			                    <div class="col-xs-4">
			                        <div class="awesome-checkbox">
			                            <label class="display-block">
			                                <input type="checkbox" id="custom-option-checkbox-9">
			                                <span class="awesome-checkbox-body"></span>
			                                <div class="awesome-checkbox-text">
			                                    맞춤옵션
			                                </div>
			                            </label>
			                        </div>
			                    </div>
			                    <div class="col-xs-8">
			                        <div class="border-solid padding-all-15 bg-color-fa">
			                            <div class="row">
			                                <div class="col-xs-2 margin-top-5">
			                                    <label class="label-margin-none font-size-h6" for="customOption-9-title"><b>제목</b></label>
			                                </div>
			                                <div class="col-xs-9 padding-right-5">
			                                    <div class="form-group" id="customOption-9-titleDiv">
			                                        <input name="op_title" type="text" class="form-control border-radius-0 input-xs inline-block" placeholder="제목을 입력해주세요" maxlength="20" id="customOption-9-title">
			                                        <span class="customOption-9-title-error help-block padding-left-0 hidden"><i class="fa fa-exclamation-triangle"></i>&nbsp;최대 20자 입니다.</span>
			                                    </div>
			                                </div>
			                                <div class="col-xs-1 padding-left-0 font-size-h6 font-color-lighter margin-top-5">경우</div>
			                            </div>

			                            <div class="row margin-top-10">
			                                <div class="col-xs-2 margin-top-5">
			                                    <label class="label-margin-none font-size-h6" for="customOption-9-description"><b>설명</b></label>
			                                </div>
			                                <div class="col-xs-10">
			                                    <div class="form-group" id="customOption-9-descriptionDiv">
			                                        <input name="op_content" type="text" class="form-control border-radius-0 input-xs" placeholder="옵션에 대한 설명을 입력해주세요" maxlength="60" id="customOption-9-description">
			                                        <span class="customOption-9-description-error help-block padding-left-0 hidden"><i class="fa fa-exclamation-triangle"></i>&nbsp;최대 60자 입니다.</span>
			                                    </div>
			                                </div>
			                            </div>

			                            <div class="row margin-top-10">
			                                <div class="col-xs-2 margin-top-5">
			                                    <label class="label-margin-none font-size-h6" for="customOption-9-price"><b>추가금액</b></label>
			                                </div>
			                                <div class="col-xs-4">
			                                    <div class="form-group input-text-group position-relative" id="customOption-9-priceDiv">
			                                        <span class="input-inner-text-xs inline-block position-absolute" style="top: 8px ; right: 8px;">원</span>
			                                        <input name="op_price" type="text" class="form-control border-radius-0 input-xs" placeholder="최소 1,000" id="customOption-9-price">
			                                    </div>
			                                </div>
			                                <div class="col-xs-2 padding-left-0" style="margin-top: 8px;">
			                                    <label class="label-margin-none font-color-lighter font-size-h6" for="customOption-9-days">추가작업일</label>
			                                </div>
			                                <div class="col-xs-3 padding-side-0">
			                                    <div class="form-group" id="customOption-9-daysDiv">
			                                        <div class="border-solid">
			                                            <select name="op_days" class="form-control border-none input-xs">
			                                                <option value="">선택해주세요</option>
			                                                <option value="0">0 일</option>
			                                                <option value="1">1 일</option><option value="2">2 일</option><option value="3">3 일</option><option value="4">4 일</option><option value="5">5 일</option><option value="6">6 일</option><option value="7">7 일</option><option value="8">8 일</option><option value="9">9 일</option><option value="10">10 일</option><option value="11">11 일</option><option value="12">12 일</option><option value="13">13 일</option><option value="14">14 일</option><option value="15">15 일</option><option value="16">16 일</option><option value="17">17 일</option><option value="18">18 일</option><option value="19">19 일</option><option value="20">20 일</option><option value="21">21 일</option><option value="22">22 일</option><option value="23">23 일</option><option value="24">24 일</option><option value="25">25 일</option><option value="26">26 일</option><option value="27">27 일</option><option value="28">28 일</option><option value="29">29 일</option><option value="30">30 일</option>
			                                            </select>
			                                        </div>
			                                    </div>
			                                </div>
			                                <div class="col-xs-1 padding-side-0 text-center" style="margin-top: 8px;">
			                                    <span class="font-size-h6 font-color-lighter">추가</span>
			                                </div>
			                            </div>
			                            <div class="row">
			                                <div class="col-xs-12">
			                                    <span class="customOption-9-price-none-error help-block padding-left-0 color-danger hidden"><i class="fa fa-exclamation-triangle"></i>&nbsp;금액을 입력해주세요.</span>
			                                </div>
			                            </div>
			                        </div>
			                    </div>
			                </div>
			            </div>		
        </li>
    </ul>
     <ul class="list-group panel-list-group-only">
    <li id="option_plus" class="extra-option-list-group-item package-custom-option-plus text-center bg-color-white" style="border-top: none">
            <a class="plain font-color-lighter" href="javascript:void(0);" v-on:click="addCustomOption">
                <div>
                    <i class="fa fa-plus vertical_0"></i>&nbsp;&nbsp;맞춤옵션 추가
                </div>
            </a>
        </li>
        </ul>
</div>
            </div>
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
 </div>		<!-- col-xs-9 -->
	
    <div class="col-xs-3 margin-top-20">
        <div id="packageBasicTooltip" class="gig-form-package-basic-tooltip margin-top-50" style="display: block;">
            <div class="gig-form-tooltip-square"></div>
            <div class="gig-form-tooltip-body">
                <h5 class="margin-bottom-20">
                    <i class="fa fa-info-circle" aria-hidden="true"></i>
                    <b>패키지 설정</b>
                </h5>
                <ul class="gig-form-tooltip-text">
                    <li>서비스는 3개의 패키지로 구성하실 수 있습니다.</li>
                    <li>각 패키지 금액에 제공 가능한 내용을 작성해주세요.</li>
                    <li class="list-unstyled"><a href="javascript:void(0);" class="font-size-h6 text-underline link-color-blue NGB" data-toggle="modal" data-target="#packagesExampleModal">(패키지 예시)</a></li>
                </ul>
            </div>
        </div>
    </div>   <!-- col-xs-3 margin-top-20 -->
		<!-- row margin-top-25 -->

<div class="modal fade" id="packagesExampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-position" role="document" style="width: 690px;">
        <div class="modal-content">
            <div class="modal-body  padding-all-20">
                <div class="row">
                    <i class="fa fa-close package-example-close" aria-hidden="true" data-dismiss="modal" aria-label="Close"></i>


                    <h2 class="text-center margin-top-50">패키지 노출 예시</h2>
                    <h4 class="text-center font-color-lighter">패키지 작성시 의뢰인에게 보여지는 화면 입니다.</h4>

                    <div class="col-xs-12 text-center">
                        <img class="width-100" src="<%=ContextPath %>/css/image/gig_pakage_exampe.jpg">
                    </div>

                    <div class="col-xs-12" style="margin-left: 165px;">
                        * 패키지 구성에 포함된 내용 이상의 추가 서비스는 아래 추가 옵션에 작성해 주세요.
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="extraOptionsExampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog modal-position" role="document" style="width: 696px;">
        <div class="modal-content">
            <div class="modal-body padding-all-20">
                <div class="row">
                    <i class="fa fa-close package-example-close" aria-hidden="true" data-dismiss="modal" aria-label="Close"></i>


                    <h2 class="text-center margin-top-50">추가 옵션 노출 예시</h2>
                    <h4 class="text-center font-color-lighter">추가 옵션 작성시 의뢰인에게 보여지는 화면 입니다.</h4>

                    <div class="col-xs-12 text-center">
                        <img src="<%=ContextPath %>/css/image/extra_options_example.jpg">
                    </div>

                    <div class="col-xs-12 margin-left-15">
                        <i class="fa fa-check color-dark-yellow-400"></i> <strong>추가 옵션이란?</strong><br>
                        기본패키지 구성에 포함된 내용 이상의<br>
                        추가 금액이 요구되는 상황 및 금액입니다.<br>
                        의뢰인은 <strong>[주문하기]</strong> 페이지 에서 옵션을 추가로 구매 할 수 있습니다.<br>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<!-- 계산기 modal -->
<div class="modal fade modal-square" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div id="profitsCalculatorModal" class="momodal modalal modal-dialog modal-position" style="width:725px" role="document">
        <div class="modal-content border-none border-radius-0 bg-color-black position-relative">
            <button type="button" class="position-absolute top-20 right-5" style="z-index: 1" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="closeModal">×</span></button>
            <div class="row">
                <div class="col-xs-3">
                    <div class="padding-left-25 padding-top-25">
                        <h2 class="color-white line-height" id="myModalLabel">전문가<br>수익금 계산기</h2>
                    </div>
                </div>
                <div class="col-xs-9 bg-color-white padding-side-0">
                    <div class="modal-body padding-top-60">
                        <div class="row">
                            <div class="col-xs-12 padding-side-30">
                                <div class="row margin-top-15">
                                    <div class="col-xs-12">
                                        <div class="padding-bottom-35">
                                            <span class="NGB">거래 완료 금액</span>
                                            <div class="input-group margin-top-10 position-relative width-100">
                                                <input id="kmongProfitsCal" placeholder="0" type="text" maxlength="12" class="form-control single-form-group width-100 padding-right-40 radius-none" autocomplete="off">
                                                <div class="position-absolute top-15 right-20" style="z-index: 11">
                                                    <img class="width-15px margin-right-10 cursor" src="<%=ContextPath %>/css/image/profits_cal_icon.png" style="">
                                                    <span>원</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12">
                                        <table class="profits-table padding-bottom-40 width-100">
                                            <tbody><tr>
                                                <td class="text-left width-35">금액</td>
                                                <td class="text-center width-30">수수료</td>
                                                <td class="text-right width-35">전문가 수익</td>
                                            </tr>

                                            <tr>
                                                <td>1 원~ 500,000 원</td>
                                                <td>20%</td>
                                                <td class="NGB">13,332원</td>
                                            </tr><tr>
                                                <td>500,001 원~ 1,000,000 원</td>
                                                <td>10%</td>
                                                <td class="NGB">0원</td>
                                            </tr><tr>
                                                <td>1,000,001 원~ </td>
                                                <td>5%</td>
                                                <td class="NGB">0원</td>
                                            </tr>
                                        </tbody></table>
                                    </div>
                                </div>
                                <div class="row padding-top-25 padding-bottom-30">
                                    <div class="col-xs-4 padding-top-5"><span class="NGB">전문가 총 수익</span></div>
                                    <div class="col-xs-8 text-right">
                                        <span class="font-size-h1 NGB color-red">13,332원</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



					</div>   <!-- 없는거 -->
            </div>	<!-- 스타일 -->
        </div>  <!-- 기그폼컨테이너 -->
    </div>  <!-- 기그폼 -->
</div>
</div>
</form>
<script type="text/javascript" src="https://wcs.naver.net/wcslog.js"> </script>
<%@ include file = "../inc/footer/footer.jsp" %>
</body>
<script>
	$(function (){
		$("#exam1").click(function(){
			$("#packagesExampleModal").prop("aria-hidden","false").prop("display","block");
		});
	});
	
</script>
<script>
	
</script>
<script>
            $(function(){
            	$("#page_1").click(function(){
            		$('.sub').attr('action','index.do').submit();
            	});	     
            	
            	$("#next, #page_3").click(function(){
            		$('.sub').attr('action','page3Cookie.do').submit();
            	});	
            	
            	$("#page_4").click(function(){
            		$('.sub').attr('action','page4Cookie.do').submit();
            	});	
            	
            	$("#page_5").click(function(){
            		$('.sub').attr('action','page5Cookie.do').submit();
            	});	
            	
            	$("#back").click(function(){
            		$('.sub').attr('action','page1Cookie.do').submit();
            	});
            	$("#store").click(function(){
            		$(this).attr("type","button");
            		alert("임시저장완료!!");
            	});
            });
</script>
</html>