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
		
		
		<div class="myaccount-container">
				<h3>Moje wyplaty</h3>
				<br />
				<c:set var="count" value="1" scope="page" />
				<table width="100%">
					<tr>
						<th>ID</th>
						<th>Data wypłaty</th>
						<th>Kwota netto</th>
						<th>Kwota brutto</th>
					</tr>
					<c:forEach var="userval" items="${userSalary}">
						<tr>
							<td>${count}</td>
							<td>${userval.getPayday()}</td>
							<td>${userval.getNet_salary()}zł</td>
							<td>${userval.getGross_salary()}zł</td>
						</tr>
						<c:set var="count" value="${count + 1}" scope="page" />
					</c:forEach>
				</table>
			</div>
		
		
		</div>
	</div>

</body>

</html>



