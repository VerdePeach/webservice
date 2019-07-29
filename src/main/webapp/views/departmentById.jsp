<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>${department.departmentName} department</title>
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
</style>