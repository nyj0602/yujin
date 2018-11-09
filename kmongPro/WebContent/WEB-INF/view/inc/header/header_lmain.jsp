<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String m_email = (String) request.getSession().getAttribute("authUser");
	System.out.print(m_email);
	try {
		if (m_email == null || m_email.equals("")) {
			response.sendRedirect("login.do");
		}
	} catch (Exception e) {
		response.sendRedirect("login.do");
	}
%>


<script type="text/javascript">
	$(document)
			.ready(
					function() {

						var i = $('.spsp').attr('title');
						if (i == '완료') {
							var str = '../m/images/complete.png';
							$('.spsp').attr('src', str);
						} else if (i == '진행') {
							var str = '../m/images/ongoing.png';
							$('.spsp').attr('src', str);
						}

						var alarmon = "<i class='fa fa-bell' style='font-size: 20px;'></i>"
						$('#alarm').append(alarmon);

						$(document)
								.on(
										'mouseover',
										'#alarm',
										function(event) {

											$
													.ajax({
														url : "alarm.do",
														dataType : "json",
														cache : false,
														success : function(data) {

															var alarmcount = 0;

															var innerHTML = "";
															$
																	.each(
																			data,
																			function(
																					idx,
																					data) {
																				console
																						.log(data.t_seq);
																				console
																						.log(data.seller_profile);
																				console
																						.log(data.seller_name);
																				console
																						.log(data.order_num);
																				console
																						.log(data.msg_content);
																				console
																						.log(data.image);
																				console
																						.log(data.msg_send);
																				console
																						.log(data.msg_ck);
																				alarmcount += data.msg_ck;
																				console
																						.log(alarmcount);
																				innerHTML += "<li class='list-group-item order-notification-list-group-item'>";
																				innerHTML += "<div class='row margin-right-0'>";
																				innerHTML += "<div class='col-xs-12'>";
																				innerHTML += "<a class='plain sendGAEventClz'";
																				innerHTML += "data-name='투명 헤더 - 종모양 - 알림 내용 클릭'";
																				innerHTML += "onclick='sendGAClickEvent(투명 헤더 - 종모양 - 알림 내용 클릭')'";
																				innerHTML += "href='https://kmong.com/track/533298?MID=4069023'>";
																				innerHTML += "<div class='row'>";
																				innerHTML += "<div";
						innerHTML+=					"class='col-xs-2 padding-right-0 text-center padding-top-5'>";
																				innerHTML += "<img class='width-40px border-round border-solid'";
						innerHTML+=						"src='css/image/"+data.seller_profile+"'";
						innerHTML+=						"onerror='this.onerror=null;this.src='css/image/"+data.seller_profile+"';'";
						innerHTML+=						"title=''>";
																				innerHTML += "</div>";
																				innerHTML += "<div class='col-xs-8'>";
																				innerHTML += "<span class='order-notification-text'><b>"
																						+ data.seller_name
																						+ "</b>&nbsp;:&nbsp;"
																						+ "#"
																						+ data.order_num
																						+ "&nbsp;:&nbsp;";
																				innerHTML += data.msg_content
																						+ "</span>";
																				innerHTML += "<h6"
						innerHTML+=						"class='header-margin-none font-color-lighter notificationTooltip'>";
																				innerHTML += data.msg_send
																						+ "&nbsp;주일 전ㅣ&nbsp; &nbsp;ㅣ&nbsp; <img class='spsp'";
						innerHTML+=							"src='css/image/complete.png'";
						innerHTML+=							"style='width: 11px; position: relative; top: -1px;'";
						innerHTML+=						"data-toggle='tooltip' data-placement='right' title='"+data.p_state+"'";
						innerHTML+=						"data-original-title='자동 구매 확정'>";
																				innerHTML += "</h6>";
																				innerHTML += "</div>";
																				innerHTML += "<div";
						innerHTML+=				"class='col-xs-2 padding-left-0 text-center margin-top-5'>";
																				innerHTML += "<img class='dashboard-notification-gig-image'";
						innerHTML+=					"src='css/image/"+data.image+"'";
						innerHTML+=					"onerror='this.onerror=null;this.src='../images/"+data.image+"';'";
						innerHTML+=					"title=''>";
																				innerHTML += "</div>";
																				innerHTML += "</div>";
																				innerHTML += "</a>";
																				innerHTML += "</div>";
																				innerHTML += "</div>";
																				innerHTML += "</li>";

																			});//each문 
															var alarmcountstr = "<b>알림&nbsp;("
																	+ alarmcount
																	+ ")</b>";
															$(
																	'.alarm-dropdown-menu-top')
																	.children()
																	.children()
																	.html(
																			alarmcountstr);
															$(
																	'#alram_layout_div')
																	.append(
																			innerHTML);

															if (alarmcount == 0) {
																$('#alarm')
																		.children()
																		.attr(
																				'class',
																				'fa fa-bell-slash');
															} else {
																$('#alarm')
																		.children()
																		.attr(
																				'class',
																				'fa fa-bell');
															}
															event
																	.preventdefault();
														}

													});//ajax

											$('#alram_layout_div *').remove();
										}); //mouseover		

					});
