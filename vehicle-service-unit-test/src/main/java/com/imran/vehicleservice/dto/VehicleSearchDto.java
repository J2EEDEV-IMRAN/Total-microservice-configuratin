package com.imran.vehicleservice.dto;

import java.util.UUID;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@JsonIgnoreProperties(ignoreUnknown = true)
public class VehicleSearchDto {

	//private String make;
	private String model;
	//private String type;
	//private int year;
	//private int odometerValueOnRegister;
	//private String color;
	private String searchTerm;

}
