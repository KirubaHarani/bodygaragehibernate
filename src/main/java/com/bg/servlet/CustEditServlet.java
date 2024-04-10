package com.bg.servlet;
import java.io.IOException;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import com.bg.Dao.CustomerEditDao;
import com.bg.conn.HibernateUtil;
import com.bg.entity.Customer;

@WebServlet("/editregister")
public class CustEditServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
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
            
            // Now you can do something with the 'cust' object, like save to database
            
            System.out.println("Customer Data Received:");
            System.out.println(custdetails);
            
           CustomerEditDao dao=new CustomerEditDao(HibernateUtil.getSessionFactory());
            boolean f=dao.updateCustomer(custdetails);
            
            if(f)
            {
            	System.out.println("registered successfully");
            }
            else
            {
            	System.out.println("Not Registered");
            }
            // For demonstration, let's forward to a success page
           
        } catch (ParseException e) {
            e.printStackTrace();
            // Handle the error gracefully, e.g., forward to an error page
            // out.println("Error: " + e.getMessage());
        }
    }
}
