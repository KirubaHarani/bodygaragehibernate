package com.bg.Dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.bg.conn.HibernateUtil;
import com.bg.conn.HibernateUtilLogin;
import com.bg.entity.Customer;
import com.bg.entity.Login;

public class LoginDao {
	 private SessionFactory sessionFactory;

	    public LoginDao(SessionFactory sessionFactory) {
	        super();
	        this.sessionFactory = sessionFactory;
	    }

	    @SuppressWarnings("deprecation")
		public static boolean validate(String userName, String password) {
	        System.out.println("username in Dao:" + userName);
	        System.out.println("password in Dao:" + password);
	        Transaction transaction = null;
	        Login login = null;
	        Session session = HibernateUtilLogin.getSessionFactory().openSession();
	            // start a transaction
	        	
	            transaction = session.beginTransaction();
	            System.out.println("session and transaction begins");
	            // get a user object
	            login = (Login) session.createQuery("from com.bg.entity.Login  WHERE username  = :userName")
	                    .setParameter("userName", userName)
	                    .uniqueResult();
	            System.out.println("login query:" + login);
	            //System.out.flush(); 
	            if (login != null && login.getPassword().equals(password)) {
	                // commit transaction before returning
	                transaction.commit();
	                return true;
	            }
	        
	        return false;
	    }
}