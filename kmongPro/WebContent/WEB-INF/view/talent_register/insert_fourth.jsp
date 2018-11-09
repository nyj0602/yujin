<%@page import="java.io.File"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");

  String p_service_content = request.getParameter("service_content");
  String p_AS_context = request.getParameter("AS_context");
  
  Cookie cookie_service_content = 
		    new Cookie("service_content",URLEncoder.encode(p_service_content, "UTF-8"));
cookie_service_content.setPath("/");
cookie_service_content.setMaxAge(-1);
response.addCookie(cookie_service_content);

Cookie cookie_AS_context = 
  		new Cookie("AS_context",URLEncoder.encode(p_AS_context, "UTF-8"));
cookie_AS_context.setPath("/");
cookie_AS_context.setMaxAge(-1);
response.addCookie(cookie_AS_context);
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
	#page_4{
		border-bottom: 4px solid #ffd400;
	}
	#page_1, #page_2, #page_3, #page_5{
		border-bottom: none;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	/* function gigMainImageThumbnail(value){
		alert("zz");
	}
		*/
		
		
	
$(function(){
	$("#gigMainImageDiv").change(function(value){
		alert("zz");
	if(value.files && value.files[0]){
		var reader = new FileReader();
		reader.onload = function(e){
			alert("hhh");
			$("#gigMainImageThumbnail").attr('src',e.target.result).prop("display","block");
			$("#gigMainImageDiv").prop("display","none");
		}
		reader.readAsDataURL(value.files[0]);
	}
	});
	
	$("#gigImage_1").change(function(){
		//$("#imgp").append("<input class='gigImage_1 gigDetailImageUpload' name='file' type='file' data-index='1' id='gigImage_1 "+ index  + "'>" ");
		$("#imgppp").children(":eq(0)").clone().appendTo("#imgppp").css("display","block");
	});
	
	$("#userLicense_0").change(function(){
		$("#movieppp").children(":eq(0)").clone().appendTo("#movieppp").css("display","block");
	});
	
});
	 
</script>

<script type="text/javascript">
var InputImage = 
 (function loadImageFile() {
    if (window.FileReader) {
        var ImagePre; 
        var ImgReader = new window.FileReader();
        //var fileType = /^(?:image\/bmp|image\/gif|image\/jpeg|image\/png|image\/x\-xwindowdump|image\/x\-portable\-bitmap)$/i; 
 
        ImgReader.onload = function (Event) {
            if (!ImagePre) {
                var newPreview = document.getElementById("gigMainImageThumbnail");
                ImagePre = new Image();
                //ImagePre.style.width = "200px";
                //ImagePre.style.height = "140px";
                newPreview.appendChild(ImagePre);
                $("#gigMainImageLink").css("display","none");
                $("#gigMainImageThumbnail").css("display","block");
            }
            ImagePre.src = Event.target.result;
            
        };
        return function(){
         
            var img = document.getElementById("gigMainImageUpload").files;
           
            if (!fileType.test(img[0].type)) { 
             alert("이미지 파일을 업로드 하세요"); 
             return; 
            }
            
            ImgReader.readAsDataURL(img[0]);
        }
 
    }
            document.getElementById("gigMainImageThumbnail").src = document.getElementById("gigMainImageUpload").value;
 
});
</script>
</head><jsp:include page="/WEB-INF/view/inc/header/header_lmain.jsp"></jsp:include>

			<jsp:include page="/WEB-INF/view/inc/header/header_category.jsp"></jsp:include>
<body id="master_body" class="wysihtml5-supported" style="cursor: default;">
<% String ContextPath = request.getContextPath(); %>

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
    
    <div  class="col-xs-9">
        <div class="panel panel-default">
            <ul class="list-group panel-list-group-only">
                <li class="gig-form-list-group-item gigFormTooltip">
                    <div class="row">
                        <div class="col-xs-3">
                            <h5 class="margin-none">메인 이미지 등록</h5>
                            <a href="https://kmong.groovehq.com/knowledge_base/topics/imijineun-eoddeon-geol-deungroghaeyahanayo" target="_blank" class="font-size-h6 plain link-color-blue text-underline">
                                <b>이미지 가이드라인</b>
                            </a>
                        </div>
                        
                        <div class="col-xs-9">
                            <div class="position-relative">
                                
                                <div class="image-delete-btn" style="display: none;">
                                    <span class="fa fa-close"></span>
                                </div>
								
								
								
								
                                <div id="gigMainImageDiv" class="gig-form-main-image-body has-error">
                                    <label id="gigMainImageLink" for="gigMainImageUpload" class="cursor label-margin-none">
                                    	
                                        <div class="text-center gig-form-main-image">
                                            <i class="fa fa-picture-o width-100px"></i>
                                            <h5>
                                                <b class="line-height">652 * 488 px 사이즈의<br>
                                                    메인 이미지를 등록해 주세요</b>
                                            </h5>
                                            <h6 class="font-color-lighter">
                                                (5MB 이하의 jpg, jpeg, png 형식)
                                            </h6>
                                        </div>
                                    </label>
                                    <div id="gigMainImageLoader" class="gig-form-main-image text-center" style="display: none">
                                        <div class="la-ball-fall color-black margin-top-45 margin-bottom-85"><div></div><div></div><div></div></div>
                                    </div>
                                    
		
		
									
                                    <img id="gigMainImageThumbnail" class=" gig-form-main-preview-image-body" style="display: none">
                                    <input id="gigMainImageUpload" name="upload" type="file" style="display: none">
                                     <!-- onchange="gigMainImageThumbnail(this);" -->
                                    <!-- <input id="gigMainImageUpload" name="file" type="file" style="display:none"> -->
                                    <input type="hidden" value="">	
                                    <input type="hidden" id="gigMainImageBase64">
									
