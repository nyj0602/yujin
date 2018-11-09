
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
width: 100%;
padding: 5px;
margin: 5px;
}
th, td{
font-size:13px;
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
</style>

</head>

<body id="master_body">



	<div class="container">


		<div class="row margin-top-30">
			<div class="col-xs-12">
				<h2>
					<b>회원관리</b>
				</h2>
			</div>
		</div>


		<div class="row margin-top-20">
	
				<form method="GET" action="#" accept-charset="UTF-8" id="searchForm">
					<div class="row margin-top-20">
					
						<div class="col-xs-2">
							<select class="form-control input-xs" name="sep">
								<option value="전체" ${empty sep or sep eq '전체' ? 'selected' : '' }>전체</option>
								<option value="분류" ${sep eq '분류' ? 'selected' : '' }>분류</option>
								<option value="닉네임" ${sep eq '닉네임' ? 'selected' : '' }>닉네임</option>
							</select>
						</div>

						<div class="col-xs-3 padding-left-0 margin-left-15">
							<div class="position-relative">
								<i class="fa fa-search header-search-icon" aria-hidden="true"
									style="left: 11px !important; width: 15px;"></i> 
									<input
									type="text" name="keyword" value="${keyword}"
									class="form-control input-xs search_keyword padding-left-30"
									placeholder="조회 정보">
							</div>
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
					
						<c:set var="member" value="${member.memberlist}"/>
						
						<c:choose>
						<c:when test="${empty member}">
					
						<div class="border-solid text-center padding-top-85 padding-bottom-85 margin-top-20">
							<h5 class="font-color-lighter">내역이 없습니다.</h5>
						</div>
												
						</c:when>
						
						<c:when test="${not empty member }">

						<table>
						
						<tr>
						<th>닉네임</th>
						<th>회원 구분</th>
						<th>회원명</th>
						<th>연락처</th>
						<th>이메일</th>
						<th></th>
						</tr>
						
						<c:forEach items="${member}" var="member" >
						<tr>
						<td>${member.m_nick }</td>
						<td>${member.m_sep }</td>
						<td>${member.m_name }</td>
						<td>${member.m_phone }</td>
						<td>${member.m_email }</td>
						<td><button class="plain font-color-lighter" value="${member.m_email }">회원 삭제</button></td>
						</tr>
						</c:forEach>			
												<tr>
						<td colspan="6">						${ paging }
						</td>
						</tr>
						</table>
						

						</c:when>			
						</c:choose>
					
					</div>

				</div>
				
			</div>
			
<input id="del" type="hidden">

<script type="text/javascript">

$(function (){
	
	$('button').on("click", function (){
		
		var mail = $(this).val();
 
		$('#del').val(mail);
 
		$('#background').css("display", "block");
		$('#del_member').css("display", "block");
		
		
		$('#yesbtn').on("click", function (){
			
			
			$.ajax({
				
				url:"ad_member.do?mail="+mail,
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
		$('#del_member').css("display", "none");
		
	});
	
	
	
});

</script>



</body>


<div id="background" class="sweet-overlay" tabindex="-1" style="opacity: 1.1; display: none;"></div>
<div id="del_member" class="sweet-alert showSweetAlert visible" data-custom-class="" data-has-cancel-button="true" data-has-confirm-button="true" data-allow-outside-click="false" data-has-done-function="true" data-animation="pop" data-timer="null" style="display: none; margin-top: -175px;"><div class="sa-icon sa-error" style="display: none;">
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
    </div><div class="sa-icon sa-custom" style="display: none;"></div><h2>회원을 삭제하시겠습니까?</h2>
    <p style="display: block;">삭제된 회원은 복구가 불가능합니다.</p>
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