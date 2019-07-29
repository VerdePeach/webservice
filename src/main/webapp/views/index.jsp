<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <title>Car service</title>

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
        <a class="button" href="/web_service_war_exploded/departments">Tell Me More</a>
    </div>
</header>
</body>
</html>

<style>
    body {
        font-family: Arial, sans-serif;
        padding: 0;
        margin: 0;
        color: #222222;
    }

    .clearfix:after {
        content:'';
        display: table;
        width: 100%;
        clear: both;
    }

    div {
        box-sizing: border-box;
    }

    header {
        background: saddlebrown;/*url(../img/first-bg.jpg) no-repeat center top / cover;*/
        height: 100vh;
    }

    .container {
        width: 930px;
        margin: 0 auto;
    }

    nav {
        float: right;
        margin-top: 45px;
    }

    .menu {
        padding: 0;
        margin: 0;
        display: block;
    }

    .menu li {
        float: left;
        display: block;
        margin-right: 41px;
    }

    .menu a {
        color: #fff;
        text-decoration: none;
        text-transform: uppercase;
        font-size: 14px;
    }

    .titles__first {
        font-size: 40px;
        color: #fff;
        text-transform: uppercase;
        text-align: center;
        margin-top: 180px;
    }

    h1 {
        font-size: 75px;
        color: #fff;
        text-transform: uppercase;
        text-align: center;
        margin: 15px;
    }

    .button {
        background: #fed136;
        color: #484543;
        border-radius: 3px;
        display: block;
        width: 240px;
        padding: 20px 0;
        margin: 0 auto;
        text-decoration: none;
        text-align: center;
        text-transform: uppercase;
        font-weight: bold;
        font-size: 18px;
        margin-top: 50px;
    }
</style>