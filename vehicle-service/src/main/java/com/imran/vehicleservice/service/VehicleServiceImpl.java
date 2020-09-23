package com.imran.vehicleservice.service;

import org.apache.commons.lang3.StringUtils;
import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.imran.allmodel.model.vehicle.Vehicle;
import com.imran.vehicleservice.dto.VehicleDto;
import com.imran.vehicleservice.dto.VehicleSearchDto;
import com.imran.vehicleservice.predicates.VehiclePredicate;
import com.imran.vehicleservice.repository.VehicleRepository;
import com.querydsl.core.types.Predicate;

import java.lang.reflect.Type;
import java.util.List;

/**
 * @author Md amran Hossain
 */
@Service
public class VehicleServiceImpl implements VehicleService {
	private static final Logger LOGGER = LoggerFactory.getLogger(VehicleServiceImpl.class);
	private static final Type VEHICLE_LIST = new TypeToken<List<VehicleDto>>() {
	}.getType();
	@Autowired
	VehicleRepository vehicleRepository;

	@Autowired
	ModelMapper modelMapper;

	@Override
	public boolean saveVehicle(VehicleDto VehicleDto, Integer loginUserId) {

		boolean isSaveVehicle = false;
		try {
			LOGGER.info("*************Start saving Vehile*****************");
			Vehicle saveVehicleEntity = modelMapper.map(VehicleDto, Vehicle.class);
			if (saveVehicleEntity.getId() != null) {
				LOGGER.info("*************Start updating Vehicle*****************");
				Vehicle vehicle = vehicleRepository.findById(saveVehicleEntity.getId()).orElse(null);
				if (vehicle != null) {
					saveVehicleEntity.setMake(vehicle.getMake());
					saveVehicleEntity.setModel(vehicle.getModel());
					saveVehicleEntity.setType(vehicle.getType());
					saveVehicleEntity.setYear(vehicle.getYear());
					saveVehicleEntity.setOdometerValueOnRegister(vehicle.getOdometerValueOnRegister());
					saveVehicleEntity.setColor(vehicle.getColor());

					saveVehicleEntity.setActive(vehicle.isActive());
					saveVehicleEntity.setCreatedBy(vehicle.getCreatedBy());
					saveVehicleEntity.setCreatedOn(vehicle.getCreatedOn());
					saveVehicleEntity.setUpdatedBy(loginUserId);
				}

			} else {
				LOGGER.info("*************New record Vehicle*****************");
				saveVehicleEntity.setCreatedBy(loginUserId);
			}
			LOGGER.info("*************Start saving Vehicle*****************");
			vehicleRepository.save(saveVehicleEntity);
			LOGGER.info("*************saving process completed*****************");
			isSaveVehicle = true;
		} catch (Exception ex) {
			LOGGER.error("An error occurred while saving Vehicle" + ex.getMessage());
		}
		return isSaveVehicle;
	}

	@Override
	public List<VehicleDto> getAllVehicleList(VehicleSearchDto vehicleSearchDto) {
		try {

			Predicate predicate = VehiclePredicate.vehicleSearch(vehicleSearchDto);

			LOGGER.info("*************Start retrieve the process Vehicle list *****************");
			Iterable<Vehicle> vehiclePage = vehicleRepository.findAll(predicate);
			LOGGER.info("*************Process completed*****************");

			List<VehicleDto> vehicleDtoList = modelMapper.map(vehiclePage, VEHICLE_LIST);
			return vehicleDtoList;
		} catch (Exception ex) {
			LOGGER.error("error occurd while retrive vehicle data::" + ex);
		}
		return null;
	}
	
	@Override
	public Page<VehicleDto> getVehiclePaginationList(VehicleSearchDto searchDto, Integer currentPage,
			Integer itemPerPage, String sortedBy) {
		Pageable pageable;
		try {
			if (!StringUtils.isBlank(sortedBy)) {
				pageable = PageRequest.of(currentPage, itemPerPage, Sort.by(sortedBy).descending());
			} else {
				pageable = PageRequest.of(currentPage, itemPerPage, Sort.by("inventoryTypeName").ascending());
			}
			Predicate predicate = VehiclePredicate.vehicleSearch(searchDto);
			
			LOGGER.info("*************Start retrieve the process Vehicle list *****************") ;
			Page<Vehicle> vehiclePage = vehicleRepository.findAll(predicate, pageable);
			LOGGER.info("*************Process completed*****************") ;
			
			Page<VehicleDto> dtoPage = vehiclePage
					.map(vehicle -> new ModelMapper().map(vehicle, VehicleDto.class));
			return dtoPage;

		} catch (Exception ex) {
			LOGGER.error("error occurd while retrive Vehicle data::" + ex);
		}
		return null;
	}
	
	@Override
	public VehicleDto getVehicleById(Integer id) {
		VehicleDto vehicleDto = null;
		try {
			LOGGER.info("*************Start retrieve the process Vehicle *****************") ;
			Vehicle vehicle = vehicleRepository.findById(id).orElse(null);
			LOGGER.info("*************Process completed*****************") ;
			vehicleDto = modelMapper.map(vehicle, VehicleDto.class);
		} catch (Exception ex) {
			LOGGER.error("An error occurred while retiving Vehicle" + ex.getMessage());
		}
		return vehicleDto;
	}
	
	@Override
	public boolean deleteVehicleeById(Integer id) {
		try {
			LOGGER.info("*************Start retrieve the process Vehicle*****************") ;
			vehicleRepository.deleteById(id);
			LOGGER.info("*************deleting process completed*****************") ;
			if (!vehicleRepository.existsById(id)) {
				return Boolean.TRUE;
			} else {
				return Boolean.FALSE;
			}
		} catch (Exception ex) {
			LOGGER.info("An error occurred while deleting data from db::" + ex);
			return Boolean.FALSE;
		}
	}

	
}
