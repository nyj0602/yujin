
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <div class="bg-color-fa border-top-solid border-bottom-solid">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 ">
                    <ul class="list-inline text-center font-color-lighter margin-top-5 margin-bottom-5 font-size-h6">

                        <li>
                            <a class="plain font-color-lighter font-size-h6" href="https://kmong.com/about/kmong_is" onclick=" sendGAEvent('main', 'footer - 크몽팀', kmongCurrentPath); ">크몽팀</a>
                        </li>

                        <li>|</li>

                        <li>
                            <a class="plain font-color-lighter font-size-h6" href="https://kmong.com/about/service" onclick=" sendGAEvent('main', 'footer - 크몽 서비스소개', kmongCurrentPath); ">서비스소개</a>
                        </li>

                        <li>|</li>

                        <li>
                            <a class="plain font-color-lighter font-size-h6" href="https://kmong.com/about/recruit" onclick=" sendGAEvent('main', 'footer - 인재채용', kmongCurrentPath); ">인재채용</a>
                        </li>

                        <li>|</li>

                        <li>
                            <a class="plain font-color-lighter font-size-h6" href="https://kmong.com/terms_of_service" onclick=" sendGAEvent('main', 'footer - 이용약관', kmongCurrentPath); ">이용약관</a>
                        </li>

                        <li>|</li>

                        <li>
                            <a class="plain font-color-lighter font-size-h6" href="https://kmong.com/privacy_policy" onclick=" sendGAEvent('main', 'footer - 개인정보취급방침', kmongCurrentPath); ">개인정보취급방침</a>
                        </li>

                        <li>|</li>

                        <li>
                            <a class="plain font-color-lighter font-size-h6" href="javascript:void(0);" onclick=" sendGAEvent('main', 'footer - FAQ', kmongCurrentPath);  master_vue.openKmongKB();$('#kmongFAQLink').trigger('click');">FAQ</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>


    <div class="padding-bottom-30 padding-top-20 bg-color-white ">
        <div class="container">
            <div class="row">
                <div class="col-xs-12padding-bottom-20 padding-right-0 padding-left-0">
                    <div class="col-xs-9">
                        <div class="row">
                            <div class="col-xs-12">
                                <h4>
                                    <b>공지사항</b>
                                </h4>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <ul class="list-unstyled">
                                                                            <li class="padding-top-5 padding-bottom-5 padding-left-0 padding-right-0">
                                            <a target="_blank" href="http://kmongteam.blog.me/221206895186" class="plain color-dark-gray" onclick="sendGAEvent('main', 'footer - 공지사항 - 2/23 출금 및 고객센터 업무시간 안내', kmongCurrentPath);">
                                                - 2/23 출금 및 고객센터 업무시간 안내
                                                                                                    <span class="color-dark-yellow-400 padding-left-5">NEW</span>
                                                                                            </a>
                                        </li>
                                                                            <li class="padding-top-5 padding-bottom-5 padding-left-0 padding-right-0">
                                            <a target="_blank" href="http://kmongteam.blog.me/221202310949" class="plain color-dark-gray" onclick="sendGAEvent('main', 'footer - 공지사항 - 크몽앱 전화상담 이용방법 안내', kmongCurrentPath);">
                                                - 크몽앱 전화상담 이용방법 안내
                                                                                                    <span class="color-dark-yellow-400 padding-left-5">NEW</span>
                                                                                            </a>
                                        </li>
                                                                            <li class="padding-top-5 padding-bottom-5 padding-left-0 padding-right-0">
                                            <a target="_blank" href="http://kmongteam.blog.me/221191685719" class="plain color-dark-gray" onclick="sendGAEvent('main', 'footer - 공지사항 - 법률 관련 서비스 개편', kmongCurrentPath);">
                                                - 법률 관련 서비스 개편
                                                                                            </a>
                                        </li>
                                                                            <li class="padding-top-5 padding-bottom-5 padding-left-0 padding-right-0">
                                            <a target="_blank" href="https://kmongteam.blog.me/221171520968" class="plain color-dark-gray" onclick="sendGAEvent('main', 'footer - 공지사항 - 앱 전화상담 기능 도입 안내', kmongCurrentPath);">
                                                - 앱 전화상담 기능 도입 안내
                                                                                            </a>
                                        </li>
                                                                            <li class="padding-top-5 padding-bottom-5 padding-left-0 padding-right-0">
                                            <a target="_blank" href="http://kmongteam.blog.me/221171267788" class="plain color-dark-gray" onclick="sendGAEvent('main', 'footer - 공지사항 - 상담&amp;노하우, 컨설팅 카테고리 재편 안내', kmongCurrentPath);">
                                                - 상담&amp;노하우, 컨설팅 카테고리 재편 안내
                                                                                            </a>
                                        </li>
                                                                    </ul>
                            </div>
                        </div>
                    </div>

                    <div class="pull-right inline-block padding-left-60">
                        <div class="row">
                            <div class="col-xs-12">
                                <h4 class="margin-none pull-left">
                                    <b>고객센터</b>
                                </h4>
                                <!-- 직거래 신고하는 페이지로 연결 -->
                                <a class="font-size-h6 color-primary text-underline pull-right" href="#" onclick="sendGAEvent('main', 'footer - 직거래 / 불법홍보 신고', kmongCurrentPath);">
                                    &nbsp;직거래/불법홍보 신고
                                </a>
                            </div>
                        </div>
                        <div class="row margin-top-5 margin-bottom-5 text-center">
                            <div class="col-xs-12">
                                                                    <a class="plain" href="javascript:void(0);" onclick="sweetalertByType('크몽은 [통신판매중개사이트] 입니다.', '판매 중인 서비스에 대한 작업의뢰/견적요청 등의<br/>문의는 해당 서비스 전문가에게 직접 부탁드립니다 :D<br/><br/>크몽 고객센터: 1544-6254', 'info', 'button'); sendGAEvent('clickEvent', 'main', '전화번호 확인 기타');">
                                        <div class="margin-top-0 font-size-h1" style="letter-spacing: 4px;font-size: 22px !important;">
                                            <img style="vertical-align: initial;" class="width-20px" src="css/image/ic-phone.png" alt="전화아이콘">
                                            <b>전화번호확인</b>
                                        </div>
                                    </a>
                                                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <a class="btn btn-black btn-block btn-xss NGL" href="javascript:void(0);" target="_blank" onclick="sendGAEvent('main', 'footer - 전화전 클릭', kmongCurrentPath);">
                                    전화전 클릭
                                </a>
                            </div>
                        </div>
                        <div class="row margin-top-10">
                            <div class="col-xs-12">
                                <h5 class="margin-none text-style text-right font-color-lighter">
                                    <strong class="font-color-light">
                                        상담시간 :&nbsp;<span style="letter-spacing: 0.1px;">평일 10:00 ~ 18:00</span>
                                    </strong> <br>
                                    <span class="font-color-light">* 토요일 및 공휴일 휴무</span>
                                </h5>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
</div>
