package com.bg.Dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.bg.entity.Customer;

public class CustomerEditDao {

    private SessionFactory sessionFactory;

    public CustomerEditDao(SessionFactory sessionFactory) {
        super();
        this.sessionFactory = sessionFactory;
    }

    public boolean updateCustomer(Customer custdetails) {
        boolean f = false;

        Session session = sessionFactory.openSession() ;
            Transaction tx = session.beginTransaction();
            session.update(custdetails);
            
                f = true;
                System.out.println("Customer updated successfully with ID: " );
            
                tx.commit();
                session.close();
            
           
        return f;
    }

	
}
