package com.imran.customerservice.service;



import java.util.List;

import com.imran.allmodel.model.customer.Customer;

/**
 * @author Md Amran Hossain
 */
public interface CustomerService {
    Customer save(Customer customer);

    Customer findById(int id);

    List<Customer> findAll();
}