<!-- 
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <span class="gigMainImage-error gig-form-help-block color-danger font-size-h6 margin-top-5"><i class="fa fa-exclamation-triangle font-size-h6 color-danger "></i>&nbsp;서비스 메인 이미지를 등록해주세요.</span>
                                        </div>
                                    </div>
 -->
                                </div>
                                

                            </div>
                        </div>

                        <div class="division-for-tooltip"></div>
                        <div class="gig-form-tooltip" style="display: none;">
                            <div class="gig-form-tooltip-square"></div>
                            <div class="gig-form-tooltip-body">
                                <h5 class="margin-bottom-20">
                                    <i class="fa fa-info-circle" aria-hidden="true"></i>
                                    <b>이미지 등록</b>
                                </h5>
                                <div>
                                    <img src="<%= ContextPath %>/css/image/image_description.png" style="margin-left: -7px ">
                                </div>
                                <ul class="gig-form-tooltip-text">
                                    <li>메인 이미지: 652*488px (4:3 비율 권장)</li>
                                    <li>메인 이미지(필수) 포함, 총 10장의 이미지를 등록할 수 있습니다.</li>
                                    <li>상세 이미지는 상세페이지 하단에 순차적으로 노출됩니다.</li>
                                    <li>사용 제한 이미지</li>
                                    <li style="list-style: none">저작권법(97조6항)의거 무단복제,<br> 도용된 이미지</li>
                                    <li style="list-style: none">광고, 홍보성 텍스트 및<br> 개인정보가 포함된 이미지</li>
                                    <li style="list-style: none">선정적이거나 혐오, 엽기적인 이미지</li>
                                    <li style="list-style: none">해상도가 낮은 이미지 &nbsp;
                                        <a class="link-color-blue NGB" target="_blank" href="https://kmong.groovehq.com/knowledge_base/topics/imijineun-eoddeon-geol-deungroghaeyahanayo">자세히보기</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>


