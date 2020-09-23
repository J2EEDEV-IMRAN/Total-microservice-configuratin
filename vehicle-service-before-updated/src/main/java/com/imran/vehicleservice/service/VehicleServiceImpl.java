package com.imran.vehicleservice.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.imran.allmodel.model.vehicle.Vehicle;
import com.imran.vehicleservice.repository.VehicleRepository;

import java.util.List;
import java.util.Optional;

/**
 * @author Md amran Hossain
 */
@Service
public class VehicleServiceImpl implements VehicleService {
    @Autowired
    VehicleRepository vehicleRepository;


    @Override
    public Vehicle save(Vehicle customer) {
        return vehicleRepository.save(customer);
    }


    @Override
    public Vehicle findById(int id) {
        Optional<Vehicle> vehicle = vehicleRepository.findById(id);

        if (vehicle.isPresent())
            return vehicle.get();
        else
            return new Vehicle();

    }


    @Override
    public List<Vehicle> findAll() {
        return vehicleRepository.findAll();
    }
}