</script>



<div class="header-yellow bg-color-yellow-400">
	<div class="container">
		<div class="row">
			<div class="col-xs-6 padding-top-10 padding-bottom-10">
				<ul class="list-inline margin-bottom-0 margin-top-5">



					<li class="pull-left header-logo-align"><a
						class="margin-top-5 inline-block" href="main.do"
						onclick="sendGAEvent('main', '노란색 헤더 - 로고', kmongCurrentPath);">
							<img class="width-100px" src="css/image/kmong_logo_20170518.png"
							title="당신의 '일'을 해결해줄 전문가들이 있는 곳, 서비스 마켓플레이스 크몽 ( Kmong )">
					</a></li>



					<li class="pull-left header-search-group position-relative">
						<form method="GET" action="https://kmong.com/gigs/keyword"
							accept-charset="UTF-8" id="searchHeader" class="margin-bottom-0"
							data-name="노란 헤더">
							<input class="form-control input-xs border-none"
								placeholder="검색어를 입력해 주세요" id="keyword" name="keyword"
								type="text"> <i
								class="fa fa-search header-search-icon text-center font-color-base cursor"
								aria-hidden="true"
								onclick="sendGAEvent('main', '노란색 헤더 - 서비스 검색', kmongCurrentPath);$('#searchHeader').submit();"></i>
						</form>

					</li>
				</ul>
			</div>

			<div class="col-xs-6">
				<div class="inline-block pull-right">

					<div class="inline-block pull-left padding-top-20 padding-right-5">
						<ul class="list-inline margin-all-0">
							<li class="padding-right-5 padding-left-0" data-toggle="tooltip"
								data-placement="bottom" title="" data-header-style="노란"
								data-original-title="마이크몽"><a
								class="margin-right-5 plain sendGAEventClz" href="#"
								data-name="노란 헤더 - 마이크몽 아이콘"> <i class="fa fa-bar-chart"
									style="font-size: 20px;"></i>
							</a></li>



							<li class="padding-right-5 padding-left-0" data-toggle="tooltip"
								data-placement="bottom" title="" data-original-title="메시지"><a
								class="plain margin-right-5 sendGAEventClz" href="#"
								data-name="노란 헤더 - 마이크몽 아이콘"> <i class="fa fa-envelope"
									style="font-size: 20px;"></i>
							</a></li>



							<li class="padding-right-5 padding-left-0">
								<div></div>

								<div class="dropdown">
									<a id="alarm"
										class="plain padding-bottom-20 margin-right-5 cursor kmongAlarmIcon"
										data-toggle="dropdown" aria-haspopup="true" role="button"
										aria-expanded="false"> </a>

									<ul class="alarm-dropdown-menu" role="menu"
										aria-labelledby="alarm">
										<li class="alarm-dropdown-arrow"><img
											src="css/image/alram_arr.png"></li>

										<!-- top -->
										<li class="alarm-dropdown-menu-top">
											<ul class="list-inline">
												<li></li>

												<li class="alarm-menu-top-right pull-right">
													<div>
														<a class="sendGAEventClz" href="#"
															data-name="노란 헤더 - 종모양 - 알림 설정"> <img
															style="width: 13px;" src="css/image/setting.png"
															data-toggle="tooltip" title="" data-placement="right"
															data-original-title="알림 설정">
														</a>
													</div>

													<div class="alarm-menu-top-right-text">
														<a class="plain-color-default sendGAEventClz" href="#"
															data-name="노란 헤더 - 종모양 - 마이크몽 보기">&nbsp;마이크몽 보기</a>
													</div>
												</li>
											</ul>
										</li>

										<li>
											<ul id="alram_layout_div"
												class="list-group alarm-list margin-bottom-0" style="">
												<li id="notificationLoadingImg"
													class="text-center margin-top-15"
													style="margin-bottom: 15px; display: none;">
													<div class="la-ball-fall color-black">
														<div></div>
														<div></div>
														<div></div>
													</div>
												</li>
											</ul>

											<div class="text-center margin-top-15"
												style="margin-bottom: 15px;">
												<div class="la-ball-fall color-black">
													<div></div>
													<div></div>
													<div></div>
												</div>
											</div>
											<div class="text-center margin-top-15"
												style="display: none; margin-bottom: 15px;">
												<div>
													<img
														style="width: 13px; position: relative; top: -2px; left: -3px;"
														src="css/image/header_alram.png" title="">알림 내역이
													없습니다.
												</div>
											</div>

										</li>

										<!-- bottom -->
										<li class="alarm-dropdown-menu-bottom"><a
											class="plain-color-default sendGAEventClz" href="#"
											data-name="노란 헤더 - 종모양 - 알림 모두보기">모두보기</a></li>
									</ul>
								</div>
							</li>


						</ul>
					</div>

					<c:choose>
						<c:when test="${haveCash eq 0 }">

						</c:when>
						<c:when test="${not empty haveCash}">
							<div
								class="inline-block pull-left padding-top-20 padding-right-5">
								<a
									class="btn btn-xs btn-black-reverse border-radius-0 header-cash sendGAEventClz"
									href="#" data-name="노란 헤더 - 크몽캐시ㅂ"> <i
									class="	fa fa-copyright	
