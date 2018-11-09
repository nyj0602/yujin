<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="subject" content="크몽 - 당신의 비즈니스를 도와드립니다 " />
<meta name="keywords" content="재능기부, 재능마켓, 재능기부사이트, 웹에이전시, 재택알바사이트, 자택알바, 직장인투잡알바, 창업사이트, 재택부업, 부업사이트, 재택근무알바, 직장인부업">
<meta name="description" content="디자인, 마케팅, 프로그래밍, 영상제작 등 각 분야 5천 여명의 전문가들이 비즈니스에 도움을 드립니다.">
<title>구매관리 크몽 - 당신의 비즈니스를 도와드립니다</title>


<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="../css/kmong-99952b2854.master_desktop.css" rel="stylesheet">
<link href="../css/kmong_desktop_v2-6ec7c3f31e.css" rel="stylesheet">
<link href="../css/kmong_fonts.css?v=1.1" rel="stylesheet">
<link href="../css/mykmong_main.css" rel="stylesheet">
<link href="../css/kmong_buy.css" rel="stylesheet">
<link rel="shortcut icon" href="../image/favicon.ico">
<link href="../css/bootstrap-datepicker3.css" rel="stylesheet">
<script src="../js/bootstrap-datepicker.js"></script>
<script src="../js/aws-sdk-2.165.0.min.js"></script>
<script src="../js/kmong-c7448f76b7.dynamo.js"></script>
<script src="../js/buildV63.js"></script>
<script src="../js/dropzone.js"></script>
<script src="../js/fbevents.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script></head>
<body>

<div class="gradient-black padding-bottom-100">
        <div class="container">

            <div class="row">
                <div class="col-xs-12 text-center color-white">
                    <h2 class="margin-bottom-0 margin-top-75 report-line-height">정의로운 크몽인 여러분!<br>직거래 권유 및 불법 홍보 메시지를 받았다면<br>크몽에 알려주세요!</h2>
                    <h5 class="margin-top-40 NGL text-style">정의로운 크몽인에게는 크몽 안전 결제서비스를 이용하여 거래할 수 있도록<br><b>크몽캐시 1만원</b>을 지급하여드립니다!</h5>

                </div>
            </div>
        </div>
</div>

