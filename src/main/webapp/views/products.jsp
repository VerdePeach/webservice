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
    <!--
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.14/jquery-ui.min.js"></script>
    -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

    <link href="<spring:url value="/resources/css/product/products.css" />" rel="stylesheet" type="text/css" />
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
                <p>Choose Department</p>
                <!--dynamic search-->
                <input id="select_dep_add" type="text" placeholder="Department">



                <!--
                <select id="select_dep_add" size="">
                    <option disabled>Choose department</option>
                    <c:forEach items="${departmentList}" var="department">
                        <option value="<c:out value="${department.departmentId}"></c:out>"> ${department.departmentId} ${department.departmentName}</option>
                    </c:forEach>
                </select>
                -->



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
                <p>Choose Department</p>
                <input id="select_dep_edit" type="text" placeholder="Department">

                <!--
                <select id="select_dep_edit" size="">
                    <option disabled>Choose department</option>
                    <c:forEach items="${departmentList}" var="department">
                        <option value="<c:out value="${department.departmentId}"></c:out>"> ${department.departmentId} ${department.departmentName}</option>
                    </c:forEach>
                </select>
                -->

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
</body>

<script>
    /* ?????????? ??????*/
    $( function() {
        var availableTags = [];
        <c:forEach items="${departmentList}" var="department">
        var str = '${department.departmentId} ${department.departmentName}';
        availableTags.push(str);
        </c:forEach>
        $( "#select_dep_add" ).autocomplete({
            source: availableTags
        });

        $( "#select_dep_edit" ).autocomplete({
            source: availableTags
        });
    });
</script>

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


    function formIdAll(str) {
        var myStr = str
        var formId = '';
        for (var i = 0; i < str.length; i++) {
            if (myStr[i] == ' ')
                break;
            if (myStr[i] > -1 && myStr[i] < 10) {
                formId += myStr[i];
            }
        }
        return formId;
    }

    function addEntProd() {
        var formId = formIdAll($("#select_dep_add").val());
/*
        var myStr = $("#select_dep_add").val();
        var formId = '';
        for (var i = 0; i < $("#select_dep_add").val().length; i++) {
            if (myStr[i] == ' ')
                break;
            if (myStr[i] > -1 && myStr[i] < 10) {
                formId += myStr[i];
            }
        }
*/
        var product = {
            productName : $("#prod_name_add").val(),
            departmentId : formId
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
        var formId = formIdAll($("#select_dep_edit").val());

        var product = {productId : $("#prod_id_edit").val(),
            productName : $("#prod_name_edit").val(),
            departmentId : formId
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

