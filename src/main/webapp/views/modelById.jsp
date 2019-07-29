<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>${model.modelName} model</title>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<header>
    <section class="container">
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
    </section>
</header>
<section>
    <div>
        <h1>${model.modelName} model </h1>
    </div>
    <div>
        <table class="table_dark">
            <tr>
                <th>ID</th>
                <td><c:out value="${model.modelId}" /></td>
            </tr>
            <tr>
                <th>Name</th>
                <td><c:out value="${model.modelName}" /></td>
            </tr>
            <tr>
                <th>Product ID</th>
                <td><c:out value="${model.productId}" /></td>
            </tr>
            <tr>
                <th>Base model ID</th>
                <td><c:out value="${model.baseModelId}" /></td>
            </tr>
            <tr>
                <th>Price</th>
                <td><c:out value="${model.price}" /></td>
            </tr>
            <tr>
                <th>MAX speed</th>
                <td><c:out value="${model.maxSpeed}" /></td>
            </tr>
            <tr>
                <th>Fuel</th>
                <td><c:out value="${model.fuel}" /></td>
            </tr>
            <tr>
                <th>Engine</th>
                <td><c:out value="${model.engine}" /></td>
            </tr>
        </table>
    </div>
    <button class="myButton" onclick="prodInfo()">Get info about product with ID ${model.productId}</button>
    <button class="myButton" onclick="baseModelInfo()">Get info about base model</button>
</section>
</body>
</html>

<script type="text/javascript">
    function prodInfo() {
        window.location.href ="/web_service_war_exploded/getProductById?id=" + ${model.productId};
    }

    function baseModelInfo() {
        window.location.href ="/web_service_war_exploded/getModelById?id=" + ${model.baseModelId};
    }
</script>

<style>
    body {
        font-family: Arial, sans-serif;
        padding: 0;
        margin: 0;
        color: #222222;
        background: saddlebrown;
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

    h1 {
        font-size: 75px;
        color: #fff;
        text-transform: uppercase;
        text-align: center;
        margin: 15px;
        padding-top: 40px;
    }

    .table_dark {
        font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
        font-size: 14px;
        width: 640px;
        text-align: left;
        border-collapse: collapse;
        background: #39137c;
        margin-left: 29%;
        border: 1px solid #37B5A5;
        margin-top: 50px;
    }
    .table_dark th {
        color: #EDB749;
        padding: 12px 17px;
        border: 1px solid #37B5A5;
    }
    .table_dark td {
        color: #fffaef;
        padding: 7px 17px;
        border: 1px solid #37B5A5;
    }

    .myButton {
        -moz-box-shadow:inset 0px 1px 0px 0px #caefab;
        -webkit-box-shadow:inset 0px 1px 0px 0px #caefab;
        box-shadow:inset 0px 1px 0px 0px #caefab;
        background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #77d42a), color-stop(1, #5cb811));
        background:-moz-linear-gradient(top, #77d42a 5%, #5cb811 100%);
        background:-webkit-linear-gradient(top, #77d42a 5%, #5cb811 100%);
        background:-o-linear-gradient(top, #77d42a 5%, #5cb811 100%);
        background:-ms-linear-gradient(top, #77d42a 5%, #5cb811 100%);
        background:linear-gradient(to bottom, #77d42a 5%, #5cb811 100%);
        filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#77d42a', endColorstr='#5cb811',GradientType=0);
        background-color:#77d42a;
        -moz-border-radius:6px;
        -webkit-border-radius:6px;
        border-radius:6px;
        border:1px solid #268a16;
        display:inline-block;
        cursor:pointer;
        color:#f2f2f2;
        font-family:Arial;
        font-size:15px;
        font-weight:bold;
        padding:6px 24px;
        text-decoration:none;
        text-shadow:0px 1px 0px #aade7c;
        outline: none;
        margin-left: 40%;
        margin-top: 20px;
        margin-bottom: 15px;
    }

    .myButton:hover {
        background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #5cb811), color-stop(1, #77d42a));
        background:-moz-linear-gradient(top, #5cb811 5%, #77d42a 100%);
        background:-webkit-linear-gradient(top, #5cb811 5%, #77d42a 100%);
        background:-o-linear-gradient(top, #5cb811 5%, #77d42a 100%);
        background:-ms-linear-gradient(top, #5cb811 5%, #77d42a 100%);
        background:linear-gradient(to bottom, #5cb811 5%, #77d42a 100%);
        filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#5cb811', endColorstr='#77d42a',GradientType=0);
        background-color:#5cb811;
    }
    .myButton:active {
        position:relative;
        top:1px;
    }
</style>