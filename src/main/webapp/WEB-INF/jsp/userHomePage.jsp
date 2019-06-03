<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	response.setCharacterEncoding("UTF-8");
	request.setCharacterEncoding("UTF-8");
%>
<html lang="pl">

<head>
<!-- <link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script> -->
<!-- <script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<c:url value="/css/user.css" var="jstlCss" />
<link href="${jstlCss}" rel="stylesheet" />



</head>

<body>

<div class="container">
	
		<div class="banner">
			<div class="menu">
				<ol>
					<a href="/uhome"><li><img src="/logoinwebapp/logo2.png" width="30" height="30" alt="">
					<font face = "WildWest" size = "5"><b>MAMR</b> Employee Manager</font></li></a>
	
					<a href="/myaccount"><li>Moje konto</li></a>
					<a href="/Uedit"><li>Edytuj profil</li></a>
					<a href="/paymenthistory"><li>Historia wypłat</li></a>
					<a href="/contact"><li>Kontakt</li></a>
					
				</ol>
			</div>
			<div class="dane">${userName}</div>
		</div>
		
		<div class="page">
			
			
		</div>
	</div>

</body>

</html>




