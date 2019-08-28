<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>${department.departmentName} department</title>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <link href="<spring:url value="/resources/css/department/departmentById.css" />" rel="stylesheet" type="text/css" />
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
            <h1>${department.departmentName} department </h1>
        </div>
        <div>
            <table class="table_dark">
                <tr>
                    <th>ID</th>
                    <td><c:out value="${department.departmentId}" /></td>
                </tr>
                <tr>
                    <th>Name</th>
                    <td><c:out value="${department.departmentName}" /></td>
                </tr>
            </table>
        </div>
    </section>
</body>
<script type="text/javascript">

</script>
</html>

