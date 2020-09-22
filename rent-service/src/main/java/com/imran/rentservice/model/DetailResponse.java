package com.imran.rentservice.model;

import com.imran.allmodel.model.customer.Customer;
import com.imran.allmodel.model.rent.Rent;
import com.imran.allmodel.model.vehicle.Vehicle;

/**
 * @author Md Amran Hossain
 */
public class DetailResponse implements Response {

    Rent rent;
    Customer customer;
    Vehicle vehicle;

    public DetailResponse(Rent rent, Customer customer, Vehicle vehicle) {
        this.rent = rent;
        this.customer = customer;
        this.vehicle = vehicle;
    }

    public Rent getRent() {
        return rent;
    }

    public void setRent(Rent rent) {
        this.rent = rent;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Vehicle getVehicle() {
        return vehicle;
    }

    public void setVehicle(Vehicle vehicle) {
        this.vehicle = vehicle;
    }
}
