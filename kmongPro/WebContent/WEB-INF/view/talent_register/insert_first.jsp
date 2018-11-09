<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/kmong-99952b2854.master_desktop.css"
	type="text/css">
<link rel="stylesheet" href="css/kmong_desktop_v2-6ec7c3f31e.css"
	type="text/css">
<link rel="stylesheet" href="css/kmong-3f20e872d5.master_desktop.css"
	type="text/css">
<link rel="stylesheet" href="css/kmong_fonts.css" type="text/css">
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="https://kmong.com/build/css/kmong-a9f87b1e91.master_desktop.css">
<title></title>
<style>
#page_1 {
	border-bottom: 4px solid #ffd400;
}

#page_2, #page_3, #page_4, #page_5 {
	border-bottom: none;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- 두 번째 slelectbox 불러오는 코딩 -->
<script>
	$(function() {
		$("#sel_first").change(
				function() {
					var params = $('.sub').serialize();
					// > keyword=&sel_first=3&sel_second=%EC%84%A0%ED%83%9D%ED%95%B4%EC%A3%BC%EC%84%B8%EC%9A%94
					//console.log("> " + params);
					$.ajax({
						url : "ajax_category_second.do",
						dataType : 'json',
						type : 'get',
						data : params,
						cache : false,
						success : function(jarr) {
							//alert("성공");
							$("#sel_second option:gt(0)").remove();
							$(jarr).each(
									function(index, value) {
										$("#sel_second").append(
												"<option value= '" + value.c_id + "'>"
														+ value.c_group
														+ "</option>");
									});
						}
					});
					$("#second_select").css("display", "block");
					$("#third_select, #gigMetadataDiv").css("display", "none");

				});
	});
</script>

<!-- 세 번 째 selectbox 불러오는 코딩 -->
<script>
	$(function() {
		$("#sel_second")
				.change(
						function() {
							var params = $('.sub').serialize();
							$.ajax({
								url : "ajax_category_third.do",
								dataType : 'json',
								type : 'get',
								data : params,
								cache : false,
								success : function(jarry) {
									$("#sel_third option:gt(0)").remove();
									$(jarry).each(
											function(index, value) {
												$("#sel_third").append(
														"<option value= '" + value.c_id + "'>"
																+ value.c_group
																+ "</option>");
											});
								}
							});
							$("#third_select, #gigMetadataDiv").css("display",
									"block");

						});
	});
</script>


<!-- level 4 짜리들 항목별로 불러오는 코딩 -->
<script>
	$(function() {
		$("#sel_second")
				.change(
						function() {
							var params = $('.sub').serialize();
							//alert(params);   sel_second=11
							$
									.ajax({
										url : "ajax_service_method.do",
										dataType : 'json',
										type : 'get',
										data : params,
										cache : false,
										success : function(jarr) {
											$(".service_name").remove();
											$(jarr)
													.each(
															function(index,
																	value) {
																$(
																		"#service_title")
																		.append(
																				"<li id='" + index + "' class='ohpen service_name bg-color-fa gig-metadata-list-item active' role='presentation'> <a href='#' id='gigMetadataLink"+index+"' name='gigMetadataLink1' class='chbox text-left plain' title='" + value.c_id + "'>"
																						+ value.c_group
																						+ "</a><input type='hidden' name='gigMetadataLink1'  value='"+ value.c_id +"'><div class='position-relative'><div class='gig-metadata-list-check'><span class='gig-metadata-list-check-question font-size-h2'>"
																						+ "+"
																						+ "</span></div></div></li>");
															});
										}
									});
						});
	});
</script>



