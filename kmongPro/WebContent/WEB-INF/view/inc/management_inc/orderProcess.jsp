<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="row">
	<div class="col-xs-12">
		<div
			class="message-container border-bottom-solid message-container-min-height">
<c:set value="0" var="term"></c:set>
<c:forEach items="${payment }" var="pay">
	<c:set value="${term+pay.op_term }" var="term"></c:set>
	<c:set value="${pay.seller }" var="seller"></c:set>
</c:forEach>

  <c:forEach items="${process }" var="pro">
      <c:if test="${pro.pl_content eq '작업시작' }">
      <fmt:parseDate value="${pro.sendtime }" var="sendtime" pattern="yy.mm.dd HH:mm"></fmt:parseDate>
			<div class="row track-action-wrapper" style="">
				<div class="col-xs-12">
					<div class="row">
						<div class="text-center margin-top-30">
							<img class="message-action-image"
								src="../css/image/order_complet.png" title="주문 접수">
							<div class="margin-top-10">
								<b>주문이 접수되었습니다</b>
							</div>
						</div>

						<div class="text-center">
							작업물 발송 예정일까지 작업물이 전달되지 않을 경우 <br> 직권취소 사유가 될 수 있습니다. 완료일을 꼭
							지켜주세요!
						</div>

						<h5 class="text-center margin-top-15 color-primary">
							<b>작업물 발송 예정일</b><br> <fmt:formatDate value="${sendtime}" pattern="yy.MM.dd HH:mm "/> 
						</h5>
					</div>
				</div>
			</div>
</c:if>

      

<c:if test="${pro.pl_content eq '추가결제 완료' and  email eq seller}">
			<div class="row margin-top-0 track-action-wrapper"
				id="inbox2_4252887">

				<div>
					<div class="text-center margin-top-30">
						<img class="message-action-image width-35px"
							src="../css/image/additional_pay.png" title="추가 결제">

						<div class="margin-top-10">
							<b>${pro.pl_sender }&nbsp;님이 추가결제를 완료했습니다.</b>
						</div>
						<div class="margin-top-10" style="display: none;">
							<b>문제해결 요청이 수락되었습니다.</b>
						</div>




						<h5 class="color-primary text-center margin-top-15"
							style="display: none;">
							작업물 발송 예정일<br> ${pro.pl_sendtime }
						</h5>
					</div>


					<div class="text-center">
						<div class="text-left message-option-table">
							<div class="panel panel-default">
								<div class="panel-body">
									<div class="panel margin-top-0 margin-bottom-15">
										<div class="panel-gray border-none padding-all-10">
											<div class="row">
												<div class="col-xs-5">서비스</div>
												<div class="col-xs-2 text-center">수량</div>
												<div class="col-xs-2 text-right">작업일</div>
												<div class="col-xs-3 text-right">금액</div>

											</div>
										</div>
										<c:forEach items="${addpay }" var="add">
										<div
											class="panel-body padding-top-15 padding-left-10 padding-right-10 padding-bottom-15">
											<div class="row message-option-table-divider">
												<div class="col-xs-5 message-option-table-content"
													style="display: -webkit-box !important;">추가 수정</div>
												<div
													class="col-xs-2 text-center message-option-table-content">1</div>
												<div
													class="col-xs-2 text-right message-option-table-content">+&nbsp;${add.ap_term }&nbsp;일</div>
												<div
													class="col-xs-3 text-right message-option-table-content">
													<i class="fa fa-krw" aria-hidden="true"></i>&nbsp;${add.ap_price }
												</div>
											</div>
										</div>
										</c:forEach>
									</div>
									<div
										class="message-option-total-price padding-right-5 margin-bottom-0 margin-top-10">
										<b>총 결제금액&nbsp;&nbsp;<i class="fa fa-krw"
											aria-hidden="true"></i>&nbsp;${ap.ap_price }
										</b>
									</div>
								</div>
							</div>
							<h6 class="margin-top text-right font-color-lighter">
								18.03.14 17:56</h6>
						</div>
					</div>

				</div>

			</div>
			</c:if>
			
			
<c:if test="${pro.pl_content eq '수정요청' }">
			<div
				class="row margin-top-30 track-action-wrapper margin-top-10 margin-bottom-10"
				id="inbox2_4253024">



				<div>
					<div class="text-center margin-top-30">
						<img class="message-action-image" src="../css/image/revision.png"
							title="상호 취소 요청">

						<div class="margin-top-10">
							<b>작업물 수정 요청을 하였습니다</b>
						</div>

					</div>
					
				</div>

			</div>
