<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title>Our departments</title>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <link href="<spring:url value="/resources/css/department/departments.css" />" rel="stylesheet" type="text/css" />
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
        <h1>Departments</h1>
        <div class="inner_table_section">
        <table id="table_dark" class="table_dark">
            <tbody>
            <tr>
                <th>ID</th>
                <th>Name</th>
            </tr>
            <c:forEach items="${departmentList}" var="department">
                <tr>
                    <td><c:out value="${department.departmentId}" /></td>
                    <td><c:out value="${department.departmentName}" /></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        </div>
        <div class="table_buttons">
        <button class="myButton" onclick="addDep()" >add</button>
        <button class="myButton" onclick="editDep()" >edit</button>
        <button class="myButton" onclick="deleteDep()" >delete</button>
        <button class="myButton" onclick="getById()" >get department by ID</button>
        </div>
    </section>
    <section class="input_section">
        <div id="add_Dep" hidden="hidden">
            <label>
                <p>Name</p>
                <input id="dep_name_add" type="text" placeholder="Name" />
            </label>
            <br>
            <button class="myButtonAction" onclick="addEntDep()" >Add department</button>
        </div>
        <div id="edit_Dep" hidden="hidden">
            <label>
                <p>ID</p>
                <input id="dep_id_edit" type="text" placeholder="ID"/>
                <p>Name</p>
                <input id="dep_name_edit" type="text" placeholder="Name"/>
            </label>
            <br>
            <button class="myButtonAction" onclick="editEntDep()" >Edit department</button>
        </div>
        <div id="delete_Dep" hidden="hidden">
            <label>
                <p>ID</p>
                <input id="dep_id_delete" type="text" placeholder="ID"/>
            </label>
            <br>
            <button class="myButtonAction" onclick="deleteEntDep()" >Delete department</button>
        </div>
        <div id="get_by_id" hidden="hidden">
            <label>
                <p>ID</p>
                <input id="dep_id_get" type="text" placeholder="ID"/>
            </label>
            <br>
            <button class="myButtonAction" onclick="getEntByID()" >Get department by ID</button>
        </div>
    </section>
</header>
<b id="message"></b>


</body>

<script type="text/javascript" >

    function addDep() {
        $("#edit_Dep").hide(600);
        $("#delete_Dep").hide(600);
        $("#get_by_id").hide(600);
        $("#add_Dep").show(600);
    }

    function editDep() {
        $("#add_Dep").hide(600);
        $("#delete_Dep").hide(600);
        $("#get_by_id").hide(600);
        $("#edit_Dep").show(600);
    }

    function deleteDep() {
        $("#add_Dep").hide(600);
        $("#edit_Dep").hide(600);
        $("#get_by_id").hide(600);
        $("#delete_Dep").show(600);
    }

    function getById() {
        $("#add_Dep").hide(600);
        $("#edit_Dep").hide(600);
        $("#delete_Dep").hide(600);
        $("#get_by_id").show(600);
    }

    function addEntDep() {
        var department = {
            departmentName : $("#dep_name_add").val()
        };
        $.ajax({
            url: "/web_service_war_exploded/addDepartment",
            type: 'POST',
            processData: false,
            data: JSON.stringify(department),
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (data) {
                updateTable(data);
            },
            error: function (data) {
                alert("Incorrect values");
            }
        });
    }

    function editEntDep() {
        var department = {departmentId : $("#dep_id_edit").val(),
            departmentName : $("#dep_name_edit").val()
        };
        $.ajax({
            url: "/web_service_war_exploded/editDepartment",
            type: 'POST',
            processData: false,
            data: JSON.stringify(department),
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (data) {
                updateTable(data);
            },
            error: function (data) {
                alert("Incorrect values");
            }
        });
    }

    function deleteEntDep() {
        alert($("#dep_name_add").val());
        var department = {departmentId : $("#dep_id_delete").val()
        };
        $.ajax({
            url: "/web_service_war_exploded/deleteDepartment",
            type: 'POST',
            processData: false,
            data: JSON.stringify(department),
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (data) {
                updateTable(data);
            },
            error: function (data) {
                alert("Incorrect values");
            }
        });
    }

    function getEntByID() {
        window.location.href ="/web_service_war_exploded/getDepartmentById?id=" + $("#dep_id_get").val();
    }

    function updateTable(data) {
        var htmlTable = "<tbody><tr>" +
            "                <th>ID</th>" +
            "                <th>Name</th>" +
            "            </tr>";
        for(var dat in data) {
            htmlTable += "<tr><td>" + data[dat].departmentId + "</td><td>" + data[dat].departmentName + "</td></tr>";
        }
        htmlTable += "</tbody>";
        $("#table_dark").html(htmlTable);
    }

</script>
</html>


