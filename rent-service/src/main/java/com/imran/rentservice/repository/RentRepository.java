package com.imran.rentservice.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.imran.allmodel.model.rent.Rent;


/**
 * @author Md Amran Hossain
 */
public interface RentRepository extends JpaRepository<Rent,Integer> {
}
