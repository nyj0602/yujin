<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name ="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/kmong-99952b2854.master_desktop.css" type="text/css">
<link rel="stylesheet" href="css/kmong_desktop_v2-6ec7c3f31e.css" type="text/css">
<link rel="stylesheet" href="css/kmong_fonts.css" type="text/css">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<title></title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(function(){
		$("#sendEmailBtn").click(function(){
			alert("상대방에게 이메일 전송!!");
		});
	});
</script>
</head>
<% String ContextPath = request.getContextPath(); %>
<body id="master_body">
<%@ include file = "../inc/header/header.jsp" %>
]





 
<div class="global-body">
    <div class="gradient-black padding-bottom-100">
        <div class="container">

            

            <div class="row">
                <div class="col-xs-12 text-center color-white">
                    <h2 class="margin-bottom-0 margin-top-75">친구야 COME ON, KMONG!</h2>
                    <h3 class="margin-top-10 NGL">친구에게 크몽을 소개해주세요. 크몽캐시를 지원해드립니다.</h3>

                </div>
            </div>

            

            <div class="row margin-top-75">
                <div class="col-xs-2">
                    &nbsp;
                </div>
                <div class="col-xs-8 referal-border">

                </div>
                <div class="col-xs-2">
                    &nbsp;
                </div>
            </div>


            <div class="row margin-top-20">
                <div class="col-xs-2">
                    &nbsp;
                </div>
                <div class="col-xs-8">
                    <div class="row">
                        <div class="col-xs-4">
                            <img class="width-85" src="<%=ContextPath %>/css/image/kmong_images.png">
                        </div>
                        <div class="col-xs-8 color-white">
                            <dl>
                                <dt class="position-relative">
                                    <span class="title-number inline-block font-size-h6 position-absolute">1</span>
                                    코드 생성하기
                                </dt>
                                <dd class="NGL">코드 생성 버튼을 클릭하여 생성된 코드를 친구에게 알려주세요.</dd>
                            </dl>
                            <dl class="margin-top-15">
                                <dt class="position-relative">
                                    <span class="title-number inline-block font-size-h6 position-absolute">2</span>
                                    신규 가입 선물
                                </dt>
                                <dd class="NGL">가입 시 해당 코드를 삽입하면, 크몽캐시 5,000원을 선물해드립니다.</dd>
                            </dl>
                            <dl class="margin-top-15">
                                <dt class="position-relative">
                                    <span class="title-number inline-block font-size-h6 position-absolute">3</span>
                                    추천인 리워드
                                </dt>
                                <dd class="NGL">초대한 친구가 10,000원 이상 결제하면, 추천인에게도 크몽캐시 5,000원을 선물해드립니다.</dd>
                            </dl>
                        </div>
                    </div>
                </div>
                <div class="col-xs-2">
                    &nbsp;
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
                                <div class="row margin-bottom-5">
                                    <div class="col-xs-12">
                                        <div class="NGB font-size-h5">참여하기</div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-9">
                                        <div id="codeDivWrapper" class="referral-cord bg-color-white border-radius border-solid">
                                             INVFR334601                                         </div>
                                    </div>
                                    <div id="buttonDivWrapper" class="col-xs-3 padding-left-0">
                                                                                    <a class="btn btn-default width-100 NGB" disabled="disabled" href="javascript:void(0);" role="button">코드 생성완료</a>
                                                                            </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12">
                                        <h5 class="font-color-lighter margin-bottom-0">* 해당 코드를 통해 가입한 친구에게는 자동으로 크몽캐시 5,000원이 적립됩니다. 친구에게 당신의 코드를 보내세요!</h5>
                                    </div>
                                </div>

                                                                    <div class="row margin-bottom-5 margin-top-20">
                                        <div class="col-xs-12">
                                            <div class="NGB font-size-h5">이메일로 초대하기</div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-9">
                                            <input id="email" type="email" class="form-control" placeholder="초대할 친구의 이메일을 입력해주세요.  예)  ssangyong@naver.com">
                                            <input id="referralCode" type="hidden" value="INVFR334601">
                                        </div>
                                        <div id="buttonDivWrapper" class="col-xs-3 padding-left-0">
                                            <button id="sendEmailBtn" class="btn btn-default width-100 NGB">이메일 전송</button>
                                        </div>
                                    </div>
                                                            </div>
                        </div>
                    </div>
                </div>
                                <div class="row margin-top-20">
                    <div class="col-xs-12">
                        <h4 class="padding-bottom-10 border-bottom-solid NGB">jsaa11 님의 누적 리워드</h4>
                    </div>
                    <div class="col-xs-12 margin-top-15">
                        <span><b>크몽캐시</b></span>
                        <span class="NGB margin-left-20">
                                                            0
                            &nbsp;원
                        </span>
                    </div>
                </div>
                                <div class="row margin-top-90">
                    <div class="col-xs-12 text-center">
                        <a class="btn btn-default btn-xss width-140px NGB font-color-lighter" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">이용약관 보기</a>
                    </div>
                </div>

            </div>
            <div class="col-xs-2">
                &nbsp;
            </div>
        </div>
    </div>
</div>
<%@ include file = "../inc/footer/footer.jsp" %>
</body>
</html>