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
	<c:url value="/css/admin.css" var="jstlCss" />
	<link href="${jstlCss}" rel="stylesheet" />

</head>

<body>

	<div class="container">
		<div class="banner">
			<div class="menu">
				<ol>
					<a href="/ahome">
						<li><img src="/logoinwebapp/logo2.png" width="30" height="30"
								class="d-inline-block mr-1 align-bottom" alt="">
							<font face="WildWest" size="5"><b>MAMR</b> Employee Manager</font>
						</li>
					</a>

					<a href="/ahome">
						<li>Dane użytkowników</li>
					</a>
					<a href="/adduser">
						<li>Dodaj użytkownika</li>
					</a>
					<a href="/APayment">
						<li>Historia płac</li>
					</a>
					<a href="/AddPay">
						<li>Dodaj płacę</li>
					</a>
				</ol>
			</div>
			<a href="/logout" title="Wyloguj">
				<div class="dane">${userName}</div>
			</a>
		</div>
		<div class="page">
			<table>
				<tr>
					<td>Lp.</td>
					<td>Imię</td>
					<td>Nazwisko</td>
					<td>Nr Konta Bankowego</td>
					<td>Data</td>
					<td>Stanowisko</td>
					<td>Typ Umowy</td>
					<td>Wypłata NETTO</td>
					<td>Wypłata BRUTTO</td>
				</tr>
				<c:set var="count" value="1" scope="page" />
				<c:forEach var="salary" items="${userSalary}">
					<tr>
						<td>${count}</td>
						<td>${salary.getUserData().getName()}</td>
						<td>${salary.getUserData().getSurname()}</td>
						<td>${salary.getUserData().getAccount_number()}</td>
						<td><b>${salary.getPayday()}</b></td>
						<td>${salary.getUserData().getPosition() }</td>
						<td>${salary.getUserData().getContract_type()}</td>
						<td>${salary.getNet_salary()}zł</td>
						<td>${salary.getGross_salary()}zł</td>
						<c:set var="count" value="${count + 1}" scope="page" />
					</tr>
				</c:forEach>
				<tr>


					<td colspan="8">Suma kosztów: </td>
					<td>${totalPayment}zł</td>
				</tr>
			</table>


		</div>
	</div>

</body>

</html>