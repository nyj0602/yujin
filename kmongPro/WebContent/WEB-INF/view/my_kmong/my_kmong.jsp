<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>2018. 2. 22. - 오후 12:17:19</title>

<style>
body {
	background: #fafafa !important;
	font-size: 14px;
}

</style>

<style>
.tab-menu-underline>.active>.todo-header:after {
	top: 30px;
}

.dashboard-user-information  .tooltip-inner {
	padding: 5px;
	max-width: 200px;
	text-align: left;
	/* If max-width does not work, try using width instead */
	width: 200px;
}
</style>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="css/kmong_desktop_v2-6ec7c3f31e.css"
	type="text/css">
<link rel="stylesheet" href="css/kmong-8888b96a4a.master_desktop.css"
	type="text/css">
<link rel="stylesheet" href="css/kmong_fonts.css?v=1.1" type="text/css">
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {

		$('[data-toggle="tooltip"]').tooltip();

		$("#quickMenuTop").click(function() {
			$('html, body').animate({
				scrollTop : 0
			}, 400);
			return false;
		});
		makeAlarmList();
		maketodo();
	});

	function maketodo() {

		$
				.ajax({
					url : "work.do",
					dataType : "json",
					cache : false,
					success : function(data) {

						$("#todoList").children().children().empty();
						var innerHTML = "";

						$
								.each(
										data,
										function(idx, data) {
											$("#todoCount").text(idx + 1);

											innerHTML += "<li class='todos list-group-item dashboard-list-group-item' data-index='557749'>";
											innerHTML += "<div class='row'>";
											innerHTML += "<a class='plain' href='#'>";
											innerHTML += "<div class='col-xs-1 padding-right-0 text-center'>";
											innerHTML += "<img class='width-40px' src='css/image/3.png'>";
											innerHTML += "</div>";

											if (data.p_state == '요청사항 미작성') {
												innerHTML += "<div class='col-xs-7'>                                                #"
														+ data.p_seq
														+ "  요청사항을 미작성하였습니다. 요청사항을 작성해주세요.                                                <h6 class='header-margin-none font-color-lighter'>"
														+ data.m_name + "</h6>";
												innerHTML += "</div>";
											} else if (data.p_state == '진행') {
												innerHTML += "<div class='col-xs-7'>                                                #"
														+ data.p_seq
														+ "  거래가 진행중입니다. 현재 진행 상태를 확인해주세요.                                                <h6 class='header-margin-none font-color-lighter'>"
														+ data.m_name + "</h6>";
												innerHTML += "</div>";
											} else if (data.p_state == '발송중') {
												innerHTML += "<div class='col-xs-7'>                                                #"
														+ data.p_seq
														+ "  작업물이 발송중입니다. 작업물을 확인해주세요.                                                <h6 class='header-margin-none font-color-lighter'>"
														+ data.m_name + "</h6>";
												innerHTML += "</div>";
											} else if (data.p_state == '완료') {
												innerHTML += "<div class='col-xs-7'>                                                #"
														+ data.p_seq
														+ "  거래가 완료되었습니다. 전문가님을 평가해주세요.                                                <h6 class='header-margin-none font-color-lighter'>"
														+ data.m_name + "</h6>";
												innerHTML += "</div>";
											} else if (data.p_state == '평가 미작성') {
												innerHTML += "<div class='col-xs-7'>                                                #"
														+ data.p_seq
														+ "  평가를 미작성하였습니다. 평가를 작성해주세요.                                                <h6 class='header-margin-none font-color-lighter'>"
														+ data.m_name + "</h6>";
												innerHTML += "</div>";
											} else if (data.p_state == '취소') {
												innerHTML += "<div class='col-xs-7'>                                                #"
														+ data.p_seq
														+ "  거래가 취소되었습니다. 취소된 사항을 확인해주세요.                                                <h6 class='header-margin-none font-color-lighter'>"
														+ data.m_name + "</h6>";
												innerHTML += "</div>";
											}

											innerHTML += "</a>";
											innerHTML += "<div class='col-xs-4 todo-list-btn-group todoBtn text-right padding-right-30' style='display: none;' id='todo_btn_557749'>";
											innerHTML += "<a class=btn btn-primary' role='button' href='#'>평가하기</a>";
											innerHTML += "<a class='btn btn-default' href='javascript:void(0);' role='button'><b><span class='fa fa-check' style='margin-top: 3px;''></span></b></a>";
											innerHTML += "</div>";
											innerHTML += "</div>";
											innerHTML += "</li>";

										})//each
						$("#todoList").children().children().append(innerHTML);
					}//success
				});//ajax

		$("#alarmTabLi").attr("class", "position-relative");
		$("#todoTabLi").attr("class", "position-relative dashboardTab active");
		$("#alarmTabLi").find('a').attr('aria-expanded', 'false');
		$("#todoTabLi").find('a').attr('aria-expanded', 'true');
		$("#alarmList").attr("class", "tab-pane fade");
		$("#todoList").attr("class", "tab-pane fade active in");
	}

	function makeAlarmList() {
		$
				.ajax({
					url : "alarm.do",
					dataType : "json",
					cache : false,

					success : function(data) {

						$("#alarmList").children().children().empty();
						var innerHTML = "";
						var alarmcount = 0;
						$
								.each(
										data,
										function(idx, data) {
											if (data.msg_ck == 1) {
												alarmcount++;
											}

											console.log(data.seller_name);
											innerHTML += "<li class='list-group-item dashboard-list-group-item'>";
											innerHTML += "<div class='row'>";
											innerHTML += "<div class='col-xs-12'>";
											innerHTML += "<a class='plain' href='#'>";
											innerHTML += "<div class='row'>";
											innerHTML += "<div class='col-xs-1 padding-right-0 text-center'>";
											innerHTML += "<img class='width-40px border-round border-solid' src='css/image/"+data.seller_profile+"' title=''>";
											innerHTML += "</div>";
											innerHTML += "<div class='col-xs-10'>";
											innerHTML += "<span><b>"
													+ data.seller_name
													+ "</b>&nbsp;:&nbsp;#"
													+ data.order_num
													+ "&nbsp;:&nbsp;"
													+ data.msg_content
													+ "</span>";
											innerHTML += "<h6 class='header-margin-none font-color-lighter'>                                                            "
													+ data.msg_send
													+ " 주일 전                                                                                                                        <img src='/img/dashboard/complete.png' style='width:11px;' data-toggle='tooltip' data-placement='right' title='' data-original-title='자동 구매 확정'>";
											innerHTML += "</h6>";
											innerHTML += "</div>";
											innerHTML += "<div class='col-xs-1 padding-left-0 text-center'>";
											innerHTML += "<img class='dashboard-notification-gig-image' src='css/image/"+data.image+"' title=''>";
											innerHTML += "</div>";
											innerHTML += "</div>";
											innerHTML += "</a>";
											innerHTML += "</div>";
											innerHTML += "</div>";
											innerHTML += "</li>";

										});//each
						$("#alarmList").children().children().append(innerHTML);
					}//success
				});//ajax
		$("#alarmTabLi").attr("class", "position-relative dashboardTab active");
		$("#todoTabLi").attr("class", "position-relative");
		$("#alarmTabLi").find('a').attr('aria-expanded', 'true');
		$("#todoTabLi").find('a').attr('aria-expanded', 'false');
		$("#alarmList").attr("class", "tab-pane fade active in");
		$("#todoList").attr("class", "tab-pane fade");
	}

	function changeTab(type) {

		$('.dashboardAlarm').removeClass('alarm_on');
		$('#' + type + 'Count').addClass('alarm_on');
		if (type == 'todo') {
			maketodo();
		} else if (type == 'alarm') {
			makeAlarmList();
		}
	}
