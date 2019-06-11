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
				<div class="dane">${userName}</div>
			</a>
		</div>
		<div class="page">

		</div>
	</div>

</body>

</html>