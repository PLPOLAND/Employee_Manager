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
				</div>
			</nav>
		</header>
	
		<div class="userslist-container">
			<table class="table table-bordered">
				<thead>
			    	<tr>
			      		<th scope="col">Imię</th>	
			     		<th scope="col">Nazwisko</th>
			     		<th scope="col">Email</th>
			      		<th scope="col">Nr konta bankowego</th>
			      		<th scope="col">Wypłata NETTO</th>
			     		<th scope="col">Wypłata BRUTTO</th>
			      		<th scope="col">Stanowisko</th>
			      		<th scope="col">Typ umowy</th>
			      		<th scope="col">Edycja</th>
			    	</tr>
			  	</thead>
		  		<tbody>
		  			<c:forEach var="userval" items="${userList}">
					    <tr>
					      <td> ${userval.getName()} </td>
					      <td> ${userval.getSurname()} </td>
					      <td> ${userval.getEmail()} </td>
					      <td> ${userval.getAccount_number()} </td>
					      <td> ${userval.getNet_salary()} </td>
					      <td> ${userval.getGross_salary()} </td>
					      <td> ${userval.getPosition()} </td>
					      <td> ${userval.getContract_type()} </td>
					      <td valign="button" align="right"><button type="button" class="btn btn-light">Zmień</button> </td>
					    </tr>
				    </c:forEach>
				</tbody>
			</table>
		</div>
</body>

</html>