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
					<a href="/ahome"><li><img src="/logoinwebapp/logo2.png" width="30" height="30"
					class="d-inline-block mr-1 align-bottom" alt="">
					<font face = "WildWest" size = "5"><b>MAMR</b> Employee Manager</font></li></a>
	
					<a href="/ahome"><li>Dane użytkowników</li></a>
					<a href="/adduser"><li>Dodaj użytkownika</li></a>
					<a href="/APayment"><li>Historia płac</li></a>
                    <a href="/AddPay"><li>Dodaj płacę</li></a>
				</ol>
			</div>
			<div class="dane"><a href="/logout" title="Wyloguj" style="color:white;text-decoration:underline;">${userName}</a></div>
		</div>
        <div class="page">
            <table>
                <form method="POST" action="/addU" autocomplete="off">
                    <tr>
                        <td>Dane</td>
                        <td>Edycja</td>
                    </tr>
                    <tr>
                        <td>Login</td>
                        <td class="pole_przycisku"><input type="text" name="login" required="required" maxlength="30" ></td>
                    </tr>
                    <tr>
                        <td> Hasło: </td>
                        <td class="pole_przycisku"><input type="password" name="password" autocomplete="new-password" required="required" maxlength="30"></td>
                    </tr>
                    <tr>
                        <td> Imie:</td>
                        <td  class="pole_przycisku"><input type="text" name="name" required="required" pattern="[\\p{IsAlphabetic}\\s]+" maxlength="45"></td>
                    </tr>
                    <tr>
                        <td> Nazwisko:</td>
                        <td  class="pole_przycisku"><input type="text" name="surname" required="required" pattern="[\\p{IsAlphabetic}\\s]+" maxlength="45"></td>
                    </tr>
                    <tr>
                        <td> E-mail:</td>
                        <td  class="pole_przycisku"><input type="email" name="mail" required="required" maxlength="45"></td>
                    </tr>
                    <tr>
                        <td> Nr konta:</td>
                        <td  class="pole_przycisku"><input type="text" name="account" required="required" pattern="^[0-9]+$" maxlength="26"></td>
                    </tr>
                    <tr>
                        <td> Wypłata NETTO:</td>
                        <td class="pole_przycisku" lang="en-US"><input type="number" name="net_salary" min="1" step="0.5" required="required"></td>
                    </tr>
                    <tr>
                        <td>Stanowisko: </td>
                        <td class="pole_przycisku"><input type="text" name="position" pattern="^[A-Za-z\s]+$" required="required"></td>
                    </tr>
                    <tr>
                        <td>Typ Umowy</td>
                        <td class="pole_przycisku">
                            <select name="contract_type" required="required">
                            <c:forEach var="contractTypes" items="${contractTypes}">
                            <option value="${contractTypes.getId() }">${contractTypes.getShort_name()}</option>
                               </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Typ Konta</td>
                        <td class="pole_przycisku">
                            <select name="account_type" required="required">
                            <c:forEach var="accountTypes" items="${accountTypes}">
                            <option value="${accountTypes.getId()}">${accountTypes.getName()}</option>
                               </c:forEach>
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td>Dodaj użytkownika:</td>
                        <td class="pole_przycisku"><input class="przcisk_submit" type="submit" name="send" value="Wyślij"></td>
                    </tr>
                </form>
            </table>
        </div>
    </div>

</body>

</html>