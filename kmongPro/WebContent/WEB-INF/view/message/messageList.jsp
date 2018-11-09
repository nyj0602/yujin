<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>2018. 3. 4. - 오전 12:52:58</title>
<link rel="stylesheet" href="../css/bootstrap-datepicker3.css" />
<link rel="stylesheet" href="../css/kmong_buy.css" />
<link rel="stylesheet" href="../css/kmong_desktop_v2-6ec7c3f31e.css" />
<link rel="stylesheet" href="../css/kmong_fonts.css" />
<link rel="stylesheet" href="../css/kmong-99952b2854.master_desktop.css" />
<link rel="stylesheet" href="../css/mykmong_main.css" />
<link rel="shortcut icon" href="../image/favicon.ico">
 <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>

<div id="inboxGroup" class="container ">
        <div class="row margin-top-30">
            <jsp:include page="/WEB-INF/view/message/inc/general_message.jsp"></jsp:include>
            <div class="col-xs-10">
                <!--  -->
                 <jsp:include page="/WEB-INF/view/message/inc/msgLbanner.jsp"></jsp:include>
                <!--  -->
                    <form id="form">
                <div id="inboxListDiv" class="panel panel-default" style="">
                    <ul id="inboxList" class="list-group">
                    <c:set var="msg" value="${message.ms }"></c:set>
                    <c:forEach items="${msg }" var="dto">
                    <c:if test="${email eq dto.m_email or email eq dto.buy_email }"><!-- 파라미터로 들어온 이메일 값이 재능판매자 이메일 또는 구매자 이메일과 일치할때-->
                    <c:set value="${(email eq dto.m_email)? dto.del_t:dto.del_b}" var="delete"></c:set>
                    <c:if test="${delete eq 1 }">
                	 <c:set value="${(email eq dto.m_email)?1:0}" var="seller"></c:set><!-- 1이면 판매자 -->
                       <li class='list-group-item active-hover padding-all-20 ${(email ne dto.msg_sender and dto.msg_ck eq 0)? "bg-color-unread":""}'><!-- 안읽었을떄 클래스명 list-group-item active-hover padding-all-20 bg-color-unread -->
                            <div class="row">
                                <div class="inbox-list-checkbox position-relative pull-left padding-left-15 padding-right-15">
                                    <div class="awesome-checkbox">
                                        <label>
                                            <input type="checkbox" id="chkbox_${dto.mr_seq }" class="ckb_list" value="${seller }_${dto.mr_seq }" name="delete">
                                            <span class="awesome-checkbox-body"></span>
                                            <div class="awesome-checkbox-text">
                                            </div>
                                        </label>
                                    </div>
                                </div>
                                <div class="inbox-list-starred cursor position-relative pull-left" data-toggle="tooltip" title="" id="STARRED_2329314" data-original-title="별표">
                                  <!-- 별 클릭했을때 클래스명 : fa fa-star-active -->
                                <c:choose>
                                <c:when test="${ dto.mr_star eq (email eq dto.m_email?10:1)}"><i class="fa fa-star-active" aria-hidden="true"><span class="star" style="display: none">${dto.mr_star }_${dto.mr_seq }_${seller }</span></i></c:when>
                                <c:when test="${ dto.mr_star eq 11 }"><i class="fa fa-star-active" aria-hidden="true"><span class="star" style="display: none">${dto.mr_star }_${dto.mr_seq }_${seller }</span></i></c:when>
                                <c:otherwise><i class="fa fa-star-o-inactive" aria-hidden="true" ><span class="star" style="display: none">${dto.mr_star }_${dto.mr_seq }_${seller }</span></i></c:otherwise>
                                </c:choose>
                                </div>
                                <div class="inbox-list-profile position-relative pull-left padding-left-15">
                                    <a href="/kmongPro/message/message.do?mr_seq=${ dto.mr_seq }&email=${email}">
                                        <img class="width-25px border-round border-solid" onerror="../css/image/main_user_gray.png';" title=" ${ (email eq dto.buy_email)? dto.m_email:dto.buy_email }" src="../css/image/${ (email eq dto.buy_email)? dto.sellprofile:dto.buyerprofile }">
                                    </a>
                                </div>
                                <div class="inbox-list-text-wrapper pull-left padding-left-15">
                                    <a class="plain-color-default" href="/kmongPro/message/message.do?mr_seq=${ dto.mr_seq }&email=${email}">
                                        <div class="col-xs-2 ellipsis padding-left-0 width-95px" id="email">                                            ${ (email eq dto.buy_email)? dto.m_email:dto.buy_email }                                        </div>
                                        <div class="col-xs-10 padding-left-0 ellipsis font-color-base">${dto.msg_content }</div>
                                        
                                        
                                        <div class="col-xs-10 padding-left-0 ellipsis" style="display: none;">
                                            <span class="label label-purple">상담요청</span>&nbsp;<span class="color-purple">부재중인 상담요청이 있습니다.</span>
                                        </div>

                                    </a>
                                 </div>
                                <div class="inbox-list-time text-right font-color-lighter pull-left padding-left-15 padding-right-15">                                 ${dto.sendtime }                          </div>
                            </div>
                        </li><!--  -->
                        </c:if>
                        </c:if>
                        </c:forEach>
                    </ul>
                </div>
             </form>

                <div class="panel bg-color-transparent border-solid border-radius-0" style="display: none">
                    <div class="panel-body text-center padding-top-40 padding-bottom-40">
                        <div>
                            <img class="width-50px" src="../css/image/nothing.png" title="내역없음">
                        </div>
                        <h5 class="font-color-light">내역이 없습니다.</h5>
                    </div>
                </div>
                <div id="inboxGroupsLoadingImg" class="loadingDiv text-center margin-top-150 margin-bottom-15 hidden">
                    <div class="la-ball-fall color-black"><div></div><div></div><div></div></div>
                </div>
                <div id="inboxGroupsPageLoading" class="text-center margin-top-30 hidden">
                    <div class="la-ball-fall color-black"><div></div><div></div><div></div></div>
                </div>
            </div>
        </div>
    </div>
