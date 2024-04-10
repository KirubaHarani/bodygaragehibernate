<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BodyGarage Gym</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Link your custom CSS file -->
    <link rel="stylesheet" href="styles.css">
</head>
 <link rel="stylesheet" href="styles.css">
    <style>
    #packages
     {
 		 width: 190px; /* Set the desired width */
	 }
        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around; /* Adjust as per your preference */
            padding: 20px;
        }
        .container > form,
        .container > table {
            width: 100%;
            margin-bottom: 20px;
        }
        .container table {
            border-collapse: collapse;
        }
        .container th, .container td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        .container th {
            background-color: #f2f2f2;
        }
        .modify-links a {
            margin-right: 5px;
        }
        h2{
        color="white";
        }
        #doj,#dob
        {
        	width: 190px;	
        }
       
    </style>

<script>
        function calculateBMI() {
            var height = parseFloat(document.getElementById('height').value);
            var weight = parseFloat(document.getElementById('weight').value);

            if (!isNaN(height) && !isNaN(weight) && height > 0 && weight > 0) {
                var height = height / 100; // Convert height from cm to m
                var bmi = weight / (height * height);
                document.getElementById('bmi').value = bmi.toFixed(2);
            } 
        }
    </script>
<script>
 function validate() {
	 
    var custname = document.getElementById("custname").value;
    var custno = document.getElementById("custno").value;
    var packages = document.getElementById("packages").value;
    var age = document.getElementById("custage").value;
    var height = document.getElementById("height").value;
    var weight = document.getElementById("weight").value;
    var phno = document.getElementById("phno").value;
    var emphno = document.getElementById("emphno").value;
    
    var numbersOnly = /^\d+$/;
    var letters = /^[A-Za-z]+$/;
    var phonePattern = /^\d{10}$/;

    if (!custno.match(numbersOnly)) {
        alert("Invalid Customer Number");
        return false;
    }
    if(!custname.match(letters))
    {
    	alert("Invalid Customer Name");
    	return false;
    }
   
    if (!age.match(numbersOnly)) {
        alert("Invalid Age");
        return false;
    }
    
    if (!height.match(numbersOnly)) {
        alert("Invalid Height");
        return false;
    }
    if (!weight.match(numbersOnly)) {
        alert("Invalid Weight");
        return false;
    }
    if (!phno.match(numbersOnly)) {
        alert("Invalid Phone Number");
        return false;
    }
    if (!phno.match(phonePattern)) {
        alert("Invalid Phone Number");
        return false;
    }
    if (!emphno.match(phonePattern)) {
        alert("Invalid Emergency Phone Number");
        return false;
    }
    if (!emphno.match(numbersOnly)) {
        alert("Invalid Emergency Phone Number");
        return false;
    }

    if (packages.trim() === "--Select Package--") {
        alert("Please Select Package");
        return false;
    }
   
    return true; // Form will submit if all validations pass
}
</script>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"> <!-- Make navbar fixed -->
  <a class="navbar-brand" href="#">BodyGarage Gym</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav ml-auto">
      
      <li class="nav-item">
        <a class="nav-link" href="homepage.jsp" >Logout</a>
      </li>
    </ul>
  </div>
</nav>

<br><br><br>
	<div align="center">
	<h3>Edit Customer Entry Form</h3>
	<h3></h3>
	</div>
	<div align="center">
		    <form  onsubmit="return validate()" action="register?action=update" method="post">
      
            <table>
<tr>
<td>Id Number&nbsp;&nbsp;&nbsp; </td>
                <td><input type="text" name="id" id="id" value="<c:out value='${customer.id}' />" readonly required></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>

</tr>
            <tr>
                <td>Customer Number&nbsp;&nbsp;&nbsp; </td>
                <td><input type="text" name="custno" id="custno" value="<c:out value='${customer.custno}' />" readonly required></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                
                <td>  Blood Group&nbsp;&nbsp;&nbsp;</td>
                <td><input type="text" name="bloodgrp" id="bloodgrp" value="<c:out value='${customer.bloodgrp}' />" required></td>
               
            </tr>
            <tr>
                <td>Customer Name</td>
                <td><input type="text" name="custname" id="custname" value="<c:out value='${customer.custname}' />"  required></td>
                <td></td>
                
                <td>Height</td>
				<td><input type="number" name="height" id="height" value="<c:out value='${customer.height}' />" step="0.01" oninput="calculateBMI()" required></td>
      </tr>
            <tr>
                <td>Gender</td>
                <td colspan="2">
                  <label>
    <input type="radio" id="male" name="gender" value="male" <c:if test="${customer.gender == 'male'}">checked</c:if>>
    Male
</label>
<label>
    <input type="radio" id="female" name="gender" value="female" <c:if test="${customer.gender == 'female'}">checked</c:if>>
    Female
</label>

                </td>
                
                <td>Weight</td>
				<td><input type="number" name="weight" id="weight" value="<c:out value='${customer.weight}' />"  step="0.01" oninput="calculateBMI()" required></td>
  </tr>
            <tr>
                <td>Date Of Joining</td>
                
                <td><input type="date" id="doj" name="doj" value="<fmt:formatDate value="${customer.doj}" pattern="yyyy-MM-dd" />" required></td>
                <td></td>
                 <td>BMI</td>
                <td><input type="text" name="bmi" id="bmi" value="<c:out value='${customer.bmi}' />" readonly required></td>
            </tr>
            <tr>
                <td>Date Of Birth</td>
                <td><input type="date" id="dob" name="dob" value="<fmt:formatDate value="${customer.dob}" pattern="yyyy-MM-dd" />" required></td>
                <td></td>
                 <td>Phone Number</td>
                <td><input type="text" name="phno" id="phno" value="<c:out value='${customer.phno}' />"  required></td>
            </tr>
            <tr>
                <td>Age</td>
                <td><input type="text" name="custage" id="custage" value="<c:out value='${customer.age}' />"></td>
                <td></td>
                <td>Emergency Phone Number&nbsp;&nbsp;&nbsp;</td>
                <td><input type="text" name="emphno" id="emphno" value="<c:out value='${customer.emphno}' />" required></td>
            </tr>
            <tr>
                <td>Package</td>
                <td colspan="2">             
                     <select id="packages" name="packages" required>
        <option value="1month" <c:if test="${customer.packages.equals('1 Month')}">selected</c:if>>1 Month</option>
        <option value="3month" <c:if test="${customer.packages.equals('3 Month')}">selected</c:if>>3 Month</option>
        <option value="6month" <c:if test="${customer.packages.equals('6 Month')}">selected</c:if>>6 Month</option>
        <option value="1year" <c:if test="${customer.packages.equals('1 Year')}">selected</c:if>>1 Year</option>
    </select>
                </td>
                
                <td>Registered By</td>
                <td><input type="text" value= "<c:out value='${customer.registeredby}' />"name="registeredby" id="registeredby" readonly required></td>
                 
            </tr>
            <tr>
                <td>Occupation</td>
                <td><input type="text" name="occupation" id="occupation" value="<c:out value='${customer.occupation}' />"></td>
            </tr>
            <tr>
                <td>Address</td>
                <td colspan="4"><textarea id="address" name="address" rows="3" cols="23"  required><c:out value='${customer.address}' /></textarea></td>
            </tr>
            <tr>
            <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td colspan="5"><input type="submit" value="UPDATE"></td>
            </tr>
            </table>
        </form>
	</div>
	 <footer>
    <p>&copy; 2024 BodyGarage Gym. All rights reserved.</p>
</footer>
<!-- Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	
</body>
</html>