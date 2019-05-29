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
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<c:url value="/css/main.css" var="jstlCss" />
<link href="${jstlCss}" rel="stylesheet" />
<c:url value="/css/mystyle.css" var="jstlCss2" />
<link href="${jstlCss2}" rel="stylesheet" />
</head>

<body>
	<c:forEach var="userval" items="${user}">

		<header>
			<nav class="navbar navbar-dark navbar-expand-md" style='background-color: #61A4D7;'>
				<a class="navbar-brand" href="/uhome"><img src="/logoinwebapp/logo2.png" width="30" height="30"
				class="d-inline-block mr-1 align-bottom" alt="">
				<font face = "WildWest" size = "5"><b>MAMR</b> Employee Manager</font></a>
	
				<div>
					<ul class="navbar-nav" >
						<li><a class="nav-link" href="/uhome"> Strona główna </a></li>
						<li><a class="nav-link" href="/myaccount"> Moje konto </a></li>
						<li><a class="nav-link" href="paymenthistory"> Historia wypłat </a></li>
						<li><a class="nav-link" href="/contact"> Kontakt </a></li>
					</ul>
					<!--   <div class="dane">${userval.getName()} ${userval.getSurname()}</div>  --> 
				</div>
			</nav>
		</header>
			
		<div class="myaccount-container">
			<h3>Moje konto</h3>

			<table>
				<tr>
					<td>Imię:</td>
					<td>${userval.getName()}</td>
				</tr>
				<tr>
					<td>Nazwisko:</td>
					<td>${userval.getSurname()}</td>
				</tr>
				<tr>
					<td>Email:</td>
					<td>${userval.getEmail()}</td>
				</tr>
				<tr>
					<td>Numer konta:</td>
					<td>${userval.getAccount_number()}</td>
				</tr>
				<tr>
					<td>Stanowisko:</td>
					<td>${userval.getPosition()}</td>
				</tr>
				<tr>
					<td>Typ umowy:</td>
					<td>${userval.getContract_type()}</td>
				</tr>
			</table>
		</div>
	</c:forEach>
</body>

</html>