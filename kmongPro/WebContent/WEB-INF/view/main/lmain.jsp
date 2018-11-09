<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>비지니스 파트너 크몽에 다있다! 외주, 아웃소싱 전문 | 크몽</title>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="css/kmong_desktop_v2-6ec7c3f31e.css"
	type="text/css">
<link rel="stylesheet" href="css/kmong-8888b96a4a.master_desktop.css"
	type="text/css">
<link rel="stylesheet" href="css/kmong_fonts.css" type="text/css">
<link rel="shortcut icon" href="css/image/favicon.ico">

<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.css" />
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
	
		$("#quickMenuTop").click(function() {
			$('html, body').animate({
				scrollTop : 0
			}, 400);
			return false;
		});

		var mknav = $('#mainKmongNavBar');
		$(window).scroll(function() {
			if ($(this).scrollTop() > 300) {
				mknav.css("display", "block");
				mknav.addClass("f-nav");
			} else {
				mknav.css("display", "none");
				mknav.removeClass("f-nav");
			}
		});

	});
</script>


<style>
.global-body {
	margin-top: 0px !important;
}
</style>

<style>
.notificationTooltip .tooltip-inner {
	padding: 5px;
	max-width: 100px;
	text-align: left;
	/* If max-width does not work, try using width instead */
	width: 100px;
}
</style>

