
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<header>
		<div id="categoryHeader" class="bg-color-white border-bottom-solid">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<ul class=" list-inline margin-none">
						
						
						

							<li class="header-list mypage-menu">
								<h5 class="dropdown margin-top-5 margin-bottom-5">
									<a class="plain" href="admin.do"> 회원정보 </a>
								</h5>
							</li>
							
							
							
							<li class="header-list mypage-menu dropdown"><a
								class="plain dropdown-toggle padding-bottom-20"
								href="javascript:void(0);" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="true"> 재능관리 <i class="fa fa-chevron-down chevron-down font-size-h6" aria-hidden="true"></i>
							</a>

								<ul
									class="dropdown-menu border-top-category mypage-menu width-120px border-radius-0">
									<li><a class="plain" href="ad_tal.do">재능 신청 승인</a></li>
									<li><a class="plain" href="ad_tal.do?sep=판매중">재능 관리</a></li>
								</ul></li>






							<li class="header-list mypage-menu">
								<h5 class="dropdown margin-top-5 margin-bottom-5">
									<a class="plain" href="ad_QNA.do"> 문의관리 </a>
								</h5>
							</li>




							<li class="header-list mypage-menu">
								<h5 class="dropdown margin-top-5 margin-bottom-5">
									<a class="plain" href="ad_report.do"> 신고관리 </a>
								</h5>
							</li>


							
						</ul>
					</div>
				</div>
			</div>
		</div>
	</header>
	