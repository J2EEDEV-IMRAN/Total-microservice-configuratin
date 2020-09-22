package com.imran.customerservice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.imran.allmodel.model.customer.Customer;
import com.imran.customerservice.repository.CustomerRepository;

import java.util.List;
import java.util.Optional;

/**
 * @author Md Amran Hossain
 */
@Service
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    CustomerRepository customerRepository;

    @Override
    public Customer save(Customer customer) {
        return customerRepository.save(customer);
    }

    @Override
    public Customer findById(int id) {
        Optional<Customer> customer = customerRepository.findById(id);

        if (customer.isPresent())
            return customer.get();
        else
            return new Customer();

    }

    @Override
    public List<Customer> findAll() {
        return customerRepository.findAll();
    }
}
