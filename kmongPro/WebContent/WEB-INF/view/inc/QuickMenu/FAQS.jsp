<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link href="https://kmong.com/css/kmong_fonts.css?v=1.1"
	rel="stylesheet">
</head>

<body>
	<div id="kmongKnowledgeBase"
		class="bg-color-fa border-left kmong-KB text-left font-size-h5"
		style="height: 100%; display: block;">
		<div id="kmongKnowledgeBaseCarousel" class="carousel slide"
			data-ride="carousel" data-interval="false">
			<div class="row margin-left-0 margin-right-0 kmong-KB-nav-shadow">
				<div class="col-xs-11 padding-left-0 padding-right-0">
					<ul class="nav text-center bg-color-white kmong-KB-nav"
						role="tablist">
						<li role="presentation" class="kmongKBNav col-xs-4 active"
							id="que"><a id="kmongFAQLink"
							class="font-color-lighter font-size-h4" href="#kmongFAQ"
							aria-controls="home" role="tab" data-toggle="tab"
							aria-expanded="true">자주 묻는 질문</a></li>
						<li role="presentation" class="kmongKBNav col-xs-4" id="center"><a
							id="kmongHelpCenterLink" class="font-color-lighter font-size-h4"
							href="#kmongHelpCenter" aria-controls="profile" role="tab"
							data-toggle="tab" aria-expanded="false">크몽 고객센터</a></li>
						<li role="presentation" class="kmongKBNav col-xs-4" id="kmong"><a
							id="kmongNotificationLink"
							class="font-color-lighter font-size-h4 position-relative"
							href="#kmongNotifications" aria-controls="messages" role="tab"
							data-toggle="tab" aria-expanded="false"> 크몽 안내 <span
								class="color-primary font-size-h2 position-absolute"
								style="display: none; top: -5px; right: 20px;">•</span>
						</a></li>
					</ul>
				</div>
				<div
					class="col-xs-1 bg-color-white text-right padding-bottom-10 padding-left-0 cursor"
					style="margin-top: 11px">
					<i class="fa fa-close color-gray-d1 font-size-20" id="close"></i>
				</div>
			</div>
			<div class="carousel-inner" role="listbox">

				<div class="item kmong-KB-menu active" data-index="0"
					style="height: 820px;">
					<div id="kbCategoryBody"
						class="row margin-left-0 margin-right-0 overflow-y"
						style="height: 100%;">
						<div class="col-xs-12 padding-left-0 padding-right-0">
							<div class="tab-content">
								<div role="tabpanel"
									class="kmongKBTab tab-pane position-relative active"
									id="kmongFAQ">
									<div class="padding-left-15 padding-right-15">
										<div id="kbCategoryHeader" style="display: block;">
											<div class="font-size-20 NGB margin-top-30">문의 전 확인</div>
											<h5 class="margin-top-5">아래 검색창을 통해 원하시는 답변을 빠르게 찾아 보실 수
												있습니다.</h5>
										</div>
										<div class="form-group input-text-group margin-top-30">
											<span class="twitter-typeahead"
												style="position: relative; display: inline-block;"> <input
												type="text" id="search" name="searchKeyword"
												class="form-control padding-left-30 input-sm text-left-imp kb_search_bar border-radius-0 tt-input"
												placeholder="검색어를 입력해주세요" autocomplete="off"
												spellcheck="false" dir="auto"
												style="position: relative; vertical-align: top; height: 40px;">
												<pre aria-hidden="true"
													style="position: absolute; visibility: hidden; white-space: pre; font-family: &amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; quot; NotoSansKR Regular&amp;amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; quot;; font-size: 13px; font-style: normal; font-variant: normal; font-weight: 400; word-spacing: 0px; letter-spacing: 0px; text-indent: 0px; text-rendering: auto; text-transform: none;">회원가입</pre>
												<div class="tt-menu tt-empty"
													style="position: absolute; top: 100%; left: 0px; z-index: 100; display: none;">
													<div class="list-group margin-none margin-none-0"></div>

												</div>
											</span>
											<div class="kmong-KB-search-icon">
												<i class="fa fa-search font-color-lighter"
													aria-hidden="true"></i>
											</div>
											<div class="inline-block kb-category-close cursor" id="keyup"
												style="display: none;">
												<span> <i class="fa fa-times font-color-lighter"
													id="findClose" aria-hidden="true"></i>
												</span>
											</div>
										</div>

									</div>
									<div
										class="panel-group margin-none border-radius-none margin-top-30"
										id="kbCategoryAccordion" role="tablist"
										aria-multiselectable="true" style="">


										<!-- foreach -->

										<c:forEach items="${ Fs_Con }" var="con" varStatus="status">
											<div
												class="panel panel-default margin-top-0 border-radius-none kb-border-solid"
												id="kbCategoryAccordionPanel0">
												<div
													class="bg-color-white padding-all-20 border-radius-none"
													role="tab">
													<a class="plain" data-toggle="collapse"
														data-parent="#kbCategoryAccordion" aria-expanded="true"
														href="#kbCategoryBody0" aria-controls="kbCategoryHeading0"
														id="kbCategoryHeading0">
														<h4 class="panel-title NGB">
															${con.fs_con }<span class="pull-right"
																id="arrowToggle_${status.index}"> <i
																class="fa fa-chevron-down color-yellow KB-arrow-icon"></i>
															</span>
														</h4>
													</a>
												</div>

												<div class="panel-collapse collapse in dfc" role="tabpanel"
													id="kbCategoryBody${status.index}"
													aria-labelledby="kbCategoryHeading0" aria-expanded="true"
													style="">
													<ul
														class="list-group margin-none panel-list-group-only padding-left-15 padding-right-15">
														<!-- 두번째for문 -->
														<c:forEach items="${Faqs }" var="faq" varStatus="status">
															<c:if test="${faq.fs_con eq con.fs_con}">
																<li
																	class="list-group-item padding-top-10 padding-bottom-10 cursor qwer"
																	id="select${status.index}"><span>${faq.f_sub }</span>
																</li>
															</c:if>
														</c:forEach>
													</ul>

												</div>
											</div>


										</c:forEach>

									</div>
									<!--  선택한거눌렀을때이용하는것 -->

									<c:forEach items="${Faqs }" var="fq" varStatus="status">
										<div
											class="item bg-color-fa overflow-y kmong-KB-menu kmong-KB-menu-margin-adjust active asdf"
											data-index="2" style="height: 959px; display: none;"
											id="selected${status.index}">
											<div class="row margin-left-0 margin-right-0">
												<div class="col-xs-11 padding-left-15 padding-right-0">
													<ul class="nav kmong-KB-nav" role="tablist">
														<li role="presentation"
															class="col-xs-12 cursor padding-top-20 padding-bottom-20 closed"
															id="closed"><i
															class="fa fa-arrow-left color-gray-d1" aria-hidden="true"></i>&nbsp;
															<span class="font-color-lighter"> ${fq.fs_con } </span></li>
													</ul>
												</div>
											</div>

											<div class="row margin-left-0 margin-right-0">
												<div class="col-xs-12 padding-left-15 padding-right-15">
													<div
														class="font-size-20 NGB margin-bottom-15 kmong-kb-images-size">
														${fq.f_sub }</div>
													<div
														class="knowledgeBaseDetailContent font-size-h5 text-justify style-style padding-bottom-40">
														<p>
															${fq.f_con }<a href="mailto:help@kmong.com">mailsendkmong@gmail.com</a>
														</p>
													</div>

												</div>
											</div>
										</div>
									</c:forEach>
									<!-- <서치결과> -->


									<ul id="kbCategoryQueryBody"
										class="list-group list-unstyled overflow-y margin-none padding-left-15 position-relative"
										style="display: block;">

										<!--  for문시작 -->


										<!--  for문끝 -->

										


									</ul>

									<!-- <서치결과> -->
								</div>










								<!-- 고객센터 -->
								<div role="tabpanel"
									class="kmongKBTab tab-pane kmong-KB-menu-margin-adjust"
									id="kmongHelpCenter" style="display: none;">
									<div class="row margin-none bg-color-fa">
										<div class="col-xs-12 padding-right-15 padding-left-15" style="margin-left: 15px;">
											<div class="font-size-20 NGB margin-top-30">안녕하세요, 크몽
												고객센터입니다.</div>
											<h5 class="line-height margin-top-5">문의 내용을 상세히 작성하여
												보내주시면, 입력된 이메일 주소를 통해 <br>빠르게 답변해드리도록 하겠습니다.</h5>
										</div>
									</div>

									<div class="row margin-none">
										<div class="col-xs-12 padding-all-20">
											<h6 class="font-color-lighter">이메일</h6>
											<div id="helpCenter_from_email"
												class="form-group margin-bottom-10">
												<input type="text" class="form-control input-sm"
													placeholder="이메일" id="mailsender"> <span
													id="helpCenter_from_email_error"
													class="help-block padding-left-0" style="display: none"><i
													class="fa fa-exclamation-triangle"></i>&nbsp;이메일을 입력해주세요.</span>
											</div>

											<div id="helpCenter_title"
												class="form-group margin-bottom-10">
												<h6 class="margin-top-15 font-color-lighter">제목</h6>
												<div class="form-group input-text-group">
													<span
														class="input-inner-text-sm-no-label bg-color-white padding-left-5 color-primary cursor"
														style="pointer-events: auto; display: none;"
														onclick="$('#related_kb').toggle();"> 관련 답변들(0개) <i
														class="fa fa-chevron-circle-down" aria-hidden="true"></i>
													</span> <input type="search"
														class="form-control input-sm text-left-imp"
														placeholder="제목을 작성해주세요." id="mailTitle">
												</div>
												<span id="helpCenter_title_error"
													class="help-block padding-left-0" style="display: none"><i
													class="fa fa-exclamation-triangle"></i>&nbsp;제목을 입력해주세요.</span>
											</div>

											<ul id="related_kb" class="list-group overflow-y margin-none"
												style="display: none;">

												<li
													class="list-group-item border-radius-none bg-color-gray border-top-none text-right"
													onclick="$('#kmongFAQLink').trigger('click');"
													style="display: none;"><span
													class="cursor font-color-lighter font-size-h6">
														관련문의더보기 </span></li>
											</ul>


											<div id="helpCenter_body" class="form-group margin-all-0">
												<h6 class="margin-top-15 font-color-lighter">내용</h6>
												<textarea class="form-control border-radius-bottom-none"
													placeholder="문의 내용을 작성해주세요." rows="7" id="mailText"></textarea>
												<span id="helpCenter_body_error"
													class="help-block padding-left-0" style="display: none"><i
													class="fa fa-exclamation-triangle"></i>&nbsp;내용을 입력해주세요.</span>
											</div>


											<div class="border-solid border-top-none padding-all-10">
												<div class="row dropzone-preview-helpcenter margin-top-5"></div>
												<a id="dropzoneFileHelp"
													class="btn btn-default sendBtn btn-xs dz-clickable">파일첨부</a>
											</div>
										</div>
									</div>

									<div class="row margin-none">
										<div class="col-xs-12 padding-left-20 padding-right-20">
											<a id="sendHelpCenterForm"
												class="btn btn-primary btn-sm btn-block">문의하기</a>
										</div>
									</div>

									<div class="row margin-none margin-top-10">
										<div class="col-xs-12">
											<ul class="font-size-h6 font-color-lighter padding-left-25">
												<li>주말·공휴일은 답변이 늦어질 수 있습니다.</li>
												<li>파일첨부는 최대 4개까지 가능합니다.</li>
											</ul>
										</div>
									</div>
								</div>

								<div role="tabpanel"
									class="kmongKBTab tab-pane kmong-KB-menu-margin-adjust"
									id="kmongNotifications" style="display: none; height: 348px;">
									<ul class="list-group">
										<li
											class="kmong-KB-notification-list-group-item padding-top-20 padding-bottom-20 list-group-item border-radius-none border-top-none"
											data-index="0">
											<div class="media">
												<div class="media-left">
													<img
														class="width-40px border-round border-solid media-object"
														src="https://d2v80xjmx68n4w.cloudfront.net/members/thumbs/B64eJ1438389689.png"
														onerror="this.onerror=null;this.src='css/image/main_user_gray.png';"
														title="">
												</div>
												<div class="media-body">
													<h5 class="header-margin-none color-primary">
														 <span class="pull-right font-color-lighter">2018-03-12 18:35:17</span>
													</h5>
													<h5
														class="header-margin-none margin-top-5 line-clamp-default-2s"><br>
														안녕하세요, 크몽입니다^^<br>새롭게 추가되는 기능 관련, 서비스 이용약관 및 개인정보
														취급방침을 개정하게 되어 안내 드립니다.<br> <br>아래 크몽 공식블로그 url로
														이동하셔서 변경 될 약관을 확인해보세요.<br> <a
															href="http://blog.naver.com/kmongteam/221227241424"
															target="_blank">blog.naver.com/kmongteam/221227241424</a><br>
														<br>※ 크몽의 공식 블로그 계정에서는<br>크몽의 다양한 이슈와 이벤트를
														안내해드립니다.<br>이제 다양한 소식과 이벤트를 보다 빠르고 편하게 확인하세요 !
													</h5>
												</div>
											</div>
										</li>
									</ul>

									<div id="kmongNotificationLoadingDiv"
										class="row margin-left-0 margin-right-0"
										style="display: none;">
										<div class="col-xs-12 padding-all-20 text-center">
											<div class="la-ball-fall color-black">
												<div></div>
												<div></div>
												<div></div>
											</div>
											<h5>불러오는 중</h5>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>


				</div>


				<div
					class="item bg-color-fa kmong-KB-menu kmong-KB-menu-margin-adjust"
					data-index="1" style="height: 820px;">
					

					<div id="kmongNotificationDetailFooter"
						class="row margin-left-0 margin-right-0 bg-color-black padding-top-15 padding-bottom-15 kmong-KB-footer">
						<div class="col-xs-6 padding-right-0 padding-left-20 text-left">
							<a id="kmongNotificationPrevBtn" class="plain-color-white"
								href="javascript:void(0)" style="display: none;"> 이전</a>
						</div>
						<div class="col-xs-6 padding-left-0  padding-right-20 text-right">
							<a id="kmongNotificationNextBtn" class="plain-color-white"
								href="javascript:void(0)" style="display: none;">다음 </a>
						</div>
					</div>


					<div id="kmongNotificationDetailLoadingBody"
						class="row margin-left-0 margin-right-0 overflow-y"
						style="height: 780px; display: none;">
						<div class="col-xs-12 padding-all-20 text-center margin-top-50">
							<div class="la-ball-fall color-black">
								<div></div>
								<div></div>
								<div></div>
							</div>
							<h5>불러오는 중</h5>
						</div>
					</div>
				</div>


			</div>
		</div>
	</div>
</body>
</html>