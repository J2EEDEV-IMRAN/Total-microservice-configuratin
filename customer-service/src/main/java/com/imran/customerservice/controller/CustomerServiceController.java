package com.imran.customerservice.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import com.imran.allmodel.model.customer.Customer;
import com.imran.customerservice.service.CustomerService;

import java.time.LocalDateTime;
import java.util.List;

/**
 * @author Md Amran Hossain
 */

@RestController
@RequestMapping("/services/customers")
public class CustomerServiceController {


    @Autowired
    CustomerService customerService;

    @PostMapping
    @PreAuthorize("hasAuthority('create_profile')")
    public Customer save(@RequestBody Customer customer) {
        return customerService.save(customer);
    }

    @GetMapping(value = "/{id}")
    public Customer getCustomer(@PathVariable int id) {

        System.out.println("request came on "+LocalDateTime.now() + "  5  ++++++++++++++++++++++");
        return customerService.findById(id);
    }

    @GetMapping
    @PreAuthorize("hasAuthority('read_profile')")
    public List<Customer> getAllCustomers() {
        return customerService.findAll();
    }


}
