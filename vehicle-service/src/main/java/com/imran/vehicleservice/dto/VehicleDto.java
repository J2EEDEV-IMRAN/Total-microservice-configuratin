package com.imran.vehicleservice.dto;

import java.util.UUID;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@JsonIgnoreProperties(ignoreUnknown = true)
@NoArgsConstructor
@AllArgsConstructor
public class VehicleDto {

	private Integer id;
	private String make;
	private String model;
	private String type;
	private Integer year;
	private Integer odometerValueOnRegister;
	private String color;
	

}
