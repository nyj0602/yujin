<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="mykmong_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>2018. 2. 23. - 오전 10:25:22</title>
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="../css/kmong-99952b2854.master_desktop.css" rel="stylesheet">
<link href="../css/kmong_desktop_v2-6ec7c3f31e.css" rel="stylesheet">
<link href="../css/kmong_fonts.css" rel="stylesheet">
<link href="../css/mykmong_main.css" rel="stylesheet">
<link href="../css/kmong_buy.css" rel="stylesheet">
<link rel="shortcut icon" href="../image/favicon.ico">
<script src="../js/aws-sdk-2.165.0.min.js"></script>
<script src="../js/kmong-c7448f76b7.dynamo.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<div class="container">

        <div class="row margin-top-20">
            <div class="col-xs-12"><h2><b>나의 크몽</b></h2></div>
        </div>

		<div class="row"> <!-- 나의 크몽 밑 바디부분 --> 

			<div class="col-xs-3"><!-- 프로필 박스 부분 -->
			
			
			
				<div class="row margin-top-10">
					<div class="col-xs-6 font-size-h6">
                        프로필&nbsp;:&nbsp;<b>10%<!-- ***프로필 완성도의 퍼센트가 나와야 함 디폴트 10*** --></b>
                    </div>
                    
                    <div class="col-xs-6 text-right font-size-h6">
                    	<!-- *** a태그에 프로필 페이지 연결 -->
                        <a href="#">완성하러가기&nbsp;<i class="fa fa-angle-right"></i></a>
                    </div>
				</div>
				<div class="row margin-top-5"> <!-- 프로그레스바 부분 -->
                    <div class="col-xs-12">
                        <div class="progress" style="height:8px;">
                        	<!-- 바 부분 프로그래스로 표시... -->
                        	<!-- 아래 div 스타일을 위의 퍼센트에 맞게 변경해 줘야 함.  -->
                            <div class="progress-bar bg-color-yellow-400" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 10%; height: 8px; box-shadow: none;"></div>
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
											<!-- 프로필 사진 부분 회원에 따라서 다르게 보여줘야 함.  -->
                                            <img id="thumbnail" class="border-round" src="#" title="" onError="this.onerror=null;this.src='../image/main_user_gray.png';">


                                           	<!-- 데이터로 들어온 회원의 등급에 따라서 바껴야 하는 부분 -->
                                            <div class="dashboard-profile-grade userProfileRanking NEW">
                                                <a href="#">
                                                    <img  src="../image/kmong_grade_NEW.png" data-toggle="tooltip" data-placement="right" title="" data-original-title=NEW>
                                                </a>
                                            </div>


                                        </div>
                                    </div>
                                    <div class="col-xs-6">
                                        <div class="row">
                                        
                                            <div id="satisfaction" class="col-xs-12 cursor">
                                                <h6 class="header-margin-none font-color-lighter">만족도</h6>
                                                <div><b>아직몰라요<!--  회원에 따라서 % 보여줌 --></b></div>
                                            </div>
                                            <div id="satisfactionInformation" class="dashboard-satisfaction" style="display: none">
                                                <div class="position-relative">
                                                    <div class="font-color-base dashboard-satisfaction-arrow">
                                                        <i class="fa fa-caret-up" aria-hidden="true"></i>
                                                    </div>
                                                </div>
												<!-- 마우스 가져다 대면 보여야 하는 항목 -->
                                                <div class="dashboard-satisfaction-body color-white font-size-h6">
                                                    <h6 class="header-margin-none">평가 세부내용</h6>
                                                    <div class="position-relative satisfaction-progress-background">
                                                        <div style="width: 0%;" class="satisfaction-progress-danger"></div>
                                                    </div>
                                                    <div class="position-relative margin-top-5">
                                                        <span>전체</span>
                                                        <span class="pull-right left-right">회원별</span>
                                                    </div>

                                                    <div class="position-relative margin-top-5">
                                                        <span>긍정 (&nbsp; >= &nbsp;2.5)</span>
                                                        <span class="pull-right left-right">회원별</span>
                                                    </div>

                                                    <div class="position-relative margin-top-5">
                                                        <span>부정 (&nbsp; < &nbsp;2.5)</span>
                                                        <span class="pull-right left-right">회원별</span>
                                                    </div>

                                                    <div class="position-relative margin-top-5">
                                                        <span>평가없음</span>
                                                        <span class="pull-right left-right">회원별</span>
                                                    </div>
                                                </div>
                                                
                                                
                                            </div>
                                        </div>
                                        
                                        <div class="row margin-top-10">
                                            <div class="col-xs-12">
                                                <h6 class="header-margin-none font-color-lighter">평균응답시간</h6>
                                                <div><b>아직몰라요<!-- 회원에따라 시간 --></b></div>
                                            </div>
                                        </div>
                                        
                                    </div>
                                </div>






								<!-- 프로필 사진 밑쪽 -->
                                <div class="row margin-top-20 dashboard-user-information">
                                    <div class="col-xs-12">
                                        <div data-toggle="tooltip" title="최근 신규 문의 메시지로부터 30일 기반, 첫 문의에 24시간 내로 응답한 비율 (문의가 없었던 날은 미포함)" data-placement="right">
                                            <h5 class="header-margin-none">응답률
                                                <span class="pull-right"><b>0%<!-- 회원에 따라 다르게 해줘야 하는 부분 --></b></span>
                                            </h5>
                                        </div>
                                    </div>
                                </div>
								<!-- 프로그래스 바 부분 -->
                                <div class="row dashboard-user-information-progress margin-top-5 border-bottom-solid">
