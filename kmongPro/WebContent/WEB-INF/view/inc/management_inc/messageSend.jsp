<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <div class="message-box-container padding-all-30" id="generalMsg">
 <div class="message-box-partner-information-body">
      <c:forEach items="${payment }" var="pay" end="0">
    <div class="message-box-partner-username">
        <h6 class="color-brown">상대방 닉네임</h6>
        <c:set value="${email eq pay.seller?pay.buyer:pay.seller  }" var="another"></c:set>
        <b>${email eq pay.seller?pay.buyer:pay.seller  }</b>
    </div>
</c:forEach>
    <div class="pull-right">
        <div>
            <div class="message-box-partner-offline-information">

                <div class="message-box-partner-average-response-time">
                    <h6>평균응답시간</h6>
                    <div><strong>아직 모름</strong></div>
                </div>
                <c:forEach items="${time }" var="t">
                	<c:if test="${t.email eq another }">
                <div class="message-box-partner-available-time">
                    <h6>연락가능시간</h6>
                    <strong>${t.time_1 }&nbsp;~&nbsp;${t.time_2 }시</strong>
                </div>
                </c:if>
                </c:forEach>
            </div>
        </div>
    </div>
</div>       
<!-- processList에 인서트됨 -->
	<form id="proForm" enctype="multipart/form-data">
         <div class="margin-top-25">
                    <div>
                        <div class="position-relative">
                            <div class="form-group margin-bottom-0">
                                <input id="generalMessageTxtArea" name="content" class="form-control message-box-textarea messageTextArea" data-button="sendMessageBtn" placeholder="최소 한자 이상 입력해야 전송 가능합니다."></input>
                            </div>
                        </div>

                        <div class="message-box-request-container padding-all-0">
                                <div class="row">
                                    <div class="col-xs-12 padding-left-35 track-additional-pay-header">
                                        <a id="additionalPayBtn" class="plain" role="button">
                                            <i id="PlusCircle" class="fa fa-plus-circle font-size-h4"></i>
                                            &nbsp;<strong>추가결제 요청</strong>
                                        </a>
                                    </div>

                                </div>
                            </div>
                                            </div>
                    <div class="message-box-footer-body bg-color-transparent border-none padding-top-20 padding-left-15 padding-right-15 padding-bottom-0">
                        <div class="row attached_file_preview"></div>

                        <div class="row">
                            <div id="generalMessageFileDiv" class="col-xs-7 padding-left-0">
                                <div class="inline-block">
                                    <input type="file" name="generalfile" width="8px" id="generalfile"/>
                                        <!-- <input type="file" name="file" style="display: none; width: 8px;" id="attach"/><img style="width:8px" src="../css/image/track_upload.png"> 첨부파일 -->
                                    <!-- </a> --> 
                                    <div class="upload-tooltip bg-color-black color-white font-size-h6 padding-left-10 padding-right-10 padding-top-5 padding-bottom-5 inline-block position-absolute margin-left-15" style="top: 6px; right: 38px;">한 번에 최대 250MB의 파일을 첨부할 수 있어요!</div>
                                </div>
                            </div>

                            <div class="col-xs-5 padding-right-0 text-right">
                                <div class="inline-block" id="generalbtn">
                                    <a id="sendMessageBtn" class="btn sendBtn btn-brand-yellow btn-gray" role="button" >전송</a>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                </form>
            </div><!-- 판매 완료 & 취소일땐 안보임 -->
            
            
            