package com.imran.vehicleservice.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.imran.allmodel.model.vehicle.Vehicle;
import com.imran.vehicleservice.service.VehicleService;

import java.time.LocalDateTime;
import java.util.List;

/**
 * @author Md Amran Hossain
 */

@RestController
@RequestMapping("/services/vehicles")
public class VehicleController {

    @Autowired
    VehicleService vehicleService;

    @PostMapping
    public Vehicle save(@RequestBody Vehicle vehicle) {
        return vehicleService.save(vehicle);
    }

    @GetMapping(value = "/{id}")
    public Vehicle getVehicle(@PathVariable int id)
    {
        System.out.println("request came on "+LocalDateTime.now() + "  ++++++++++++++++++++++");
        return vehicleService.findById(id);
    }

    @GetMapping
    public List<Vehicle> getAllVehicles() {
        return vehicleService.findAll();
    }

}
