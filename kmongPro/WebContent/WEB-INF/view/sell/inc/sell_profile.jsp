
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="subject" content="크몽 - 당신의 비즈니스를 도와드립니다 " />

</head>
<body>





	<div class="col-xs-3">


		<div class="row margin-top-10">
			<div class="col-xs-6 font-size-h6">
				프로필&nbsp;:&nbsp;<b> <!-- 데이터넣어야하는부분 -->${pro_rate }%
				</b>
			</div>
			<div class="col-xs-6 text-right font-size-h6">
				<a class="color-purple" href="#">${pro_rate eq 100 ? '나의 프로필':'완성하러가기' }&nbsp;<i
					class="fa fa-angle-right"></i></a>
			</div>
		</div>


		<!-- 프로그래스바 길이값 조정해줘야 함.  -->
		<div class="row margin-top-5">
			<div class="col-xs-12">
				<div class="progress" style="height: 8px;">
					<div class="progress-bar bg-color-yellow-400" role="progressbar"
						aria-valuenow="85" aria-valuemin="0" aria-valuemax="100"
						style="width: ${pro_rate}%; height: 8px; box-shadow: none;"></div>
				</div>
			</div>
		</div>



		<div class="row">
		
			<div class="col-xs-12">
			
				<div
					class="text-center panel panel-default box-shadow-light margin-bottom-0 border-solid border-bottom-none padding-top-20">
					
					
					<div class="user-profile-body">
						<a class="plain" href="#"> <!-- 프로필 이미지 넣기 -->
							<img class="user-profile-image" src="" title="${name }"
							onerror="this.onerror=null;this.src='../image/main_user_gray.png';">
						</a>

						<div class="user-profile-ranking">
							<!-- 전문가등급페이지 연결 -->
							<a href="#"> <img class="tooltip-width-100 width-100"
								src="../image/kmong_grade_NEW.png" rel="tooltip-text"
								data-toggle="tooltip" data-placement="right" title=""
								data-original-title=NEW>
							</a>
						</div>
					</div>



					<ul class="list-group margin-top-10">
						<li class="list-unstyled margin-bottom-20">
							<h3 class="margin-top-5">
								<a class="plain" href="#"> ${name } </a>
							</h3>
							<div style="display: ${mem eq 'sell'? 'none' : 'block'}">
                            <a class="plain" href="https://kmong.com/my_profile/certification?auth_type=seller&amp;target=NEW">
                                <label class="label-margin-none label label-primary cursor">전문가 인증</label>
                            </a>
                        </div>
						</li>
						
						
						<li class="list-group-item padding-all-15"><a class="plain"
							href="profits.do">
								<div class="row">
									<div class="col-xs-6 text-left  padding-right-0">
										<div class="font-color-lighter">출금가능 수익금</div>
									</div>
									<div class="col-xs-6 text-right padding-left-0">
										<b>${profit }&nbsp;원
										</b>
									</div>
								</div>
						</a></li>


						<li class="list-group-item padding-all-15 border-bottom-solid border-radius-0">
							<a class="plain" href="milege.do">
								<div class="row">
									<div class="col-xs-6 text-left padding-right-0">
										<div class="font-color-lighter">전문가 마일리지</div>
									</div>
									<div class="col-xs-6 text-right padding-left-0">
										<b>${milege }&nbsp;원
										</b>
									</div>
								</div>
						</a>
						</li>
						
						
					</ul>
					
					
				</div>
				
			</div>
			
		</div>


		<div class="row margin-left-0 margin-right-0 seller-menu">
			
			
			<div class="col-xs-12 border-solid border-top-none">
				
				
				<div class="row border-bottom-solid">
					<a class="plain font-color-lighter" href="sellmanage.do">
						<div class="col-xs-6 padding-all-15 text-center seller-menu-item position-relative border-right  ${active eq 'sell' ? 'active' : '' } " data-target="selling">
							<div>
								<img class="width-40px" src="${active eq 'sell' ? '../image/selling_active.png' : '../image/selling.png' }">
							</div>
							<h6 class="margin-bottom-0">판매관리</h6>
						</div>
					</a> 
					
					<a class="plain font-color-lighter" href="profits.do">
						<div class="col-xs-6 padding-all-15 text-center seller-menu-item position-relative ${active eq 'bene' ? 'active' : '' }" data-target="profits_new">
							<div>
								<img class="width-40px" src="${active eq 'bene' ? '../image/profits_new_active.png' : '../image/profits_new.png' }">
							</div>
							<h6 class="margin-bottom-0">수익관리</h6>
						</div>
					</a>
				</div>
				
				
				

				<div class="row border-bottom-solid">
					<a class="plain font-color-lighter" href="adver.do">
						<div class="col-xs-6 padding-all-15 text-center seller-menu-item position-relative border-right ${active eq 'ad' ? 'active' : '' }" data-target="advertisement">
							<div>
								<img class="width-40px" src="${active eq 'ad' ? '../image/advertisement_active.png' : '../image/advertisement.png' }">
							</div>
							<h6 class="margin-bottom-0">광고관리</h6>
						</div>
					</a> <a class="plain font-color-lighter" href="myservice.do">
						<div class="col-xs-6 padding-all-15 text-center seller-menu-item position-relative ${active eq 'msv' ? 'active' : '' }" data-target="my_gigs">
							<div>
								<img class="width-40px" src="${active eq 'msv' ? '../image/my_gigs_active.png' : '../image/my_gigs.png' }">
							</div>
							<h6 class="margin-bottom-0">나의 서비스</h6>
						</div>
					</a>
				</div>




				<div class="row">
					<a class="plain font-color-lighter" href="milege.do">
						<div class="col-xs-6 padding-all-15 text-center seller-menu-item position-relative border-right ${active eq 'mm' ? 'active' : '' }" data-target="seller_mileage">
							<div>
								<img class="width-40px" src="${active eq 'mm' ? '../image/seller_mileage_active.png' : '../image/seller_mileage.png' }">
							</div>
							<h6 class="margin-bottom-0">전문가 마일리지</h6>
						</div>
					</a>


					<div class="col-xs-6 padding-left-0 padding-right-0">
						<div>
							<img style="width: 112px; height: 93px;"
								src="../image/temporary.png">
						</div>
					</div>
				</div>
				
				
			</div>
			
			
		</div>
		
	</div>
</body>
</html>