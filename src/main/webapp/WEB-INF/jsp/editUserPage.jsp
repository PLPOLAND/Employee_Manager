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
							<td><input type="hidden" name="id"
								value="${userval.getId() }"> <input type="text"
								name="name" value="${userval.getName()}"></td>
						</tr>
						<tr>
							<td><b> Nazwisko:</b></td>
							<td><input type="text" name="surname"
								value="${userval.getSurname()}"></td>
						</tr>
						<tr>
							<td><b> E-mail:</b></td>
							<td><input type="text" name="email"
								value="${userval.getEmail()}"></td>
						</tr>
						<tr>
							<td><b> Nr konta:</b></td>
							<td><input type="text" name="account"
								value="${userval.getAccount_number()}"></td>
						</tr>
						<tr>
							<td><b> Stare hasło: </b></td>
							<td><input type="password" name="oldpassword"></td>
						</tr>
						<tr>
							<td><b> Nowe hasło: </b></td>
							<td><input type="password" name="newpassword"></td>
						</tr>
						<tr>
							<td>Wyślij zmiany:</td>
							<td><input type="submit" name="send" value="Wyślij"
								onclick="{return confirmation();}"></td>
						</tr>
					</table>
				</div>
			</form>
		</c:forEach>
	</div>
</body>
</html>