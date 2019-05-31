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
                    <a href="#">
                        <li>Dane użytkowników</li>
                    </a>
                    <a href="#">
                        <li>Dodaj użytkownika</li>
                    </a>
                </ol>
            </div>
            <div class="dane">${userName}</div>
        </div>
        <div class="page">
            <!-- <table>
                <tr>
                    <td>Login</td>
                    <td>Hasło</td>
                    <td>Imie</td>
                    <td>Nazwisko</td>
                    <td>Email</td>
                    <td>Nr Konta Bankowego</td>
                    <td>Wypłata NETTO</td>
                    <td>Stanowisko</td>
                    <td>Typ Umowy</td>
                    <td>Typ Użytkownika</td>
                </tr>
                <tr>
                    <form action="/addU" method="post">


                        

                        <td class="pole_przycisku"><input type="text" placeholder="Login" name="login" maxlength="30"></td>
                        <td class="pole_przycisku"><input type="password" placeholder="Hasło" name = "pass" maxlength="30"></td>
                        <td class="pole_przycisku"><input type="text" placeholder="Imie" name = "imie" maxlength="45"></td>
                        <td class="pole_przycisku"><input type="text" placeholder="Nazwisko" name="nazwisko" maxlength="45"></td>
                        <td class="pole_przycisku"><input type="email" placeholder="Email" name="Email" maxlength="45"></td>
                        <td class="pole_przycisku"><input type="number" placeholder="Nr Konta Bankowego" name="nr_banku" ></td>
                        <td class="pole_przycisku"><input type="number" placeholder="Wypłata NETTO" name="netto"></td>
                        <td class="pole_przycisku"><input type="text" placeholder="Stanowisko" name="stanowisko" maxlength="50"></td>
                        <td class="pole_przycisku">
                        <select name="typ_umowy">
                                <option>B2B</option>
                                <option>UZ</option>
                            </select>
                        </td>
                        <td class="pole_przycisku">
                        <select name="typ_konta">
                                <option  >Administrator</option>
                                <option>Użytkownik</option>
                            </select>
                        </td>
                    </form>
                </tr>
            </table> -->
            <table>
                <form method="POST" action="/addU">
                    <tr>
                        <td>Dane</td>
                        <td>Edycja</td>
                    </tr>
                    <tr>
                        <td>Login</td>
                        <td class="pole_przycisku"><input type="text" name="login" maxlength="30" ></td>
                    </tr>
                    <tr>
                        <td> Hasło: </td>
                        <td class="pole_przycisku"><input type="password" name="password" maxlength="30"></td>
                    </tr>
                    <tr>
                        <td> Imie:</td>
                        <td  class="pole_przycisku"><input type="text" name="name" maxlength="45"></td>
                    </tr>
                    <tr>
                        <td> Nazwisko:</td>
                        <td  class="pole_przycisku"><input type="text" name="surname" maxlength="45"></td>
                    </tr>
                    <tr>
                        <td> E-mail:</td>
                        <td  class="pole_przycisku"><input type="email" name="mail" maxlength="45"></td>
                    </tr>
                    <tr>
                        <td> Nr konta:</td>
                        <td  class="pole_przycisku"><input type="number" name="account" max="99999999999"></td>
                    </tr>
                    <tr>
                        <td> Wypłata NETTO:</td>
                        <td class="pole_przycisku"><input type="number" name="account" max="99999999999"></td>
                    </tr>
                    <tr>
                        <td>Stanowisko: </td>
                        <td class="pole_przycisku"><input type="text" name="password"></td>
                    </tr>
                    <tr>
                        <td>Typ Umowy</td>
                        <td class="pole_przycisku">
                            <select name="typ_umowy">
                                <option>B2B</option>
                                <option>UZ</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Typ Konta</td>
                        <td class="pole_przycisku">
                            <select name="typ_konta">
                                <option>Administrator</option>
                                <option>Użytkownik</option>
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td>Dodaj użytkownika:</td>
                        <td class="pole_przycisku"><input type="submit" name="send" value="Wyślij"></td>
                    </tr>
                </form>
            </table>
        </div>
    </div>

</body>

</html>