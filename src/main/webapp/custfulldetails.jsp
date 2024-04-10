<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Customer Information</title>
  <style>
    .grid-container {
      display: grid;
      grid-template-columns: 1fr;
      gap: 5px;
      border: 1px solid #ddd;
      width: 100%;
    }
    .grid-item {
      padding: 8px;
      border-bottom: 1px solid #ddd;
    }
    .grid-item:last-child {
      border-bottom: none;
    }
    .grid-item strong {
      display: block;
      margin-bottom: 5px;
    }
    .modify-links a {
      margin-right: 5px;
    }
    table {
      border-collapse: collapse;
      width: 80%; /* Adjust width as needed */
      margin: 0 auto; /* Center the table horizontally */
    }
    th, td {
      border: 1px solid #ddd;
      padding: 8px;
      text-align: left;
    }
    th {
      background-color: #f2f2f2;
    }
  </style>
</head>
<body>

<h2>Customer Information</h2>

<table class="grid-container">
  <% Connection con = null;
     try {
         Class.forName("com.mysql.cj.jdbc.Driver");
         con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bodygarage?user=root&password=root");
         
         int custno = Integer.parseInt(request.getParameter("custno"));
         // System.out.println(uname);
         String str = "SELECT * FROM custdetails where custno=?";
         PreparedStatement pst = con.prepareStatement(str);
         pst.setInt(1, custno); 
         ResultSet rs = pst.executeQuery();
         while (rs.next()) { %>
             <tr class="grid-item">
                 <th>Customer No:</th> <td><%= rs.getInt("custno") %></td>
             </tr>
             <tr class="grid-item">
                 <th>Customer Name:</th> <td><%= rs.getString("custname") %></td>
             </tr>
             <tr class="grid-item">
                 <th>Gender:</th> <td><%= rs.getString("gender") %></td>
             </tr>
             <tr class="grid-item">
                 <th>Age:</th> <td><%= rs.getInt("age") %></td>
             </tr>
             <tr class="grid-item">
                 <th>Date of Birth:</th> <td><%= rs.getString("dob") %></td>
             </tr>
             <tr class="grid-item">
                 <th>Date of Joining:</th> <td><%= rs.getString("doj") %></td>
             </tr>
             <tr class="grid-item">
                 <th>Package:</th> <td><%= rs.getString("package") %></td>
             </tr>
             <tr class="grid-item">
                 <th>Occupation:</th> <td><%= rs.getString("occupation") %></td>
             </tr>
             <tr class="grid-item">
                 <th>Blood Group:</th> <td><%= rs.getString("bloodgrp") %></td>
             </tr>
             <tr class="grid-item">
                 <th>Height:</th> <td><%= rs.getInt("height") %></td>
             </tr>
             <tr class="grid-item">
                 <th>Weight:</th> <td><%= rs.getInt("weight") %></td>
             </tr>
             <tr class="grid-item">
                 <th>BMI:</th> <td><%= rs.getDouble("bmi") %></td>
             </tr>
             <tr class="grid-item">
                 <th>Phone Number:</th> <td><%= rs.getLong("phno") %></td>
             </tr>
             <tr class="grid-item">
                 <th>Emergency Phone Number:</th> <td><%= rs.getLong("emphno") %></td>
             </tr>
             <tr class="grid-item">
                 <th>Address:</th> <td><%= rs.getString("address") %></td>
             </tr>
             <tr class="grid-item">
                 <th>Registered By:</th> <td><%= rs.getString("registeredby") %></td>
             </tr>
             <tr class="grid-item">
                 <td colspan="2" class="modify-links">
                     <a href="custeditform.jsp?custno=<%= rs.getInt("custno") %>" >Edit</a>
                     <a href="custdeleteServlet?custno=<%= rs.getInt("custno") %>">Delete</a>
                 </td>
             </tr>
     <%          }
         rs.close();
       
     } catch (Exception e) {
         // Handle exceptions here
         e.printStackTrace();
     } finally {
         if (con != null) {
             try {
                 con.close();
             } catch (SQLException e) {
                 e.printStackTrace();
             }
         }
     }
  %>
</table>

</body>
</html>
