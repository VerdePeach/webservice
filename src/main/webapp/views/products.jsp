<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="services.servicesImp.DepartmentServiceImpl" %>
<%@ page import="services.DepartmentService" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Department" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<html>
<head>
    <title>Our departments</title>
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
    <section class="table_section">
        <h1>Products</h1>
        <div class="inner_table_section">
            <table id="table_dark" class="table_dark">
                <tbody>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Department ID</th>
                </tr>
                <c:forEach items="${productList}" var="product">
                    <tr>
                        <td><c:out value="${product.productId}" /></td>
                        <td><c:out value="${product.productName}" /></td>
                        <td><c:out value="${product.departmentId}" /></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="table_buttons">
            <button class="myButton" onclick="addProd()" >add</button>
            <button class="myButton" onclick="editProd()" >edit</button>
            <button class="myButton" onclick="deleteProd()" >delete</button>
            <button class="myButton" onclick="getById()" >get product by ID</button>
        </div>
    </section>
    <section class="input_section">
        <div id="add_Prod" hidden="hidden">
            <label>
                <p>Name</p>
                <input id="prod_name_add" type="text" placeholder="Name" />
                <p>Department ID</p>
                <select id="select_dep_add" size="">
                    <option disabled>Choose department</option>
                    <c:forEach items="${departmentList}" var="department">
                        <option value="<c:out value="${department.departmentId}"></c:out>"> ${department.departmentId} ${department.departmentName}</option>
                    </c:forEach>
                </select>
            </label>
            <br>
            <button class="myButtonAction" onclick="addEntProd()" >Add product</button>
        </div>
        <div id="edit_Prod" hidden="hidden">
            <label>
                <p>ID</p>
                <input id="prod_id_edit" type="text" placeholder="ID"/>
                <p>Name</p>
                <input id="prod_name_edit" type="text" placeholder="Name"/>
                <p>Department ID</p>
                <select id="select_dep_edit" size="">
                    <option disabled>Choose department</option>
                    <c:forEach items="${departmentList}" var="department">
                        <option value="<c:out value="${department.departmentId}"></c:out>"> ${department.departmentId} ${department.departmentName}</option>
                    </c:forEach>
                </select>
            </label>
            <br>
            <button class="myButtonAction" onclick="editEntProd()" >Edit product</button>
        </div>
        <div id="delete_Prod" hidden="hidden">
            <label>
                <p>ID</p>
                <input id="prod_id_delete" type="text" placeholder="ID"/>
            </label>
            <br>
            <button class="myButtonAction" onclick="deleteEntProd()" >Delete product</button>
        </div>
        <div id="get_by_id" hidden="hidden">
            <label>
                <p>ID</p>
                <input id="prod_id_get" type="text" placeholder="ID"/>
            </label>
            <br>
            <button class="myButtonAction" onclick="getEntByID()" >Get product by ID</button>
        </div>
    </section>
</header>
<b id="message"></b>


</body>

<script type="text/javascript" >

    function addProd() {
        $("#edit_Prod").hide(600);
        $("#delete_Prod").hide(600);
        $("#get_by_id").hide(600);
        $("#add_Prod").show(600);
    }

    function editProd() {
        $("#add_Prod").hide(600);
        $("#delete_Prod").hide(600);
        $("#get_by_id").hide(600);
        $("#edit_Prod").show(600);
    }

    function deleteProd() {
        $("#add_Prod").hide(600);
        $("#edit_Prod").hide(600);
        $("#get_by_id").hide(600);
        $("#delete_Prod").show(600);
    }

    function getById() {
        $("#add_Prod").hide(600);
        $("#edit_Prod").hide(600);
        $("#delete_Prod").hide(600);
        $("#get_by_id").show(600);
    }

    function addEntProd() {
        var product = {
            productName : $("#prod_name_add").val(),
            departmentId : $("#select_dep_add option:selected").val()
        };
        $.ajax({
            url: "/web_service_war_exploded/addProduct",
            type: 'POST',
            processData: false,
            data: JSON.stringify(product),
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (data) {
                updateTable(data);
            },
            error: function () {
                alert("Incorrect values!");
            }
        });
    }

    function editEntProd() {
        alert($("#prod_name_add").val());
        var product = {productId : $("#prod_id_edit").val(),
            productName : $("#prod_name_edit").val(),
            departmentId : $("#select_dep_edit option:selected").val()
        };
        $.ajax({
            url: "/web_service_war_exploded/editProduct",
            type: 'POST',
            processData: false,
            data: JSON.stringify(product),
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (data) {
                updateTable(data);
            },
            error: function (data) {
                alert("Incorrect values!");
            }
        });
    }

    function deleteEntProd() {
        var product = {productId : $("#prod_id_delete").val()
        };
        $.ajax({
            url: "/web_service_war_exploded/deleteProduct",
            type: 'POST',
            processData: false,
            data: JSON.stringify(product),
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (data) {
                updateTable(data);
            },
            error: function (data) {
                alert("Incorrect values!");
            }
        });
    }

    function getEntByID() {
        window.location.href ="/web_service_war_exploded/getProductById?id=" + $("#prod_id_get").val();
    }

    function updateTable(data) {
        var htmlTable = "<tbody><tr>" +
            "                <th>ID</th>" +
            "                <th>Name</th>" +
            "                <th>Department ID</th>" +
            "            </tr>";
        for(var dat in data) {
            htmlTable += "<tr><td>" + data[dat].productId + "</td><td>" + data[dat].productName + "</td><td>" + data[dat].departmentId + "</td></tr>";
        }
        htmlTable += "</tbody>";
        $("#table_dark").html(htmlTable);
    }
