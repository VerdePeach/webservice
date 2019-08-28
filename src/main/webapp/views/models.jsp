<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="services.servicesImp.DepartmentServiceImpl" %>
<%@ page import="services.DepartmentService" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Department" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title>Our departments</title>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <link href="<spring:url value="/resources/css/model/models.css" />" rel="stylesheet" type="text/css" />
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

