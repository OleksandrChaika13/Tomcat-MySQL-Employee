<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>List of Employees</title>
    <style>
        .myButton {
        	box-shadow: 0px 1px 0px 2px #ffffff;
        	background:linear-gradient(to bottom, #7892c2 5%, #476e9e 100%);
        	background-color:#7892c2;
        	border-radius:15px;
        	border:1px solid #4e6096;
        	display:inline-block;
        	cursor:pointer;
        	color:#ffffff;
        	font-family:Arial;
        	font-size:19px;
        	padding:12px 37px;
        	text-decoration:none;
        	text-shadow:0px 1px 0px #b2c8ff;
        }
        .myButton:hover {
        	background:linear-gradient(to bottom, #476e9e 5%, #7892c2 100%);
        	background-color:#476e9e;
        }
        .myButton:active {
        	position:relative;
        	top:1px;
        }
        .redButton {
            box-shadow:inset 0px 39px 0px -24px #e67a73;
            background-color:#e4685d;
            border-radius:4px;
            border:1px solid #ffffff;
            display:inline-block;
            cursor:pointer;
            color:#ffffff;
            font-family:Arial;
            font-size:15px;
            padding:6px 15px;
            text-decoration:none;
            text-shadow:0px 1px 0px #b23e35;
        }
        .redButton:hover {
            background-color:#eb675e;
        }
        .redButton:active {
            position:relative;
            top:1px;
        }
        .myGreenButton {
        	box-shadow:inset 0px 39px 0px -24px #3dc21b;
        	background-color:#44c767;
        	border-radius:4px;
        	border:1px solid #18ab29;
        	display:inline-block;
        	cursor:pointer;
        	color:#ffffff;
        	font-family:Arial;
        	font-size:15px;
        	padding:6px 15px;
        	text-decoration:none;
        	text-shadow:0px 1px 0px #2f6627;
        }
        .myGreenButton:hover {
        	background-color:#5cbf2a;
        }
        .myGreenButton:active {
        	position:relative;
        	top:1px;
        }
    </style>
</head>
<body>
    <center>
        <h1>List of Employees</h1>
        <h3>
        <!-- <a href="<%=request.getContextPath()%>/new">Add New Employee</a> -->
            <a href="<%=request.getContextPath()%>/new" class="myButton">Add Employee</a>
            &nbsp;&nbsp;&nbsp;
            <a href="<%=request.getContextPath()%>/list">List of Employees</a>
        </h3>
    </center>
    <div align="center">
        <table border="1" cellpadding="5">
            <caption><h2>Users</h2></caption>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Position</th>
                <th>Phone</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="employee" items="${listEmployee}">
                <tr>
                    <td><c:out value="${employee.id}" /></td>
                    <td><c:out value="${employee.name}" /></td>
                    <td><c:out value="${employee.position}" /></td>
                    <td><c:out value="${employee.phone}" /></td>
                    <td>
                        <a href="<%=request.getContextPath()%>/edit?id=<c:out value='${employee.id}' />" class="myGreenButton">Edit</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="<%=request.getContextPath()%>/delete?id=<c:out value='${employee.id}' />" class="redButton">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>