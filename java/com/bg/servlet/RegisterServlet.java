package com.bg.servlet;

import java.io.IOException;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.bg.Dao.CustomerDao;
import com.bg.conn.HibernateUtil;
import com.bg.entity.Customer;

import jakarta.servlet.http.HttpServletRequestWrapper;
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	
	{
		String action = request.getParameter("action");
		System.out.println(action);
		switch (action) 
		{
		case "save":
			saveCustomer(request, response);
			break;
		case "delete":
			deleteCustomer(request, response);
			break;
		case "edit":
			showEditForm(request, response);
			break;
		case "update":
			System.out.println("update");
			updateCustomer(request,response);
			break;
		default:
			listCustomer(request, response);
			break;
		 } 
	}
	
	
	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
			throws  ServletException, IOException {
		CustomerDao customerDao = new CustomerDao(HibernateUtil.getSessionFactory());
		int id = Integer.parseInt(request.getParameter("id"));
		System.out.println(id);
		Customer existingCustomer = customerDao.getCustomer(id);
		System.out.println("Existing customer:"+ existingCustomer);
		RequestDispatcher dispatcher = request.getRequestDispatcher("custeditform.jsp");
		request.setAttribute("customer", existingCustomer);
		dispatcher.forward(request, response);

	}
	
	private void listCustomer(HttpServletRequest request, HttpServletResponse response)	throws IOException, ServletException {
	    System.out.println("Inside listCustomer method"); // Add this line for testing
	    
	    CustomerDao customerDao = new CustomerDao(HibernateUtil.getSessionFactory());
	    String registeredby = request.getParameter("registeredby");
	    System.out.println(registeredby);
	    List<Customer> listCustomer = customerDao.getAllCustomer(registeredby);
	    
	    System.out.println("ListCustomer:" + listCustomer);
	    
	    request.setAttribute("listCustomer", listCustomer);
	    RequestDispatcher dispatcher = request.getRequestDispatcher("custdetailsform.jsp");
	    dispatcher.forward(request, response);
	}


	
	private void saveCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
        
            int custno = Integer.parseInt(request.getParameter("custno"));
            String custname = request.getParameter("custname");
            String gender = request.getParameter("gender");
            String strdoj = request.getParameter("doj");
            String strdob = request.getParameter("dob");
            SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
            Date doj = dateFormatter.parse(strdoj);
            Date dob = dateFormatter.parse(strdob);
            int age = Integer.parseInt(request.getParameter("custage"));
            String packages = request.getParameter("packages");
            String occupation = request.getParameter("occupation");
            String bloodgrp = request.getParameter("bloodgrp");
            int height = Integer.parseInt(request.getParameter("height"));
            int weight = Integer.parseInt(request.getParameter("weight"));
            double bmi = Double.parseDouble(request.getParameter("bmi"));
            long phno = Long.parseLong(request.getParameter("phno"));
            long emphno = Long.parseLong(request.getParameter("emphno"));
            String address = request.getParameter("address");
            String registeredby = request.getParameter("registeredby");

            Customer custdetails = new Customer(custno, custname, gender, doj, dob, age, packages, occupation, bloodgrp,
                    height, weight, bmi, phno, emphno, address, registeredby);
            
            System.out.println("Customer Data Received:");
            System.out.println(custdetails);
            
            CustomerDao dao = new CustomerDao(HibernateUtil.getSessionFactory());
            boolean f = dao.saveCustomer(custdetails);
            
            if (f) {
                System.out.println("Registered successfully");
                // Redirect to a success page
                response.sendRedirect("custdetailsform.jsp?registeredby="+ registeredby);
            } else {
                System.out.println("Not Registered");
                // Redirect to an error page
              //  response.sendRedirect("error.jsp");
            }
            
        } catch (ParseException e) {
            e.printStackTrace();
            // Handle the error gracefully, e.g., forward to an error page
            // out.println("Error: " + e.getMessage());
        }
    }
	
	private void updateCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
        	 int id=Integer.parseInt(request.getParameter("id"));
        	 System.out.println("Fetched Id:"+id);
            int custno = Integer.parseInt(request.getParameter("custno"));
            String custname = request.getParameter("custname");
            String gender = request.getParameter("gender");
            String strdoj = request.getParameter("doj");
            String strdob = request.getParameter("dob");
            SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
            Date doj = dateFormatter.parse(strdoj);
            Date dob = dateFormatter.parse(strdob);
            int age = Integer.parseInt(request.getParameter("custage"));
            String packages = request.getParameter("packages");
            String occupation = request.getParameter("occupation");
            String bloodgrp = request.getParameter("bloodgrp");
            int height = Integer.parseInt(request.getParameter("height"));
            int weight = Integer.parseInt(request.getParameter("weight"));
            double bmi = Double.parseDouble(request.getParameter("bmi"));
            long phno = Long.parseLong(request.getParameter("phno"));
            long emphno = Long.parseLong(request.getParameter("emphno"));
            String address = request.getParameter("address");
            String registeredby = request.getParameter("registeredby");

            Customer custdetails = new Customer(id,custno,custname, gender, doj, dob, age, packages, occupation, bloodgrp,
                    height, weight, bmi, phno, emphno, address, registeredby);
            
            System.out.println("Customer Data Received:");
            System.out.println(custdetails);
            
            CustomerDao dao = new CustomerDao(HibernateUtil.getSessionFactory());
            boolean f = dao.updatecustomer(custdetails);
            System.out.println(f);
            if (f) {
                System.out.println("Registered successfully");
                // Redirect to a success page
                response.sendRedirect("custdetailsform.jsp");
            } else {
                System.out.println("Not Registered");
                // Redirect to an error page
              //  response.sendRedirect("error.jsp");
            }
            
        } catch (ParseException e) {
            e.printStackTrace();
            // Handle the error gracefully, e.g., forward to an error page
            // out.println("Error: " + e.getMessage());
        }
    }
	
	private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
        int id = Integer.parseInt(request.getParameter("id"));
        
        System.out.println(id);
        CustomerDao dao = new CustomerDao(HibernateUtil.getSessionFactory());
        boolean f = dao.deleteCustomer(id);
        
        if (f) 
        {
            System.out.println("Customer deleted successfully");
            // Redirect to a success page or list page
            response.sendRedirect("custdetailsform.jsp");
        } else 
        {
            System.out.println("Failed to delete customer");
            // Redirect to an error page
          //  response.sendRedirect("error.jsp");
        }
    }
	
	

}
