<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
<link rel="stylesheet" href="css/kmong-3f20e872d5.master_desktop.css" />
</head>






<body id="master_body">
	<c:forEach var="tal" items="${talent }" varStatus="status">
		<div
			class="kmong-grid-3-20 gig-wrapper margin-top-20 position-relative"
			data-ga-issend="1" data-ga-category="main"
			data-ga-action="ì¤íì ìë¹ì¤ í´ë¦­" data-ga-label="/"
			style="width: 232.656px;">

			<div class=" gig-wrapper-default  position-relative">

				<a class="plain" href="https://kmong.com/gig/99394">

					<div class="gig-image position-relative" style="height : 172.625px;">
						<div class="gig-profile">
							<div class="position-relative">
								<div class="gig-list-profile-background-border"></div>
								<div class="gig-list-profile userProfileRanking NEW">

									<!--  프로필 -->
									<img 
										class="gig-list-user-profile border-round position-relative"
										src="https://d2v80xjmx68n4w.cloudfront.net/members/thumbs/BeJne1519018545.PNG"
										title="ìì"
										onerror="this.onerror=null;this.src='/img/tools/main_user_gray.png'" style="height: auto; width: 100%;">

								</div>
							</div>
						</div>

						<!--  큰이미지 -->
						<img class="width-100"  style="height : 172.625px;"
							src="server/${tal.image }">
					</div>
				</a>

				<!--  제목 -->
				<div>
					<div id="tiong" class="gig-title ">

						<a class="plain" href="https://kmong.com/gig/99394">
							<div class="GigLineClamp line-clamp-default-2 position-relative"
								style="line-height: 20px !important; height: 40px !important;">
								${tal.t_name}</div>
						</a>
					</div>
				</div>
				<!-- 가격 -->
				<div class="padding-left-15 padding-right-15 padding-bottom-15">
					<div class="inline-block">


						<button type="button"
							class="test inline-block border-none bg-color-transparent font-size-h4 padding-all-0"
							id="searchPM">
							<input type="text" value="${tal.m_email }" hidden=""
								id="talEmail" /> <input type="text" value="${tal.t_seq }"
								hidden="" id="talSeq" />




							<c:forEach items="${heart }" var="hea" varStatus="status">
								<c:choose>

									<c:when test="${tal.t_seq == hea.t_seq }">
										<i class="fa fa-heart color-red pulse"
											style="font-weight: 800" id="PMSelect"></i>
									</c:when>
								</c:choose>
							</c:forEach>

							<i class="fa fa-heart-o color-e6" style="font-weight: 800"
								id="PMSelect"></i>



						</button>
					</div>
					<div class="pull-right inline-block">
						<b class="font-size-h4"><span class="NGB"></span>&nbsp;
							${tal.op_price} ~</b><span class="font-size-"> </span>
					</div>
				</div>


				<div class="border-top-solid padding-left-15 padding-right-15"
					style="padding-top: 4px; padding-bottom: 4px">
					<c:choose>
						<c:when test="${m_sep eq '개인' }">
							<!-- 회원일때 -->
							<a class="inline-block plain color-dark-gray"
								style="margin-top: 4px; margin-bottom: 2px;" href="#">
								<div class="gig-username font-size-h6"
									style="max-width: 80px !important;">${nickname}</div>
							</a>

						</c:when>
						<c:otherwise>
							<!-- 기업일때 -->
							<a class="inline-block plain color-dark-gray"
								style="margin-top: 4px; margin-bottom: 2px;"
								href="https://kmong.com/@rnjsdbsxo"> <img
								class="padding-right-5 width-30px"
								src="css/image/ic_company.png"
								style="vertical-align: inherit !important;">
								<div class="gig-username font-size-h6"
									style="max-width: 37px !important;">${nickname}</div>
							</a>
						</c:otherwise>
					</c:choose>

					<!-- 별점 -->
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
												class="fa fa-star color-e3"></i></span> <span class="	"><i
												class="fa fa-star color-e3"></i></span> <span class="star"><i
												class="fa fa-star color-e3"></i> </span>
										</span>
										<!-- 0이면 0% 0.5는 10% 1은 20% -->
										 <span class="filled-stars" style="width: 0%;"> <span
											class="star"><i class="fa fa-star"></i></span> <span
											class="star"><i class="fa fa-star"></i></span> <span
											class="star"><i class="fa fa-star"></i></span> <span
											class="star"><i class="fa fa-star"></i></span> <span
											class="star"><i class="fa fa-star"></i></span>
										</span>
									</div>
								</div>
							</div>


							<div
								class="inline-block color-dark-gray gig-rating-count font-size-h6">
								&nbsp;
								<c:forEach items="${star }" var="star">
									<c:choose>
										<c:when test="${star.t_seq == tal.t_seq }">
											<input hidden="" value="${star.avg }" id="Staravg">
									  		${star.num }
									  	</c:when>
										<c:otherwise>
									  		0
									  	</c:otherwise>
									</c:choose>
								</c:forEach>


							</div>
						</h6>
					</div>
				</div>
			</div>
		</div>

	</c:forEach>
</body>
</html>