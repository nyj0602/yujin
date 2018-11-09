<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<div class="row">
							<div class="col-xs-12">
								<div id="gigListContainer">
								
									<c:set var="i" value="0"></c:set>
									<c:forEach items="${ TalentList }" var="dto"	begin="${page*12-12 }"	end="${(page*12-1) eq size? size:(page*12-1) }">
										<c:set var="i" value="${1+i}"></c:set>
							
										<c:choose>
											<c:when test="${i % 4 eq 1 }">
												<div class="row margin-none">
											</c:when>
										</c:choose>
										<div
											class="kmong-grid-4-20  gig-wrapper margin-top-20 position-relative"
											data-ga-issend="1" data-ga-category="category"
											data-ga-action="1 - 서비스 클릭" data-ga-label="/category/1">
											<div
												class=" bg-color-white gig-wrapper-default  position-relative">

												<div class="gig-premium-img">
													<c:choose>
														<c:when test="${dto.t_ad eq '프리미엄광고' }">
															<img class="width-30px"
																src="../css/image/gig_premium_ver3.png" title="프리미엄광고">
														</c:when>
														<c:when test="${dto.t_ad eq '플러스광고' }">
															<img class="width-30px" src="../css/image/gig_plus_ver3.png"
																title="플러스광고">
														</c:when>
													</c:choose>
												</div>

												<a class="plain" href="/kmongPro/category/talent.do?t_seq=${dto.t_seq }"
													onclick="sendGAEvent('category', '1 - 서비스 클릭 - 서비스 이미지 - 1', '/category/1');">

													<div class="gig-image position-relative">
														<div class="gig-profile">
															<div class="position-relative">
																<div class="gig-list-profile-background-border"></div>
																<div
																	class="gig-list-profile userProfileRanking ${dto.gs_name }">
																	<img
																		class="gig-list-user-profile border-round position-relative"
																		src="../css/image/${dto.m_profile }"
																		title="${dto.m_name }"
																		onerror="this.onerror=null;this.src='../image/${dto.m_profile }'">

																	<c:choose>
																		<c:when test="${dto.gs_name eq 'new' }">
																			<img class="gig-ranking-img"
																				src="../css/image/kmong_grade_NEW.png"
																				data-toggle="tooltip" data-placement="top" title=""
																				data-original-title="NEW">
																		</c:when>
																		<c:when test="${dto.gs_name eq 'junior' }">
																			<img class="gig-ranking-img"
																				src="../css/image/kmong_grade_JUNIOR.png"
																				data-toggle="tooltip" data-placement="top" title=""
																				data-original-title="JUNIOR">
																		</c:when>
																		<c:when test="${dto.gs_name eq 'senior' }">
																			<img class="gig-ranking-img"
																				src="../css/image/kmong_grade_SENIOR.png"
																				data-toggle="tooltip" data-placement="top" title=""
																				data-original-title="SENIOR">
																		</c:when>
																		<c:when test="${dto.gs_name eq 'semipro' }">
																			<img class="gig-ranking-img"
																				src="../css/image/kmong_grade_SEMIPRO.png"
																				data-toggle="tooltip" data-placement="top" title=""
																				data-original-title="SEMIPRO">
																		</c:when>
																		<c:when test="${dto.gs_name eq 'pro' }">
																			<img class="gig-ranking-img"
																				src="../css/image/kmong_grade_PRO.png"
																				data-toggle="tooltip" data-placement="top" title=""
																				data-original-title="PRO">
																		</c:when>
																		<c:when test="${dto.gs_name eq 'master' }">
																			<img class="gig-ranking-img"
																				src="../css/image/kmong_grade_MASTER.png"
																				data-toggle="tooltip" data-placement="top" title=""
																				data-original-title="MASTER">
																		</c:when>
																	</c:choose>
																</div>
															</div>
														</div>


														<img class="width-100" src="../server/${dto.image}"
															title="${dto.t_name }"
															onerror="this.onerror=null;this.src='../image/no_gig_sm_image.jpg'">
													</div>
												</a>
												<div>
													<div id="tiong" class="gig-title ">

														<a class="plain" href="/kmongPro/category/talent.do?t_seq=${dto.t_seq }">
															<div	class="GigLineClamp line-clamp-default-2 position-relative"
																style="line-height: 20px !important; height: 40px !important;">
																${dto.t_name }</div>
														</a>
													</div>
												</div>

												<div
													class="padding-left-15 padding-right-15 padding-bottom-15">
													<div class="inline-block">
														<button type="button"
															class="test inline-block border-none bg-color-transparent font-size-h4 padding-all-0"
															disabled="">
															<i class="fa fa-heart-o color-white"></i>
														</button>
													</div>
													<div class="pull-right inline-block">
														<b class="font-size-h4"><span class="NGB">₩</span>&nbsp; <fmt:formatNumber value="${dto.op_price }" pattern="#,###" /></b><span
															class="font-size-"> </span>
													</div>
												</div>

												<div
													class="border-top-solid padding-left-15 padding-right-15"
													style="padding-top: 4px; padding-bottom: 4px">
													<a class="inline-block plain color-dark-gray"
														style="margin-top: 4px; margin-bottom: 2px;"
														href="http://localhost:8080/kmongPro/profile.do?sellerID=${dto.m_email }"> <c:choose>
															<c:when test="${dto.m_sep eq '기업판매자' }">
																<img class="padding-right-5 width-30px"
																	src="../css/image/ic_company.png"
																	style="vertical-align: inherit !important;">
															</c:when>
														</c:choose>
														<div class="gig-username font-size-h6"
															style="max-width: 80px !important;">${dto.m_name }
														</div>
													</a>
											<c:set var="star" value="${star.st }"></c:set>
													<div
														class="gig-userinfo-rating-right inline-block pull-right text-right"
														style="margin-top: 4px;">
														<h6 class="gig-userinfo-rating margin-none">
															<div class="inline-block ">
																<div
																	class="rating-container theme-krajee-fa rating-xs rating-disabled rating-margin-none">
																	<div class="rating-stars">
																		<span class="empty-stars"> <span class="star"><i
																				class="fa fa-star color-e3"></i></span> <span class="star"><i
																				class="fa fa-star color-e3"></i></span> <span class="star"><i
																				class="fa fa-star color-e3"></i></span> <span class="star"><i
																				class="fa fa-star color-e3"></i></span> <span class="star"><i
																				class="fa fa-star color-e3"></i></span>
																		</span> 
												<c:forEach items="${star }" var="star">
												<c:if test="${dto.t_seq eq star.t_seq }">
																		<span class="filled-stars" style="width: ${star.avg*20}%;">
																			<!-- 평가받은 별점 평균 --> <span class="star"><i
																				class="fa fa-star"></i></span> <span class="star"><i
																				class="fa fa-star"></i></span> <span class="star"><i
																				class="fa fa-star"></i></span> <span class="star"><i
																				class="fa fa-star"></i></span> <span class="star"><i
																				class="fa fa-star"></i></span>
																		</span>
													
																	</div>
																</div>
															</div>
																<!-- 재능 별 평가 갯수입력 -->
															<div	class="inline-block color-dark-gray gig-rating-count font-size-h6">
																(${star.num })
															</div>
														 </c:if>
														</h6>
													</div>
													</c:forEach>
												</div>
											</div>
										</div>
										<c:choose>
											<c:when test="${i % 4 eq 0 }">
								</div>
								</c:when>
								</c:choose>
								
								
								</c:forEach>
								<%-- <h1>${i }</h1> --%>

							</div>