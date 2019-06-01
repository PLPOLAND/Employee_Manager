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
	<c:url value="/css/editUser.css" var="jstlCss" />
	<link href="${jstlCss}" rel="stylesheet" />

	<script type="text/javascript">
		function confirmation(userID) {
			var retVal = confirm("Czy chcesz edytowac tego uzytkownika?");
			if (retVal == true) {
				return true;
			} else {
				return false;
			}
		}
	</script>
</head>



<body>

	<div class="container">
		<div class="banner">
			<div class="menu">
				<ol>
					<a href="/ahome">
						<li>Dane użytkowników</li>
					</a>
					<a href="/adduser">
						<li>Dodaj użytkownika</li>
					</a>
				</ol>
			</div>
			<div class="dane">${userName}</div>
		</div>

		<c:forEach var="userval" items="${user}">
			<form action="editUser" method="POST">
				<div class="page">
					<table>
						<tr>
							<td>Dane</td>
							<td>Edycja</td>
						</tr>
						<tr>
							<td><b> Imie:</b></td>
							<td class="pole_przycisku"><input type="hidden" name="id"
								value="${userval.getId() }"><input type="text" name="name" maxlength="30" value="${userval.getName()}"></td>
							
						</tr>
						<tr>
							<td><b> Nazwisko:</b></td>
							<td class="pole_przycisku"><input type="text" name="surname" maxlength="30" value="${userval.getSurname()}"></td>
						</tr>
						<tr>
							<td><b> E-mail:</b></td>
							<td class="pole_przycisku"><input type="text" name="email" maxlength="30" value="${userval.getEmail()}"></td>
						</tr>
						<tr>
							<td><b> Nr konta:</b></td>
							<td class="pole_przycisku"><input type="text" name="account" maxlength="30" value="${userval.getAccount_number()}"></td>
						</tr>
						<tr>
							<td><b> Stare hasło: </b></td>
							<td class="pole_przycisku"><input type="text" name="oldpassword" maxlength="30" ></td>
						</tr>
						<tr>
							<td><b> Nowe hasło: </b></td>
							<td class="pole_przycisku"><input type="text" name="newpassword" maxlength="30" ></td>
						</tr>
						<tr>
							<td>Wyślij zmiany:</td>
							<td class="pole_przycisku"><input class="przcisk_submit" type="submit" name="send" value="Wyślij"></td>
						</tr>
					</table>
				</div>
			</form>
		</c:forEach>
	</div>
</body>
</html>