package com.imran.rentservice.model;

import com.imran.allmodel.model.rent.Rent;

/**
 * @author Md Amran Hossain
 */
public class SimpleResponse implements Response {

    Rent rent;


    public SimpleResponse(Rent rent) {
        this.rent = rent;
    }

    public Rent getRent() {
        return rent;
    }

    public void setRent(Rent rent) {
        this.rent = rent;
    }
}
