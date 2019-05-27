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
    <c:url value="/css/mystyle.css" var="jstlCss2" />
    <link href="${jstlCss2}" rel="stylesheet" />
</head>

<body>
	
    <div class="container">
		<div class="banner">
			
			<div class="dane">Imie</div>
		</div>
		
		<div class="container login-container">
        <div class="login-form mydiv">
            <h3>Moje wyplaty</h3>
            
			<br/>
			NIC JESZCZE NIE ZAROBILES, LENIU
			
            
        </div>
    </div>
		
		
		
	</div> 
	
	
    
</body>

</html>