<script>
$(function () {
	
	//메세지 체크박스 클릭시 휴지통 버튼 활성화
	$(".awesome-checkbox>label>input.ckb_list").on('click',function(){
		$("div.pull-left>a.btn").attr('class',"btn btn-default btn-xss");
		if ($("input.ckb_list:checked").length==0) {
			$("div.pull-left>a.btn").attr('class',"btn btn-default btn-xss disabled");
		}
	});//click

	//별 클릭 유무에 따라 별 색깔 변화
	$("div.inbox-list-starred>i.fa").click(function () {
		if ($(this).hasClass("fa fa-star-o-inactive")) {
			$(this).attr("class","fa fa-star-active");
	    	  $.ajax({			 
	 			 url:"givestar.do",
	 			 dataType:'json',
	 			 type:'post',
	 			 data: {
	 				value: $(this).children('span.star').text()
					} ,
	 			success:function(data){
	 				if (data.star=="star") {
	 					
					}
				 }
	 		 });//ajax
		} else {
			$(this).attr("class","fa fa-star-o-inactive")
			  $.ajax({			 
	 			 url:"takestar.do",
	 			 dataType:'json',
	 			 type:'post',
	 			 data: {
	 				value: $(this).children('span.star').text()
					} ,
	 			success:function(data){
	 				if (data.star=="star") {
					}
				 }
	 		 });//ajax
		}
	});
	 
	//이메일 검색 버튼 클릭
	$('#searchKeywordInput~span>a.btn').click(function () {
		$('li.list-group-item').css("display","block");
		var searchWord = $('input#searchKeywordInput').val().trim();
		if (searchWord=="") {
			 $('li.list-group-item').css("display","block");
		}
		var test = $("div:contains('" + searchWord + "')").parent("li.list-group-item");
		 $('li.list-group-item').not(test).css("display","none");
		 $('input#searchKeywordInput').val("");
		 
		 console.log($("div:contains('" + searchWord + "')"));
	});

	
	  $("#delete").click(function () {
    	  var params = $('#form').serialize();
    	  $.ajax({			 
 			 url:"delete.do",
 			 dataType:'json',
 			 type:'post',
 			 data:  params ,
 			success:function(data){
 				if (data.complete=="complete") {
 					 $("input.ckb_list:checked").closest("li").remove();
				}
			 }
 		 });//ajax
	})//delete click
	
	$("li.bg-color-unread").click(function () {
		 $(this).removeClass('bg-color-unread');		 
	});
	
	
});//function

</script>
</body>
<footer>
	<jsp:include page="/WEB-INF/view/inc/footer/footer_notice.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/view/inc/footer/footer.jsp"></jsp:include>
	</footer>
</html>