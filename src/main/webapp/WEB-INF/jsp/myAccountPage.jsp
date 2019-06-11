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
	<c:url value="/css/user.css" var="jstlCss" />
	<link href="${jstlCss}" rel="stylesheet" />
</head>

<body>
	<div class="container">

		<div class="banner">
			<div class="menu">
				<ol>
					<a href="/uhome">
						<li><img src="/logoinwebapp/logo2.png" width="30" height="30" alt="">
							<font face="WildWest" size="5"><b>MAMR</b> Employee Manager</font>
						</li>
					</a>

					<a href="/myaccount">
						<li>Moje konto</li>
					</a>
					<a href="/Uedit">
						<li>Edytuj profil</li>
					</a>
					<a href="/paymenthistory">
						<li>Historia wypłat</li>
					</a>
					<a href="/contact">
						<li>Kontakt</li>
					</a>

				</ol>
			</div>
			<a href="/logout" title="Wyloguj" style="color:white;text-decoration:underline;">
				<div class="dane">${userName}</div>
			</a>
		</div>

		<div class="myaccount-container">


			<c:forEach var="userval" items="${user}">

				<h2>
					<font color="white">Moje konto</font>
				</h2>

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

			</c:forEach>



		</div>
	</div>

</body>

</html>