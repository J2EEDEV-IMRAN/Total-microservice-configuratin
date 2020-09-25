package com.imran.vehicleservice.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.imran.allmodel.model.vehicle.Vehicle;

/**
 * @author Md Amran Hossain
 */

public interface VehicleRepository extends JpaRepository<Vehicle,Integer>,QuerydslPredicateExecutor<Vehicle> {
	
}
