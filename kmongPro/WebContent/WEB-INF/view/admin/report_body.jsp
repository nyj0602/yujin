
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="admin_header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>관리자 페이지</title>


<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="../css/kmong-99952b2854.master_desktop.css" rel="stylesheet">
<link href="../css/kmong_desktop_v2-6ec7c3f31e.css" rel="stylesheet">
<link href="../css/kmong_fonts.css?v=1.1" rel="stylesheet">
<link href="../css/mykmong_main.css" rel="stylesheet">
<link href="../css/kmong_buy.css" rel="stylesheet">
<link rel="shortcut icon" href="../image/favicon.ico">

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



	<div class="container"  style="margin-left: 200px; margin-right: 200px">


		<div class="row margin-top-30">
			<div class="col-xs-12">
				<h2>
					<b>신고관리</b>
				</h2>
			</div>
		</div>


			
				<div class="row">
					<div class="col-xs-12 margin-top-15">
					
						<c:set var="report" value="${report.reportlist}"/>
						
						<c:choose>
						<c:when test="${empty report}">
					
						<div style="width: 1350px;" class="border-solid text-center padding-top-85 padding-bottom-85 margin-top-20">
							<h5 class="font-color-lighter">내역이 없습니다.</h5>
						</div>
												
						</c:when>
						<c:when test="${not empty report }">

						<table>
						
						<tr>
						<th>신고내용</th>
						<th>신고회원</th>
						<th>신고대상</th>
						<th></th>
						</tr>
						
						<c:forEach items="${report}" var="report" >
						<tr>
						<td>${report.r_con }</td>
						<td>${report.r_email }</td>
						<td>${report.r_nick }</td>
						<td><button class="btn1" style="text-decoration: ${report.ck == 0 ? '' : 'line-through' } " ${report.ck == 0 ? '' : 'disabled' } class="plain font-color-lighter" value="${report.r_seq}">확인</button></td>
						</tr>
						</c:forEach>			
												<tr>
						<td colspan="4">						${ paging }
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
		
		var seq = $(this).val();
 
 
		$('#background').css("display", "block");
		$('#rep_tal').css("display", "block");
		
		
		$('#yesbtn').on("click", function (){
			
			
			$.ajax({
				
				url:"ad_sub_report.do?r_seq="+seq,
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
		$('#rep_tal').css("display", "none");
		
	});
	
	
	
});

</script>



</body>


<div id="background" class="sweet-overlay" tabindex="-1" style="opacity: 1.1; display: none;"></div>
<div id="rep_tal" class="sweet-alert showSweetAlert visible" data-custom-class="" data-has-cancel-button="true" data-has-confirm-button="true" data-allow-outside-click="false" data-has-done-function="true" data-animation="pop" data-timer="null" style="display: none; margin-top: -175px;"><div class="sa-icon sa-error" style="display: none;">
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
    </div><div class="sa-icon sa-custom" style="display: none;"></div><h2>신고 확인</h2>
    <fieldset>
      <input type="text" tabindex="3" placeholder="">
      <div class="sa-input-error"></div>
    </fieldset><div class="sa-error-container">
      <div class="icon">!</div>
      <p>Not valid!</p>
    </div><div class="sa-button-container">
      <button id="nobtn" class="cancel" tabindex="2" style="display: inline-block; box-shadow: none;">취소</button>
      <div class="sa-confirm-button-container">
        <button id="yesbtn" class="confirm" tabindex="1" style="display: inline-block; background-color: rgb(221, 107, 85); box-shadow: rgba(221, 107, 85, 0.8) 0px 0px 2px, rgba(0, 0, 0, 0.05) 0px 0px 0px 1px inset;">확인</button><div class="la-ball-fall">
          <div></div>
          <div></div>
          <div></div>
        </div>
      </div>
    </div></div>
</html>