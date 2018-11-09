<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col-xs-2">

      <h2><b>메시지</b></h2>
      <h4 class="margin-top-30">
          <a id="GENERAL_messages"  class="messageLink  inbox-list-menu-active  plain">전체메시지</a>
      </h4>
      <h4 class="margin-top-10">
          <a id="UNREAD_messages" class="messageLink  plain">안읽은메시지</a>
      </h4>
      <h4 class="margin-top-10">
          <a id="STARRED_messages"  class="messageLink  plain">별표메시지</a>
       </h4>
</div>

<script>
	$(function () {
		$("h2~h4>a").hover(function () {
			$(this).css("cursor", "pointer");
		});
		
		$("#GENERAL_messages").click(function () {
			$(this).attr('class','messageLink  inbox-list-menu-active  plain');
			$('#UNREAD_messages, #STARRED_messages').attr('class','messageLink  plain');
			
			if($("ul.list-group>li").hasClass("list-group-item")){
				$('div#inboxListDiv').css("display","block");	
				$("ul.list-group>li").css("display","block");		
				$("div.bg-color-transparent").css("display","none");
			} else{
				$("div#inboxListDiv").css("display","none");
				$("div.bg-color-transparent").css("display","block");
			}
		});
		
		//안읽은 페이지 체크
		$("#UNREAD_messages").click(function () {
			$(this).attr('class','messageLink  inbox-list-menu-active  plain');
			$('#GENERAL_messages, #STARRED_messages').attr('class','messageLink  plain');
				if($("ul.list-group>li").hasClass("bg-color-unread")){
					$("ul.list-group>li.bg-color-unread").css("display","block");		
					$("ul.list-group>li:not('.bg-color-unread')").css("display","none");		
					$("div.bg-color-transparent").css("display","none");
				} else{
					$("div#inboxListDiv").css("display","none");
					$("div.bg-color-transparent").css("display","block");
				}
		});
		
		//별표인 메세지 체크
		$("#STARRED_messages").click(function () {
			$(this).attr('class','messageLink  inbox-list-menu-active  plain');
			$('#GENERAL_messages, #UNREAD_messages').attr('class','messageLink  plain');
				if($("div.inbox-list-starred>i.fa").hasClass("fa-star-active")){
					$("div#inboxListDiv").css("display","block");
					$("div.inbox-list-starred>i.fa-star-active").closest("li").css("display","block");
					$("div.inbox-list-starred>i.fa-star-o-inactive").closest("li").css("display","none");
					$("div.bg-color-transparent").css("display","none");
				} else{
					$("div#inboxListDiv").css("display","none");
					$("div.bg-color-transparent").css("display","block");
				}
		});
		
	});//function
	

</script>            
         