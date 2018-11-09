<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link href="https://kmong.com/css/kmong_fonts.css?v=1.1"
	rel="stylesheet">

<style>
@media (max-width: 1300px)
.kmong-quick-menu-wrap .mainFixed {
    position: fixed!important;
    bottom: 30px!important;
}
.kmong-quick-menu {
    width: 70px;
    position: fixed;
    top: 50%;
    right: 70px;
    z-index: 93;
}
</style>
</head>
<body>
	<div class="modal fade" id="kmongManual" tabindex="-1" role="dialog"
		aria-labelledby="myModal" aria-hidden="true" style="display: none; ">
		<div class="modal-dialog manual_modal modal-position"
			style="width: 640px; z-index: 9999;" id="howtobuyModal">
			<div class="modal-content">
				<div class="container" style="width: 100% !important;">
					<div class="row">
						<div class="col-xs-12 text-center padding-top-30">
							<h2 class="color-black">
								<b>초간단 구매방법</b>
							</h2>
							<button type="button" class="close kmong-how-close"
								data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">×</span>
							</button>
							<h3 class="margin-top-5 color-dark-gray">서비스를 상품처럼 사고팔 수 있는
								곳, 크몽</h3>
						</div>
					</div>
					<div
						class="row padding-right-80 padding-left-80 margin-top-30 margin-bottom-50">
						<div class="col-xs-12">
							<div class="row">
								<div class="col-xs-2 padding-right-0 padding-left-0">
									<img class="width-55px" src="css/image/1.png" alt="전문가찾기">
								</div>
								<div
									class="col-xs-10 padding-left-30 padding-bottom-30 padding-right-0 border-dashed-left">
									<dl>
										<dt>
											<h2 class="margin-top-0 color-dark-yellow-400">
												<i>01</i>
											</h2>
										</dt>
										<dd>
											<h4 class="color-black margin-top-5">
												<b>'카테고리 선택'</b> 또는 <b>'검색창'</b>을 통해 전문가를 찾아보세요.
											</h4>
										</dd>
									</dl>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-2 padding-right-0 padding-left-0">
									<img class="width-55px" src="css/image/2.png" alt="서비스 설명보기">
								</div>
								<div
									class="col-xs-10 padding-left-30 padding-bottom-30 padding-right-0 border-dashed-left">
									<dl>
										<dt>
											<h2 class="margin-top-0 color-dark-yellow-400">
												<i>02</i>
											</h2>
										</dt>
										<dd>
											<h4 class="color-black margin-top-5">
												제공 <b>서비스에 대한 설명과 가격</b> 등을 꼼꼼히 살펴보세요.
											</h4>
										</dd>
									</dl>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-2 padding-right-0 padding-left-0">
									<img class="width-55px" src="css/image/3.png" alt="견적문의">
								</div>
								<div
									class="col-xs-10 padding-left-30 padding-bottom-30 padding-right-0 border-dashed-left">
									<dl>
										<dt>
											<h2 class="margin-top-0 color-dark-yellow-400">
												<i>03</i>
											</h2>
										</dt>
										<dd>
											<h4 class="color-black margin-top-5">
												<b>크몽 메세지</b>를 통해 전문가에게<b> 견적을 문의</b>해보세요.
											</h4>
										</dd>
									</dl>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-2 padding-right-0 padding-left-0">
									<img class="width-55px" src="css/image/4.png" alt="구매버튼 클릭">
								</div>
								<div
									class="col-xs-10 padding-left-30 padding-bottom-30 padding-right-0 border-dashed-left">
									<dl>
										<dt>
											<h2 class="margin-top-0 color-dark-yellow-400">
												<i>04</i>
											</h2>
										</dt>
										<dd>
											<h4 class="color-black margin-top-5">구매버튼을 클릭하여 구매를
												완료하세요.</h4>
										</dd>
									</dl>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-2 padding-right-0 padding-left-0">
									<img class="width-55px" src="css/image/5.png" alt="작업물 확인">
								</div>
								<div
									class="col-xs-10 padding-left-30 padding-bottom-30 padding-right-0 border-dashed-left">
									<dl>
										<dt>
											<h2 class="margin-top-0 color-dark-yellow-400">
												<i>05</i>
											</h2>
										</dt>
										<dd>
											<h4 class="color-black margin-top-5">전문가와 대화하며 최상의 작업물을
												받아보세요.</h4>
										</dd>
									</dl>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-2 padding-right-0 padding-left-0">
									<img class="width-55px" src="css/image/6.png" alt="전문가 평가">
								</div>
								<div
									class="col-xs-10 padding-left-30 padding-right-0 border-dashed-left">
									<dl>
										<dt>
											<h2 class="margin-top-0 color-dark-yellow-400">
												<i>06</i>
											</h2>
										</dt>
										<dd>
											<h4 class="color-black margin-top-5">
												<b>전문가를 평가</b>해주세요.
											</h4>
										</dd>
									</dl>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>