<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>2018. 3. 5. - 오후 3:37:46</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
*, pre {
	word-break: break-all;
}

article, aside, details, figcaption, figure, footer, header, hgroup,
	main, menu, nav, section, summary {
	display: block;
}

body, figure {
	margin: 0;
}

html {
	font-family: sans-serif;
	-ms-text-size-adjust: 100%;
	-webkit-text-size-adjust: 100%;
}

a {
	background-color: transparent;
}

img {
	vertical-align: middle;
}

*, ::after, ::before {
	box-sizing: border-box;
}

body {
	letter-spacing: -0.3px;
	font-size: 13px;
	font-family: "NotoSansKR Regular" !important;
	font-weight: 400;
	background-color: #FAFAFA;
}

html {
	font-size: 10px;
	-webkit-tap-highlight-color: transparent;
}

ol, ul {
	margin-bottom: 10px;
}

a {
	color: #f26656;
	text-decoration: none;
}

::selection {
	background: #FAE57C;
	color: #4d4d4d;
}

.navbar {
	position: relative;
	min-height: 50px;
	margin-bottom: 20px;
	border: 1px solid transparent;
}
/* @media all and (min-width:768px) */
.navbar {
	border-radius: 5px;
}

.header-main, .navbar-fixed-bottom, .navbar-fixed-top {
	position: fixed;
	right: 0px;
	left: 0px;
	z-index: 1030;
}

.header-main, .navbar-fixed-top {
	top: 0px;
	border-width: 0 0 1px;
}
/* @media all and (min-width:768px) */
.header-main, .navbar-fixed-bottom, .navbar-fixed-top {
	border-radius: 0;
}

.header-main, .navbar-fixed-top {
	z-index: 999 !important;
}

.navbar-collapse::after, .navbar-collapse::before, .navbar-header::after,
	.navbar-header::before, .navbar::after, .navbar::before {
	content: " ";
	display: table;
}

.navbar::after {
	clear: both;
}

body {
	line-height: 1.5438;
	color: #4d4d4d;
}

body {
	background: #fafafa !important;
	font-size: 14px;
}

.header-yellow {
	height: 59px;
}

.header-yellow {
	width: 100%;
	height: 59px;
	background-color: #ffd400;
}
/* @media all and (min-width:768px) */
.container {
	width: 750px;
}

.container, .container-fluid {
	margin-right: auto;
	margin-left: auto;
}

.container, .container-fluid {
	padding-left: 15px;
	padding-right: 15px;
}
/* @media all and (min-width:992px) */
.container {
	width: 970px;
}
/* @media all and (min-width:1200px) */
.container {
	width: 1170px;
}

.container {
	width: 1024px !important;
}

.row {
	margin-left: -15px;
	margin-right: -15px;
}

.container-fluid::after, .container-fluid::before, .container::after,
	.container::before, .row::after, .row::before {
	content: " ";
	display: table;
}

.container::after {
	clear: both;
}

.row::after {
	clear: both;
}

.col-lg-1, .col-lg-10, .col-lg-11, .col-lg-12, .col-lg-2, .col-lg-3,
	.col-lg-4, .col-lg-5, .col-lg-6, .col-lg-7, .col-lg-8, .col-lg-9,
	.col-md-1, .col-md-10, .col-md-11, .col-md-12, .col-md-2, .col-md-3,
	.col-md-4, .col-md-5, .col-md-6, .col-md-7, .col-md-8, .col-md-9,
	.col-sm-1, .col-sm-10, .col-sm-11, .col-sm-12, .col-sm-2, .col-sm-3,
	.col-sm-4, .col-sm-5, .col-sm-6, .col-sm-7, .col-sm-8, .col-sm-9,
	.col-xs-1, .col-xs-10, .col-xs-11, .col-xs-12, .col-xs-2, .col-xs-3,
	.col-xs-4, .col-xs-5, .col-xs-6, .col-xs-7, .col-xs-8, .col-xs-9,
	.kmong-grid-3-10, .kmong-grid-3-20, .kmong-grid-4-10, .kmong-grid-4-20,
	.kmong-grid-4-40, .kmong-grid-4-5, .kmong-grid-5-20 {
	position: relative;
	min-height: 1px;
	padding-left: 15px;
	padding-right: 15px;
}

.col-xs-1, .col-xs-10, .col-xs-11, .col-xs-12, .col-xs-2, .col-xs-3,
	.col-xs-4, .col-xs-5, .col-xs-6, .col-xs-7, .col-xs-8, .col-xs-9,
	.kmong-grid-3-10, .kmong-grid-3-20, .kmong-grid-4-10, .kmong-grid-4-20,
	.kmong-grid-4-40, .kmong-grid-4-5, .kmong-grid-5-20 {
	float: left;
}

.col-xs-6 {
	width: 50%;
}

dl, ol, ul {
	margin-top: 0px;
}

.list-inline, .list-unstyled {
	padding-left: 0px;
	list-style: none;
}

.list-inline {
	margin-left: -5px;
}

.my-profile-menu-list>li:not (:first-child ), .padding-top-15 {
	padding-top: 15px !important;
}

.padding-top-15 {
	padding-top: 15px;
}

.list-inline>li {
	display: inline-block;
	padding-left: 5px;
	padding-right: 5px;
}

hr, img {
	border: 0;
}

.width-100px {
	width: 100px !important;
}
</style>
</head>
<body>
	<nav class="navbar navbar-fixed-top">
		<div class="header-yellow">
			<div class="container">
				<div class="row">
					<div class="col-xs-6">
						<ul class="list-inline padding-top-15">
							<li>
								<div>

									<a href="http://localhost:8080/kmongPro/main.do"> <img title="당신의 '일'을 해결해줄 전문가들이 있는 곳, 서비스 마켓플레이스 크몽 ( Kmong )" class="width-100px" src="css/image/kmong_logo.png">
									</a>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</nav>
</body>
</html>
