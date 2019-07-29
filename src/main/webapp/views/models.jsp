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
        <h1>Models</h1>
        <div class="inner_table_section">
            <table id="table_dark" class="table_dark">
                <tbody>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Base model ID</th>
                    <th>Product ID</th>
                    <th>Price</th>
                    <th>MAX speed</th>
                    <th>Fuel</th>
                    <th>Engine</th>
                </tr>
                <c:forEach items="${modelList}" var="model">
                    <tr>
                        <td><c:out value="${model.modelId}" /></td>
                        <td><c:out value="${model.modelName}" /></td>
                        <td><c:out value="${model.baseModelId}" /></td>
                        <td><c:out value="${model.productId}" /></td>
                        <td><c:out value="${model.price}" /></td>
                        <td><c:out value="${model.maxSpeed}" /></td>
                        <td><c:out value="${model.fuel}" /></td>
                        <td><c:out value="${model.engine}" /></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="table_buttons">
            <button class="myButton" onclick="addModel()" >add</button>
            <button class="myButton" onclick="editModel()" >edit</button>
            <button class="myButton" onclick="deleteModel()" >delete</button>
            <button class="myButton" onclick="getById()" >get product by ID</button>
        </div>
    </section>
    <section class="input_section">
        <div id="add_Model" hidden="hidden">
            <label>
                <p>Name</p>
                <input id="model_name_add" type="text" placeholder="Name" />
                <p>Base model ID</p>
                <select id="select_model_add" size="">
                    <option disabled>Choose base model</option>
                    <c:forEach items="${modelList}" var="model">
                        <option value="<c:out value="${model.modelId}"></c:out>"> ${model.modelId} ${model.modelName}</option>
                    </c:forEach>
                </select>
                <p>Product ID</p>
                <select id="select_product_add" size="">
                    <option disabled>Choose product</option>
                    <c:forEach items="${productList}" var="product">
                        <option value="<c:out value="${product.productId}"></c:out>"> ${product.productId} ${product.productName}</option>
                    </c:forEach>
                </select>
                <p>Price</p>
                <input id="model_price_add" type="text" placeholder="Price" />
                <p>MAX speed</p>
                <input id="model_speed_add" type="text" placeholder="MAX speed" />
                <p>Fuel</p>
                <input id="model_fuel_add" type="text" placeholder="Fuel" />
                <p>Engine</p>
                <input id="model_engine_add" type="text" placeholder="Engine" />
            </label>
            <br>
            <button class="myButtonAction" onclick="addEntModel()" >Add model</button>
        </div>
        <div id="edit_Model" hidden="hidden">
            <label>
                <p>ID</p>
                <input id="model_id_edit" type="text" placeholder="ID"/>
                <p>Name</p>
                <input id="model_name_edit" type="text" placeholder="Name" />
                <p>Base model ID</p>
                <select id="select_model_edit" size="">
                    <option disabled>Choose base model</option>
                    <c:forEach items="${modelList}" var="model">
                        <option value="<c:out value="${model.modelId}"></c:out>"> ${model.modelId} ${model.modelName}</option>
                    </c:forEach>
                </select>
                <p>Product ID</p>
                <select id="select_product_edit" size="">
                    <option disabled>Choose product</option>
                    <c:forEach items="${productList}" var="product">
                        <option value="<c:out value="${product.productId}"></c:out>"> ${product.productId} ${product.productName}</option>
                    </c:forEach>
                </select>
                <p>Price</p>
                <input id="model_price_edit" type="text" placeholder="Price" />
                <p>MAX speed</p>
                <input id="model_speed_edit" type="text" placeholder="MAX speed" />
                <p>Fuel</p>
                <input id="model_fuel_edit" type="text" placeholder="Fuel" />
                <p>Engine</p>
                <input id="model_engine_edit" type="text" placeholder="Engine" />
            </label>
            <br>
            <button class="myButtonAction" onclick="editEntModel()" >Edit model</button>
        </div>
        <div id="delete_Model" hidden="hidden">
            <label>
                <p>ID</p>
                <input id="model_id_delete" type="text" placeholder="ID"/>
            </label>
            <br>
            <button class="myButtonAction" onclick="deleteEntModel()" >Delete model</button>
        </div>
        <div id="get_by_id" hidden="hidden">
            <label>
                <p>ID</p>
                <input id="model_id_get" type="text" placeholder="ID"/>
            </label>
            <br>
            <button class="myButtonAction" onclick="getEntByID()" >Get model by ID</button>
        </div>
    </section>
