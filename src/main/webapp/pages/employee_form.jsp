<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>List of Employees</title>
<style>
        .myButton {
        	box-shadow: 0px 1px 0px 2px #ffffff;
        	background:linear-gradient(to bottom, #eae0c2 5%, #ccc2a6 100%);
        	background-color:#eae0c2;
        	border-radius:15px;
        	border:2px solid #ffffff;
        	display:inline-block;
        	cursor:pointer;
        	color:#505739;
        	font-family:Arial;
        	font-size:19px;
        	font-weight:bold;
        	padding:12px 37px;
        	text-decoration:none;
        	text-shadow:0px 1px 0px #ffffff;
        }
        .myButton:hover {
        	background:linear-gradient(to bottom, #ccc2a6 5%, #eae0c2 100%);
        	background-color:#ccc2a6;
        }
        .myButton:active {
        	position:relative;
        	top:1px;
        }
    </style>
</head>
<body>
    <center>
        <h1>List of Employees</h1>
        <h3>
            <a href="<%=request.getContextPath()%>/list"  class="myButton">List of Employees</a>
        </h3>
    </center>
    <div align="center">
        <c:if test="${employee != null}">
            <form action="update" method="post">
        </c:if>
        <c:if test="${employee == null}">
            <form action="insert" method="post">
        </c:if>
        <table border="1" cellpadding="5">
            <caption>
                <h3>
                    <c:if test="${employee != null}">
                        Edit Employee
                    </c:if>
                    <c:if test="${employee == null}">
                        Add New Employee
                    </c:if>
                </h3>
            </caption>
                <c:if test="${employee != null}">
                    <input type="hidden" name="id" value="<c:out value='${employee.id}' />" />
                </c:if>
            <tr>
                <th>Name: </th>
                <td>
                    <input type="text" name="name" size="45"
                            value="<c:out value='${employee.name}' />"
                        />
                </td>
            </tr>
            <tr>
                <th>Position: </th>
                <td>
                    <input type="text" name="position" size="45"
                            value="<c:out value='${employee.position}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Phone: </th>
                <td>
                    <input type="text" name="phone" size="45"
                            value="<c:out value='${employee.phone}' />"
                    />
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <form action="<%=request.getContextPath()%>/insert">
                        <input type="submit" value="Save" />
                    </form>
                </td>
            </tr>
        </table>
        </form>
    </div>
</body>
</html>