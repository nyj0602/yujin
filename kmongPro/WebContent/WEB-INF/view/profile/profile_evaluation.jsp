<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>


<link rel="stylesheet" href="css/bootstrap-datepicker3.css" />
<link rel="stylesheet" href="css/kmong_buy.css" />
<link rel="stylesheet" href="css/kmong_desktop_v2-6ec7c3f31e.css" />
<link rel="stylesheet" href="css/kmong_fonts.css" />
<link rel="stylesheet" href="css/kmong-a9f87b1e91.master_desktop.css" />
<link rel="stylesheet" href="css/mykmong_main.css" />
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="shortcut icon" href="css/image/favicon.ico">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</head>
<body>
	<div class="row" id="userInfo">
		<div class="col-xs-12">
			<div class="row margin-top-50 margin-bottom-10 font-size-h3">
				<div class="col-xs-12" id="userInfos">
					<h4 class="NGB inline-block">${nickname }님의받은평가&nbsp;&nbsp;</h4>



					<!--  평가없을경우 -->

					<c:choose>
						<c:when test="${ empty sendm_email }">
							<div class="text-left inline-block">
								<div
									class="rating-container theme-krajee-fa rating-xs rating-disabled rating-margin-none">
									<div class="rating-stars">
										<!-- 총평가점수평균 -->
										<span class="empty-stars"> <span class="star"><i
												class="fa fa-star color-e3"></i></span> <span class="star"><i
												class="fa fa-star color-e3"></i></span> <span class="star"><i
												class="fa fa-star color-e3"></i></span> <span class="star"><i
												class="fa fa-star color-e3"></i></span> <span class="star"><i
												class="fa fa-star color-e3"></i></span>
										</span> <input type="text" value="0" hidden="" id="hiddenStar" /> <span
											class="filled-stars" style="width: 0%;"> <input
											type="text" value="${AvgEvaluation }" hidden=""
											id="AvgEvaluation" /> <span class="star"><i
												class="fa fa-star"></i></span> <span class="star"><i
												class="fa fa-star"></i></span> <span class="star"><i
												class="fa fa-star"></i></span> <span class="star"><i
												class="fa fa-star"></i></span> <span class="star"><i
												class="fa fa-star"></i></span>
										</span>
									</div>
								</div>
							</div>
							<div class="inline-block font-size-h5">&nbsp;( 0 )</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12">
					<ul class="list-group" id="userRatingsDiv">
						<div class="padding-left-0 margin-bottom-0 margin-bottom-20">
							<div class="row">
								<div class="col-xs-12">
									<div class="panel bg-color-e6 border-radius-0 margin-all-0">
										<div class="panel-body text-center">
											<img class="width-50px margin-top-60"
												src="css/image/appraisal.PNG">
											<h5
												class="margin-top-15 margin-bottom-60 font-color-lighter NGB">
												받은 평가가 없습니다.</h5>


										</div>
									</div>
								</div>
							</div>
						</div>
						</c:when>




						<c:otherwise>
							<!--  있을경우 -->
							<div class="text-left inline-block">
								<div
									class="rating-container theme-krajee-fa rating-xs rating-disabled rating-margin-none">
									<div class="rating-stars">
										<!-- 총평가점수평균 -->
										<span class="empty-stars"> <span class="star"><i
												class="fa fa-star color-e3"></i></span> <span class="star"><i
												class="fa fa-star color-e3"></i></span> <span class="star"><i
												class="fa fa-star color-e3"></i></span> <span class="star"><i
												class="fa fa-star color-e3"></i></span> <span class="star"><i
												class="fa fa-star color-e3"></i></span>
										</span> <span class="filled-stars" style="width: 0%;"> <input
											type="text" value="${AvgEvaluation }" hidden=""
											id="AvgEvaluation" /> <span class="star"><i
												class="fa fa-star"></i></span> <span class="star"><i
												class="fa fa-star"></i></span> <span class="star"><i
												class="fa fa-star"></i></span> <span class="star"><i
												class="fa fa-star"></i></span> <span class="star"><i
												class="fa fa-star"></i></span>
										</span>
									</div>
								</div>
							</div>
							<div class="inline-block font-size-h5">&nbsp;(${CountEvaluation })</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12">
					<ul class="list-group" id="userRatingsDiv">
						<ul id="userRatingsDiv" class="list-group">

							<c:forEach items="${evaluation }" var="eval">
								<li class="list-group-item border-radius-0">
									<div class="row">
										<div
											class="col-xs-1 margin-right-35 padding-right-0 padding-left-20 padding-top-5">
											<div class="overflow-hidden inline-block">
												<img class="width-60px border-round" src="css/image/main_user_gray.png"
													title="${buyerNickname }">
												<!--  onerror="this.onerror=null;this.src='/img/tools/main_user_gray.png'" -->
											</div>
										</div>
										<div
											class="col-xs-10 padding-left-0 padding-top-5 padding-bottom-10">
											<div class="text-left inline-block">
												<div
													class="rating-container theme-krajee-fa rating-xs rating-disabled rating-margin-none">
													<div class="rating-stars">
														<span class="empty-stars"> <span class="star">
																<i class="fa fa-star color-e3"></i>
														</span> <span class="star"> <i class="fa fa-star color-e3"></i>
														</span> <span class="star"><i class="fa fa-star color-e3"></i></span>
															<span class="star"><i class="fa fa-star color-e3"></i></span>
															<span class="star"><i class="fa fa-star color-e3"></i></span>
														</span> <input type="text" value="${eval.e_star }" hidden=""
															id="hiddenStar" /> <span class="filled-stars"
															style="width: 0%" id="hiddenValue"> <span
															class="star"><i class="fa fa-star"></i></span> <span
															class="star"><i class="fa fa-star"></i></span> <span
															class="star"><i class="fa fa-star"></i></span> <span
															class="star"><i class="fa fa-star"></i></span> <span
															class="star"><i class="fa fa-star"></i></span>
														</span>
													</div>
												</div>
											</div>
											<h5 class="text-style margin-top-0 margin-bottom-10">
												${eval.e_content }</h5>
											<h6 class="font-color-lighter">${eval.t_date}|
												${buyerNickname }</h6>
										</div>
									</div>
								</li>
							</c:forEach>


						</ul>

						</c:otherwise>
						</c:choose>
					</ul>

				</div>
			</div>

			<div class="row" id="loadUSerRatingsBtnWrapper"
				style="display: none;">
				<div class="col-xs-12">
					<a class="btn btn-default btn-block border-solid border-radius-0"
						id="loadUserRatingsBtn"></a>
				</div>
			</div>
		</div>


	</div>
</body>
</html>