</script>
</head>

<body id="master_body">
	<nav id="KmongNavBar" class="navbar navbar-fixed-top"
		style="z-index: 99; display: block;">
		<div class="header-yellow bg-color-yellow-400">
			<div class="container">
				<jsp:include page="/WEB-INF/view/inc/header/header_lmain.jsp"></jsp:include>
				<jsp:include page="/WEB-INF/view/inc/header/header_category.jsp"></jsp:include>
			</div>
		</div>
	</nav>

	<div class="fake_global_body"></div>
	<div class="global-body">
		<script>
			var $globalBody = $('.global-body');

			if ($('#penaltyDetailBanner').length > 0) {
				$('#kmongNavBar').css('margin-top',
						$('#penaltyDetailBanner').height() + 'px');
				$('#penaltyDetailBanner').css({
					'position' : 'fixed',
					'top' : 0,
					'z-index' : 100
				});
			}
		</script>


			<c:import url="http://localhost:8080/kmongPro/QuickMenuModuel.do">
					<c:param name="sessionID" value="${sessionID }"></c:param>
			</c:import>
	</div>
	<div class="container">
		<div class="row margin-top-20">
			<div class="col-xs-12">
				<h2>
					<b>나의 크몽</b>
				</h2>
			</div>
		</div>

		<div class="row">

			<div class="col-xs-3">
				<div class="row margin-top-10">
					<div class="col-xs-6 font-size-h6">
						프로필&nbsp;:&nbsp;<b>${profilecompletenum }%</b>
					</div>
					<div class="col-xs-6 text-right font-size-h6">
						<a href="#">완성하러가기&nbsp;<i class="fa fa-angle-right"></i></a>
					</div>
				</div>
				<div class="row margin-top-5">
					<div class="col-xs-12">
						<div class="progress" style="height: 8px;">
							<div class="progress-bar bg-color-yellow-400" role="progressbar"
								aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
								style="width: ${profilecompletenum}%; height: 8px; box-shadow: none;"></div>
						</div>
					</div>
				</div>

				<div class="row margin-top-10">
					<div class="col-xs-12">
						<div class="panel panel-default border-radius-none margin-none">
							<div class="panel-body position-relative padding-bottom-0">
								<div class="row">
									<div class="col-xs-6 dashboard-profile text-center">
										<div class="dashboard-profile-body">
											<img id="thumbnail" class="border-round"
												src="css/image/${m_profile }" title="dodo95123"
												onerror="this.onerror=null;this.src='css/image/main_user_gray.png';">
											<div class="dashboard-profile-grade userProfileRanking NEW">
												<a href="#"> <img src="css/image/kmong_grade_NEW.png"
													data-toggle="tooltip" data-placement="right" title=""
													data-original-title="NEW">
												</a>
											</div>
										</div>
									</div>
									<div class="col-xs-6">
										<div class="row">
											<div id="satisfaction" class="col-xs-12 cursor">
												<h6 class="header-margin-none font-color-lighter">만족도</h6>
												<div>
													<b>${mystaravg.satisfaction }</b>
												</div>
											</div>
											<div id="satisfactionInformation"
												class="dashboard-satisfaction" style="display: none">
												<div class="position-relative">
													<div class="font-color-base dashboard-satisfaction-arrow">
														<i class="fa fa-caret-up" aria-hidden="true"></i>
													</div>
												</div>

												<div
													class="dashboard-satisfaction-body color-white font-size-h6">
													<h6 class="header-margin-none">평가 세부내용</h6>
													<div
														class="position-relative satisfaction-progress-background">
														<div style="width: ${totRate}%;"
															class="satisfaction-progress-danger"></div>
													</div>
													<div class="position-relative margin-top-5">
														<span>전체</span> <span class="pull-right left-right">${mystaravg.d }</span>
													</div>

													<div class="position-relative margin-top-5">
														<span>긍정 (&nbsp;&gt;=&nbsp;2.5)</span> <span
															class="pull-right left-right">${mystaravg.a }</span>
													</div>

													<div class="position-relative margin-top-5">
														<span>부정 (&nbsp;&lt;&nbsp;2.5)</span> <span
															class="pull-right left-right">${mystaravg.b }</span>
													</div>

													<div class="position-relative margin-top-5">
														<span>평가없음</span> <span class="pull-right left-right">${mystaravg.c }</span>
													</div>
												</div>
											</div>
										</div>
										<div class="row margin-top-10">
											<div class="col-xs-12">
												<h6 class="header-margin-none font-color-lighter">평균응답시간</h6>
												<div>
													<b>${restime }</b>
												</div>
											</div>
										</div>
									</div>
								</div>


								<div class="row margin-top-20 dashboard-user-information">
									<div class="col-xs-12">
										<div data-toggle="tooltip" title="" data-placement="right"
											data-original-title="최근 신규 문의 메시지로부터 30일 기반,<br />첫 문의에 24시간 내로 응답한 비율<br />(문의가 없었던 날은 미포함)">
											<h5 class="header-margin-none">
												응답률 <span class="pull-right"><b>${res_rate }%</b></span>
											</h5>
										</div>
									</div>
								</div>
								<div
									class="row dashboard-user-information-progress margin-top-5 border-bottom-solid">
									<div style="width: ${successRate}%;" class="bg-color-danger"></div>
								</div>

								<div class="row margin-top-20 dashboard-user-information">
									<div class="col-xs-12">
										<div data-toggle="tooltip" title="" data-placement="right"
											data-original-title="전체 주문 건 대비&#10;취소 없이 완료된 건의 비율">
											<h5 class="header-margin-none">
												주문 성공률 <span class="pull-right"><b>${successRate }%</b></span>
											</h5>
										</div>
									</div>
								</div>
								<div
									class="row dashboard-user-information-progress margin-top-5 border-bottom-solid">
									<div style="width: ${successRate}%;" class="bg-color-success"></div>
								</div>

								<div class="row margin-top-20 dashboard-user-information">
									<div class="col-xs-12">
										<div data-toggle="tooltip" title="" data-placement="right"
											data-original-title="지난 60일 기반,<br/>완료 건 대비 작업물 발송 예정일에<br/>맞춰 작업을 완료한 비율">
											<h5 class="header-margin-none">
												작업일 준수율 <span class="pull-right"><b>${WKRate }%</b></span>
											</h5>
										</div>
									</div>
								</div>
								<div
									class="row dashboard-user-information-progress margin-top-5 border-bottom-solid">
									<div style="width: ${WKRate }%;" class="bg-color-success"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>



			<div class="col-xs-9">
				<div class="row margin-top-10">
					<div class="col-xs-12">
						<div class="panel panel-default margin-top-0 border-radius-0">
							<div class="panel-body">
								<div class="row">
									<div class="col-xs-3 text-center border-right">
										<h5 class="header-margin-none font-color-lighter">판매 중인 건</h5>
										<a class="plain" href="#">
											<h4 class="header-margin-none margin-top-5">
												<b>${myTotalTalentcount }</b>
											</h4>
										</a>
									</div>
									<div class="col-xs-3 text-center border-right">
										<h5 class="header-margin-none font-color-lighter">이달의 수익금</h5>
										<a class="plain" href="#">
											<h4 class="header-margin-none margin-top-5">
												<b><i class="fa fa-krw" aria-hidden="true"></i>&nbsp;${addMoney }</b>
											</h4>
										</a>
									</div>
									<div class="col-xs-3 text-center border-right">
										<h5 class="header-margin-none font-color-lighter">구매 중인 건</h5>
										<a class="plain" href="#">
											<h4 class="header-margin-none margin-top-5">
												<b>${buycount }</b>
											</h4>
										</a>
									</div>
									<div class="col-xs-3 text-center">
										<h5 class="header-margin-none font-color-lighter">크몽캐시</h5>
										<a class="plain" href="#">
											<h4 class="header-margin-none margin-top-5">
												<b><i class="fa fa-krw" aria-hidden="true"></i>&nbsp;${haveCash }</b>
											</h4>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>


				<div class="row">
					<div class="col-xs-12">
						<ul class="list-inline tab-menu-underline" role="tablist">
							<li id="todoTabLi" role="presentation"
								class="position-relative dashboardTab active"><a
								href="#todoList"
								class="todo-header plain font-color-lighter position-relative font-size-h5 NGR"
								aria-controls="todo" role="tab" data-toggle="tab"
								onclick="changeTab('todo')" aria-expanded="true">할&nbsp;일&nbsp;</a>
							</li>

							<li id="alarmTabLi" role="presentation"
								class="position-relative dashboardTab"><a href="#alarmList"
								class="plain font-color-lighter font-size-h5 NGR"
								aria-controls="alarm" role="tab" data-toggle="tab"
								onclick="changeTab('alarm')" aria-expanded="false">알림&nbsp;</a>
							</li>
						</ul>
					</div>
				</div>


				<div class="tab-content">
					<!-- 할일 -->
					<div id="todoList" role="tabpanel" class="tab-pane fade active in">


						<div class="panel panel-default" style="">
							<ul class="list-group panel-list-group-only">



								<li class="list-group-item text-center hidden"><a
									href="javascript:void(0);">더 보기</a></li>
							</ul>
						</div>
					</div>

					<!-- 알림 -->
					<div role="tabpanel" class="tab-pane fade" id="alarmList">


						<div class="panel panel-default" style="">
							<ul class="list-group panel-list-group-only">


								<li class="list-group-item text-center"><a
									id="notificationsLoadMoreDiv" href="javascript:void(0);">더
										보기</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/view/inc/footer/footer_notice.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/view/inc/footer/footer.jsp"></jsp:include>

</body>
</html>