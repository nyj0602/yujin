<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

     <div id="trackOrderInstructionQuestions">
        <div>
            <div class="order-instruction-wrapper padding-all-30">
                <div class="text-center padding-top-20">
                    <img class="width-25px" src="../css/image/work_before.png">
                    <h2 class="margin-top-10 font-size-20 margin-bottom-5"><b>작업 전 요청사항</b></h2>
                    <h4>원활한 주문을 진행하기 위해 반드시 필요한 정보입니다.</h4>
                </div>

                <div class="row margin-top-15 margin-bottom-30">
                    <div class="col-xs-11 col-xs-center">
                        <div class="panel bg-color-fa work-before-box border-radius-0 padding-left-30 padding-right-30">
                            <div class="panel-body padding-left-0 padding-right-0 padding-bottom-15 padding-top-15 padding-top-30 border-bottom-solid" id="orderInstructionDiv0">
                                <div>
                                <c:forEach items="${process }" var="pro" end="0">
                                    <h4 class="header-margin-none line-height"><b><span>0</span>${pro.t_request }</b><span class="font-size-h6 color-danger">(필수)</span></h4>
                                 </c:forEach>
                                    <div class="margin-top-15 font-color-base">
                                        <form  class="fileupload">
                                            <input type="file" name="file" id="instructionFile">
                                        </form>
                                        <div class="inline-block">
                                            <span class="font-color-lighter" id="instructionFileUploadComplete185522"></span>
                                        </div>
                                    </div>
                                </div>
                                <span class="help-block padding-left-0 margin-top-10" style="display: none" id="orderInstructionError0"><i class="fa fa-exclamation-triangle"></i>&nbsp;필수 입력사항입니다.</span>
                            </div>

                            <div class="text-center margin-top-20 margin-bottom-20" id="request">
                                <a id="submitInstructionBtn" class="btn-block btn btn-black width-100px inline-block btn-sm" role="button">
                                    <i class="fa fa-file-text" style="margin: 2px 3px 0px 0px;"></i>&nbsp;보내기
                                </a>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>