<div class="container referral-position position-relative">
        <div class="row">
            <div class="col-xs-2">
                &nbsp;
            </div>
            <div class="col-xs-8">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="row margin-bottom-10">
                                    <div class="col-xs-12">
                                        <div class="NGB font-size-h4">직거래 유도 및 불법홍보 신고 작성란</div>
                                    </div>
                                </div>
                                <div class="panel panel-default margin-all-0 border-radius-0">
                                <form id="report" action="#">
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-xs-3">
                                                <h5 class="margin-top-0">기본 제공 정보</h5>
                                            </div>
                                            <div class="col-xs-9 padding-left-0">
                                                <div class="row">
                                                    <div class="col-xs-6 padding-left-0">
                                                        <h6 class="font-color-light margin-top-0">본인</h6>
                                                        <input id="reportFromMember" class="form-control input-sm" type="text" placeholder="닉네임" value="${name }" disabled="">
                                                    </div>

                                                    <div class="col-xs-6 padding-left-0">
                                                        <h6 class="font-color-light margin-top-0">상대방</h6>
                                                        <input id="reportToMember" name="nick" class="form-control input-sm" type="text" placeholder="닉네임" value="">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row margin-top-20">
                                            <div class="col-xs-3">
                                                <h5 class="margin-top-0 report-line-height">직거래 권유 혹은<br>불법홍보내용</h5>
                                            </div>
                                            <div class="col-xs-9 padding-left-0">
                                                <div class="row">
                                                    <div class="col-xs-12 padding-left-0">
                                                        <textarea id="reportDesc" name="content" class="form-control report-textarea" placeholder="직거래 권유 혹은 불법홍보 내용을 간단히 적어주세요" rows="5"></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row margin-top-20">
                                            <div class="col-xs-3">
                                                <h5 class="margin-top-0">근거자료 첨부</h5>
                                            </div>
                                            <div class="col-xs-9 padding-left-0">
                                                <div class="row">
                                                    <div class="col-xs-12 upload_complete"></div>

                                                    <div class="col-xs-6">
                                                        <input class="btn btn-default btn-xss" name="files" id="evidence_file" type="file" name="file" data-url="https://kmong.com/upload" data-filename-placement="inside">
                                                    </div>

                                                    <input id="attached_file" type="hidden">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </form>
                                </div>
                                <div class="row margin-top-35 margin-bottom-15">
                                    <div class="col-xs-4 text-center col-xs-center">
                                        <a id="reportToKmong" class="btn btn-primary btn-block" role="button">신고하기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                
                <script type="text/javascript">
                
                $(function (){
                	
                	$('#cancelok').on("click", function (){
        				$('#r_body').css("display", "none");
        				$('#r_back').css("display", "none");
                		
                	});
                	
                	
                	
                	$('#reportToKmong').on("click", function (event){
                	
                		
                		if( $('#reportToMember').val() == "" || $('#reportDesc').val() == "") {
                			console.log("asdf");
                			location.reload();
                			event.preventDefault();
                		}
     					
                		var params = $('#report').serialize();

                		
                		$.ajax({
                			
                			url:"reportset.do",
                			dataType:'json',
                			type:'post',
                			data:params,
                			success:function(data){
                				
                				$('#r_body').css("display", "block");
                				$('#r_back').css("display", "block");
                				
                			}
                			});
                		
                	});
                	
                });
                
                
                </script>
                
                
                <div class="row margin-top-10">
                    <div class="col-xs-12">
                        <dl>
                            <dt class="font-color-light NGB">
                                <i class="fa fa-exclamation-circle" aria-hidden="true"></i>
                                &nbsp;
                                꼭! 결제는 크몽 시스템 안에서!
                            </dt>
                            <dd class="font-color-lighter">
                                크몽 회원님들 모두 한분한분 소중하기에 크몽은 여러분들을 보호해드리고 싶어요.<br>
                                불법홍보 혹은 직거래 권유를 받았다면 정의로은 크몽인은 상대방 닉네임 ,증빙자료(문자내용,대화내역,통화
                                녹음 내역 등)을 첨부하여 크몽으로 알려주세요!
                            </dd>
                        </dl>
                    </div>
                </div>
            </div>
        </div>
    </div>


<div id="r_back" class="sweet-overlay" tabindex="-1" style="opacity: 1.06; display: none;"></div>
<div id="r_body" class="sweet-alert showSweetAlert visible" data-custom-class="" data-has-cancel-button="false" data-has-confirm-button="true" data-allow-outside-click="false" data-has-done-function="true" data-animation="pop" data-timer="null" style="display: none; margin-top: -175px;"><div class="sa-icon sa-error" style="display: none;">
      <span class="sa-x-mark">
        <span class="sa-line sa-left"></span>
        <span class="sa-line sa-right"></span>
      </span>
    </div><div class="sa-icon sa-warning" style="display: none;">
      <span class="sa-body"></span>
      <span class="sa-dot"></span>
    </div><div class="sa-icon sa-info" style="display: none;"></div><div class="sa-icon sa-success animate" style="display: block;">
      <span class="sa-line sa-tip animateSuccessTip"></span>
      <span class="sa-line sa-long animateSuccessLong"></span>

      <div class="sa-placeholder"></div>
      <div class="sa-fix"></div>
    </div><div class="sa-icon sa-custom" style="display: none;"></div><h2>신고 접수</h2>
    <p style="display: block;">신고가 접수되었습니다.</p>
    <fieldset>
      <input type="text" tabindex="3" placeholder="">
      <div class="sa-input-error"></div>
    </fieldset><div class="sa-error-container">
      <div class="icon">!</div>
      <p>Not valid!</p>
    </div><div class="sa-button-container">
   
      <div class="sa-confirm-button-container">
        <button id="cancelok" class="confirm" tabindex="1" style="display: inline-block; background-color: rgb(140, 212, 245); box-shadow: rgba(140, 212, 245, 0.8) 0px 0px 2px, rgba(0, 0, 0, 0.05) 0px 0px 0px 1px inset;">확인</button><div class="la-ball-fall">
          <div></div>
          <div></div>
          <div></div>
        </div>
      </div>
    </div></div>

</body>
</html>