</c:if>
<c:if test="${email ne pro.pl_sender and pro.pl_sender ne 'kmong' }">
<c:forEach items="payment" var="pay">
			<div class="row margin-top-30 margin-top-10 margin-bottom-10"
				id="inbox2_4265694">
				<div>
					<div class="message-left">
						<div class="inline-block message-left-arrow">


							<div class="inline-block">
								<a target="_blank" href="http://localhost:8080/kmongPro/profile.do?sellerID=${pro.pl_sender }"> <img
									class="message-left-profile-image"
									onerror="this.onerror=null;this.src='../css/image/main_user_gray.png';"
									src="../css/image/${email eq buyer? bprofile:sprofile }">
								</a>
							</div>
						</div>

						<div class="inline-block message-left-body">

							<div class="message-left-partner">
								<a class="plain" target="_blank"
									href="http://localhost:8080/kmongPro/profile.do?sellerID=${pro.pl_sender }"> ${pro.pl_sender } </a>
							</div>
							<div class="message-left-bubble-body position-relative">
								<div>${pro.pl_content }</div>


							</div>
							<div class="message-left-time">${pro.sendtime }</div>
						</div>
					</div>
				</div>
			</div>
</c:forEach>
</c:if>

<c:if test="${email eq pro.pl_sender }">

<div class="row margin-top-30 margin-top-10 margin-bottom-10" id="inbox2_4265694">
    
    <div>
        <div class="message-right">
    <div class="inline-block message-right-arrow">
            </div>

    <div class="inline-block message-right-body">
                <div class="message-right-bubble-body position-relative">
            <div>${pro.pl_content }</div>
            
            
        </div>
        <div class="message-right-time">
            
                            &nbsp;&nbsp;                        ${pro.sendtime }        </div>
    </div>
</div>
    </div>

</div>

</c:if>

<c:if test="${pro.pl_content eq '작업완료' }">
			<div
				class="row margin-top-30 track-action-wrapper margin-bottom-0 margin-top-10 margin-bottom-10"
				id="inbox2_4253029">

				<div>

					<div class="row">
						<div class="col-xs-12">
							<div class="row">
								<div class="col-xs-12">
									<div class="text-center margin-top-30">
										<img class="message-action-image width-35px"
											src="../css/image/delivery.png" title="작업물 배송">


										<div class="margin-top-10">
											<b>발송완료 되었습니다.</b>
										</div>

									</div>
								</div>
							</div>
							<!--  -->
							<c:if test="${email eq seller }">
							<div class="row">
								<div class="col-xs-12">
									<div class="message-right">
										<div class="inline-block message-right-arrow"></div>

										<div class="inline-block message-right-body">
											<div class="message-right-bubble-body position-relative">
												<div>작업물이 발송되었습니다. </div>
												<ul style="width: 375px"
													class="list-inline message-image-body">
													<li style="padding: 7px !important;"
														class="padding-right-0">
														<div>
															<a class="text-underline"
																href="다운로드">
																<div>
																</div> <span class="width-100px line-clamp-default-1"
																data-toggle="tooltip" data-placement="bottom"
																data-title="${pro.pl_file }">
																	<i class="fa fa-paperclip"></i>&nbsp;${pro.pl_file }
															</span>
															</a>
														</div>

													</li>
												</ul>

											</div>
											<div class="message-right-time">&nbsp;&nbsp; ${pro.sendtime }
												</div>
										</div>
									</div>
								</div>
							</div>
							</c:if>
							<!--  -->
<c:if test="${email ne seller }">
							<div class="row">
            <div class="col-xs-12">
                <div class="message-left">
    <div class="inline-block message-left-arrow">
                    <div class="inline-block">
                <a target="_blank" href="http://localhost:8080/kmongPro/profile.do?sellerID=${seller }">
                    <img class="message-left-profile-image" onerror="this.onerror=null;this.src='../css/image/main_user_gray.png';" src="../css/image/${sprofile }">
                </a>
            </div>

            
            </div>

    <div class="inline-block message-left-body">
                    <div class="message-left-partner">
                <a class="plain" target="_blank" href="http://localhost:8080/kmongPro/profile.do?sellerID=${seller }"> ${seller } </a>
            </div>
            
                <div class="message-left-bubble-body position-relative">
            <div>작업물이 도착하였습니다.</div>
            <ul style="width: 375px" class="list-inline message-image-body">
                <li style="padding: 7px !important;" class="padding-right-0">
                    <div>
                        <a class="text-underline" href="https://kmong.com/download/track/4253029/2168345">
                            <div>
                            </div>
                            
                            <span class="width-100px line-clamp-default-1" data-toggle="tooltip" data-placement="bottom" data-title="${pl_png }">
                                <i class="fa fa-paperclip"></i>&nbsp;${pro.pl_file }                       </span>
                        </a>
                    </div>
                    
                </li>
            </ul>
            
        </div>
        <div class="message-left-time">  ${pl.send_time } </div>
    </div>
