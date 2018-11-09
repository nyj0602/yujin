<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="panel panel-default border-radius-none margin-top-30 margin-bottom-0">
	<div class="panel-body padding-all-30">
		<div>
		<c:forEach items="${payment }" var="pay" end="0">
		<c:set value="${email eq pay.buyer?pay.seller:pay.buyer  }" var="anothermail"></c:set>
		<c:set value="${email eq pay.buyer?'전문가':'의뢰인'}" var="other"></c:set>
		<c:set value="${pay.t_seq }" var="t_seq"></c:set>
		
			<div class="media">
				<div class="media-left media-middle padding-right-20">
					<a href="/kmongPro/category/talent.do?t_seq=${pay.t_seq }" target="_blank"> <img
						class="width-120px"
						src="../server/${pay.image }"
						title="${pay.t_name }"
						onerror="this.onerror=null;this.src='/no_gig_sm_image.jpg';">
					</a>
				</div>
				<div class="media-body">
					<h3 class="order-info-gig-body header-margin-none NGB">
						<a class="plain" href="/kmongPro/category/talent.do?t_seq=${pay.t_seq }"
							target="_blank">${pay.t_name } </a>
					</h3>

					<div class="margin-top-20">
						<span style=""> <span style="padding-bottom: 2px;"
							class="label label-warning">${pay.p_state }</span>
						</span> <span class="card-font-size-default font-color-lighter">#553613&nbsp;ㅣ&nbsp;${pay.paytime }&nbsp;ㅣ&nbsp;${other}&nbsp;:&nbsp;
						<c:forEach items="${time }" var="ti">
						<c:if test="${ti.email eq anothermail }">
						<a href="http://localhost:8080/kmongPro/profile.do?sellerID=${anothermail}">${anothermail}</a>&nbsp;ㅣ&nbsp;연락처&nbsp;:&nbsp; ${ti.phone }
						</c:if>
						</c:forEach>
						</span>
					</div>
				</div>
			</div>
			</c:forEach>
			<!--  -->
		</div>

		<table class="order-table">
			<colgroup>
				<col width="60%">
				<col width="15%">
				<col width="10%">
				<col width="15%">
			</colgroup>
			<thead class="track-package">
				<tr>
					<th><b>기본항목</b></th>
					<th class="text-center"><b>수량</b></th>
					<th class="text-center"><b>작업일</b></th>
					<th class="text-right"><b>금액</b></th>
				</tr>
			</thead>
			<tbody class="track-package">
				<!-- standard deluxe premium일때의 가격정보 -->
				<c:set value="0" var="sum"></c:set>
				<c:forEach items="${payment }" var="pay" end="0">
				<tr>
					<td><span>${pay.op_sep } 서비스</span>
						<h6>
							&nbsp;&nbsp;<i class="fa fa-check color-df" aria-hidden="true"></i>&nbsp;${pay.op_manual1 }
						</h6></td>
					<td class="text-center">1</td>
					<td class="text-center">${pay.op_term }&nbsp;일</td>
					<td class="text-right">₩&nbsp;<fmt:formatNumber value="${pay.op_price }" pattern="#,###" /></td>
					<c:set value="${sum+pay.op_price }" var="sum"></c:set>
				</tr>
				</c:forEach>
				<!-- 구매한 추가옵션 가격정보-->
				<c:forEach items="${payment }" var="pay" begin="1">
					<tr style="">
						<td><span class="label label-success">${pay.op_sep }</span>${pay.op_manual1 }</td>
						<td class="text-center">1</td>
						<td class="text-center"><span>+</span>${pay.op_term }&nbsp;일</td>
						<td class="text-right">₩&nbsp;<fmt:formatNumber value="${pay.op_price }" pattern="#,###" /></td>
					</tr>
						<c:set value="${sum+pay.op_price}" var="sum"></c:set>
					</c:forEach>
				</tbody>
		</table>
		<c:forEach items="${payment }" var="pay" end="0">
				<div class="text-right margin-top-30 margin-right-15 font-size-h3">
					<span class="label label-light-gray border-radius-none font-color-lighter cashBoxArrow position-relative cash-banner-arrow">적립예정
						캐시 <span class="cash" ></span><fmt:formatNumber value="${sum * pay.cash /100 }" pattern="0000" />원</span> &nbsp;<b>총 결제금액&nbsp;&nbsp;₩&nbsp;<fmt:formatNumber value="${sum }" pattern="#,###" /></b>
				</div>
		</c:forEach>
	</div>
</div>