<!--                                 	디폴트는 없음. red에서 100퍼 달성 시 green -->
                                    <div style="width: 0%;" class="bg-color-danger"></div>
                                </div>



                                <div class="row margin-top-20 dashboard-user-information">
                                    <div class="col-xs-12">
                                        <div data-toggle="tooltip" title="전체 주문 건 대비 취소 없이 완료된 건의 비율" data-placement="right">
                                            <h5 class="header-margin-none">주문 성공률
                                                <span class="pull-right"><b>100%<!-- 회원에 따라 다르게 해줘야 하는 부분 --></b></span>
                                            </h5>
                                        </div>
                                    </div>
                                </div>
                                <!-- 프로그래스 바 부분 -->
                                <div class="row dashboard-user-information-progress margin-top-5 border-bottom-solid">
<!--                                 	디폴트 green, red에서 100퍼 달성 시 green -->
                                    <div style="width: 100%;" class="bg-color-success"></div>
                                </div>



                                <div class="row margin-top-20 dashboard-user-information">
                                    <div class="col-xs-12">
                                        <div data-toggle="tooltip" title="지난 60일 기반, 완료 건 대비 작업물 발송 예정일에 맞춰 작업을 완료한 비율" data-placement="right">
                                            <h5 class="header-margin-none">작업일 준수율
                                                <span class="pull-right"><b>100%<!-- 회원에 따라 다르게 해줘야 하는 부분 --></b></span>
                                            </h5>
                                        </div>
                                    </div>
                                </div>
                                <!-- 프로그래스 바 부분 -->
                                <div class="row dashboard-user-information-progress margin-top-5 border-bottom-solid">
