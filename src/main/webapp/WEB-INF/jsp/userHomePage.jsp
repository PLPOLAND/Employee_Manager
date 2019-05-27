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
</head>

<body>

	<div class="container">
		<div class="banner">
			<div class="menu">
				<ol>
					<a href="/myaccount"><li>Moje konto</li></a>
					<a href="/paymenthistory"><li>Historia wyplat</li></a>
				</ol>
			</div>
			<div class="dane">Imie</div>
		</div>
		<div class="page">
			<div class="user-line">
				<div class="user-pole">Imie</div>
				<div class="user-pole">Nazwisko</div>
				<div class="user-pole">email</div>
				<div class="user-pole">nr konta bankowego</div>
				<div class="user-pole">wyplata NETTO</div>
				<div class="user-pole">wyplata BRUTTO</div>
				<div class="user-pole">stanowisko</div>
				<div class="user-pole">typ umowy</div>
				<div class="user-pole"></div>
			</div>

			<c:forEach var="userval" items="${userList}">
				<div class="user-line">
					<div class="user-pole"> ${userval.getName()}</div>
					<div class="user-pole"> ${userval.getSurname()}</div>
					<div class="user-pole"> ${userval.getEmail()}</div>
					<div class="user-pole"> ${userval.getAccount_number()}</div>
					<div class="user-pole"> ${userval.getNet_salary()}</div>
					<div class="user-pole"> ${userval.getGross_salary()}</div>
					<div class="user-pole"> ${userval.getPosition()}</div>
					<div class="user-pole"> ${userval.getContract_type()}</div>
					<div class="user-pole">
						<input type="submit" class="" value="Zmien" />
					</div>
				</div>
			</c:forEach>

		</div>
	</div>

</body>

</html>