<script>
	$(function() {
		// 동적 생성한 것에 이벤트 등록 할때...
		$(document)
				.on(
						"click",
						'.chbox',
						function() {
							var params = "gigMetadataLink1="
									+ $(this).prop("title"); // ?id=200&&
							//var params = $('#xxx').serialize();
							//alert(params);
							$
									.ajax({
										url : "ajax_service_checkbox.do",
										dataType : 'json',
										type : 'get',
										data : params,
										cache : false,
										success : function(jarr) {
											//alert("성공");
											$(".boxbox").remove();
											$(jarr)
													.each(
															function(index,
																	value) {
																$(
																		"#cat_checkbox")
																		.append(
																				"<div name='chkbox' class='boxbox awesome-checkbox margin-bottom-10'><label> <input class='lastcc' type='checkbox' value='"+ value.c_id+"' id='data_1' name='metadata_1'" + index + "><span class='awesome-checkbox-body'></span><div class='awesome-checkbox-text' name='five' id='"+ value.c_id +"'>"
																						+ value.c_group
																						+ "</div></label></div>");
															});
										}
									});
						});
	});
</script>
<script>
	$(document).on('keyup', '#gtitleInput', function(e) {
		var gtitleInput = $(this).val();
		$('#textcount').text(getBytes(gtitleInput));
		if (gtitleInput.val().length > 9 && gtitleInput.val().length != null) {
			$("#gtitleInput").css("border-color", "#e6e6e6");
		}
	});
	function getBytes(gtitleInput) {
		var cnt = 0;
		for (var i = 0; i < gtitleInput.length; i++) {
			cnt += 1;
		}
		return cnt;
	}
</script>
</head>
<%
	String ContextPath = request.getContextPath();
%>
<body id="master_body" class="wysihtml5-supported"
	style="cursor: default">
	<jsp:include page="/WEB-INF/view/inc/header/header_lmain.jsp"></jsp:include>

	<jsp:include page="/WEB-INF/view/inc/header/header_category.jsp"></jsp:include>

	<form class="sub" method="post">
		<div class="global-body">
			<div id="gig_form">
				<div class="gig-form-fixed">
					<div class="container">
						<div class="row">
							<div class="col-xs-9">
								<div id="page_1" class="gig-form-header-item active">
									<h5 class="gig-form-header-text">
										<div id="pageNaviText1">
											<span class="gig-form-header-page-number">1</span> 기본사항
										</div>
										<span class="page-1-error gig-form-header-error hidden"><i
											class="fa fa-exclamation-triangle gig-form-header-font-icon"></i>기본사항</span>
									</h5>
								</div>

								<div id="page_2" class="gig-form-header-item">
									<h5 class="gig-form-header-text">
										<div id="pageNaviText2">
											<span class="gig-form-header-page-number">2</span> 가격설정
										</div>
										<span class="page-2-error gig-form-header-error hidden"><i
											class="fa fa-exclamation-triangle gig-form-header-font-icon"></i>가격설정</span>
									</h5>
								</div>

								<div id="page_3" class="gig-form-header-item">
									<h5 class="gig-form-header-text">
										<div id="pageNaviText3">
											<span class="gig-form-header-page-number">3</span> 서비스 설명
										</div>
										<span class="page-3-error gig-form-header-error hidden"><i
											class="fa fa-exclamation-triangle gig-form-header-font-icon"></i>서비스
											설명</span>
									</h5>
								</div>

								<div id="page_4" class="gig-form-header-item">
									<h5 class="gig-form-header-text">
										<div id="pageNaviText4">
											<span class="gig-form-header-page-number">4</span> 이미지
										</div>
										<span class="page-4-error gig-form-header-error hidden"><i
											class="fa fa-exclamation-triangle gig-form-header-font-icon"></i>이미지</span>
									</h5>
								</div>


								<div id="page_5" class="gig-form-header-item">
									<h5 class="gig-form-header-text">
										<div id="pageNaviText5">
											<span class="gig-form-header-page-number">5</span> 요청사항
										</div>
										<span class="page-5-error gig-form-header-error hidden"><i
											class="fa fa-exclamation-triangle gig-form-header-font-icon"></i>요청사항</span>
									</h5>
								</div>
							</div>

							<div class="col-xs-3 btn-gig-form-header text-right">
								<button id="store"
									class="btn btn-default btn-sm header-button-group padding-top-5 padding-bottom-5">
									<i class="fa fa-floppy-o" aria-hidden="true"></i> 임시저장
								</button>
								<button class="btn btn-default btn-sm header-button-group"
									style="display: none;">
									<i class="fa fa-floppy-o" aria-hidden="true"></i> 저장
								</button>
								<button type="button"
									class="btn btn-default btn-sm margin-left-10"
									style="outline: 0;">
									<i class="fa fa-desktop" aria-hidden="true"></i> 미리보기
								</button>
							</div>
						</div>
					</div>
				</div>
				<div id="sellerNewEvent" class="container"
					style="margin-top: 130px !important;">
					<div class="row ">
						<div class="col-xs-12 padding-right-5">
							<img class="width-100"
								src="<%=ContextPath%>/css/image/seller_mykmong.jpg">
						</div>
					</div>
				</div>

				<%--  
