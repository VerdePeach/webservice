<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>${model.modelName} model</title>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <link href="<spring:url value="/resources/css/model/modelById.css" />" rel="stylesheet" type="text/css" />
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
