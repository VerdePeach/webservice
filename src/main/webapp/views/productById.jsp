<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>${product.productName} product</title>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <link href="<spring:url value="/resources/css/product/productById.css" />" rel="stylesheet" type="text/css" />
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
        <h1>${product.productName} product </h1>
    </div>
    <div>
        <table class="table_dark">
            <tr>
                <th>ID</th>
                <td><c:out value="${product.productId}" /></td>
            </tr>
            <tr>
                <th>Name</th>
                <td><c:out value="${product.productName}" /></td>
            </tr>
            <tr>
                <th>Department ID</th>
                <td><c:out value="${product.departmentId}" /></td>
            </tr>
        </table>
    </div>
    <button class="myButton" onclick="depInfo()">Get info about department with ID ${product.departmentId}</button>
</section>
</body>
</html>

<script type="text/javascript">
    function depInfo() {
        window.location.href ="/web_service_war_exploded/getDepartmentById?id=" + ${product.departmentId};
    }
</script>
