<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8");
%>
<html lang="pl">

<head>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <c:url value="/css/main.css" var="jstlCss" />
    <link href="${jstlCss}" rel="stylesheet" />
</head>

<body>

    <div class="container login-container">
        <div class="login-form">
            <h3>Logowanie do systemu</h3>
            <form action="login" method="POST">
                <div class="login-field">
                    <input type="text" class="form-control" placeholder="Twój Login *" value="" name="login" />
                </div>
                <div class="login-field">
                    <input type="password" class="form-control" placeholder="Twoje Hasło *" value="" name="pass" />
                </div>
                <div class="login-field btn-field">
                    <input type="submit" class="btnSubmit" value="Zaloguj" />
                </div>
            </form>
        </div>
    </div>
</body>

</html>