"></i>&nbsp;&nbsp;${haveCash } 원
								</a>
							</div>
						</c:when>
					</c:choose>
					<div class="inline-block pull-left padding-top-15">
						<ul class="list-inline margin-all-0">
							<li class="padding-left-0 padding-right-5"></li>
							<li class="dropdown padding-left-0"><a
								class="plain black inline-block position-relative" href="#"
								data-header-style="노란"
								onclick="sendGAEvent('main', '노란 헤더 - 닉네임', kmongCurrentPath);">
									<div
										class="inline-block padding-right-0 padding-left-5 pull-left">
										<img class="border-round width-30px"
											src="css/image/${m_profile }" title="프로필이미지"
											onerror="this.onerror=null;this.src='css/image/main_user_gray.png';">
									</div>
									<div
										class="inline-block padding-left-10 padding-right-0 pull-right  margin-top-5 padding-bottom-10 ">
										<span> ${m_name } <i class="fa fa-sort-desc"></i>
										</span>
									</div>
							</a>
								<div
									class="header-dropdown-menu dropdown-menu padding-all-0 margin-top-0 margin-left-5 top-35"
									role="menu" aria-labelledby="dLabel">
									<div class="dropdown-arrow">
										<img src="css/image/main_toparrow.png">
									</div>
									<div class="panel-group margin-bottom-0" id="accordion"
										role="tablist" aria-multiselectable="true">





										<div
											class="panel border-none margin-top-0 header-root-dropdown-menu border-radius-bottom-none">
											<a href="mykmong.do" class="plain sendGAEventClz"
												data-name="노란 헤더 - 드랍다운 메뉴 - 마이크몽">
												<div
													class="panel-heading padding-left-15 padding-right-15  padding-bottom-10 padding-top-10">
													<h5 class="header-margin-none">마이크몽</h5>
												</div>
											</a>
										</div>
										<div class="panel border-none margin-top-0">
											<a class="plain collapsed" data-toggle="collapse"
												data-parent="#accordion" href="#buying-collapse-fixed"
												aria-expanded="true" aria-controls="collapseOne">
												<div
													class="panel-heading border-radius-none header-root-dropdown-menu padding-left-15 padding-right-15 padding-bottom-10 padding-top-10"
													role="tab" id="headerRootMenuBuyingList">
													<h5 class="header-margin-none font-color-base">
														구매<span class="new-alarm-active" style="display: none">0</span>
														<span class="pull-right"> <i
															class="fa fa-caret-down" aria-hidden="true"></i>
														</span>
													</h5>
												</div>
											</a>
											<div id="buying-collapse-fixed"
												class="panel-collapse collapse" role="tabpanel"
												aria-labelledby="headerRootMenuBuyingList">
												<div class="panel-body bg-color-eee padding-all-0">
													<ul class="list-unstyled heading-hover-item">
														<li class="padding-left-15 padding-right-15"><a
															class="plain sendGAEventClz"
															href="http://localhost:8080/kmongPro/main/buy.do"
															data-name="노란 헤더 - 드랍다운 메뉴 - 구매관리">구매관리<span
																class="new-alarm-active" style="display: none">0</span></a>
														</li>
														<li class="padding-left-15 padding-right-15"><a
															class="plain sendGAEventClz"
															href="http://localhost:8080/kmongPro/main/paylist.do"
															data-name="노란 헤더 - 드랍다운 메뉴 - 결제내역">결제내역</a></li>
														<li class="padding-left-15 padding-right-15"><a
															class="plain sendGAEventClz"
															href="http://localhost:8080/kmongPro/main/cash.do"
															data-name="노란 헤더 - 드랍다운 메뉴 - 크몽캐시">크몽캐시</a></li>
														<li class="padding-left-15 padding-right-15"><a
															class="plain sendGAEventClz"
															href="http://localhost:8080/kmongPro/main/cashcharge.do"
															data-name="노란 헤더 - 드랍다운 메뉴 - 캐시충전">캐시충전</a></li>
													</ul>
												</div>
											</div>
										</div>
										<div class="panel border-none margin-top-0">
											<a class="plain collapsed" data-toggle="collapse"
												data-parent="#accordion" href="#selling-collapse-fixed"
												aria-expanded="false" aria-controls="collapseTwo">
												<div
													class="panel-heading border-radius-none header-root-dropdown-menu padding-left-15 padding-right-15 padding-bottom-10 padding-top-10"
													role="tab" id="headerRootMenuSellingList">
													<h5 class="header-margin-none font-color-base">
														판매 <span class="new-alarm-active" style="display: none">0</span>
														<span class="pull-right"> <i
															class="fa fa-caret-down" aria-hidden="true"></i>
														</span>
													</h5>
												</div>
											</a>
											<div id="selling-collapse-fixed"
												class="panel-collapse collapse" role="tabpanel"
												aria-labelledby="headerRootMenuSellingList">
												<div class="panel-body bg-color-eee padding-all-0">
													<ul class="list-unstyled heading-hover-item">
														<li class="padding-left-15 padding-right-15"><a
															class="plain sendGAEventClz" href="http://localhost:8080/kmongPro/main/sellmanage.do"
															data-name="노란 헤더 - 드랍다운 메뉴 - 판매관리"> 판매관리 <span
																class="new-alarm-active" style="display: none;">0</span>
														</a></li>

														<li class="padding-left-15 padding-right-15"><a
															class="plain sendGAEventClz" href="http://localhost:8080/kmongPro/main/myservice.do"
															data-name="노란 헤더 - 드랍다운 메뉴 - 나의 서비스">나의서비스</a></li>

														<li class="padding-left-15 padding-right-15"><a
															class="plain sendGAEventClz" href="http://localhost:8080/kmongPro/main/profits.do"
															data-name="노란 헤더 - 드랍다운 메뉴 - 수익관리">수익관리</a></li>

														<li class="padding-left-15 padding-right-15"><a
															class="plain sendGAEventClz"
															href="http://localhost:8080/kmongPro/index.do"
															data-name="노란 헤더 - 드랍다운 메뉴 - 서비스 등록">서비스등록</a></li>
													</ul>
												</div>
											</div>
										</div>
										<div class="panel border-none ">
											<a href="my_profile.HeartList.do" class="plain sendGAEventClz"
												data-name="노란 헤더 - 드랍다운 메뉴 - 찜목록">
												<div
													class="panel-heading border-radius-none header-root-dropdown-menu padding-left-15 padding-right-15 padding-bottom-10 padding-top-10">
													<h5 class="header-margin-none">찜목록</h5>
												</div>
											</a>
										</div>
										<div class="panel border-none ">
											<a href="http://localhost:8080/kmongPro/profile.do?sellerID=${sessionID }" class="plain sendGAEventClz"
												data-name="노란 헤더 - 드랍다운 메뉴 - 프로필">
												<div
													class="panel-heading border-radius-none header-root-dropdown-menu padding-left-15 padding-right-15 padding-bottom-10 padding-top-10">
													<h5 class="header-margin-none">프로필</h5>
												</div>
											</a>
										</div>


										<div class="panel border-none ">
											<a href="http://localhost:8080/kmongPro/friend.do" class="plain sendGAEventClz"
												data-name="노란 헤더 - 드랍다운 메뉴 - 친구 초대"
												onclick="sendGAEvent('clickEvent', 'referral_program', 'header');">
												<div
													class="panel-heading border-radius-none header-root-dropdown-menu padding-left-15 padding-right-15 padding-bottom-10 padding-top-10">
													<h5 class="header-margin-none">친구초대</h5>
												</div>
											</a>
										</div>
										<div class="panel border-none margin-top-0">
											<a class="plain collapsed" data-toggle="collapse"
												data-parent="#accordion" href="#account-collapse-fixed"
												aria-expanded="false" aria-controls="collapseFour">
												<div
													class="panel-heading border-radius-none header-root-dropdown-menu padding-left-15 padding-right-15 padding-bottom-10 padding-top-10"
													role="tab" id="headerRootMenuAuthList">
													<h5 class="header-margin-none font-color-base">
														계정설정 <span class="pull-right"> <i
															class="fa fa-caret-down" aria-hidden="true"></i>
														</span>
													</h5>
												</div>
											</a>
											<div id="account-collapse-fixed"
												class="panel-collapse collapse" role="tabpanel"
												aria-labelledby="headerRootMenuAuthList">
												<div class="panel-body bg-color-eee padding-all-0">
													<ul class="list-unstyled heading-hover-item">
														<li class="padding-left-15 padding-right-15"><a
															class="plain sendGAEventClz"
															data-name="노란 헤더 - 드랍다운 메뉴 - 나의정보"
															href="http://localhost:8080/kmongPro/my_profile.infomation.do">나의정보</a></li>

														<li class="padding-left-15 padding-right-15"><a
															class="plain sendGAEventClz"
															data-name="노란 헤더 - 드랍다운 메뉴 - 인증정보"
															href="#">인증정보</a></li>

														<li class="padding-left-15 padding-right-15"><a
															class="plain sendGAEventClz"
															data-name="노란 헤더 - 드랍다운 메뉴 - 알림설정"
															href="http://localhost:8080/kmongPro/my_profile.mailsetting.do">알림설정</a></li>
													</ul>
												</div>
											</div>
										</div>
										<div
											class="panel border-none border-top-solid border-radius-top-none margin-top-0">
											<a href="logout.do" class="plain sendGAEventClz"
												data-name="노란 헤더 - 드랍다운 메뉴 - 로그아웃">
												<div
													class="panel-heading border-radius-none header-root-dropdown-menu padding-left-15 padding-right-15 padding-bottom-10 padding-top-10">
													<h5 class="header-margin-none">로그아웃</h5>
												</div>
											</a>
										</div>
									</div>
								</div></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>





