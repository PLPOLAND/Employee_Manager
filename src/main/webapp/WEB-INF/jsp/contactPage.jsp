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
			<a href="/logout" title="Wyloguj">
				<div class="dane">${userName}</div>
			</a>
		</div>

		<div class="page">
			


			<h2>
				<font color="white">Kontakt</font>
			</h2>
			
			<div class="contactpage-container">
				
				<p>MAMR Employee Manager sp. z.o.o<br>
				ul. Wałbrzyska 23, 01-820 Warszawa<br>
				NIP: 113-19-74-684<br>
				REGON: 015554383<br>
				NR KONTA: 88 4500 2017 0000 1302 0684 1300</p>
				<p><u>Aleksander Nowak</u><br>
				Tel: 663 545 600<br>
				Email: aleksandernowak_mamr@biuro.mamr.pl</p>
				<p><h3>mamr.pl</h3></p>
			
			</div>
			
			
			
		</div>


	</div>


</body>

</html>