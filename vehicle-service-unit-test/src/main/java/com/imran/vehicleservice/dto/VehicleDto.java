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
	

	public VehicleDto(String make, String model, String type, Integer year, Integer odometerValueOnRegister,
			String color,boolean isActive) {
		super();
		this.make = make;
		this.model = model;
		this.type = type;
		this.year = year;
		this.odometerValueOnRegister = odometerValueOnRegister;
		this.color = color;
		this.isActive=isActive;
	}
	private Integer id;
	private String make;
	private String model;
	private String type;
	private Integer year;
	private Integer odometerValueOnRegister;
	private String color;
	private boolean isActive;
	

}
