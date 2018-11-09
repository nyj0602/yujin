
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="admin_header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="subject" content="크몽 - 당신의 비즈니스를 도와드립니다 " />
<meta name="keywords" content="재능기부, 재능마켓, 재능기부사이트, 웹에이전시, 재택알바사이트, 자택알바, 직장인투잡알바, 창업사이트, 재택부업, 부업사이트, 재택근무알바, 직장인부업">
<meta name="description" content="디자인, 마케팅, 프로그래밍, 영상제작 등 각 분야 5천 여명의 전문가들이 비즈니스에 도움을 드립니다.">
<title>구매관리 크몽 - 당신의 비즈니스를 도와드립니다</title>


<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="../css/kmong-99952b2854.master_desktop.css" rel="stylesheet">
<link href="../css/kmong_desktop_v2-6ec7c3f31e.css" rel="stylesheet">
<link href="../css/kmong_fonts.css?v=1.1" rel="stylesheet">
<link href="../css/mykmong_main.css" rel="stylesheet">
<link href="../css/kmong_buy.css" rel="stylesheet">
<link rel="shortcut icon" href="../image/favicon.ico">
<link href="../css/bootstrap-datepicker3.css" rel="stylesheet">
<script src="../js/bootstrap-datepicker.js"></script>
<script src="../js/aws-sdk-2.165.0.min.js"></script>
<script src="../js/kmong-c7448f76b7.dynamo.js"></script>
<script src="../js/buildV63.js"></script>
<script src="../js/dropzone.js"></script>
<script src="../js/fbevents.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">
table{
width: 1350px;
padding: 5px;
margin: 15px;
}
th, td{
padding: 7px;
margin: 7px;
border-bottom: solid 1px gray;
}
th{
background-color: rgba(0,0,0,0.1); 
}
#table{
position: absolute;
bottom: 200px;
left: 45%;
}
table, th, td{
font-size: 13px;
}
</style>

</head>

<body id="master_body">



	<div class="container" style="margin-left: 200px; margin-right: 200px">


		<div class="row margin-top-30">
			<div class="col-xs-12">
				<h2>
					<b>재능 관리</b>
				</h2>
			</div>
		</div>


		<div class="row margin-top-20" style="margin-left: 20px">
	
				<form method="GET" action="#" accept-charset="UTF-8" id="searchForm">
					<div class="row margin-top-20">
					<input type="hidden" value="판매" name="sep">
						<div class="col-xs-2">
							<select class="form-control input-xs" name="cate">
								<option value="0" ${empty cate or cate eq 0 ? 'selected' : '' }>전체</option>
								<option value="1" ${cate == 1 ? 'selected' : '' }>디자인</option>
								<option value="2" ${cate == 2 ? 'selected' : '' }>IT&프로그래밍</option>
								<option value="3" ${cate == 3 ? 'selected' : '' }>컨텐츠 제작</option>
								<option value="4" ${cate == 4 ? 'selected' : '' }>마케팅</option>
								<option value="5" ${cate == 5 ? 'selected' : '' }>번역&통역</option>
								<option value="6" ${cate == 6 ? 'selected' : '' }>문서작성</option>
								<option value="7" ${cate == 7 ? 'selected' : '' }>상담&컨설팅</option>
								<option value="8" ${cate == 8 ? 'selected' : '' }>레슨</option>
								<option value="9" ${cate == 9 ? 'selected' : '' }>핸드메이드</option>
							</select>
						</div>

						<div class="col-xs-3 padding-left-0 margin-left-15">
							<select class="form-control input-xs" name="keyword">
							<option value="전체" ${empty keyword or keyword eq '전체' ? 'selected' : '' }>전체</option>
							<option value="개인" ${keyword eq '개인' ? 'selected' : '' }>개인</option>
							<option value="기업" ${keyword eq '기업' ? 'selected' : '' }>기업</option>
							</select>
						</div>
						
						
						<div class="col-xs-1 padding-left-0 padding-right-0">
							<div>
								<input style="border-radius: 2px !important;" type="submit"
									class="btn btn-default btn-seller-search padding-top-5 border-solid padding-bottom-5 NGB"
									value="검색">
							</div>
						</div>
					</div>
					
				</form>

		</div>
			
			
				<div class="row">
					<div class="col-xs-12 margin-top-15">
					
						<c:set var="talent" value="${talent.talentlist}"/>
						
						<c:choose>
						<c:when test="${empty talent}">
					
						<div style="height: 400px" class="border-solid text-center padding-top-85 padding-bottom-85 margin-top-20">
							<h5 class="font-color-lighter">내역이 없습니다.</h5>
						</div>
												
						</c:when>
						<c:when test="${not empty talent }">

						<table>
						
						<tr>
						<th>재능코드</th>
						<th>재능명</th>
						<th>재능상태</th>
						<th>가격</th>
						<th>등록일</th>
						<th>닉네임</th>
						<th>회원구분</th>
						<th>전문가 등급</th>
						<th>회원 메일</th>
						<th></th>
						<th></th>
						</tr>
						
						<c:forEach items="${talent}" var="talent" >
						
						<tr>
						<td>${talent.t_seq }</td>
						<td>${talent.t_name }</td>
						<td>${talent.ts_name }</td>
						<td>${talent.op_price }</td>
						<td>${talent.date }</td>
						<td>${talent.m_name }</td>
						<td>${talent.m_sep }</td>
						<td>${talent.gs_name }</td>
						<td>${talent.m_email }</td>
						<td><button class="btn1" class="plain font-color-lighter" value="${talent.t_seq}">재능상세</button></td>
						<td><button class="btn2" class="plain font-color-lighter" value="${talent.t_seq }">삭제</button></td>
						</tr>
						</c:forEach>			
												<tr>
						<td colspan="11">						${ paging }
						</td>
						</tr>
						</table>
						


						</c:when>			
						</c:choose>
					
					</div>

				</div>
				
			</div>
			