</script>
</html>


<style>

    .table_buttons {
        padding-left: 25%;
        padding-top: 10px;
    }

    .table_section {
        float: left;
        margin-left: 20%;
        padding: 20px;
    }

    .inner_table_section {
        overflow-y: scroll;
        overflow-x: hidden;
        height: 500px;
        background: #252F48;
    }

    .input_section {
        margin-top: 105px;
        float: right;
        padding-right: 150px;
        margin-bottom: 20px;
    }

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

    h1 {
        font-size: 75px;
        color: #fff;
        text-transform: uppercase;
        text-align: center;
        margin: 15px;
        padding-left: 0%;
    }

    p {
        font-size: 21px;
        color: #fff;
        padding-bottom: 0px;
        margin-bottom: 0px;
    }

    input {
        border-radius: 8px;
        outline: none;
        background-color: #f5f5e7;
        border: none;
        text-align: center;
        height: 30px;
        font-family: Arial, sans-serif;
        font-size: 16px;
    }

    .table_dark {
        font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
        font-size: 14px;
        width: 790px;
        text-align: left;
        border-collapse: collapse;
        background: #252F48;
        margin-left: 10%;
        border: 1px solid #37B5A5;
        margin: 2px;
    }
    .table_dark th {
        color: #EDB749;
        border: 1px solid #37B5A5;
        padding: 12px 17px;
    }
    .table_dark td {
        color: #CAD4D6;
        border: 1px solid #37B5A5;
        padding: 7px 17px;
    }
    .table_dark tr:last-child td {
        border-bottom: none;
    }
    .table_dark td:last-child {
        border-right: none;
    }
    .table_dark tr:hover td {
        text-decoration: underline;
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




    .myButtonAction {
        -moz-box-shadow: 0px 1px 0px 0px #fff6af;
        -webkit-box-shadow: 0px 1px 0px 0px #fff6af;
        box-shadow: 0px 1px 0px 0px #fff6af;
        background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ffec64), color-stop(1, #ffab23));
        background:-moz-linear-gradient(top, #ffec64 5%, #ffab23 100%);
        background:-webkit-linear-gradient(top, #ffec64 5%, #ffab23 100%);
        background:-o-linear-gradient(top, #ffec64 5%, #ffab23 100%);
        background:-ms-linear-gradient(top, #ffec64 5%, #ffab23 100%);
        background:linear-gradient(to bottom, #ffec64 5%, #ffab23 100%);
        filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffec64', endColorstr='#ffab23',GradientType=0);
        background-color:#ffec64;
        -moz-border-radius:6px;
        -webkit-border-radius:6px;
        border-radius:6px;
        border:1px solid #ffaa22;
        display:inline-block;
        cursor:pointer;
        color:#333333;
        font-family:Arial;
        font-size:15px;
        font-weight:bold;
        padding:6px 24px;
        text-decoration:none;
        text-shadow:0px 1px 0px #ffee66;

        outline: none;
        margin-top: 10px;
    }
    .myButtonAction:hover {
        background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ffab23), color-stop(1, #ffec64));
        background:-moz-linear-gradient(top, #ffab23 5%, #ffec64 100%);
        background:-webkit-linear-gradient(top, #ffab23 5%, #ffec64 100%);
        background:-o-linear-gradient(top, #ffab23 5%, #ffec64 100%);
        background:-ms-linear-gradient(top, #ffab23 5%, #ffec64 100%);
        background:linear-gradient(to bottom, #ffab23 5%, #ffec64 100%);
        filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffab23', endColorstr='#ffec64',GradientType=0);
        background-color:#ffab23;
    }
    .myButtonAction:active {
        position:relative;
        top:1px;
    }


</style>