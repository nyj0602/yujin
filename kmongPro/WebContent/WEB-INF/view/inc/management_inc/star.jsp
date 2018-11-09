<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<div class="bg-color-f5">

                <div id="ratingSellerMessageBox" class="deliveryMessageBox margin-top-30 padding-bottom-20 border-bottom-solid" style="">
                    <div class="row text-center margin-top-15">
                        <div class="col-xs-12 padding-left-35 padding-right-35">

                            <div class="row margin-none">
                                <div class="col-xs-12 padding-top-20 border-top-solid padding-left-0 padding-right-0">
                                    <div class="row text-center">
                                        <div class="col-xs-12">
                                            <img class="message-action-image" src="../css/image/ratings.png" title="구매 확정">

                                            <div class="margin-top-10"><b>서비스를 평가하고 구매를 확정합니다.</b></div>
                                            <div class="margin-top-5">구매가 확정되면, 결과물에 대한 수정/취소가 불가능합니다.<br>최종 작업물을 받아보지 못한 상태에서의 확정요청은 단호히 거절해주세요.</div>

                                            <div id="trackRatingSellerWhenDelivered" class="track-rating-star text-center">
                                                <div class="rating-container rating-ms rating-animate">
                                                <div class="rating-stars">
                                                	<span class="empty-stars">
                                                		<span class="star"><i class="fa fa-star color-e3"></i></span>
                                                		<span class="star"><i class="fa fa-star color-e3"></i></span>
                                                		<span class="star"><i class="fa fa-star color-e3"></i></span>
                                                		<span class="star"><i class="fa fa-star color-e3"></i></span>
                                                		<span class="star"><i class="fa fa-star color-e3"></i></span>
                                                	</span>
                                                	<span class="filled-stars" id="evalu" style="width: 100%; color: rgb(68, 68, 68);">
                                                		<span class="star"><i class="fa fa-star"></i></span>
                                                		<span class="star"><i class="fa fa-star"></i></span>
                                                		<span class="star"><i class="fa fa-star"></i></span>
                                                		<span class="star"><i class="fa fa-star"></i></span>
                                                		<span class="star"><i class="fa fa-star"></i></span>
                                                	</span>
                                                </div>
                                                </div>
                                            </div>


                                            <div class="row">
                                                <div class="col-xs-4 col-xs-center">
                                                    <div class="gig-detail-default-option">
                                                        <div class="gig-detail-decision-option-btn">
                                                            <a class="inline-block" id="starm">
                                                                <i class="fa fa-minus" aria-hidden="true"></i>
                                                            </a>
                                                            <div class="inline-block track-star-rating-value" id="starRatingValue">5.0 
                                                            </div>
                                                            <a class="inline-block" id="starp" >
                                                                <i class="fa fa-plus" aria-hidden="true"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="margin-top-20 position-relative">
                                        <div class="row">
                                        <form id="starForm">
                                            <div class="col-xs-9 padding-side-0 col-centered">
                                            	<input type="hidden" name="ordernum" value="${ordernum }" />
                                            	<input type="hidden" name="star" value="5"/>
                                                <input name="content" class="form-control message-box-textarea messageTextArea" placeholder="감사합니다~!" ></input>
                                            </div>
                                         </form>
                                        </div>
                                    </div>

                                    <div class="message-box-footer-body padding-top-20 padding-bottom-5">
                                        <div class="row">
                                            <div class="col-xs-5 col-centered">
                                                <div class="inline-block" id="evaluation">
                                                    <button class="btn btn-block btn-black sendBtn" id="starBtn">전송</button>
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
            
   