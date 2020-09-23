package com.imran.vehicleservice.service;



import java.util.List;

import com.imran.allmodel.model.vehicle.Vehicle;

/**
 * @author Md Amran Hossain
 */
public interface VehicleService {
    Vehicle save(Vehicle customer);

    Vehicle findById(int id);

    List<Vehicle> findAll();
}
