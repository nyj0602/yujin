<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<div class="header-yellow bg-color-yellow-400">
			<div class="container">
				<div class="row">
					<div class="col-xs-6 padding-top-10 padding-bottom-10">
						<ul class="list-inline margin-bottom-0 margin-top-5">



							<li class="pull-left header-logo-align"><a
								class="margin-top-5 inline-block" href="https://kmong.com"
								onclick="sendGAEvent('main', '노란색 헤더 - 로고', kmongCurrentPath);">
									<img class="width-100px"
									src="css/image/kmong_logo_20170518.png"
									title="당신의 '일'을 해결해줄 전문가들이 있는 곳, 서비스 마켓플레이스 크몽 ( Kmong )">
							</a></li>



							<li class="pull-left header-search-group position-relative">
								<form method="GET" action="https://kmong.com/gigs/keyword"
									accept-charset="UTF-8" id="searchHeader"
									class="margin-bottom-0" data-name="노란 헤더">
									<input class="form-control input-xs border-none"
										placeholder="검색어를 입력해 주세요" id="keyword" name="keyword"
										type="text"> <i
										class="fa fa-search header-search-icon text-center font-color-base cursor"
										aria-hidden="true"
										onclick="sendGAEvent('main', '노란색 헤더 - 서비스 검색', kmongCurrentPath);$('#searchHeader').submit();"></i>
								</form>
							</li>



							<li class="pull-left"><a
								class="btn header-kmonghow btn-black font-size-h6 cursor"
								data-toggle="modal" data-target="#kmongManual"
								onclick="sendGAEvent('main', '노란색 헤더 - 초간단 구매방법', kmongCurrentPath);">
									<i class="fa fa-book" aria-hidden="true"></i> 초간단 구매방법
							</a></li>
						</ul>
					</div>

					<div class="col-xs-6 padding-top-10 padding-bottom-10">
						<ul class="list-inline margin-all-0 pull-right">
							<li class="position-relative" style="top: 2px;"><a
								class="plain" href="become_a_seller.do"
								onclick="sendGAEvent('main', '노란색 헤더 - 판매시작하기', kmongCurrentPath);">
									<h5>판매시작하기</h5>
							</a></li>

							<li class="position-relative padding-left-20" style="top: 2px;">
								<a class="plain"
								href="login.do"
								onclick="sendGAEvent('main', '노란색 헤더 - 로그인', kmongCurrentPath);">
									<h5>로그인</h5>
							</a>
							</li>

							<li class="position-relative padding-left-20"><a
								class="btn btn-black-reverse btn-sm"
								href="https://kmong.com/signup"
								onclick="sendGAEvent('main', '노란색 헤더 - 무료 회원가입', kmongCurrentPath);">
									무료 회원가입 </a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
