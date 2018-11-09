<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:forEach items="${checkboxName}" var="dto3">
	<div style="" class="fade-transition">
								<!-- fade-transition margin-top-20 -->
									<div class="row">
										<div class="col-xs-12 padding-left-0">
											<h5 class="margin-all-0 NGB">${dto3.c_group} </h5>
										</div>
									</div>
		<c:forEach items="${checkboxList}" var="dto" >
		<c:if test="${dto3.c_id eq dto.c_superid }">
									<div class="row">
										<div class="col-xs-12 padding-left-0">
											<div class="awesome-checkbox margin-top-5">
												<label> <input class="gigDataCheckbox"
													type="checkbox" id="gigData_${dto.c_id }_checkbox"	value="${dto.c_id }" name = 'checked' ${fn:contains(check, dto.c_id )? "checked":""}> 
													<span	class="awesome-checkbox-body"></span>
													<div class="awesome-checkbox-text category-awesome-width font-color-light">${dto.c_group}  </div>
												</label>
											</div>
										</div>
									</div>
		</c:if>
	</c:forEach>
	</div>
</c:forEach>
<script>
$(function () {
	$(".fade-transition:gt(1)").attr('class','fade-transition margin-top-20');
	
	/* '<div class="row"> <div class="col-xs-12 margin-top-5 padding-left-0"> <a class="cursor link-color-blue font-size-h6" id="showMore_1">더 보기&nbsp;<i class="fa fa-caret-down"></i></a></div></div>' */
});


</script>
