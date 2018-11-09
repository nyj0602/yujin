<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="message-container" style="min-height: 501px;">
	<!-- 제일처음 한번만 들어가는것 -->
	
	<div class="row message-related-gig-wrapper margin-bottom-0"	id="inbox_1">

		<div>
			<c:forEach items="${talent }" var="tal">
				<div class="message-left-related-gig"
					style="padding-top: 10px; padding-bottom: 10px;">
					<div class="position-relative">
						<a class="plain"
							href="/kmongPro/category/talent.do?t_seq=${tal.t_seq }"> <img
							class="message-related-gig-image" src="../server/${tal.image }"
							onerror="this.onerror=null;this.src='../image/no_gig_sm_image.jpg';"
							title="">
						</a>
					</div>

					<div class="position-relative message-related-gig-title">
						<h6>
							<strong>관련 서비스</strong>
						</h6>
						<a class="plain"
							href="/kmongPro/category/talent.do?t_seq=${tal.t_seq }">
							<h6 class="color-6 margin-top-5" 	style="display: -webkit-box !important; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden; line-height: inherit;">${tal.t_name }</h6>
						</a>
					</div>
				</div>
			</c:forEach>
		</div>

	</div>
<c:forEach items="${chat }" var="c">
<c:choose>
<c:when test="${email ne c.msg_sender }">
	<div class="row" id="inbox_${c.msg_seq }">
		<div>
			<div class="message-left">
				<div class="inline-block message-left-arrow">
					<div class="inline-block">
					<c:forEach items="${message }" var="msg"></c:forEach>
						<a target="_blank" href="https://kmong.com/@${ (email eq msg.m_email)? msg.buy_email:msg.m_email }"> <img
							class="message-left-profile-image"
							onerror="this.onerror=null;this.src='../image/main_user_gray.png';"
							src="../server/${ (email eq msg.m_email)? msg.buyerprofile:msg.sellprofile }">
						</a>
					</div>
				</div>

				<div class="inline-block message-left-body">
					<div class="message-left-partner">
						<a class="plain" target="_blank" href="프로필 바로가기 ${c.msg_sender }">
							${c.msg_sender } </a>
					</div>
					<div class="message-left-bubble-body position-relative">
						<div>${c.msg_content }</div>

					</div>
					<div class="message-left-time">${c.sendtime }</div>
				</div>
			</div>
		</div>

	</div>
	</c:when>
	<c:when test="${email eq c.msg_sender }">
	<div class="row" id="inbox_${c.msg_seq }">

		<div>
			<div class="message-right">
				<div class="inline-block message-right-arrow"></div>

				<div class="inline-block message-right-body">
					<div class="message-right-bubble-body position-relative">
						<div>${c.msg_content }</div>

					</div>
					<div class="message-right-time">
					<c:if test="${c.msg_ck eq 0}">
					<span class="color-primary message-unread"></span>
					</c:if>
					&nbsp; &nbsp; ${c.sendtime }
					</div>
				</div>
			</div>
		</div>

	</div>
	</c:when>
	</c:choose>
</c:forEach>







	<div class="row margin-bottom-0" id="inbox_13137517">
		<div></div>
	</div>

</div>
<!-- message container -->
