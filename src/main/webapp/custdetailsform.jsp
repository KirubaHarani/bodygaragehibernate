<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.List" %>
<%@ page import="com.bg.entity.Customer" %>
<%@ page import="com.bg.Dao.CustomerDao" %>
<%@ page import="com.bg.conn.HibernateUtil" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
CustomerDao customerDao = new CustomerDao(HibernateUtil.getSessionFactory());
String registeredby = request.getParameter("registeredby");
System.out.println(registeredby);
List<Customer> listCustomer = customerDao.getAllCustomer(registeredby);

    System.out.println("ListCustomer:" + listCustomer);

    if (listCustomer != null) {
        request.setAttribute("listCustomer", listCustomer);
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BodyGarage Gym</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
     <link rel="stylesheet" href="styles.css">
    <style>
        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            padding: 2px;
            align:center;
        }
       
       .modify-links {
    display: flex;
    align-items: center;
}

.modify-links form {
    margin-right: 10px;
    display: inline-block;
}
       
        .container table {
            border-collapse: collapse;
            height: 200px;
            overflow-y: auto;
        }
        .container th, .container td {
            border: 1px solid black;
            padding: 2px;
            text-align: left;
        }
        .container th {
            background-color: #f2f2f2;
            text-align: center;
        }
        .modify-links a {
            margin-right: 10px;
        }
        
        .modify-links form {
    margin-right: 10px;
}
        
        
        body {
            margin-bottom: 90px; /* Adjust as needed */
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <a class="navbar-brand" href="#">BodyGarage Gym</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="homepage.jsp">Logout</a>
            </li>
        </ul>
    </div>
</nav>

<br>
<br>
<br>

<div class="container" align="center">
    <form action="Customerentryform.jsp" method="post">
    <input type="hidden" name="registeredby" value="<%= registeredby %>">
        <input type="submit" class="submit-btn" value="New customer registration">
    </form>
    <br>
    <br>

    <table id="customerTable" class="display">
        <thead>
            <tr>
                <th>N0</th>
                <th>Name</th>
                <th>Gender</th>
                <th>DOJ</th>
                <th>Age</th>
                <th>Package</th>
                <th>Height</th>
                <th >Weight</th>
                <th>BMI</th>
                <th>Ph No</th>
                <th>Reg By</th>
                <th >Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="customer" items="${listCustomer}">
                <tr>
                    <td><c:out value="${customer.custno}" /></td>
                    <td><c:out value="${customer.custname}" /></td>
                    <td><c:out value="${customer.gender}" /></td>
                    <td><fmt:formatDate value="${customer.doj}" pattern="yyyy-MM-dd" /></td>
                    <td><c:out value="${customer.age}" /></td>
                    <td><c:out value="${customer.packages}" /></td>
                    <td><c:out value="${customer.height}" /></td>
                    <td><c:out value="${customer.weight}" /></td>
                    <td><c:out value="${customer.bmi}" /></td>
                    <td><c:out value="${customer.phno}" /></td>
                    <td><c:out value="${customer.registeredby}" /></td>
                   <td class="modify-links">
    <form action="register?action=edit" method="post" style="margin-right: 10px;">
        <input type="hidden" name="action" value="edit">
        <input type="hidden" name="id" value="${customer.id}">
        <input type="hidden" name="registeredby" value="${customer.registeredby}">
        <button type="submit">Edit</button>
    </form>
    <form action="register?action=delete" method="post">
        <input type="hidden" name="action" value="delete">
        <input type="hidden" name="id" value="${customer.id}">
        <input type="hidden" name="registeredby" value="${customer.registeredby}">
        <button type="submit">Delete</button>
    </form>
</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<!-- Include jQuery, Bootstrap JS, and DataTables JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>
<script>
    $(document).ready(function() {
        $('#customerTable').DataTable({
            "paging": true,
            "searching": true,
            "ordering": true,
            "info": true
        });
    });
</script>

</body>
<footer>
    <p>&copy; 2024 BodyGarage Gym. All rights reserved.</p>
</footer>
</html>
                                     