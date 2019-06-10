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
					<a href="/uhome"><li><img src="/logoinwebapp/logo2.png"
							width="30" height="30" alt=""> <font face="WildWest"
							size="5"><b>MAMR</b> Employee Manager</font></li></a>

					<a href="/myaccount"><li>Moje konto</li></a>
					<a href="/Uedit"><li>Edytuj profil</li></a>
					<a href="/paymenthistory"><li>Historia wypłat</li></a>
					<a href="/contact"><li>Kontakt</li></a>

				</ol>
			</div>
			<div class="dane">
				<a href="/logout" title="Wyloguj"
					style="color: white; text-decoration: underline;">${userName}</a>
			</div>
		</div>

		<div class="page">
			<c:forEach var="userval" items="${user}">
				<form action="UeditUser" method="POST">

					<table>
						<tr>
							<td>Dane</td>
							<td>Edycja</td>
						</tr>
						<tr>
							<td><b> Imie:</b></td>
							<td class="pole_przycisku">
							<input type="hidden" name="id" value="${userval.getId() }">
							<input type="hidden" name="login" value="${userval.getLogin() }">
							<input type="text" name="name" required="required" pattern="^[A-Za-z]+$" maxlength="45"value="${userval.getName()}"></td>

						</tr>
						<tr>
							<td><b> Nazwisko:</b></td>
							<td class="pole_przycisku"><input type="text" name="surname"
								required="required"  maxlength="45" value="${userval.getSurname()}"></td>
						</tr>
						<tr>
							<td><b> E-mail:</b></td>
							<td class="pole_przycisku"><input type="text" name="mail"
								required="required" maxlength="45" value="${userval.getEmail()}"></td>
						</tr>
						<tr>
							<td><b> Nr konta:</b></td>
							<td class="pole_przycisku"><input type="text" name="account"
								required="required" pattern="^[0-9]+$" maxlength="26" value="${userval.getAccount_number()}"></td>
						</tr>
						<tr>
							<td><b> Nowe hasło: </b></td>
							<td class="pole_przycisku"><input type="password"
								name="password" maxlength="30"></td>
						</tr>
						<tr>
							<td>Wyślij zmiany:</td>
							<td class="pole_przycisku"><input class="przcisk_submit"
								type="submit" name="send" value="Wyślij"></td>
						</tr>
					</table>

				</form>
			</c:forEach>
		</div>
	</div>

</body>

</html>
