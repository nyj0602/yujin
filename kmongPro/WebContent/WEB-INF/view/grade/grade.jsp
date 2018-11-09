<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name ="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/kmong-99952b2854.master_desktop.css" type="text/css">
<link rel="stylesheet" href="css/kmong_desktop_v2-6ec7c3f31e.css" type="text/css">
<link rel="stylesheet" href="css/kmong-3f20e872d5.master_desktop.css" type="text/css">
<link rel="stylesheet" href="css/kmong_fonts.css" type="text/css">
<link rel="stylesheet" href="css/kmong-6d2e653f88.master_desktop.css" type="text/css">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<title></title>
<script src="https://kmong.com/js/aws-sdk-2.203.0.min.js"></script>
<script src="https://kmong.com/js/buildV63.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<Script>
	if(gradeList.gs_seq == 1){
		$("#new").style("backgroud-color","yellow");
	}
</Script>
</head>
<% String ContextPath = request.getContextPath();%>
<body id="master_body">
<%@ include file = "../inc/header/header.jsp" %>
<div class="global-body">
    <div id="ranking-wrap">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 text-center">
                    <h1 class="margin-top-70 margin-bottom-5 line-height"><b>크몽 전문가 등급</b></h1>
                    <h3 class="margin-top-0 margin-bottom-0 line-height">전문가와 의뢰인 간의 안전하고 신뢰도 높은 거래 진행을 위해<br>
                        전문가의 취소율, 응답률, 별점 등을 기반으로 한 등급 제도를 실시하고 있습니다. </h3>
                    <h5 class="margin-top-80 margin-bottom-0">
                        <ul class="list-unstyled font-color-lighter">
                            <li>- 전문가 등급은 선정 기준을 통합하여 매월 1일 업데이트 됩니다.</li>
                            <li>- SemiPro, Pro, Master 등급의 경우 최근 두 달 간 이용정지 패널티 기록이 발생될 경우</li>
                            <li>현 등급과 무관하게 Junior 등급으로 하향조정됩니다.</li>
                        </ul>
                    </h5>
                </div>
            </div>
        </div>
        <div class="width-100 bg-color-black ranking-square">
            <img src="<%=ContextPath %>/css/image/back_f1f1f1.png" alt="배경" class="ranking-square width-100">
            <div class="container">
                <div class="row position-relative margin-top-90">
                    <div class="col-xs-6">
                                                    <div class="ranking-yellow-box" style="top: 0px;">
                                <h5 class="margin-top-5 margin-bottom-5 text-center line-height">jsaa11<br><span class="font-size-h6">(매월 1일 업데이트)</span></h5>
                            </div>
                                            </div>
                    <div class="col-xs-5">
                                                    <div class="row padding-left-50 position-relative padding-bottom-50 border-dashed-left">
                                <i class="fa fa-sort-desc font-size-h4 grade-title-icon" aria-hidden="true"></i>
                                <div class="col-xs-2 padding-left-0 text-center">
                                    <img id="grade" class="width-100 grade-img-size" src="<%=ContextPath %>/css/images/kmong_grade_NEW.png" alt="New">
                                </div>
                                <div class="col-xs-10">
                                    <dl>
                                        <dt>
                                            <h2 class="margin-top-0 margin-bottom-0 color-white">New</h2>
                                        </dt>
                                        <dd>
                                                                                            <h5 class="margin-top-10 color-white NGL">
                                                                                                            <i class="color-dark-yellow-400 fa fa-check" aria-hidden="true" style="color:gray"></i>
                                                                                                        <span>신규가입</span></h5>
                                                                                    </dd>
                                    </dl>
                                </div>
                            </div>
                                                    <div class="row padding-left-50 position-relative padding-bottom-50 border-dashed-left">
                                <i class="fa fa-sort-desc font-size-h4 grade-title-icon" aria-hidden="true"></i>
                                <div class="col-xs-2 padding-left-0 text-center">
                                    <img id="grade" class="width-100 grade-img-size" src="<%=ContextPath %>/css/image/kmong_grade_JUNIOR.png" alt="Junior">
                                </div>
                                <div class="col-xs-10">
                                    <dl>
                                        <dt>
                                            <h2 class="margin-top-0 margin-bottom-0 color-white">Junior</h2>
                                        </dt>
                                        <dd>
                                                                                            <h5 class="margin-top-10 color-white NGL">
                                                                                                            <i id='new' class="color-dark-yellow-400 fa fa-check" aria-hidden="true" style="color:gray"></i>
                                                                                                        <span>30일 활성화</span></h5>
                                                                                            <h5 class="margin-top-10 color-white NGL">
                                                                                                            <i class="font-color-lighter fa fa-check" aria-hidden="true"></i>
                                                                                                        <span>누적 판매 완료 1건 이상</span></h5>
                                                                                    </dd>
                                    </dl>
                                </div>
                            </div>
                                                    <div class="row padding-left-50 position-relative padding-bottom-50 border-dashed-left">
                                <i class="fa fa-sort-desc font-size-h4 grade-title-icon" aria-hidden="true"></i>
                                <div class="col-xs-2 padding-left-0 text-center">
                                    <img class="width-100 grade-img-size" src="<%=ContextPath %>/css/image/kmong_grade_SENIOR.png" alt="Senior">
                                </div>
                                <div class="col-xs-10">
                                    <dl>
                                        <dt>
                                            <h2 class="margin-top-0 margin-bottom-0 color-white">Senior</h2>
                                        </dt>
                                        <dd>
                                                                                            <h5 class="margin-top-10 color-white NGL">
                                                                                                            <i class="font-color-lighter fa fa-check" aria-hidden="true"></i>
                                                                                                        <span>누적 판매 완료 10건 이상</span></h5>
                                                                                            <h5 class="margin-top-10 color-white NGL">
                                                                                                            <i class="font-color-lighter fa fa-check" aria-hidden="true"></i>
                                                                                                        <span>서비스 전체 평균 별점 4점 이상</span></h5>
                                                                                            <h5 class="margin-top-10 color-white NGL">
                                                                                                            <i class="font-color-lighter fa fa-check" aria-hidden="true"></i>
                                                                                                        <span>낮은 취소율</span></h5>
                                                                                            <h5 class="margin-top-10 color-white NGL">
                                                                                                            <i class="font-color-lighter fa fa-check" aria-hidden="true"></i>
                                                                                                        <span>응답율 70% 이상</span></h5>
                                                                                            <h5 class="margin-top-10 color-white NGL">
                                                                                                            <i class="font-color-lighter fa fa-check" aria-hidden="true"></i>
                                                                                                        <span>친절한 서비스</span></h5>
                                                                                    </dd>
                                    </dl>
                                </div>
                            </div>
                                                    <div class="row padding-left-50 position-relative padding-bottom-50 border-dashed-left">
                                <i class="fa fa-sort-desc font-size-h4 grade-title-icon" aria-hidden="true"></i>
                                <div class="col-xs-2 padding-left-0 text-center">
                                    <img class="width-100 grade-img-size" src="<%=ContextPath %>/css/image/kmong_grade_SEMIPRO.png" alt="SemiPro">
                                </div>
                                <div class="col-xs-10">
                                    <dl>
                                        <dt>
                                            <h2 class="margin-top-0 margin-bottom-0 color-white">SemiPro</h2>
                                        </dt>
                                        <dd>
                                                                                            <h5 class="margin-top-10 color-white NGL">
                                                                                                            <i class="font-color-lighter fa fa-check" aria-hidden="true"></i>
                                                                                                        <span>누적 판매 완료 50건 이상</span></h5>
                                                                                            <h5 class="margin-top-10 color-white NGL">
                                                                                                            <i class="font-color-lighter fa fa-check" aria-hidden="true"></i>
                                                                                                        <span>서비스 전체 평균 별점 4.5점 이상</span></h5>
                                                                                            <h5 class="margin-top-10 color-white NGL">
                                                                                                            <i class="font-color-lighter fa fa-check" aria-hidden="true"></i>
                                                                                                        <span>낮은 취소율</span></h5>
                                                                                            <h5 class="margin-top-10 color-white NGL">
                                                                                                            <i class="font-color-lighter fa fa-check" aria-hidden="true"></i>
                                                                                                        <span>응답율 80% 이상</span></h5>
                                                                                            <h5 class="margin-top-10 color-white NGL">
                                                                                                            <i class="font-color-lighter fa fa-check" aria-hidden="true"></i>
                                                                                                        <span>최근 두 달 간 이용정지 패널티 0회</span></h5>
                                                                                            <h5 class="margin-top-10 color-white NGL">
                                                                                                            <i class="font-color-lighter fa fa-check" aria-hidden="true"></i>
                                                                                                        <span>친절한 서비스</span></h5>
                                                                                    </dd>
                                    </dl>
                                </div>
                            </div>
                                                    <div class="row padding-left-50 position-relative padding-bottom-50 border-dashed-left">
                                <i class="fa fa-sort-desc font-size-h4 grade-title-icon" aria-hidden="true"></i>
                                <div class="col-xs-2 padding-left-0 text-center">
                                    <img class="width-100 grade-img-size" src="<%=ContextPath %>/css/image/kmong_grade_PRO.png" alt="Pro">
                                </div>
                                <div class="col-xs-10">
                                    <dl>
                                        <dt>
                                            <h2 class="margin-top-0 margin-bottom-0 color-white">Pro</h2>
                                        </dt>
                                        <dd>
                                                                                            <h5 class="margin-top-10 color-white NGL">
                                                                                                            <i class="font-color-lighter fa fa-check" aria-hidden="true"></i>
                                                                                                        <span>누적 판매 완료 100건 이상</span></h5>
                                                                                            <h5 class="margin-top-10 color-white NGL">
                                                                                                            <i class="font-color-lighter fa fa-check" aria-hidden="true"></i>
                                                                                                        <span>서비스 전체 평균 별점 4.8점 이상</span></h5>
                                                                                            <h5 class="margin-top-10 color-white NGL">
                                                                                                            <i class="font-color-lighter fa fa-check" aria-hidden="true"></i>
                                                                                                        <span>낮은 취소율</span></h5>
                                                                                            <h5 class="margin-top-10 color-white NGL">
                                                                                                            <i class="font-color-lighter fa fa-check" aria-hidden="true"></i>
                                                                                                        <span>응답율 90% 이상</span></h5>
                                                                                            <h5 class="margin-top-10 color-white NGL">
                                                                                                            <i class="font-color-lighter fa fa-check" aria-hidden="true"></i>
                                                                                                        <span>최근 두 달 간 이용정지 패널티 0회</span></h5>
                                                                                            <h5 class="margin-top-10 color-white NGL">
                                                                                                            <i class="font-color-lighter fa fa-check" aria-hidden="true"></i>
                                                                                                        <span>친절한 서비스</span></h5>
                                                                                    </dd>
                                    </dl>
                                </div>
                            </div>
                                                    <div class="row padding-left-50 position-relative padding-bottom-50 border-dashed-left">
                                <i class="fa fa-sort-desc font-size-h4 grade-title-icon" aria-hidden="true"></i>
                                <div class="col-xs-2 padding-left-0 text-center">
                                    <img class="width-100 grade-img-size" src="<%=ContextPath %>/css/image/kmong_grade_MASTER.png" alt="Master">
                                </div>
                                <div class="col-xs-10">
                                    <dl>
                                        <dt>
                                            <h2 class="margin-top-0 margin-bottom-0 color-white">Master</h2>
                                        </dt>
                                        <dd>
                                                                                            <h5 class="margin-top-10 color-white NGL">
                                                                                                            <i style="content:\f00c color: #ffd400" class="font-color-lighter fa fa-check" aria-hidden="true"></i>
                                                                                                        <span>최근 2개월 간 판매 완료 100건이상</span></h5>
                                                                                            <h5 class="margin-top-10 color-white NGL">
                                                                                                            <i class="font-color-lighter fa fa-check" aria-hidden="true"></i>
                                                                                                        <span>서비스 전체 평균 별점 5.0점</span></h5>
                                                                                            <h5 class="margin-top-10 color-white NGL">
                                                                                                            <i class="font-color-lighter fa fa-check" aria-hidden="true"></i>
                                                                                                        <span>낮은 취소율</span></h5>
                                                                                            <h5 class="margin-top-10 color-white NGL">
                                                                                                            <i class="font-color-lighter fa fa-check" aria-hidden="true"></i>
                                                                                                        <span>응답율 100%</span></h5>
                                                                                            <h5 class="margin-top-10 color-white NGL">
                                                                                                            <i class="font-color-lighter fa fa-check" aria-hidden="true"></i>
                                                                                                        <span>최근 두 달 간 이용정지 패널티 0회</span></h5>
                                                                                            <h5 class="margin-top-10 color-white NGL">
                                                                                                            <i class="font-color-lighter fa fa-check" aria-hidden="true"></i>
                                                                                                        <span>친절한 서비스</span></h5>
                                                                                    </dd>
                                    </dl>
                                </div>
                            </div>
                                            </div>
                </div>
            </div>
        </div>
        <img class="width-100" src="<%=ContextPath %>/css/image/back_444.png" alt="배경">
        <div class="container">
            <div class="col-xs-12">
                <div class="row text-center">
                    <h2><b>전문가가 되어 크몽을 빛내주세요!</b></h2>
                    <h4 class="line-height">성실한 판매와 친절한 서비스를 통해 흭득한 전문가 등급으로 <br>
                        의뢰인의 신뢰와 높은 수익을 한번에 누려보세요!</h4>
                    <h4 class="margin-top-30"><a id="next" class="btn btn-lg btn-primary btn-xss" href="index.do">판매 시작하기</a></h4>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="https://wcs.naver.net/wcslog.js"> </script>
<%@ include file = "../inc/footer/footer.jsp" %>
</body>
</html>