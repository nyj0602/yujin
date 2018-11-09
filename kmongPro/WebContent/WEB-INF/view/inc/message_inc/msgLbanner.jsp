<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
                    <div class="col-xs-9">
                        <div id="dropdownMenuGroup" class="pull-left" role="group"><!-- pull-left open -->
                            <button id="inboxListDropdownBtn" type="button" class="border-radius padding-top-5 padding-bottom-5 padding-left-10 padding-right-10 btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><!-- aria-expanded="true" -->
                                <input id="checkboxMenu" type="checkbox">
                                <span class="dropdown-square"></span>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a id="allcheck">전체선택</a></li>
                                <li><a id="nocheck">선택해제</a></li>
                                <li><a id="checkstar">별표 선택</a></li>
                                <li><a id="nostar">별표 없음 선택</a></li>
                            </ul>
                        </div>
						<!-- 체크박스 클릭되면 btn btn-default btn-xss -->
                        <div class="pull-left margin-left-10">
                            <a class="btn btn-default btn-xss disabled" role="button" id="delete">
                                <i class="fa fa-trash-o fa-lg font-color-lighter" aria-hidden="true"></i>
                            </a>
                        </div>
                        <div class="pull-left margin-left-10">
                            <div class="input-group width-180px">
                                <input id="searchKeywordInput" type="text" class="form-control input-xs padding-right-45" placeholder="상대방 이메일 검색" value="">
                                <span>
                                   <a class="btn btn-xss btn-default inbox-list-search-input-group-btn" type="button" >
                                       <i class="fa fa-search fa-lg font-color-lighter" aria-hidden="true"></i>
                                   </a>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-3">
                        <div class="width-105 pull-right">
                            <div class="pull-left margin-all-0 font-size-h6">
                                <span class="inline-block text-left">
                                    메시지 응답률
                                </span>
                                <span class="inline-block color-dark-gray pull-right">
                                    100&nbsp;%
                                </span>
                            </div>

                            <div class="inbox-response-background">
                                <div class="inbox-response-bar bg-color-danger" style="width: 100%;"></div><!-- 응답률%구하기 -->
                            </div>

                        </div>
                    </div>
                </div>
                
              <script>
              $(function () {
            	  
				$("div#dropdownMenuGroup").click(function () {
					$(this).toggleClass(" open");
				});//click
				
				 $('a#allcheck').on("click", function (){
					  	$("input.ckb_list").prop("checked",true);
					  	$("div.pull-left>a.btn").attr('class',"btn btn-default btn-xss");
						if ($("input.ckb_list:checked").length==0) {
							$("div.pull-left>a.btn").attr('class',"btn btn-default btn-xss disabled");
						}
				});//click
				
				$('a#nocheck').on("click", function (){
					$("input.ckb_list").prop("checked",false);
					$("div.pull-left>a.btn").attr('class',"btn btn-default btn-xss");
					if ($("input.ckb_list:checked").length==0) {
						$("div.pull-left>a.btn").attr('class',"btn btn-default btn-xss disabled");
					}
				});//click
				
				$('a#checkstar').on("click", function (){
					$("li.list-group-item:has('.fa-star-o-inactive') input.ckb_list").prop("checked",false);
					$("li.list-group-item:has('.fa-star-active') input.ckb_list").prop("checked",true);
					$("div.pull-left>a.btn").attr('class',"btn btn-default btn-xss");
					if ($("input.ckb_list:checked").length==0) {
						$("div.pull-left>a.btn").attr('class',"btn btn-default btn-xss disabled");
					}
				});//click
				
				$('a#nostar').on("click", function (){
					$("li.list-group-item:has('.fa-star-o-inactive') input.ckb_list").prop("checked",true);
					$("li.list-group-item:has('.fa-star-active') input.ckb_list").prop("checked",false);
					$("div.pull-left>a.btn").attr('class',"btn btn-default btn-xss");
					if ($("input.ckb_list:checked").length==0) {
						$("div.pull-left>a.btn").attr('class',"btn btn-default btn-xss disabled");
					}
				});//click
				
				$("#searchKeywordInput").keydown(function (event) {
					if (event.which==13) {
						$('#searchKeywordInput~span>a.btn').click();
					}
				});
				
			});//function
              
              </script>
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              