package com.bg.conn;

import java.util.Properties;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

import com.bg.entity.Customer;

public class HibernateUtil {
    private static SessionFactory sessionFactory;

    public static SessionFactory getSessionFactory() {
        if (sessionFactory == null) {
            Configuration configuration = new Configuration();

            Properties properties = new Properties();

            // JDBC connection properties
            properties.put("hibernate.connection.driver_class", "com.mysql.cj.jdbc.Driver");
            properties.put("hibernate.connection.url", "jdbc:mysql://localhost:3306/bodygarage");
            properties.put("hibernate.connection.username", "root");
            properties.put("hibernate.connection.password", "root");

            // Hibernate dialect for MySQL 8.0
            properties.put("hibernate.dialect", "org.hibernate.dialect.MySQL8Dialect");

            // Automatically update schema
            properties.put("hibernate.hbm2ddl.auto", "update");

            // Show SQL statements in console
            properties.put("hibernate.show_sql", "true");

            configuration.setProperties(properties);

            configuration.addAnnotatedClass(Customer.class);

            ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
                    .applySettings(configuration.getProperties()).build();

            sessionFactory = configuration.buildSessionFactory(serviceRegistry);
        }

        return sessionFactory;
    }
}