<!-- 상세이미지 등록 부분 -->
                    <div id="gigSubImagesDiv" class="row margin-top-40">
                        <div class="col-xs-3">
                            상세 이미지 등록<span class="font-size-h6 font-color-lighter">&nbsp;(선택)</span>
                            <h6 class="margin-top-5 margin-left-5" style="display: none;">
                                <a href="javascript:void(0);" onclick="$('#documentGuideModal').modal({backdrop: 'static', keyboard: false})">가이드라인 보기</a>
                            </h6>
                        </div>
                        <div class="col-xs-9">
                            <div class="row">
                                <div class="col-xs-12">
                                    <h6 class="font-color-lighter header-margin-none">                                         0&nbsp;/&nbsp;9                                        <span class="font-size-h6 font-color-lighter" style="display: none;">&nbsp;(&nbsp;<span class="color-primary">3</span>개 필수&nbsp;)</span>
                                        <span class="font-size-h6 font-color-lighter" style="display: none;">&nbsp;(&nbsp;<span class="color-primary">1</span>개 필수&nbsp;)</span>
                                        <span class="font-size-h6 font-color-lighter" style="display: none;">&nbsp;(&nbsp;<span class="color-primary">1</span>개 필수&nbsp;)</span>
                                    </h6>
                                </div>
                            </div>
                            <div id="imgppp" class="row sub-images-wrapper position-relative">
                                <div id="imgpp" class="col-xs-4">
                                	
                                	<div id="imgp" class="imgplus position-relative" style="display: none;" >
                                        <div class="sub-image-delete-btn" style="display: none;">
                                            <span class="fa fa-close"></span>
                                        </div>

                                        <label  id="imgup" class="gigImage_1Link cursor label-margin-none" for="gigImage_1">
                                            <div class="text-center gig-form-main-sub-image-body">
                                                <img class="width-25px padding-top-45" src="<%=ContextPath %>/css/images/ic_plus.png">
                                            </div>
                                        </label>
                                        <div class="gigImage_1Loader text-center gig-form-main-sub-image-body" style="display: none">
                                            <div class="la-ball-fall color-black margin-top-45"><div></div><div></div><div></div></div>
                                        </div>

                                        <img class="gigImageThumbnail_1 gig-form-main-sub-preview-image-body" src="<%=ContextPath %>/css/image/ic_plus.png" style="display: none">
                                        
                                        <!-- <input class='gigImage_1 gigDetailImageUpload' name='file' type='file' data-index='1' id='gigImage_1'> -->
                                    </div>
                                    
                                    <div class="imgplus position-relative">
                                        <div class="sub-image-delete-btn" style="display: none;">
                                            <span class="fa fa-close"></span>
                                        </div>

                                        <label  class="gigImage_1Link cursor label-margin-none" for="gigImage_1">
                                            <div class="text-center gig-form-main-sub-image-body">
                                                <img class="width-25px padding-top-45" src="<%= ContextPath %>/css/image/ic_plus.png">
                                            </div>
                                        </label>
                                        <div class="gigImage_1Loader text-center gig-form-main-sub-image-body" style="display: none">
                                            <div class="la-ball-fall color-black margin-top-45"><div></div><div></div><div></div></div>
                                        </div>

                                        <img class="gigImageThumbnail_1 gig-form-main-sub-preview-image-body" src="<%= ContextPath %>/css/image/ic_plus.png" style="display: none">
                                        
                                        <input class="gigImage_1 gigDetailImageUpload" name="file" type="file" data-index="1" id="gigImage_1" style="display:none">
                                    </div>
								</div>
								
                                  <!--   <script>
                                        $(document).ready(function(){
                                            gigDetailImageUpload();
                                        })
                                    </script> -->
                                
                            </div>
                            <span class="gigSubImages-error gig-form-help-block color-danger font-size-h6 hidden"><i class="fa fa-exclamation-triangle"></i>&nbsp;상세 이미지를 등록해주세요</span>
                            <span class="gigSubImageDocument-error gig-form-help-block color-danger font-size-h6 hidden"><i class="fa fa-exclamation-triangle"></i>&nbsp;문서 전달 서비스의 경우, 가이드라인에 맞는 상세 이미지를 등록해주세요.</span>
                        </div>
                    </div>
                </li>

                <li class="gig-form-list-group-item gigFormTooltip" style="display: none;">
                    <div id="gigSubImagesDiv" class="row margin-top-40">
                        <div class="col-xs-3">
                            변호사 자격증
                            <div class="row margin-top-5">
                                <div class="col-xs-12">
                                    <h6 class="header-margin-none font-color-lighter">승인을 위해서만 사용되며,<br> 서비스 상세 페이지에는 노출되지 않습니다.</h6>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-9">
                            <div class="row">
                                <div class="col-xs-12">
                                    <h6 class="font-color-lighter header-margin-none">                                        0&nbsp;/&nbsp;1                                    </h6>
                                </div>
                            </div>

                            <div class="row sub-images-wrapper position-relative">
                                <div class="col-xs-4">
                                    <div class="position-relative">
                                        <label class="cursor label-margin-none" id="userLicense_0Link" for="userLicense_0">
                                            <div class="text-center gig-form-main-sub-image-body">
                                                <img class="width-25px padding-top-45" src="<%= ContextPath %>/css/image/ic_plus.png">
                                            </div>
                                        </label>
                                        <div class="text-center gig-form-main-sub-image-body" style="display: none" id="userLicense_0Loader">
                                            <div class="la-ball-fall color-black margin-top-45"><div></div><div></div><div></div></div>
                                        </div>

                                        <div class="text-center gig-form-main-sub-image-body position-relative" style="display: none" id="userLicense_0Completed">
                                            <div class="checkmark-circle margin-top-25">
                                                <div class="background"></div>
                                                <div class="checkmark draw"></div>
                                            </div>
                                            <div class="sub-image-delete-btn" style="display: none;">
                                      	          <span class="fa fa-close"></span>
                                            </div>
                                        </div>

                                        <input class="userLicenseImageUpload" name="file" type="file" style="display: none" id="userLicense_0" data-index="0">
                                    </div>

                                  <!--   <script>
                                        $(document).ready(function(){
                                            userLicenseImageUpload();
                                        })
                                    </script> -->
                                </div>
                            </div>
                        </div>

                        <div class="division-for-tooltip"></div>
                        <div class="gig-form-tooltip" style="display: none;">
                            <div class="gig-form-tooltip-square"></div>
                            <div class="gig-form-tooltip-body">
                                <h5 class="margin-bottom-20">
                                    <i class="fa fa-info-circle" aria-hidden="true"></i>
                                    <b>변호사 자격증</b>
                                </h5>
                                <ul class="gig-form-tooltip-text">
                                    <li>법률 자문 서비스는 변호사 자격증을 첨부해주셔야합니다. </li>
                                    <li>첨부해주신 자료는 크몽 서비스 승인팀에만 공개되며, 의뢰인 또는 서비스 상세페이지에는 공개되지 않습니다. </li>
                                    <li>자격증 내용이 가려지거나 또렷하게 확인되지 않는 경우, 서비스 승인이 거절될 수 있습니다.</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </li>


                <li class="gig-form-list-group-item gigFormTooltip">
                    <div class="row">
                        <div class="col-xs-3">
                            동영상 등록<span class="font-size-h6 font-color-lighter">&nbsp;(선택)</span>
                        </div>
                        <div class="col-xs-9">
                            <div class="row">
                                <div class="col-xs-12">
                                    <h6 class="font-color-lighter header-margin-none">                                        0&nbsp;/&nbsp;6                                    </h6>
                                </div>
                            </div>
                            <div id="movieppp" class="row sub-images-wrapper position-relative">
                                <div class="col-xs-4">
                                    <div class="position-relative">
                                        <label class="cursor label-margin-none" id="gigVideoUpload_0Link" for="gigVideoUpload_0">
                                             <div class="text-center gig-form-main-sub-image-body margin-bottom-5">
                                                <img class="width-25px padding-top-45" src="<%= ContextPath %>/css/image/ic_video.png">
                                                <h6 class="font-color-lighter">
                                                    (250MB 이하 avi, mp4 파일)
                                                </h6>
                                            </div>
                                        </label>
                                        <div class="text-center gig-form-main-sub-image-body" style="display: none" id="gigVideoUpload_0Loader">
                                            <div class="la-ball-fall color-black margin-top-45"><div></div><div></div><div></div></div>
                                            <div class="">
                                                업로드 중입니다.
                                            </div>
                                        </div>
                                        <div class="text-center gig-form-main-sub-image-body position-relative" style="display: none" id="gigVideoUpload_0Completed">
                                            <div class="checkmark-circle margin-top-25">
                                                <div class="background"></div>
                                                <div class="checkmark draw"></div>
                                            </div>
                                            <div class="margin-top-5">
                                                <h6 class="padding-left-15 padding-right-15">video.mp4</h6>
                                            </div>
                                            <div class="sub-image-delete-btn" style="display: none;">
                                                <span class="fa fa-close"></span>
                                            </div>
                                        </div>

                                        <input class="gigVideoUpload" name="file" type="file" style="display: none" id="gigVideoUpload_0" data-index="0">
                                    </div>
                                    <!-- <script>
                                        $(document).ready(function(){
                                            gigVideoUpload();
                                        })
                                    </script> -->
                                </div>
                            </div>
                        </div>

                        <div class="division-for-tooltip"></div>
                        <div class="gig-form-tooltip" style="display: none;">
                            <div class="gig-form-tooltip-square"></div>
                            <div class="gig-form-tooltip-body">
                                <h5 class="margin-bottom-20">
                                    <i class="fa fa-info-circle" aria-hidden="true"></i>
                                    <b>동영상 등록</b>
                                </h5>
                                <ul class="gig-form-tooltip-text">
                                    <img class="width-100 padding-bottom-10" src="<%= ContextPath %>/css/image/img_video_tooltip.png">
                                    <li>첨부 가능한 최대 용량은 250M입니다.</li>
                                    <li>영상 파일은 avi, mp4를 지원합니다.</li>
                                    <li>개인 연락처 혹은 홍보 동영상은 등록이 불가능합니다.</li>
                                    <li>크몽팀의 승인을 거쳐 의뢰인에게 노출됩니다.</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </li>

            </ul>
        </div>
        <div class="row">
            <div class="col-xs-3">
                <button id="back" class="btn btn-default width-70 btn-sm">뒤로</button>
            </div>
            
            <div class="col-xs-offset-5 col-xs-4">
                <button id="next" class="btn btn-black btn-block">다음단계</button>
            </div>
            
        </div>
    </div>

    <div class="col-xs-3 margin-top-20"></div>
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
            		//$('enctype','multipart/form-data')
            		
            	});	
            	
            	$("#page_3").click(function(){
            		$('.sub').attr('action','page3Cookie.do').submit();
            	});	
            	
            	$("#next, #page_5").click(function(){
            		$('.sub').attr('action','page5Cookie.do').submit();
            	});	
            	
            	$("#back").click(function(){
            		$('.sub').attr('action','page3Cookie.do').submit();
            	});
            	$("#store").click(function(){
            		$(this).attr("type","button");
            		alert("임시저장완료!!");
            	});
            	
            });
</script>
</html>