<%
  Cookie [] cookies = request.getCookies();
  
  if( cookies != null && cookies.length > 0){
	  for(int i=0; i< cookies.length ; i++){
%>
   >  <%= cookies[i].getName() %> =
      <%= URLDecoder.decode(cookies[i].getValue(),"UTF-8") %><br>
<%		  
	  }
  }
%>
   --%>

				<div id="gigFormContainer"
					class="container gig-form-container margin-top-0">
					<div>
						<div class="row margin-top-5">

							<div class="col-xs-9">
								<div class="panel panel-default border-radius-0">
									<ul class="list-group panel-list-group-only border-radius-0">

										<!-- 서비스 제목입력 부분 -->
										<li
											class="gig-form-list-group-item gigFormTooltip border-none">
											<div>
												<div class="row">
													<div class="col-xs-3">서비스 제목</div>
													<div class="col-xs-9">
														<div id="gtitleDiv" class="form-group">
															<%-- <% Stirng gtitleInput = request.getParameter(arg0) %> --%>
															<!-- <form id="form0" class="sub" action="m/insert_second.jsp"> -->
															<div id="titlebox" class="input-gtitle-text-group">
																<input id="gtitleInput" name="gtitleInput"
																	value="${param.gtitleInput}" type="text"
																	class="form-control border-radius-0"
																	placeholder="예) 마음을 담아 재미있고 개성있는 캐리커쳐를 그려"
																	maxlength="48">
																<!-- <input type="hidden" name="gtitleInput" value=""></input> -->
																<span class="font-color-base">드립니다.</span>
															</div>
															<!-- </form> -->

															<div
																class="row font-size-h6 font-color-lighter margin-top-5">
																<div class="col-xs-9">
																	<span id="redtext"
																		class="gtitle-error help-block padding-left-0"
																		style="visibility: hidden; color: #FF7262;"><i
																		class="fa fa-exclamation-triangle"></i>&nbsp;최소 10글자
																		이상 입력해주세요.</span> <span
																		class="gtitle-tail-error help-block padding-left-0 hidden"><i
																		class="fa fa-exclamation-triangle"></i>&nbsp;'드립니다'를
																		입력하실 경우 자동으로 삭제처리 됩니다.</span> <span
																		class="gtitle-keyword-error help-block padding-left-0 hidden"><i
																		class="fa fa-exclamation-triangle"></i></span> <span
																		id="gtitle_keyword_warning"
																		class="help-block color-danger padding-left-0 hidden"><i
																		class="fa fa-exclamation-triangle">&nbsp;경고메세지</i></span>
																</div>

																<div class="col-xs-3 text-right">
																	<span id="textcount" class="color-pink">0</span>&nbsp;/&nbsp;<span>48&nbsp;글자수</span>
																</div>

																<div class="col-xs-12"></div>
															</div>
														</div>
													</div>

													<div class="division-for-tooltip"></div>

													<div id="gtitleTooltip" class="gig-form-tooltip"
														style="display: none;">
														<div class="gig-form-tooltip-square"></div>
														<div class="gig-form-tooltip-body">
															<h5 class="margin-bottom-20">
																<i class="fa fa-info-circle" aria-hidden="true"></i> <b>서비스
																	제목</b>
															</h5>
															<div>
																<img
																	src="<%=ContextPath%>/css/image/gtitle_description.png"
																	style="margin-left: -7px">
															</div>
															<ul class="gig-form-tooltip-text">
																<li>최적의 제목 글자 수는 '드립니다' 포함 10~48자입니다.</li>
																<li>특수 문자 및 가격 삽입 시 승인 과정에서 삭제 됩니다.</li>
																<li>자동으로 삽입되는 문구 '드립니다'와 어울리도록 작성해 주세요.</li>
															</ul>
														</div>
													</div>
												</div>
											</div>
										</li>


										<!-- 카테고리 선택 부분 -->

										<li class="gig-form-list-group-item gigFormTooltip">
											<div class="gig-form-basic-border-dashed">
												<div class="row">
													<div class="col-xs-3">카테고리</div>
													<div class="col-xs-9">
														<div class="row">
															<div class="col-xs-6">
																<h6 class="gig-form-label">상위 카테고리</h6>
																<div id="selectedRootCategoryDiv" class="margin-top-10">
																	<div class="select-control">
																		<select class="input-sm" id="sel_first"
																			name="sel_first">
																			<option value="">선택해주세요  </option>
																			<c:forEach items="${ firstList }" var="dto">
																				<option class="selcat" value="${ dto.c_id }">${ dto.c_group }</option>
																			</c:forEach>
																		</select> <span id="redtext1"
																			class="selectedRootCategory-error help-block padding-left-0"
																			style="visibility: hidden; color: #FF7262"><i
																			class="fa fa-exclamation-triangle"></i>상위 카테고리를
																			선택해주세요.</span>
																	</div>
																</div>
															</div>

															<div class="col-xs-6" style="display: none;">
																<h6 class="gig-form-label">하위 카테고리</h6>
																<div class="margin-top-10">
																	<div class="border-solid">
																		<div class="form-control input-sm border-none">
																			<i class="fa fa-spin fa-spinner"
																				style="vertical-align: middle; margin-bottom: 2px;"></i>&nbsp;<span>카테고리를
																				불러오고 있습니다.</span>
																		</div>
																	</div>
																</div>
															</div>

															<div id="second_select" class="col-xs-6"
																style="display: none;">
																<h6 class="gig-form-label">하위 카테고리</h6>
																<div id="selectedSubCategoryDiv" class="margin-top-10">
																	<div class="select-control">
																		<select class="input-sm " id="sel_second"
																			name="sel_second">
																			<option value="">선택해주세요</option>
																		</select> <span id="redtext2"
																			class="selectedSubCategory-error help-block padding-left-0"
																			style="visibility: hidden; color: #FF7262"><i
																			class="fa fa-exclamation-triangle"></i>하위 카테고리를
																			선택해주세요.</span>
																	</div>
																</div>
															</div>

															<div id="third_select" class="col-xs-6 margin-top-20"
																style="display: none;">
																<h6 class="gig-form-label">3차 카테고리</h6>
																<div class="margin-top-10">
																	<!-- <form id="form3" class="sub"> -->
																	<div class="select-control">
																		<select class="input-sm" id="sel_third"
																			name="sel_third">
																			<option value="">선택해주세요</option>
																		</select>
																	</div>
																</div>
															</div>

														</div>
													</div>

													<!-- 우측 마오스오버하면 뜨는 부분 -->

													<div class="division-for-tooltip"></div>
													<div id="categoryTooltip" class="gig-form-tooltip"
														style="display: none;">
														<div class="gig-form-tooltip-square"></div>
														<div class="gig-form-tooltip-body">
															<h5 class="margin-bottom-20">
																<i class="fa fa-info-circle" aria-hidden="true"></i> <b>카테고리</b>
															</h5>
															<ul class="gig-form-tooltip-text">
																<li>정확한 카테고리에 따라 서비스를 분리해주시면 매출 향상에 도움이 됩니다.</li>
															</ul>
														</div>
													</div>
												</div>
											</div>
										</li>

										<!-- 서비스 방식 입력 부분 -->
										<li id="gigMetadataDiv"
											class="gig-form-list-group-item gigFormTooltip"
											data-target="metadataTooltip" style="display: none;">
											<div class="gig-form-basic-border-dashed">
												<div class="row">
													<div class="col-xs-3">
														<span>서비스 방식</span>
													</div>
													<div class="col-xs-9">
														<div class="row margin-top-20">
															<div class="col-xs-12">
																<div id="metadata_unselected_error" class="has-error"
																	style="display: none">
																	<span class="help-block padding-left-0 "><i
																		class="fa fa-exclamation-triangle"></i>&nbsp;하나 이상의
																		서비스 타입을 선택하세요.</span>
																</div>
															</div>
														</div>


														<!-- <form id="form4" class="sub"> -->
														<div class="tabs-left">
															<ul class="gig-metadata-list nav nav-tabs inline-block"
																style="z-index: 94" role="tablist" id="service_title">

															</ul>
														</div>
														<!-- </form> -->

														<!-- 체크박스  -->

														<div id="metadataDiv" class="tab-content inline-block">
															<!-- <form id="form5" class="sub2"> -->
															<div role="tabpanel" class="tab-pane fade active in"
																id="metadata_1">
																<div class="gig-metadata-body" id="metadata1_body"
																	style="min-height: 165px;">
																	<h5>
																		<b>서비스 선택 </b>
																	</h5>

																	<div class="margin-top-15" id="cat_checkbox"></div>
																</div>
															</div>
															<!-- </form> -->

															<!-- 마우스 오버하면 뜨는 부분 -->
															<div class="division-for-tooltip"></div>
															<div class="gig-form-tooltip"
																style="display: none; margin-top: 50px !important;">
																<div class="gig-form-tooltip-square"></div>
																<div class="gig-form-tooltip-body">
																	<h5 class="margin-bottom-20">
																		<i class="fa fa-info-circle" aria-hidden="true"></i> <b>추가정보</b>
																	</h5>
																	<ul class="gig-form-tooltip-text">
																		<li>제공되는 서비스의 유형을 정확하게 체크하여 의뢰인이 빠르게 서비스를 찾을 수
																			있도록 도와주세요.</li>
																	</ul>
																</div>
															</div>
														</div>

													</div>
												</div>
											</div>
										</li>
									</ul>
								</div>

								<div class="row">
									<div class="col-xs-offset-8 col-xs-4">
										<button id="next" class="btn btn-black btn-block btnbtn">다음단계</button>
										<!-- <input type="submit" style="font-color:white" value="다음단계" class="btn btn-black btn-block"> -->
									</div>
								</div>

							</div>

						</div>
						<!-- 기그폼 픽스드 -->


					</div>
				</div>

			</div>
			<!-- 기그폼 -->
		</div>
		<!-- 글로벌바디 -->
	</form>
	<!-- 서비스 방식 선택부분 -->

	<script type="text/javascript" src="https://wcs.naver.net/wcslog.js">
		
	</script>
	<%@ include file="../inc/footer/footer.jsp"%>
</body>
<script>
	$(function() {
		$("#next, #page_2").click(
				function() {
					if ($("#gtitleInput") == null
							|| $("#gtitleInput").val().length <= 9
							&& $("sel_first").val() == null
							&& $("sel_second").val() == null) {
						$("#next").attr("type", "button");
						$("#gtitleInput").css("border-color", "#FF7262");
						$("#redtext").css("visibility", "visible");
						$("#sel_first").css("border-color", "#FF7262");
						$("#redtext1").css("visibility", "visible");
						$("#sel_second").css("border-color", "#FF7262");
						$("#redtext2").css("visibility", "visible");
					} else {
						$("#next").attr("type", "submit");
						$('.sub').attr('action', 'page2Cookie.do').submit();
					}
				});

		$("#page_3").click(function() {
			$('.sub').attr('action', 'page3Cookie.do').submit();
		});
		$("#pate_4").click(function() {
			$('.sub').attr('action', 'page4Cookie.do').submit();
		});
		$("#page_5").click(function() {
			$('.sub').attr('action', 'page5Cookie.do').submit();
		});
		$("#store").click(function() {
			$(this).attr("type", "button");
			alert("임시저장완료!!");
		});
	});
</script>
</html>

