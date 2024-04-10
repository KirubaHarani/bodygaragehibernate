package com.bg.Dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.bg.conn.HibernateUtil;
import com.bg.entity.Customer;

public class CustomerDao {

    private SessionFactory sessionFactory;
	private Object custno;

    public CustomerDao(SessionFactory sessionFactory) 
    {
        super();
        this.sessionFactory = sessionFactory;
    }

    public boolean saveCustomer(Customer custdetails) {
        boolean f = false;

        Session session = sessionFactory.openSession() ;
            Transaction tx = session.beginTransaction();
            int i = (Integer) session.save(custdetails);
            if (i > 0) {
                f = true;
                System.out.println("Customer saved successfully with ID: " + i);
            }
                tx.commit();
                session.close();
            
           
        return f;
    }
    
    public boolean updatecustomer(Customer custdetails) {
    	boolean updated = false;
        Transaction tx = null;

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            tx = session.beginTransaction();
            
    System.out.println("session details:"+custdetails);
            
           session.update(custdetails);
           
               
               
               
               tx.commit();
               updated=true;
        } catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		}
		return updated;
               
    }
    
    public Customer getCustomer(int id) {

		Transaction transaction = null;
		Customer customer = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// get an user object
			customer = session.get(Customer.class, id);
			System.out.println("Customer :"+ customer);
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return customer;
	}
    
    
    public boolean deleteCustomer(int id) {
        try (Session session = sessionFactory.openSession()) {
            Transaction tx = session.beginTransaction();
            System.out.println(id);
            Customer customer = session.get(Customer.class, id);
            if (customer != null) {
                session.delete(customer);
                System.out.println("Customer with ID " + id + " is deleted");
                tx.commit();
                return true;
            } else {
                System.out.println("Customer with ID " + id + " not found");
                tx.rollback();
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    @SuppressWarnings({ "unchecked", "deprecation" })
	public  List<Customer> getAllCustomer(String registeredby) {
		 System.out.println("getAllCustomers() method called");
		Transaction transaction = null;
		List<Customer> listOfCustomer = null;
		System.out.println("hi");
		Session session = HibernateUtil.getSessionFactory().openSession();
			// start a transaction
			transaction = session.beginTransaction();
			// get an user object
			System.out.println("Session and transaction begins");
			listOfCustomer = session.createQuery("from Customer WHERE registeredby  = :registeredby").setParameter("registeredby", registeredby).getResultList();
			System.out.println(listOfCustomer);
			 for (Customer customer : listOfCustomer) {
		            System.out.println("Customer custno: " + customer.getCustno());
		        }
			// commit transaction
			transaction.commit();
		
		return listOfCustomer;
	}
}
