package com.imran.vehicleservice.service;



import java.util.List;

import org.springframework.data.domain.Page;

import com.imran.allmodel.model.vehicle.Vehicle;
import com.imran.vehicleservice.dto.VehicleDto;
import com.imran.vehicleservice.dto.VehicleSearchDto;

/**
 * @author Md Amran Hossain
 */
public interface VehicleService {
	
    boolean saveVehicle(VehicleDto VehicleDto, Integer loginUserId);

	List<VehicleDto> getAllVehicleList(VehicleSearchDto vehicleSearchDto);

	Page<VehicleDto> getVehiclePaginationList(VehicleSearchDto searchDto, Integer currentPage,
			Integer itemPerPage, String sortedBy);

	VehicleDto getVehicleById(Integer id);

	boolean deleteVehicleeById(Integer id);
}
