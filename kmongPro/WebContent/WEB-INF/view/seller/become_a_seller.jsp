<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>2018. 2. 21. - 오후 7:46:14</title>
 <style>
    .global-body {
        margin-top: 0px !important;
    }
</style>
<link rel="stylesheet" href="css/kmong_desktop_v2-6ec7c3f31e.css"
	type="text/css">
<link rel="stylesheet" href="css/kmong-8888b96a4a.master_desktop.css" type="text/css">
<link rel="stylesheet" href="css/kmong_fonts.css" type="text/css">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  $(document).ready(function () {

  $('#quickMenuTop').click(function() {
      $('html, body').animate({
          scrollTop : 0
      }, 400);
      return false;
  });
  
	var mknav = $('#mainKmongNavBar');
	$(window).scroll(function() {
		if ($(this).scrollTop() > 750) {
			mknav.css("display", "block");
			mknav.addClass("f-nav");
		} else {
			mknav.css("display", "none");
			mknav.removeClass("f-nav");
		}
	});

  
});
  </script>

</head>
<body id="master_body">
<jsp:include page="/WEB-INF/view/inc/header/header.jsp"></jsp:include>
<div class="global-body">


    <nav id="mainKmongNavBar" class="navbar navbar-fixed-top" style="display: none">
        <div class="header-yellow bg-color-yellow-400">
            <div class="container">
                <div class="row">
                    <div class="col-xs-6 padding-top-10 padding-bottom-10">
                        <ul class="list-inline margin-bottom-0 margin-top-5">

                            

                            <li class="pull-left header-logo-align">
                                <a class="margin-top-5 inline-block" href="https://kmong.com">
                                    <img class="width-100px" src="css/image/kmong_logo_20170518.png" title="당신의 '일'을 해결해줄 전문가들이 있는 곳, 서비스 마켓플레이스 크몽 ( Kmong )">
                                </a>
                            </li>

                        </ul>
                    </div>

                                            
                        <div class="col-xs-6 padding-top-10 padding-bottom-10">

                            <ul class="list-inline margin-all-0 pull-right">
                                <li class="position-relative" style="top: 2px;">
                                    <a class="plain" href="http://localhost:8080/kmongPro/index.do">
                                        <h5>서비스등록하기</h5>
                                    </a>
                                </li>

                                <li class="position-relative" style="top: 2px;">
                                    <a class="plain" href="http://localhost:8080/kmongPro/index.do">
                                        <h5>로그인</h5>
                                    </a>
                                </li>

                                <li class="position-relative">
                                    <a class="btn btn-black-reverse btn-sm" href="http://localhost:8080/kmongPro/signup.do">
                                        무료 회원가입
                                    </a>
                                </li>
                            </ul>
                        </div>
                                    </div>
            </div>
        </div>
    </nav>

    <div class="become-seller">
        <div class="become-seller-video">
            <video class="width-100" id="indexVideo" poster="https://d2v80xjmx68n4w.cloudfront.net/intro/c1a31243becb02fba269c3e290a7e652.jpg" autoplay="" loop="" muted="">
                <source src="https://d2v80xjmx68n4w.cloudfront.net/intro/c1a31243becb02fba269c3e290a7e652.mp4" type="video/mp4">
                <source src="https://d2v80xjmx68n4w.cloudfront.net/intro/c1a31243becb02fba269c3e290a7e652.webm" type="video/webm">
                <source src="https://d2v80xjmx68n4w.cloudfront.net/intro/c1a31243becb02fba269c3e290a7e652.ogv" type="video/ogv">
                <object>
                    <embed src="https://d2v80xjmx68n4w.cloudfront.net/intro/c1a31243becb02fba269c3e290a7e652.mp4" type="application/x-shockwave-flash" allowfullscreen="false" allowscriptaccess="always">
                </object>
            </video>
        </div>

        <script>
            $(document).ready(function(){
                document.getElementById('indexVideo').play();
            })
        </script>

        <div class="become-seller-main">
            <div class="container text-center">
                <div class="row margin-top-100">
                    <div class="col-xs-12 color-white">
                        <h2 style="font-size: 45px !important;" class="margin-none">전문성을 수익으로 만들어보세요</h2>
                        <h2 class="font-size-h1 margin-top-15 margin-bottom-0">크몽, 프리랜서를 위한 가장 완벽한 곳입니다</h2>
                    </div>
                </div>
                <div class="row margin-top-40">
                    <div class="col-xs-12">
                        <a class="btn btn-brand-yellow btn-sm" href="http://localhost:8080/kmongPro/index.do">서비스 등록하기</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="panel panel-default border-none box-shadow-default margin-none width-100 position-absolute become-seller-info">
                            <div class="padding-all-25">
                                <div class="row text-center">
                                    <div class="col-xs-4">
                                        <h5 class="margin-none">일 평균 서비스 등록</h5>
                                        <h2 class="margin-top-10 margin-bottom-0"><b>${todayservice } 건</b></h2>
                                    </div>
                                    <div class="col-xs-4 border-left border-right">
                                        <h5 class="margin-none">총 거래 건 수</h5>
                                        <h2 class="margin-top-10 margin-bottom-0"><b>${count } 건+</b></h2>
                                    </div>
                                    <div class="col-xs-4">
                                        <h5 class="margin-none">총 거래 금액</h5>
                                        <h2 class="margin-top-10 margin-bottom-0"><b>${sumprice } 원+</b></h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row margin-top-70">
                        <div class="col-xs-12">
                            <div class="become-seller-story-bg padding-top-30">
                                <div class="row">
                                    <div class="col-xs-12">
                                        <h2 class="margin-none text-center" style="font-size: 30px;">전문가들의 이야기를 직접 들어보세요!</h2>
                                    </div>
                                </div>
                                                                <div class="row  margin-top-85 ">
                                    <div class="col-xs-3  col-xs-offset-9 ">
                                        <div class="become-seller-story position-relative">
                                            <img class="width-100" src="css/image/seller_interview_21639.png">
                                            <ul class="position-absolute bottom-5 list-unstyled color-white">
                                                <li class="padding-right-10">
                                                    <img class="width-10px margin-right-5" src="css/image/ic_seller_story_li.png" alt="check">
                                                    <span class="NGL">전문분야</span> 로고디자인
                                                </li>
                                                <li class="padding-right-10">
                                                    <img class="width-10px margin-right-5" src="css/image/ic_seller_story_li.png" alt="check">
                                                    <span class="NGL">판매 완료 금액</span> 197,607,000원
                                                </li>
                                                <li class="padding-right-10">
                                                    <img class="width-10px margin-right-5" src="css/image/ic_seller_story_li.png" alt="check">
                                                    <span class="NGL">판매 완료 건수</span> 1,579건
                                                </li>
                                            </ul>
                                            <div class="panel panel-default box-shadow-default become-seller-story-msg  margin-none border-none become-seller-action-slide-bottom-up" style="">
                                                <div class="panel-body padding-top-20 padding-bottom-20 padding-left-45 padding-right-45">
                                                    <div class="row">
                                                        <div class="col-xs-12 padding-left-0">
                                                            <div><img class="width-30px" src="css/image/talk_icon_front.png"></div>
                                                        </div>
                                                        <div class="col-xs-12 text-center">
                                                            <h4 class="margin-bottom-0 line-height margin-top-5">
                                                                디자인 에이전시 근무 <b>13년 경력의 디자이너</b>입니다. 회사 업무와 병행하면서 서비스를 판매하고 있는데요.물론 <b>부수입을 얻을 수 있다는 것도</b> 좋지만 혼자 프로젝트를 진행하기 때문에 <b>스스로 계속 발전해 나갈 수 있다</b>는 게 매력적이예요!
                                                            </h4>
                                                        </div>
                                                        <div class="col-xs-12">
                                                            <div class="margin-top-10 text-right padding-right-0">
                                                                <img class="width-30px" src="css/image/talk_icon_back.png">
                                                            </div>
                                                            <h5 class="text-center margin-none">2799gram</h5>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                                                <div class="row  margin-top-60 ">
                                    <div class="col-xs-3 ">
                                        <div class="become-seller-story position-relative">
                                            <img class="width-100" src="css/image/seller_interview_2337.png">
                                            <ul class="position-absolute bottom-5 list-unstyled color-white">
                                                <li class="padding-right-10">
                                                    <img class="width-10px margin-right-5" src="css/image/ic_seller_story_li.png" alt="check">
                                                    <span class="NGL">전문분야</span> 이력서 &amp; 자기소개서
                                                </li>
                                                <li class="padding-right-10">
                                                    <img class="width-10px margin-right-5" src="css/image/ic_seller_story_li.png" alt="check">
                                                    <span class="NGL">판매 완료 금액</span> 44,705,000원
                                                </li>
                                                <li class="padding-right-10">
                                                    <img class="width-10px margin-right-5" src="css/image/ic_seller_story_li.png" alt="check">
                                                    <span class="NGL">판매 완료 건수</span> 2,349건
                                                </li>
                                            </ul>
                                            <div class="panel panel-default box-shadow-default become-seller-story-msg right margin-none border-none become-seller-action-slide-bottom-up" style="">
                                                <div class="panel-body padding-top-20 padding-bottom-20 padding-left-45 padding-right-45">
                                                    <div class="row">
                                                        <div class="col-xs-12 padding-left-0">
                                                            <div><img class="width-30px" src="css/image/talk_icon_front.png"></div>
                                                        </div>
                                                        <div class="col-xs-12 text-center">
                                                            <h4 class="margin-bottom-0 line-height margin-top-5">
                                                                대형 <b>포털 사이트 기획 팀장</b>으로 있으면서, 이력은 좋은데 자소서 때문에 합격하지 못하는 학생들을 보니 많이 안타깝더라구요. 이후 <b>대학교 강연</b>도 하고 잡사이트 <b>자소서 첨삭 컨설턴트</b>도 하다가 크몽까지 왔네요. 합격의 기쁨을 전해주는 취준생 분들의 메시지를 받을 때마다 <b>뿌듯함과 성취감</b>을 느낍니다
                                                            </h4>
                                                        </div>
                                                        <div class="col-xs-12">
                                                            <div class="margin-top-10 text-right padding-right-0">
                                                                <img class="width-30px" src="css/image/talk_icon_back.png">
                                                            </div>
                                                            <h5 class="text-center margin-none">hyun1155</h5>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                                                <div class="row  margin-top-60 ">
                                    <div class="col-xs-3  col-xs-offset-9 ">
                                        <div class="become-seller-story position-relative">
                                            <img class="width-100" src="css/image/seller_interview_120118.png">
                                            <ul class="position-absolute bottom-5 list-unstyled color-white">
                                                <li class="padding-right-10">
                                                    <img class="width-10px margin-right-5" src="css/image/ic_seller_story_li.png" alt="check">
                                                    <span class="NGL">전문분야</span> 영상제작
                                                </li>
                                                <li class="padding-right-10">
                                                    <img class="width-10px margin-right-5" src="css/image/ic_seller_story_li.png" alt="check">
                                                    <span class="NGL">판매 완료 금액</span> 43,574,000원
                                                </li>
                                                <li class="padding-right-10">
                                                    <img class="width-10px margin-right-5" src="css/image/ic_seller_story_li.png" alt="check">
                                                    <span class="NGL">판매 완료 건수</span> 580건
                                                </li>
                                            </ul>
                                            <div class="panel panel-default box-shadow-default become-seller-story-msg  margin-none border-none become-seller-action-slide-bottom-up" style="">
                                                <div class="panel-body padding-top-20 padding-bottom-20 padding-left-45 padding-right-45">
                                                    <div class="row">
                                                        <div class="col-xs-12 padding-left-0">
                                                            <div><img class="width-30px" src="css/image/talk_icon_front.png"></div>
                                                        </div>
                                                        <div class="col-xs-12 text-center">
                                                            <h4 class="margin-bottom-0 line-height margin-top-5">
                                                                박람회 홍보 영상, 엔터테인먼트 및 기업 영상 등을 제작하고 있습니다. 절친한 선배의 추천으로 크몽을 시작하게 됐어요. 유사 사이트들에서도 판매를 하고 있는데, <b>의뢰인 수나 인지도면에서</b> 크몽이 <b>압도적</b>이고 건의사항에 대한 <b>피드백도 빨라서 만족스러워요.</b>
                                                            </h4>
                                                        </div>
                                                        <div class="col-xs-12">
                                                            <div class="margin-top-10 text-right padding-right-0">
                                                                <img class="width-30px" src="css/image/talk_icon_back.png">
                                                            </div>
                                                            <h5 class="text-center margin-none">PowerStudio</h5>
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
                </div>
            </div>
        </div>
        <div id="howToSellingContainer" class="bg-color-gray padding-top-50 padding-bottom-50 margin-top-65">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <h2 style="font-size: 30px !important;" class="margin-none text-center">서비스 판매방법</h2>
                    </div>
                </div>
                <div class="row margin-top-45">
                    <div class="col-xs-12">
                        <div id="becomeSellerCarousel" class="carousel slide" data-ride="carousel">
                            <div class="row">
                                <div class="col-xs-5">
                                    <ul class="carousel-indicators bottom-0 list-unstyled margin-none become-seller-how">
                                        <li class="font-color-lighter" data-target="#becomeSellerCarousel" data-slide-to="0">
                                            <div class="row">
                                                <div class="col-xs-2 padding-right-0">
                                                    <div class="ic-circle gray font-size-h2 NGB">01</div>
                                                </div>
                                                <div class="col-xs-10 padding-left-0">
                                                    <dl class="font-size-h4 margin-none">
                                                        <dt class="position-relative">
                                                            <b>서비스 등록하기</b>
                                                        </dt>
                                                        <dd>
                                                            판매하고자 하는 서비스를 등록하고 승인을 기다려주세요.
                                                        </dd>
                                                    </dl>
                                                    <div class="become-seller-tooltip">
                                                        <h6 class="margin-none">신규 등록 시 50,000 마일리지 지급</h6>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="font-color-lighter" data-target="#becomeSellerCarousel" data-slide-to="1">
                                            <div class="row margin-top-30">
                                                <div class="col-xs-2 padding-right-0">
                                                    <div class="ic-circle gray font-size-h2 NGB">02</div>
                                                </div>
                                                <div class="col-xs-10 padding-left-0">
                                                    <dl class="font-size-h4 margin-none">
                                                        <dt>
                                                            <b>의뢰인과 대화하기</b>
                                                        </dt>
                                                        <dd>
                                                            주문이 접수되었을 경우에 생성되는 거래창에서 의뢰인과 작업 내용을 협의해보세요.
                                                        </dd>
                                                    </dl>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="font-color-lighter" data-target="#becomeSellerCarousel" data-slide-to="2">
                                            <div class="row margin-top-30">
                                                <div class="col-xs-2 padding-right-0">
                                                    <div class="ic-circle gray font-size-h2 NGB">03</div>
                                                </div>
                                                <div class="col-xs-10 padding-left-0">
                                                    <dl class="font-size-h4 margin-none">
                                                        <dt>
                                                            <b>작업물 발송하기</b>
                                                        </dt>
                                                        <dd>
                                                            거래창 내 [작업물 발송] 버튼을 클릭하여 의뢰인에게 최종 작업물을 발송해주세요.
                                                        </dd>
                                                    </dl>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="font-color-lighter active" data-target="#becomeSellerCarousel" data-slide-to="3">
                                            <div class="row margin-top-30">
                                                <div class="col-xs-2 padding-right-0">
                                                    <div class="ic-circle gray font-size-h2 NGB">04</div>
                                                </div>
                                                <div class="col-xs-10 padding-left-0">
                                                    <dl class="font-size-h4 margin-none">
                                                        <dt>
                                                            <b>수익금 출금하기</b>
                                                        </dt>
                                                        <dd>
                                                            거래가 완료되면 수익금 출금을 신청하세요.
                                                        </dd>
                                                    </dl>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-xs-7 padding-left-0">
                                    <ul class="carousel-indicators become-seller-slide-nav bottom-0">
                                        <li data-target="#becomeSellerCarousel" data-slide-to="0" class=""></li>
                                        <li data-target="#becomeSellerCarousel" data-slide-to="1" class=""></li>
                                        <li data-target="#becomeSellerCarousel" data-slide-to="2" class=""></li>
                                        <li data-target="#becomeSellerCarousel" data-slide-to="3" class="active"></li>
                                    </ul>
                                    <div id="becomeASellerCarouselInner" class="carousel-inner" role="listbox">
                                        <div class="item">
                                            <img class="width-100" src="css/image/step1_regist_gig.png">
                                            <div class="carousel-caption">

                                            </div>
                                        </div>
                                        <div class="item">
                                            <img class="width-100" src="css/image/step2_conversation_with_buyer.png">
                                            <div class="carousel-caption">
                                            </div>
                                        </div>
                                        <div class="item">
                                            <img class="width-100" src="css/image/step3_deliver_gig.png">
                                            <div class="carousel-caption">
                                            </div>
                                        </div>
                                        <div class="item active">
                                            <img class="width-100" src="css/image/step4_withdraw_afunds.png">
                                            <div class="carousel-caption">
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
        <div class="padding-top-60 padding-bottom-60">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <h2 style="font-size: 30px !important;" class="margin-none text-center padding-bottom-30">자주 묻는 질문</h2>
                    </div>
                </div>
                <div class="panel-group" id="accordion-faq" role="tablist" aria-multiselectable="true">
                    <div class="col-xs-6">
                        <div class="panel become-seller-faq-panel panel-default">

                            <a class="plain display-block" data-toggle="collapse" data-parent="#accordion-faq" aria="" aria-controls="#collapseOne" href="#whichContentsAvailable">
                                <div class="panel-heading" role="tab">
                                    <h5 class="panel-title">
                                        어떤 서비스를 판매할 수 있나요?
                                        <img style="margin-top: 3px; padding-right: 2px" class="become-seller-faq-ic width-15px pull-right margin-right-5" src="css/image/ic_become_seller_faq.png">
                                    </h5>
                                </div>
                            </a>
                            <div id="whichContentsAvailable" class="panel-collapse collapse">
                                <div class="become-seller-panel-body panel-body">
                                    디자인, 마케팅, 번역, 심리상담까지 ٠٠٠ 불법적이거나 사이트 규정에 어긋나지 않는다면, 크몽에서는 그 어떤 것도 판매가 가능합니다.
                                </div>
                            </div>
                        </div>
                        <div class="panel become-seller-faq-panel panel-default">
                            <a class="plain display-block" data-toggle="collapse" data-parent="#accordion-faq" href="#collapseTwo" aria-controls="#collapseTwo">
                                <div class="panel-heading">
                                    <h5 class="panel-title">
                                        판매 금액은 어떻게 설정해야 하나요?
                                        <img style="margin-top: 3px; padding-right: 2px" class="become-seller-faq-ic width-15px pull-right margin-right-5" src="css/image/ic_become_seller_faq.png">
                                    </h5>
                                </div>
                            </a>
                            <div id="collapseTwo" class="panel-collapse collapse">
                                <div class="become-seller-panel-body panel-body">
                                    판매 금액은 전문가님 스스로 결정하실 수 있습니다. 단, 금액은 vat를 포함한 금액으로 설정해주세요!
                                </div>
                            </div>
                        </div>
                        <div class="panel become-seller-faq-panel panel-default">
                            <a class="plain display-block" data-toggle="collapse" data-parent="#accordion-faq" href="#collapseThree" aria-controls="#collapse">
                                <div class="panel-heading">
                                    <h5 class="panel-title">
                                        사업자로 등록해야 판매가 가능한가요?
                                        <img style="margin-top: 3px; padding-right: 2px" class="become-seller-faq-ic width-15px pull-right margin-right-5" src="css/image/ic_become_seller_faq.png">
                                    </h5>
                                </div>
                            </a>
                            <div id="collapseThree" class="panel-collapse collapse">
                                <div class="become-seller-panel-body panel-body">
                                    국세청에서는 지속적으로 수익이 발생하는 자에게 사업자등록을 요구하고 있습니다. 사업자 미등록으로 인한 세무상 불이익이 발생될 수 있으므로 크몽은 전문가의 사업자 등록을 권장합니다.
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-6">
                        <div class="panel become-seller-faq-panel panel-default">
                            <a class="plain display-block" data-toggle="collapse" data-parent="#accordion-faq" href="#collapseFour" aria-controls="#collapseFour">
                                <div class="panel-heading">
                                    <h5 class="panel-title">
                                        서비스 등록은 무료인가요?
                                        <img style="margin-top: 3px; padding-right: 2px" class="become-seller-faq-ic width-15px pull-right margin-right-5" src="css/image/ic_become_seller_faq.png">
                                    </h5>
                                </div>
                            </a>
                            <div id="collapseFour" class="panel-collapse collapse">
                                <div class="become-seller-panel-body panel-body">
                                    네, 서비스를 등록하는 데에는 아무런 비용이 들지 않습니다.
                                </div>
                            </div>
                        </div>
                        <div class="panel become-seller-faq-panel panel-default">
                            <a class="plain display-block" data-toggle="collapse" data-parent="#accordion-faq" href="#collapseFive" aria-controls="#collapseFive">
                                <div class="panel-heading">
                                    <h5 class="panel-title">
                                        서비스 등록을 위해서는 무엇이 필요한가요?
                                        <img style="margin-top: 3px; padding-right: 2px" class="become-seller-faq-ic width-15px pull-right margin-right-5" src="css/image/ic_become_seller_faq.png">
                                    </h5>
                                </div>
                            </a>
                            <div id="collapseFive" class="panel-collapse collapse">
                                <div class="become-seller-panel-body panel-body">
                                    판매하고자 하는 서비스의 구체적인 내용과 금액 그리고 대표 이미지만 준비해주시면 서비스를 등록하실 수 있습니다.
                                </div>
                            </div>
                        </div>
                        <div class="panel become-seller-faq-panel panel-default">
                            <a class="plain display-block" data-toggle="collapse" data-parent="#accordion-faq" href="#collapseSix" aria-controls="#collapseSix">
                                <div class="panel-heading">
                                    <h5 class="panel-title">
                                        서비스가 하나도 팔리지 않는다면 지불해야할 수수료도 없는건가요?
                                        <img style="margin-top: 3px; padding-right: 2px" class="become-seller-faq-ic width-15px pull-right margin-right-5" src="css/image/ic_become_seller_faq.png">
                                    </h5>
                                </div>
                            </a>
                            <div id="collapseSix" class="panel-collapse collapse">
                                <div class="become-seller-panel-body panel-body">
                                    네, 맞습니다. 만일 서비스가 판매되지 않았다면, 판매 수수료도 부과되지 않습니다.
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="become-seller-banner">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <dl class="margin-none text-center color-brown">
                            <dt class="font-size-h3 font-color-base margin-bottom-5">
                                지금 신규 서비스를 등록하시면 50,000원의 마일리지를 지원해드립니다!
                            </dt>
                            <dd>
                                * 마일리지를 통해서는 크몽의 광고 상품을 구입하실 수 있습니다.
                            </dd>
                            <dd>
                                * 과거 판매 이력이 있을 경우, 마일리지가 지급되지 않습니다.
                            </dd>
                        </dl>
                    </div>
                </div>
                <div class="row margin-top-20">
                    <div class="col-xs-12 text-center">
                        <a class="btn btn-black btn-sm" href="login.do">서비스 등록하기</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>

        var $becomeASellerCarousel = $('#becomeASellerCarouselInner'),
            $window = $(window),
            $howToSellingContainer = $('#howToSellingContainer')
            ;

        $(document).ready(function () {

            $('.become-seller-story-msg').addClass('become-seller-action-slide-bottom-up').show()

            becomeSellerSlide(); // slide indicators

            becomeSellerAccordion(); // FAQ 아코디언

            becomeSellerScroll(); // Scroll Header

        });

        function becomeSellerAccordion() {

            // accordion animation
            $('.collapse.in').prev('.plain').find('.panel-heading').addClass('become-seller-faq-active');

            $('#accordion-faq').on('show.bs.collapse', function (a) {
                // panel 한개만 펼치기
                $('.become-seller-faq-panel > div:nth-child(2)').collapse('hide');
                $('.panel-heading').removeClass('become-seller-faq-active');

                $(a.target).prev('.plain').find('.panel-heading').addClass('become-seller-faq-active');
            }).on('hide.bs.collapse', function (a) {

                $(a.target).prev('.plain').find('.panel-heading').removeClass('become-seller-faq-active');
            });
        }

        function becomeSellerSlide() {

            howToSellingImageSlideAction($window)
            $window.on('scroll',function () {
                howToSellingImageSlideAction($(this));
            });

            $('#becomeSellerCarousel').on('slid.bs.carousel', function() {

                $(".become-seller-slide-nav li").removeClass("active");

                var indicators = $(".carousel-indicators li.active").data("slide-to");

                $(".become-seller-slide-nav").find("[data-slide-to='" + indicators + "']").addClass("active");
            });
        }



        function howToSellingImageSlideAction($window){
            var $windowScrollTop = $window.scrollTop();

            if($windowScrollTop >= $howToSellingContainer.offset().top - 1100){
                $becomeASellerCarousel.addClass('become-seller-action-slide');
            }
        }

    </script>

</div>

<jsp:include page="/WEB-INF/view/inc/footer/footer_notice.jsp"></jsp:include>
<jsp:include page="/WEB-INF/view/inc/footer/footer.jsp"></jsp:include>
</body>
</html>