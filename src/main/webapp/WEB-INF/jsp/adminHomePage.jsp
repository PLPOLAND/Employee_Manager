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
			var retVal = confirm("Czy chcesz usunac tego uzytkownika?");
			if (retVal == true) {
				window.location.href = '/delete?id=' + userID;
			} else {
				window.location.href = '/ahome';
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
						<li><img src="/logoinwebapp/logo2.png" width="30" height="30" class="d-inline-block mr-1 align-bottom"
								alt="">
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
				<div class="dane">${userName} </div>
			</a>
		</div>
		<div class="page">
			<table>
				<tr>
					<td>Imie</td>
					<td>Nazwisko</td>
					<td>Email</td>
					<td>Nr Konta Bankowego</td>
					<td>Wypłata NETTO</td>
					<td>Wypłata BRUTTO</td>
					<td>Stanowisko</td>
					<td>Typ Umowy</td>
					<td>Edytuj</td>
					<td>Usuń</td>
				</tr>
				<c:forEach var="userval" items="${userList}">
					<tr>
						<td>${userval.getName()}</td>
						<td>${userval.getSurname()}</td>
						<td>${userval.getEmail()}</td>
						<td>${userval.getAccount_number()}</td>
						<td>${userval.getNet_salary()} zł</td>
						<td>${userval.getGross_salary()} zł</td>
						<td>${userval.getPosition()}</td>
						<td>${userval.getContract_type()}</td>
						<td><input type="button" class="" value="Edytuj" onclick="location.href='/edit?id=${userval.getId()}'" />
						</td>
						<td>
							<input type="button" class="" value="Usuń"
								onclick="confirmation(<c:out value='${userval.getId()}' />);" />
						</td>
					</tr>
				</c:forEach>
			</table>
			<!-- <div class="user-line">
					<div class="user-pole">Imie</div>
					<div class="user-pole">Nazwisko</div>
					<div class="user-pole">email</div>
					<div class="user-pole">nr konta bankowego</div>
					<div class="user-pole">wyplata NETTO</div>
					<div class="user-pole">wyplata BRUTTO</div>
					<div class="user-pole">stanowisko</div>
					<div class="user-pole">typ umowy</div>
					<div class="user-pole"></div>
				</div> -->

			<!-- <c:forEach var="userval" items="${userList}">
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
				</c:forEach> -->






			<!-- <div class="users-table"></div>
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
			</div>-->
		</div>
	</div>

</body>

</html>