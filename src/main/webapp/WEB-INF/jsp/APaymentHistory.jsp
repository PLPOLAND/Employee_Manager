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
                        <li>Dane użytkowników</li>
                    </a>
                    <a href="/adduser">
                        <li>Dodaj użytkownika</li>
                    </a>
                    <a href="/APayment"></a>
                </ol>
            </div>
            <div class="dane">${userName}</div>
        </div>
        <div class="page">
            <table>
                <tr>
                    <td>Nr Konta Bankowego</td>
                    <td>Data</td>
                    <td>Typ Umowy</td>
                    <td>Wypłata NETTO</td>
                </tr>
                <% Double suma = 0.0;%>
                <c:forEach var="salary" items="${userSalary}">
                    <tr>
                        <td>${salary.getUserData().getAccount_number()}</td>
                        <td>${salary.getPayday()}</td>
                        <td>${salary.getUserData().getContract_type()}</td>
                        <td>${salary.getNet_salary()} zł</td>
                        <% suma += Double.parseDouble(salary.getNet_salary()); %>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="3"> Suma:</td>
                    <td><% out.suma;%></td>
                </tr>
            </table>
            	
			
        </div>
    </div>

</body>

</html>