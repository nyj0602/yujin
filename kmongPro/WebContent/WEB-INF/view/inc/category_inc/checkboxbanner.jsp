<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.util.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div id="metadataSliderContainer" class="container position-relative fade-transition" style="">

            <div id="openedMetadataSlider" class="row">
                
                <div class="col-xs-12">
                    <div class="panel panel-default border-radius-0 margin-none">
                        <div class="panel-body">
                            <div id="metaDataCarousel" class="carousel slide" data-ride="carousel" data-interval="false">
                                <div class="row">
                                    <div class="col-xs-6">
                                        <ol class="carousel-indicators margin-bottom-0">
                                            <li class="position-relative active"></li><li class="position-relative"></li><li class="position-relative"></li><li class="position-relative"></li><li class="position-relative"></li>
                                        </ol>
                                    </div>
                                    <div class="col-xs-6 text-right padding-right-20">
                                        

                                        <button type="button" class="close" style="margin-top: -10px"><span aria-hidden="true">×</span></button>
                                    </div>
                                </div>

                                <!-- Wrapper for slides -->
                                <div class="carousel-inner" role="listbox">
                                <c:forEach items="${checkboxName}" var="dto3">
                                    <div class="item" style="height: 100px;" data-index="0">
                                        <div class="row">
                                            <div class="col-xs-2 padding-right-0">
                                                <h3 class="NGB line-height margin-top-0 margin-bottom-5">                                                    ${dto3.c_group}                                                </h3>
                                                <h6 class="margin-all-0 font-color-light line-height">                                                    원하는 목소리의 ${dto3.c_group}을 선택해주세요.                                                </h6>
                                            </div>
                                            <div class="col-xs-10">

                                                <div class="row margin-left-0 margin-right-0">

                                                   <c:forEach items="${checkboxList}" var="dto">
                                                            <c:if test="${dto3.c_id eq dto.c_superid }">
                                                    <div class="col-xs-2 padding-left-5 padding-right-5">
                                                        <div class="text-center bg-color-white" id="gigData_${dto.c_id} _slider">
                                                            <h5 class="margin-all-0" >${dto.c_group}</h5><input type='hidden' name='checked' value='${dto.c_id }'${fn:contains(check, dto.c_id )? "checked":""}>
                                                        </div>
                                                    </div>
                                                            </c:if>
                                                    </c:forEach>
                                                    
                                                    
                                                </div><!-- row margin-left-0 margin-right-0 -->

                                                
                                            </div><!-- col-xs-10 -->
                                        </div><!-- row -->
                                    </div><!-- item active -->
                                    
                          </c:forEach>          
						<span>
                                <div class="row">
                                    <div class="col-xs-2"></div>
                                    <div class="col-xs-10 padding-left-20 padding-right-20">
                                        <div class="row">
                                            <div class="col-xs-6 text-left">
                                                <h5 class="margin-bottom-0" >
                                                    <a class="plain-color-lighter" href="javascript:void(0);">
                                                        <!-- <i class="fa fa-arrow-circle-left" aria-hidden="true"></i> -->
                                                        <span style="display: none;" class="prev">이전&nbsp;</span>
                                                    </a>
                                                </h5>
                                            </div>
                                            <div class="col-xs-6 text-right">
                                                <h5 class="margin-bottom-0" style="">
                                                    <a class="plain plain-color-lighter" href="javascript:void(0);">
                                                        <!-- <span style="" class="jump">건너뛰기&nbsp;</span> -->
                                                        <span style="" class="next">다음&nbsp;</span>
                                                    </a>
                                                </h5>

                                                <h5 class="margin-bottom-0" style="display: none;">
                                                    
                                                    <a class="link-color-blue" href="javascript:void(0);">
                                                        <span style="display: none;" class="submit">선택결과보기</span>
                                                    </a>
                                                </h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </span>    
                                
                            </div><!-- carousel-inner -->
                        </div>
                    </div>
                </div>
            </div><!-- open -->
            
            
            
        </div><!-- metadataSliderContainer -->
      </div>
      <br>  
        
        <script>
        $(function () {
			$(".item").first("div").attr("class","item_active");
			$('div.text-center').has('.margin-all-0').attr("class","text-center bg-color-white category-metadata-card border-solid vertical-align-middle cursor border-radius-0");
			
			$(".close").on('click',function(){
				$("#openedMetadataSlider").css("display","none");
			});
			$("h5.margin-all-0").on('click',function(){
				$(this).parent().toggleClass("active")
				/* $("span.jump").css("display","none");
				$("span.next").css("display","block"); */
			});
			
			$("span.next, span.jump").on('click',function(){
				$(".item_active").attr("class","item").next().attr("class","item_active");
				$(".prev").css("display","block");
			});
			
			$("span.prev").on('click',function(){
				$(".item_active").attr("class","item").prev().attr("class","item_active");
			});
	
			
			
			if($("div.carousel-inner:nth-last-child(2)").is("class","item_active")===true) {
					$(".prev").css("display","none");
					$(".next").css("display","none");
					$("span.submit").css("display","block")
					 alert("test");
				// 속성값이 존재함.

				}


			
		/* 	$("div.carousel-inner:nth-last-child(1)").has(".item_active") */
			
			
		});//function
        
        </script>
  