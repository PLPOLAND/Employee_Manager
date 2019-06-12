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
	<c:url value="/css/admin.css" var="jstlCss" />
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

		<c:forEach var="userval" items="${user}">
			<form action="editUser" method="POST">
				<div class="page">
					<table>
						<tr>
							<td>Dane</td>
							<td>Edycja</td>
						</tr>
						<!-- <tr>
							<td><b> Imie:</b></td>
							<td> <input type="text"
								name="name" value="${userval.getName()}"></td>
						</tr> -->
						<tr>
							<td>Login</td>
							<td class="pole_przycisku"><input type="hidden" name="id" value="${userval.getId() }">
								<input type="text" name="login" required="required" maxlength="30"
									value="${userval.getLogin()}"></td>
						</tr>
						<tr>
							<td> Hasło: </td>
							<td class="pole_przycisku"><input type="password" name="password"
									autocomplete="new-password" maxlength="30"></td>
						</tr>
						<tr>
							<td> Imie:</td>
							<td class="pole_przycisku"><input type="text" name="name" required="required" maxlength="45"
									pattern="^[A-Za-z-ęóąśżćńł]+$" value="${userval.getName()}"></td>
						</tr>
						<tr>
							<td> Nazwisko:</td>
							<td class="pole_przycisku"><input type="text" name="surname" required="required"
									maxlength="45" pattern="^[A-Za-z-ęóąśżćńł]+$" value="${userval.getSurname()}"></td>
						</tr>
						<tr>
							<td> E-mail:</td>
							<td class="pole_przycisku"><input type="email" name="mail" required="required"
									maxlength="45" value="${userval.getEmail()}"></td>
						</tr>
						<tr>
							<td> Nr konta:</td>
							<td class="pole_przycisku"><input type="text" name="account" required="required"
									pattern="^[0-9]+$" maxlength="26" value="${userval.getAccount_number()}">
							</td>
						</tr>
						<tr>
							<td> Wypłata NETTO:</td>
							<td class="pole_przycisku"><input type="number" name="net_salary" required="required"
									min="1" step="0.01"value="${userval.getNet_salary()}"></td>
						</tr>
						<tr>
							<td>Stanowisko: </td>
							<td class="pole_przycisku"><input type="text" name="position" required="required"
									pattern="^[A-Za-z-ęóąśżćńł\s]+$" value="${userval.getPosition()}"></td>
						</tr>
						<tr>
							<td>Typ Umowy</td>
							<td class="pole_przycisku">
								<select name="contract_type" required="required">
									 <c:forEach var="contractTypes" items="${contractTypes}">
                                    <option ${userval.getContract_type() == contractTypes.getShort_name()  ? 'selected="selected"' : '' } value="${contractTypes.getId() }">${contractTypes.getShort_name()}</option>
                                </c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td>Typ Konta</td>
							<td class="pole_przycisku">
								<select name="account_type" required="required">
									 <c:forEach var="accountTypes" items="${accountTypes}">
                                    <option ${userval.getAccount_type() == accountTypes.getName()  ? 'selected="selected"' : '' } value="${accountTypes.getId()}">${accountTypes.getName()}</option>
                                </c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td>Zapisz zmiany:</td>
							<td><input type="submit" name="send" value="Zapisz" onclick="{return confirmation();}"></td>
						</tr>
					</table>
				</div>
			</form>
		</c:forEach>
	</div>
</body>

</html>