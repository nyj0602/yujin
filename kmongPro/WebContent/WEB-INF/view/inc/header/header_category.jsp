<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="indexCategoryHeader"
			class="bg-color-white border-bottom-solid">
			<div class="container">
				<div class="row">
					<div class="col-xs-12 ">
						<ul class="list-inline margin-none">


							<c:forEach var="list" items="${ categoryList }">


								<c:choose>
									<c:when test="${ list.c_level==1}">
										<li class="header-list dropdown">
											<h5 class="margin-top-5 margin-bottom-5">
												<a class="plain font-color-light padding-bottom-25" href="#"
													onclick="sendGAEvent('main', '노란색 헤더 - 카테고리 - 1', kmongCurrentPath);">
													${list.c_group } </a>
											</h5>
											<ul class="border-top-category  border-radius-0" role="menu"
												aria-labelledby="dLabel">
												<c:forEach var="list2" items="${categoryList }">
													<c:choose>
														<c:when test="${list.c_id==list2.c_superid }">
															<li class="margin-right-0">
																<div
																	class="col-xs-6 header-sub-category-menu padding-right-0 padding-top-5 padding-bottom-5 heading-hover">
																	<a class="plain" href="https://kmong.com/category/101"
																		onclick="sendGAEvent('main', '노란색 헤더 - 카테고리 - 101', kmongCurrentPath);">
																		${list2.c_group } </a>
																</div>
															</li>
														</c:when>
													</c:choose>
												</c:forEach>
											</ul>
										</li>
									</c:when>
								</c:choose>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>

