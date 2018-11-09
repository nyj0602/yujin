<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.util.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
						<div class="col-xs-2">
							<div class="select-control">
								<select class="input-xs">
									<option value="recommendation" selected="">추천순</option>
									<option value="ranking" >랭킹순</option>
									<option value="created_at">신규등록순</option>
								</select>
								<script>
$(function () {
	//alert("나온다아"+${param.category});
	$("select").change(function () {
		var value = $(this).val();
		console.log(value);
		$.ajax({
			type:"GET",
			url:"/kmongPro/category/1.do?category="+${param.category} ,
			data: {
				sort: $(this).val()
					},
			success: function () {
				alert("넘어갔다");
			}
		});//ajax
	});//change
	
});//function
	
</script>
							</div>
						</div>
						<div class="col-xs-8 padding-left-0">
							<div class="row">
								<div class="col-xs-6 padding-right-0 width-25">
									
									<div class="awesome-checkbox margin-top-5">
										<label> <input onclick="sendGAClickEvent('접속중 클릭')"
											type="checkbox"> <span class="awesome-checkbox-body"></span>
											<div class="awesome-checkbox-text category-awesome-width font-color-light line-height">접속중</div>
										</label>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xs-2 text-right">
							<a
								class="btn  btn-xss btn-black padding-left-10 padding-right-10 sendGAEventClz"
								href="https://kmong.com/ad_request" data-name="광고 신청">광고 신청</a>
								

							<div class="pull-right kmong-ad-info-hover margin-left-5">
								<i 	class="fa fa-question-circle font-color-light vertical-align-top cursor"	aria-hidden="true"></i>
								<div class="kmong-ad-info text-left">
									<ul class="list-group">
										<li
											class="list-group-item overflow-hidden padding-all-20 border-radius-0">
											<div class="col-xs-2 padding-left-0 padding-right-0">
												<img class="width-40px" src="../css/image/gig_premium_ver3.png">
											</div>
											<div class="col-xs-10 padding-right-0 padding-left-10">
												<dl class="font-size-h6 margin-bottom-0">
													<dt class="NGB">프리미엄 광고</dt>
													<dd>프리미엄 광고 상품을 구매한 서비스를 말하며, 서비스가 최상단에 고정 노출됩니다.</dd>
												</dl>
											</div>
										</li>
										<li
											class="list-group-item overflow-hidden padding-all-20 border-radius-0">
											<div class="col-xs-2 padding-left-0 padding-right-0">
												<img class="width-40px" src="../css/image/gig_plus_ver3.png">
											</div>
											<div class="col-xs-10 padding-right-0 padding-left-10">
												<dl class="font-size-h6 margin-bottom-0">
													<dt class="NGB">플러스 광고</dt>
													<dd>플러스 광고 상품을 구매한 서비스를 말하며, 서비스가 랜덤으로 상위 노출됩니다.</dd>
												</dl>
											</div>
										</li>
									</ul>
								</div>
							</div>
							 
						</div>