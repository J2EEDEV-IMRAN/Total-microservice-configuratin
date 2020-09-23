package com.imran.vehicleservice.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.imran.allmodel.model.vehicle.Vehicle;

/**
 * @author Md Amran Hossain
 */
public interface VehicleRepository extends JpaRepository<Vehicle,Integer> {
}