</div>
            </div>
        </div>
        </c:if>
							<!--  -->
						</div>
					</div>
				</div>
			</div>
</c:if>

<c:if test="${pro.pl_content eq '평가 완료' and state ne '요청사항 미작성'}">
		<c:forEach items="${evaluation }" var="eval">
			<div class="row track-action-wrapper">
				<div class="text-center margin-top-30">
					<img class="message-action-image" src="../css/image/buy_rate.png"
						title="평가 하기">
					<div class="margin-top-10">
					<c:choose>
					<c:when test="${email eq eval.buyer }">
						<b>내가 남긴 평가</b>
					</c:when>
					<c:when test="${email ne eval.buyer }">
						<b>의뢰인이 남긴 평가</b>
					</c:when>
					</c:choose>
					</div>
					<div class="text-center">
						<div
							class="rating-container theme-krajee-fa rating-disabled rating-margin-none">
							<div class="rating-stars track-rating-star">
								<span class="empty-stars"> <span class="star"><i
										class="fa fa-star color-e3"></i></span> <span class="star"><i
										class="fa fa-star color-e3"></i></span> <span class="star"><i
										class="fa fa-star color-e3"></i></span> <span class="star"><i
										class="fa fa-star color-e3"></i></span> <span class="star"><i
										class="fa fa-star color-e3"></i></span>
								</span> <span class="filled-stars" style="width: ${eval.e_star*20}%;"> <span
									class="star"><i class="fa fa-star"></i></span> <span
									class="star"><i class="fa fa-star"></i></span> <span
									class="star"><i class="fa fa-star"></i></span> <span
									class="star"><i class="fa fa-star"></i></span> <span
									class="star"><i class="fa fa-star"></i></span>
								</span>
							</div>
						</div>
					</div>


					<h5
						class="margin-top-15 text-center padding-left-25 padding-right-25">
						<div class="message inline-block line-height word-break">${eval.e_content }</div>
					</h5>
				</div>

				<h6
					class="margin-top-10 text-right font-color-lighter margin-right-15">
					${eval.e_date }</h6>
			</div>
		</c:forEach>
</c:if>

<c:if test="${pro.pl_content eq '문제 해결 요청' }">
<c:forEach items="${solution}" var="sol">
<div class="row margin-top-30 track-action-wrapper margin-bottom-0 margin-top-10 margin-bottom-10" id="inbox2_4023156">
    
    <div>
        <div class="text-center margin-top-30">
    <div>
        <img class="message-action-image width-35px" src="../css/image/Problem.png" title="상호 취소 요청">

        <div>
                            <div class="margin-top-10"><b>문제해결을 요청했습니다.</b></div>

            <div class="word-break padding-left-30 padding-right-30">사유 : ${sol.sp_content }</div>
        </div>
    </div>
    
</div>

<div class="row">
    <div class="col-xs-12">
        <div class="panel panel-default message-option-table work-before-box">
            <div class="panel-body padding-all-20 text-center">
                <div class="padding-all-10 border-solid bg-color-f5 NGB">
                    주문 취소를 요청했습니다.
                </div>
                     </div>
        </div>
    </div>
</div>
    </div>

 
</div>
</c:forEach>
</c:if>

<c:if test="${pro.pl_content eq '취소' }">
<div class="row margin-top-30 track-action-wrapper margin-top-10 margin-bottom-10" id="inbox2_4023680">
    
    <div>
        <div class="text-center margin-top-30">
    <img class="message-action-image width-35px" src="../css/image/mutual_cancellation_succeed_c.png" title="상호 취소 승인">
    
    <div class="margin-top-10 color-danger"><b>상호 합의 하에 주문이 취소되었습니다.</b></div>
</div>


<div class="row">
    <div class="col-xs-12 text-center padding-right-30">
        <div class="message-left-time text-center">
                            &nbsp;&nbsp;                  ${pro.sendtime }       </div>
    </div>
</div>

    </div>

</div>
</c:if>

		<%-- 		<c:if test="${pro.pl_content eq '평가 미작성' and email eq buyer}">
					<jsp:include page="/WEB-INF/view/management/inc/star.jsp"></jsp:include>
				</c:if> --%>
</c:forEach>
		</div>
	</div>