</header>
</body>

<script type="text/javascript" >

    function addModel() {
        $("#edit_Model").hide(600);
        $("#delete_Model").hide(600);
        $("#get_by_id").hide(600);
        $("#add_Model").show(600);
    }

    function editModel() {
        $("#add_Model").hide(600);
        $("#delete_Model").hide(600);
        $("#get_by_id").hide(600);
        $("#edit_Model").show(600);
    }

    function deleteModel() {
        $("#add_Model").hide(600);
        $("#edit_Model").hide(600);
        $("#get_by_id").hide(600);
        $("#delete_Model").show(600);
    }

    function getById() {
        $("#add_Model").hide(600);
        $("#edit_Model").hide(600);
        $("#delete_Model").hide(600);
        $("#get_by_id").show(600);
    }

    function addEntModel() {
        alert($("#model_name_add").val());
        var model = {
            modelName : $("#model_name_add").val(),
            baseModelId : $("#select_model_add option:selected").val(),
            productId : $("#select_product_add option:selected").val(),
            price : $("#model_price_add").val(),
            maxSpeed : $("#model_speed_add").val(),
            fuel : $("#model_fuel_add").val(),
            engine : $("#model_engine_add").val()
        };
        $.ajax({
            url: "/web_service_war_exploded/addModel",
            type: 'POST',
            processData: false,
            data: JSON.stringify(model),
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

    function editEntModel() {
        alert($("#prod_name_edit").val());
        var model = {
            modelId : $("#model_id_edit").val(),
            modelName : $("#model_name_edit").val(),
            baseModelId : $("#select_model_edit option:selected").val(),
            productId : $("#select_product_edit option:selected").val(),
            price : $("#model_price_edit").val(),
            maxSpeed : $("#model_speed_edit").val(),
            fuel : $("#model_fuel_edit").val(),
            engine : $("#model_engine_edit").val()
        };
        $.ajax({
            url: "/web_service_war_exploded/editModel",
            type: 'POST',
            processData: false,
            data: JSON.stringify(model),
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

    function deleteEntModel() {
        var model = {modelId : $("#model_id_delete").val()
        };
        $.ajax({
            url: "/web_service_war_exploded/deleteModel",
            type: 'POST',
            processData: false,
            data: JSON.stringify(model),
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
        window.location.href ="/web_service_war_exploded/getModelById?id=" + $("#model_id_get").val();
    }

    function updateTable(data) {
        var htmlTable = "<tbody><tr>" +
            "               <th>ID</th>" +
            "               <th>Name</th>" +
            "               <th>Base model ID</th>" +
            "               <th>Product ID</th>" +
            "               <th>Price</th>" +
            "               <th>MAX speed</th>" +
            "               <th>Fuel</th>" +
            "               <th>Engine</th>" +
            "           </tr>";
        for(var dat in data) {
            htmlTable += "<tr><td>" + data[dat].modelId + "</td><td>" + data[dat].modelName + "</td>" +
                "<td>" + data[dat].baseModelId + "</td><td>" + data[dat].productId + "</td><td>" + data[dat].price + "</td>" +
                "<td>" + data[dat].maxSpeed + "</td><td>" + data[dat].fuel + "</td><td>" + data[dat].engine + "</td></tr>";
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