<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <title>Car service</title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <link href="<spring:url value="/resources/css/main.css" />" rel="stylesheet" type="text/css" />

</head>
<body>
<header>
    <div class="container">
        <div class="heading clearfix">
            <nav>
                <ul class="menu">
                    <li>
                        <a href="/web_service_war_exploded/homepage">Home</a>
                    </li>
                    <li>
                        <a href="/web_service_war_exploded/departments">Departments</a>
                    </li>
                    <li>
                        <a href="/web_service_war_exploded/products">Products</a>
                    </li>
                    <li>
                        <a href="/web_service_war_exploded/models">Models</a>
                    </li>
                    <li>
                        <a href="/web_service_war_exploded/contact">Contact</a>
                    </li>
                </ul>
            </nav>
        </div>
        <div class="titles">
            <div class="titles__first">
                Welcome To Our Service!
            </div>
            <h1>
                It`s nice to Meet you
            </h1>
        </div>
        <a class="button" href="/web_service_war_exploded/departments" >Tell Me More</a>
    </div>
</header>
</body>
</html>
