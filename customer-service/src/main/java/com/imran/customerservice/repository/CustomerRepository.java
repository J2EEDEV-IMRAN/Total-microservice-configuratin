package com.imran.customerservice.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.imran.allmodel.model.customer.Customer;

/**
 * @author Md Amran Hossain
 */
public interface CustomerRepository extends JpaRepository<Customer,Integer> {
}
