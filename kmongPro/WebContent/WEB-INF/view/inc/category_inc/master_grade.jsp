<%@page import="java.text.Normalizer.Form"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.util.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="fade-transition">
							<div class="row">
								<div class="col-xs-12 padding-left-0">
									<h5 class="margin-all-0 NGB">전문가등급</h5>
								</div>
							</div>
			
			<div class="row"> 
				<div class="col-xs-12 padding-left-0">	
					<div class="awesome-checkbox margin-top-5"> 
								<label>
									<input class="sellerRatingCheckbox" name="grades" id="sellerRating_new" type="checkbox" value="new" ${fn:contains(grade,'new')? "checked":""}>
									<span class="awesome-checkbox-body"></span>
					 				<div class="awesome-checkbox-text category-awesome-width font-color-light">new</div>
					 			</label>
					</div>
				</div>	
			</div>
				  
			
			<div class="row"> 
				<div class="col-xs-12 padding-left-0">	
					<div class="awesome-checkbox margin-top-5"> 
								<label>
									<input class="sellerRatingCheckbox" name="grades" id="sellerRating_junior" type="checkbox" value="junior" ${fn:contains(grade,'junior')? "checked":""}>
									<span class="awesome-checkbox-body"></span>
					 				<div class="awesome-checkbox-text category-awesome-width font-color-light">junior</div>
					 			</label>
					</div>
				</div>	
			</div>
				  
			
			<div class="row"> 
				<div class="col-xs-12 padding-left-0">	
					<div class="awesome-checkbox margin-top-5"> 
								<label>
									<input class="sellerRatingCheckbox" name="grades" id="sellerRating_senior" type="checkbox" value="senior" ${fn:contains(grade,'senior')? "checked":""}>
									<span class="awesome-checkbox-body"></span>
					 				<div class="awesome-checkbox-text category-awesome-width font-color-light">senior</div>
					 			</label>
					</div>
				</div>	
			</div>
				  
			
			<div class="row"> 
				<div class="col-xs-12 padding-left-0">	
					<div class="awesome-checkbox margin-top-5"> 
								<label>
									<input class="sellerRatingCheckbox" name="grades" id="sellerRating_semipro" type="checkbox" value="semipro" ${fn:contains(grade,'semipro')? "checked":""}>
									<span class="awesome-checkbox-body"></span>
					 				<div class="awesome-checkbox-text category-awesome-width font-color-light">semipro</div>
					 			</label>
					</div>
				</div>	
			</div>
				  
			
			<div class="row"> 
				<div class="col-xs-12 padding-left-0">	
					<div class="awesome-checkbox margin-top-5"> 
								<label>
									<input class="sellerRatingCheckbox" name="grades" id="sellerRating_pro" type="checkbox" value="pro" ${fn:contains(grade,'pro')? "checked":""}>
									<span class="awesome-checkbox-body"></span>
					 				<div class="awesome-checkbox-text category-awesome-width font-color-light">pro</div>
					 			</label>
					</div>
				</div>	
			</div>
				  
			
			<div class="row"> 
				<div class="col-xs-12 padding-left-0">	
					<div class="awesome-checkbox margin-top-5"> 
								<label>
									<input class="sellerRatingCheckbox" name="grades" id="sellerRating_master" type="checkbox" value="master"${fn:contains(grade,'master')? "checked":""}>
									<span class="awesome-checkbox-body"></span>
					 				<div class="awesome-checkbox-text category-awesome-width font-color-light">master</div>
					 			</label>
					</div>
				</div>	
			</div>
			
						</div>
		</div>
		