<script type="text/javascript">

$(function (){
	
	$('.btn1').on("click", function (){
		
		$.get(); // 재능상세와 연결
		
	});
	
	$('.btn2').on("click", function (){
		var seq = $(this).val();

		$('#background').css("display", "block");
		$('#del_tal').css("display", "block");
		
		
		$('#yesbtn').on("click", function (){
			
			
			$.ajax({
				
				url:"ad_deltal.do?t_seq="+seq,
				dataType:'json',
				type:'post',
				success:function(data){
					location.reload();
				}
				
			});
			
		});
		
		
	});
	
	
	$('#nobtn').on("click", function (){
		
		$('#background').css("display", "none");
		$('#del_tal').css("display", "none");
		
	});
	
	
	
});

</script>



</body>


<div id="background" class="sweet-overlay" tabindex="-1" style="opacity: 1.1; display: none;"></div>
<div id="del_tal" class="sweet-alert showSweetAlert visible" data-custom-class="" data-has-cancel-button="true" data-has-confirm-button="true" data-allow-outside-click="false" data-has-done-function="true" data-animation="pop" data-timer="null" style="display: none; margin-top: -175px;"><div class="sa-icon sa-error" style="display: none;">
      <span class="sa-x-mark">
        <span class="sa-line sa-left"></span>
        <span class="sa-line sa-right"></span>
      </span>
    </div><div class="sa-icon sa-warning pulseWarning" style="display: block;">
      <span class="sa-body pulseWarningIns"></span>
      <span class="sa-dot pulseWarningIns"></span>
    </div><div class="sa-icon sa-info" style="display: none;"></div><div class="sa-icon sa-success" style="display: none;">
      <span class="sa-line sa-tip"></span>
      <span class="sa-line sa-long"></span>

      <div class="sa-placeholder"></div>
      <div class="sa-fix"></div>
    </div><div class="sa-icon sa-custom" style="display: none;"></div><h2>재능을 삭제하시겠습니까?</h2>
    <p style="display: block;">재능을 삭제합니다.</p>
    <fieldset>
      <input type="text" tabindex="3" placeholder="">
      <div class="sa-input-error"></div>
    </fieldset><div class="sa-error-container">
      <div class="icon">!</div>
      <p>Not valid!</p>
    </div><div class="sa-button-container">
      <button id="nobtn" class="cancel" tabindex="2" style="display: inline-block; box-shadow: none;">취소</button>
      <div class="sa-confirm-button-container">
        <button id="yesbtn" class="confirm" tabindex="1" style="display: inline-block; background-color: rgb(221, 107, 85); box-shadow: rgba(221, 107, 85, 0.8) 0px 0px 2px, rgba(0, 0, 0, 0.05) 0px 0px 0px 1px inset;">삭제</button><div class="la-ball-fall">
          <div></div>
          <div></div>
          <div></div>
        </div>
      </div>
    </div></div>
</html>