<!--                                 	디폴트 green, red에서 100퍼 달성 시 green -->
                                    <div style="width: 100%;" class="bg-color-success"></div>
                                </div>
                                
                                
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>  <!-- 프로필 박스 부분 닫기 -->
            
    			

			
			
			<div class="col-xs-9"> <!-- 내용 부분 -->
			
		        <div class="row margin-top-10">
                    <div class="col-xs-12">
                        <div class="panel panel-default margin-top-0 border-radius-0">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-xs-3 text-center border-right">
                                        <h5 class="header-margin-none font-color-lighter">판매 중인 건</h5>
                                        <a class="plain" href="#">
                                            <h4 class="header-margin-none margin-top-5"><b>0</b></h4>
                                        </a>
                                    </div>
                                    <div class="col-xs-3 text-center border-right">
                                        <h5 class="header-margin-none font-color-lighter">이달의 수익금</h5>
                                        <a class="plain" href="#">
                                            <h4 class="header-margin-none margin-top-5"><b><i class="fa fa-krw" aria-hidden="true"></i>&nbsp;0</b></h4>
                                        </a>
                                    </div>
                                    <div class="col-xs-3 text-center border-right">
                                        <h5 class="header-margin-none font-color-lighter">구매 중인 건</h5>
                                        <a class="plain" href="#">
                                            <h4 class="header-margin-none margin-top-5"><b>0</b></h4>
                                        </a>
                                    </div>
                                    <div class="col-xs-3 text-center">
                                        <h5 class="header-margin-none font-color-lighter">크몽캐시</h5>
                                        <a class="plain" href="#">
                                            <h4 class="header-margin-none margin-top-5"><b><i class="fa fa-krw" aria-hidden="true"></i>&nbsp;0</b></h4>
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
                            <li id="todoTabLi" role="presentation" class="position-relative dashboardTab  active  ">
                                <a href="#" class="todo-header plain font-color-lighter position-relative font-size-h5 NGR" aria-controls="todo" role="tab" data-toggle="tab" onclick="changeTab('todo')">할&nbsp;일&nbsp;<span id="todoCount" class="dashboardAlarm menu-count font-size-h6 border-round">0</span></a>
                            </li>

                            <li id="alarmTabLi" role="presentation" class="position-relative dashboardTab ">
                                <a href="#" class="plain font-color-lighter font-size-h5 NGR" aria-controls="alarm" role="tab" data-toggle="tab" onclick="changeTab('alarm')">알림&nbsp;<span id="alarmCount" class="dashboardAlarm menu-count font-size-h6 border-round" v-show="unreadCnt > 0" style="display: none">{{ unreadCnt }}</span></a>
                            </li>
                        </ul>
                    </div>
                </div>


                <div class="tab-content">
                    <!-- 할일 -->
                    <div id="todoList"  role="tabpanel" class="tab-pane fade  in active " >
                        <div class="margin-top-50 text-center" v-if="todos.length == 0 && !unreadMessage">
                            <div class="position-relative">
                                <div>
                                    <img src="../image/done.png">
                                </div>

                                <div class="margin-top-15 font-color-lighter font-size-h4">
                                    할 일을 모두 완료했습니다.
                                </div>
                            </div>
                        </div>

                        <div class="panel panel-default" v-show="todos.length > 0 || unreadMessage" style="display: none">
                            <ul class="list-group panel-list-group-only">
                            
                                <li v-if="unreadMessage" class="todos list-group-item">
                                    <div class="row">
                                        <a class="plain" href="{{ unreadMessage.extra_data.url }}">
                                            <div class="col-xs-1 padding-right-0 text-center">
                                                <img class="width-40px" src="../image/SETTING.png" v-bind:src="unreadMessage.type.icon" >
                                            </div>
                                            <div class="col-xs-7 margin-top-10">
                                               {{ unreadMessage.message }}
                                            </div>
                                        </a>
                                        <div class="col-xs-4 todoBtn text-right todo-list-btn-group  padding-right-30">
                                            <a class="btn btn-primary" href="{{ unreadMessage.extra_data.url }}" role="button">{{ unreadMessage.extra_data.title }}</a>
                                        </div>
                                    </div>
                                </li>

                                <li class="todos list-group-item dashboard-list-group-item"  v-for="todo in todos" data-index="{{ todo.id }}">
                                    <div class="row">
                                        <a class="plain" href="{{ todo.extra_data.url }}">
                                            <div class="col-xs-1 padding-right-0 text-center">
                                                <img class="width-40px" src="../image/SETTING.png" v-bind:src="todo.type.icon">
                                            </div>
                                            <div class="col-xs-7" :class="{'margin-top-10': todo.extra_data.partner == null}">
                                                {{ todo.message }}
                                                <h6 class="header-margin-none font-color-lighter">{{ todo.extra_data.partner }}<span v-if="todo.extra_data.expected_completed_at">&nbsp;|&nbsp;발송 예정일 : {{ todo.extra_data.expected_completed_at }}</span></h6>
                                            </div>
                                        </a>
                                        <div id="todo_btn_{{ todo.id }}" class="col-xs-4 todo-list-btn-group todoBtn text-right padding-right-30" style="display: none;">
                                            <a class="btn btn-primary" href="{{ todo.extra_data.url }}" role="button">{{ todo.extra_data.title }}</a>
                                            <a class="btn btn-default" href="javascript:void(0);" role="button" @click="dismiss(todo, $index)"><b><span class="fa fa-check" style="margin-top: 3px;"></span></b></a>
                                        </div>
                                    </div>
                                </li>
                                
                                <li class="list-group-item text-center" :class="{'hidden': isLastTodoPage}">
                                    <a href="javascript:void(0);" @click="getTodo()">더 보기</a>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <!-- 알림 -->
                    <div role="tabpanel" class="tab-pane fade " id="alarmList">
                        <div v-if="notifications.length == 0 && gig_request_id == null" class="text-center margin-top-50" style="display: none">
                            <div class="position-relative">
                                <div class="position-relative">
                                    <div>
                                        <img src="../image/alram.png">
                                    </div>

                                    <div class="margin-top-15 font-color-lighter font-size-h4">
                                        알림 내역이 없습니다.
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="panel panel-default" v-show="notifications.length > 0 || gig_request_id != null" style="display: none">
                            <ul class="list-group panel-list-group-only">
                                <li class="list-group-item dashboard-list-group-item" v-for="notification in notifications" :class="{'bg-color-unread': notification.unread == 1}">
                                    <div class="row" v-if="notification.provider == 'ORDER'">
                                        <div class="col-xs-12">
                                            <a class="plain" href="#">
                                                <div class="row">
                                                    <div class="col-xs-1 padding-right-0 text-center">
                                                        <img class="width-40px border-round border-solid" src="../image/main_user_gray.png" v-bind:src="notification.sender.profileImage"  onError="this.onerror=null;this.src='../image/main_user_gray.png';" title="">
                                                    </div>
                                                    <div class="col-xs-10" :class="{'margin-top-10': todo.extra_data.partner == null}">
                                                        <span><b>{{ notification.sender.username }}</b>&nbsp;:&nbsp;{{ notification.order_notification_message }}</span>
                                                        <h6 class="header-margin-none font-color-lighter">
                                                            {{ notification.time }}&nbsp;ㅣ&nbsp;
                                                            {{ notification.order.gig_for_noti.category_name }}&nbsp;ㅣ&nbsp;
                                                            <img src="../image/setting.png" style="width:11px;" v-bind:src="notification.order_notification_type.icon" data-toggle="tooltip" title="{{ notification.order_notification_type.title }}" data-placement="right" />
                                                        </h6>
                                                    </div>
                                                    <div class="col-xs-1 padding-left-0 text-center">
                                                        <img class="dashboard-notification-gig-image" src="../image/no_gig_sm_image.jpg" v-bind:src="notification.main_image" onError="this.onerror=null;this.src='../image/no_gig_sm_image.jpg';" title="">
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </li>
                                <li class="list-group-item text-center" :class="{'hidden': is_lastPage}">
                                    <a id="notificationsLoadMoreDiv" href="javascript:void(0);" @click="getNotifications('loadMore')">더 보기</a>
                                </li>
                            </ul>
                        </div>
                    </div>

                </div>	
			
			
			
			
			</div> <!-- 내용 부분 닫기 -->

		</div>
		
</div>
</body>
</html>
<%@ include file="../inc/footer/footer_notice.jsp" %>
<%@ include file="../inc/footer/footer.jsp" %>