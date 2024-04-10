package com.bg.servlet;

import java.io.IOException;

import com.bg.Dao.LoginDao;
import com.bg.conn.HibernateUtilLogin;

import com.bg.entity.Login;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/reg")
public class LoginServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		try {
			authenticate(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
	
	private void authenticate(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
System.out.println("username:"+username);
System.out.println("password:"+password);
		if (LoginDao.validate(username, password)) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("custdetailsform.jsp?registeredby="+username );
			dispatcher.forward(request, response);
		}else {
			throw new Exception("Login not successful..");
		}
	}
}