</head>
<body id="master_body">

	<div class="fake_global_body"></div>
	<div class="global-body">

		<c:import url="http://localhost:8080/kmongPro/QuickMenuModuel.do">
			<c:param name="sessionID" value="${sessionID }"></c:param>
		</c:import>





		<nav id="mainKmongNavBar1" class="navbar navbar-fixed-top"
			style="z-index: 99; display: block;">
			<jsp:include page="/WEB-INF/view/inc/header/header_lmain.jsp"></jsp:include>

			<jsp:include page="/WEB-INF/view/inc/header/header_category.jsp"></jsp:include>
		</nav>

		<div
			class="overflow-hidden width-100 bg-color-yellow-400 position-relative">
			<div id="mainHeaderContainer" class="container">
				<div class="row">
					<div class="col-xs-12 padding-side-0">
						<div id="carousel-example-generic"
							class="carousel slide position-relative" data-ride="carousel">

							<!-- Wrapper for slides -->
							<div class="carousel-inner overflow-hidden" role="listbox"
								style="height: 445px;">
								<div class="item">
									<div style="width: 40%; float: right;">
										<img class="position-relative" src="css/image/cafe_n_blog.png"
											alt="인기키워드-#카페 <span class=&quot;NGR&quot;>&amp;</span> 블로그">
									</div>
									<div style="text-align: center; margin-top: 150px;"
										class="position-absolute main-header-carousel-content">
										<h4 class="margin-none margin-bottom-5">인기키워드</h4>
										<h2 class="NGB margin-none margin-bottom-10">
											#카페 <span class="NGR">&amp;</span> 블로그
										</h2>
										<h3 class="margin-none">입소문은 손님을 싣고~</h3>

										<div class="margin-top-50 position-relative">
											<a
												class="btn btn-sm btn-black padding-top-5 padding-bottom-5 padding-left-15 padding-right-15"
												href="#"
												onclick="sendGAEvent('main', '인기키워드 - #카페 <span class=&quot;NGR&quot;>&amp;</span> 블로그', kmongCurrentPath); sendGAEvent('clickEvent', 'eventDetail', '로그인후 메인 - #카페 <span class=&quot;NGR&quot;>&amp;</span> 블로그 - 입소문은 손님을 싣고~')""="">바로가기</a>
										</div>
									</div>

								</div>
								<div class="item active">
									<div style="width: 30%; float: right;">
										<img class="position-relative"
											src="css/image/drawing_lesson.png"
											alt="인기키워드-#미술 <span class=&quot;NGR&quot;>&amp;</span> 공예 레슨">
									</div>
									<div style="text-align: center; margin-top: 150px;"
										class="position-absolutemain-header-carousel-content">
										<h4 class="margin-none margin-bottom-5">인기키워드</h4>
										<h2 class="NGB margin-none margin-bottom-10">
											#미술 <span class="NGR">&amp;</span> 공예 레슨
										</h2>
										<h3 class="margin-none">똥손이 금손되는 시간!</h3>
										<div class="margin-top-50 position-relative">
											<a
												class="btn btn-sm btn-black padding-top-5 padding-bottom-5 padding-left-15 padding-right-15"
												href="#"
												onclick="sendGAEvent('main', '인기키워드 - #미술 <span class=&quot;NGR&quot;>&amp;</span> 공예 레슨', kmongCurrentPath); sendGAEvent('clickEvent', 'eventDetail', '로그인후 메인 - #미술 <span class=&quot;NGR&quot;>&amp;</span> 공예 레슨 - 똥손이 금손되는 시간!')""="">바로가기</a>
										</div>
									</div>
								</div>
								<div class="item">
									<div style="width: 40%; float: right;">
										<img class="position-relative" src="css/image/sns.png"
											alt="인기키워드-#SNS광고">
									</div>
									<div style="text-align: center; margin-top: 150px;"
										class="position-absolutemain-header-carousel-content">
										<h4 class="margin-none margin-bottom-5">인기키워드</h4>
										<h2 class="NGB margin-none margin-bottom-10">#SNS광고</h2>
										<h3 class="margin-none">저비용으로 고효율 광고하기</h3>

										<div class="margin-top-50 position-relative">
											<a
												class="btn btn-sm btn-black padding-top-5 padding-bottom-5 padding-left-15 padding-right-15"
												href="#"
												onclick="sendGAEvent('main', '인기키워드 - #SNS광고', kmongCurrentPath); sendGAEvent('clickEvent', 'eventDetail', '로그인후 메인 - #SNS광고 - 저비용으로 고효율 광고하기')""="">바로가기</a>
										</div>
									</div>
								</div>
								<div class="item">
									<div style="width: 40%; float: right;">
										<img class="position-relative"
											src="css/image/business_plan.png"
											alt="인기키워드-#사업계획서 <span class=&quot;NGR&quot;>&amp;</span> 제안서">
									</div>
									<div style="text-align: center; margin-top: 150px;"
										class="position-absolutemain-header-carousel-content">
										<h4 class="margin-none margin-bottom-5">인기키워드</h4>
										<h2 class="NGB margin-none margin-bottom-10">
											#사업계획서 <span class="NGR">&amp;</span> 제안서
										</h2>
										<h3 class="margin-none">투자를 부르는 작성 노하우는?</h3>

										<div class="margin-top-50 position-relative">
											<a
												class="btn btn-sm btn-black padding-top-5 padding-bottom-5 padding-left-15 padding-right-15"
												href="#"
												onclick="sendGAEvent('main', '인기키워드 - #사업계획서 <span class=&quot;NGR&quot;>&amp;</span> 제안서', kmongCurrentPath); sendGAEvent('clickEvent', 'eventDetail', '로그인후 메인 - #사업계획서 <span class=&quot;NGR&quot;>&amp;</span> 제안서 - 투자를 부르는 작성 노하우는?')""="">바로가기</a>
										</div>
									</div>
								</div>
								<div class="item">
									<div style="width: 40%; float: right;">
										<img class="position-relative" src="css/image/picture.png"
											alt="인기키워드-#사진 <span class=&quot;NGR&quot;>&amp;</span> 영상촬영">
									</div>
									<div style="text-align: center; margin-top: 150px;"
										class="position-absolutemain-header-carousel-content">
										<h4 class="margin-none margin-bottom-5">인기키워드</h4>
										<h2 class="NGB margin-none margin-bottom-10">
											#사진 <span class="NGR">&amp;</span> 영상촬영
										</h2>
										<h3 class="margin-none">상품을 맛있게 담아드립니다</h3>

										<div class="margin-top-50 position-relative">
											<a
												class="btn btn-sm btn-black padding-top-5 padding-bottom-5 padding-left-15 padding-right-15"
												href="#"
												onclick="sendGAEvent('main', '인기키워드 - #사진 <span class=&quot;NGR&quot;>&amp;</span> 영상촬영', kmongCurrentPath); sendGAEvent('clickEvent', 'eventDetail', '로그인후 메인 - #사진 <span class=&quot;NGR&quot;>&amp;</span> 영상촬영 - 상품을 맛있게 담아드립니다')""="">바로가기</a>
										</div>
									</div>
								</div>
								<div class="item">
									<div style="width: 40%; float: right;">
										<img class="position-relative" src="css/image/logo_design.png"
											alt="인기키워드-#로고디자인">
									</div>
									<div style="text-align: center; margin-top: 150px;"
										class="position-absolutemain-header-carousel-content">
										<h4 class="margin-none margin-bottom-5">인기키워드</h4>
										<h2 class="NGB margin-none margin-bottom-10">#로고디자인</h2>
										<h3 class="margin-none">전문 디자이너에게 맡겨보세요</h3>

										<div class="margin-top-50 position-relative">
											<a
												class="btn btn-sm btn-black padding-top-5 padding-bottom-5 padding-left-15 padding-right-15"
												href="#"
												onclick="sendGAEvent('main', '인기키워드 - #로고디자인', kmongCurrentPath); sendGAEvent('clickEvent', 'eventDetail', '로그인후 메인 - #로고디자인 - 전문 디자이너에게 맡겨보세요')""="">바로가기</a>
										</div>
									</div>
								</div>


							</div>

							<a class="left carousel-control index-logged-slider-arrow"
								href="#carousel-example-generic" role="button" data-slide="prev">
								<img class="width-30px" src="css/image/ic_main_slide_arrow.png">
								<span class="sr-only">Previous</span>
							</a> <a class="right carousel-control index-logged-slider-arrow"
								href="#carousel-example-generic" role="button" data-slide="next">
								<img class="width-30px" src="css/image/ic_main_slide_arrow.png">
								<span class="sr-only">Next</span>
							</a>
						</div>
					</div>
				</div>
			</div>


		</div>

		<div class="container margin-bottom-40">

			<div class="row position-relative" style="top: -30px">
				<div class="col-xs-12">
					<div class="panel panel-default border-radius-0 margin-none">
						<div
							class="padding-top-10 padding-bottom-10 padding-left-15 padding-right-15">
							<a class="plain" href="http://localhost:8080/kmongPro/how_profits_works.do">
								<div class="row">
									<div class="col-xs-12">
										<div class="media">
											<div class="media-left padding-left-5">
												<img class="width-25px margin-right-5 margin-top-10"
													src="css/image/main_mileage.png" alt="마일리지 아이콘">
											</div>
											<div class="media-body">
												<h4 class="margin-top-15 margin-bottom-15">
													전문가 판매 수수료가 최저 <span class="color-red NGB">5%</span>까지
													인하됩니다! <span
														class="pull-right font-color-lighter font-size-h5 margin-top-3"
														style="margin-top: 3px;">자세히보기</span>
												</h4>
											</div>
											<div class="media-right vertical-align-middle">
												<img class="width-10px margin-left-5"
													src="css/image/index_arrow_right.png" alt="arrow right">
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-2">
					<div class="panel-gray border-solid">
						<div class="padding-all-20">
							<div class="row">
								<div class="col-xs-12">
									<h4 class="margin-none line-height">
										반가워요<br> <b>${m_email }</b>님!
									</h4>
								</div>
							</div>
							<div class="row margin-top-5">
								<div class="col-xs-12">
									<p class="margin-none line-height">
										${totalSeler }명 전문가들이<br> 당신의 의뢰를 기다리고<br> 있습니다!<br>
									</p>
								</div>
							</div>
						</div>
					</div>



				</div>

				<div class="col-xs-10">


					<div class="row">
						<div class="col-xs-12">
							<div class="inline-block">
								<h2 class="margin-none">
									<b>스페셜 서비스</b>
								</h2>
								<h5 class="margin-bottom-0">전문가가 제공하는 최상의 서비스들을 소개합니다</h5>
							</div>
							<div class="inline-block pull-right margin-top-5">
								<a
									class="btn btn-black btn-xss padding-left-15 padding-right-15 padding-top-5 padding-bottom-5"
									href="ad_request.do"
									onclick="sendGAEvent('main', '광고 신청', kmongCurrentPath);">
									광고 신청 </a>
							</div>
						</div>
					</div>

					<div class="row margin-none">
						<c:forEach var="slist" items="${specialTalentInfoList }">
							<div
								class="kmong-grid-4-20  gig-wrapper margin-top-20 position-relative"
								data-ga-issend="1" data-ga-category="main"
								data-ga-action="스페셜 서비스 클릭" data-ga-label="/">

								<div class=" gig-wrapper-default  position-relative">

									<a class="plain" href="#"
										onclick="sendGAEvent('main', '스페셜 서비스 클릭 - 서비스 이미지 - 16', '/');">

										<div class="gig-image position-relative">
											<div class="gig-profile">
												<div class="position-relative">
													<div class="gig-list-profile-background-border"></div>
													<div class="gig-list-profile userProfileRanking SEMIPRO">
														<img
															class="gig-list-user-profile border-round position-relative"
															src="css/image/${slist.m_profile }"
															title="${slist.m_name }"
															onerror="this.onerror=null;this.src='css/image/main_user_gray.png'">

													</div>
												</div>
											</div>


											<img class="width-100" src="css/image/${slist.image }"
												title="${slist.t_name }"
												onerror="this.onerror=null;this.src='css/image/main_user_gray.png'">
										</div>
									</a>
									<div>
										<div id="tiong" class="gig-title ">

											<a class="plain" href="https://kmong.com/gig/88389"
												onclick="sendGAEvent('main', '스페셜 서비스 클릭 - 서비스 제목 - 16', '/');">
												<div
													class="GigLineClamp line-clamp-default-2 position-relative"
													style="line-height: 20px !important; height: 40px !important;">
													${slist.t_name }</div>
											</a>
										</div>
									</div>

									<div class="padding-left-15 padding-right-15 padding-bottom-15">
										<div class="inline-block">
											<button type="button"
												class="test inline-block border-none bg-color-transparent font-size-h4 padding-all-0"
												onclick="setBookmark(this, ${slist.t_seq})">
												<c:set var="doneLoop" value="true" />
												<c:forEach var="hlist" items="${heartInfoList }">
													<c:choose>
														<c:when test="${hlist.t_seq eq slist.t_seq and doneLoop}">
															<i class="fa fa-heart color-e6" style="font-weight: 800"></i>
															<c:set var="doneLoop" value="false" />
														</c:when>
														<c:when test="${hlist.t_seq ne slist.t_seq and doneLoop}">
															<i class="fa fa-heart-o color-e6"
																style="font-weight: 800"></i>
															<c:set var="doneLoop" value="false" />
														</c:when>
													</c:choose>
												</c:forEach>

											</button>
										</div>
										<div class="pull-right inline-block">
											<b class="font-size-h4"><span class="NGB">₩</span>&nbsp;${slist.op_price }</b><span
												class="font-size-"> </span>
										</div>
									</div>

									<div class="border-top-solid padding-left-15 padding-right-15"
										style="padding-top: 4px; padding-bottom: 4px">
										<a class="inline-block plain color-dark-gray"
											style="margin-top: 4px; margin-bottom: 2px;"
											href="https://kmong.com/@wowon7975">

											<div class="gig-username font-size-h6"
												style="max-width: 80px !important;">${slist.m_name }</div>
										</a>
										<c:forEach var="starList" items="${starList }">

											<div
												class="gig-userinfo-rating-right inline-block pull-right text-right"
												style="margin-top: 4px;">
												<h6 class="gig-userinfo-rating margin-none">
													<div class="inline-block ">
														<div
															class="rating-container theme-krajee-fa rating-xs rating-disabled rating-margin-none">
															<div class="rating-stars">
																<span class="empty-stars"> <span class="star">
																		<i class="fa fa-star color-e3"></i>
																</span> <span class="star"><i
																		class="fa fa-star color-e3"></i></span> <span class="star"><i
																		class="fa fa-star color-e3"></i></span> <span class="star"><i
																		class="fa fa-star color-e3"></i></span> <span class="star"><i
																		class="fa fa-star color-e3"></i></span>
																</span>
																<c:choose>
																	<c:when test="${starList.t_seq eq slist.t_seq}">
																		<span class="filled-stars"
																			style="width: ${starList.e_star*100/5 }%;"> <span
																			class="star"><i class="fa fa-star"></i></span> <span
																			class="star"><i class="fa fa-star"></i></span> <span
																			class="star"><i class="fa fa-star"></i></span> <span
																			class="star"><i class="fa fa-star"></i></span> <span
																			class="star"><i class="fa fa-star"></i></span>
																		</span>
																	</c:when>
																</c:choose>
															</div>
														</div>
													</div>
													<c:set var="doneLoop2" value="true" />
													<c:choose>
														<c:when
															test="${starList.t_seq eq slist.t_seq and doneLoop2}">
															<div
																class="inline-block color-dark-gray gig-rating-count font-size-h6">
																(${starList.count })</div>
															<c:set var="doneLoop2" value="false" />
														</c:when>
														<c:when
															test="${starList.t_seq ne slist.t_seq and doneLoop2}">
															<div
																class="inline-block color-dark-gray gig-rating-count font-size-h6">
																(0)</div>
															<c:set var="doneLoop2" value="false" />
														</c:when>
													</c:choose>
												</h6>
											</div>

										</c:forEach>

									</div>
								</div>
							</div>

						</c:forEach>


					</div>


				</div>
			</div>
		</div>


	</div>




	<jsp:include page="/WEB-INF/view/inc/footer/footer_notice.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/view/inc/footer/footer.jsp"></jsp:include>

	<script>

		function setBookmark(target, PID) {

			var $target = $(target);
			
			var html = $target.html();

			var formData = {
				PID : PID,
			}

			$
					.ajax({
						'type' : 'POST',
						'url' : 'heart.do',
						'data' : formData,
						'dataType' : 'json',
						'success' : function(data) {
							alert('성공');
							alert(data.re);
							if (data.re == 1) {
								$target.html('<i class="fa fa-heart color-red pulse"></i>');
							} else {
								$target.html('<i class="fa fa-heart-o color-e6" style="font-weight:800"></i>');
							}
							//$target.removeAttr('disabled');

						}
					})
		}

		
	</script>




</body>
</html>