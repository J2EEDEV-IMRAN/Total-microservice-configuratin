package com.imran.vehicleservice.controller;


import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.imran.vehicleservice.constant.AppConstant;
import com.imran.vehicleservice.dto.VehicleDto;
import com.imran.vehicleservice.dto.VehicleSearchDto;
import com.imran.vehicleservice.service.VehicleService;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.UUID;

/**
 * @author Md Amran Hossain
 */

@RestController
@RequestMapping(path = "/api" + AppConstant.API_VERSION + "/vehicles", produces = { "application/json" } ,consumes = { "application/json" } )
public class VehicleController {
	private static final Logger LOGGER = LoggerFactory.getLogger(VehicleController.class);
	
	private LinkedHashMap<String, Object> apiResponse;
    @Autowired
    VehicleService vehicleService;

    @PostMapping
    public ResponseEntity<?> save(@RequestBody VehicleDto vehicleDto,@RequestHeader(AppConstant.HEADER_CURRENT_LOGIN_USER_ID) Integer loginUserId) {
    	LinkedHashMap<String, Object> apiResponse = new LinkedHashMap<>();
        apiResponse = new LinkedHashMap<String, Object>();
        try {
        	
        	if (vehicleDto == null) {
				apiResponse.put("status", Boolean.FALSE);
				apiResponse.put("httpStatusCode", HttpStatus.BAD_REQUEST.value());
				apiResponse.put("message", "Request body empty !!");
				return new ResponseEntity<Object>(apiResponse, new HttpHeaders(), HttpStatus.BAD_REQUEST);
			}
        	  
            boolean isSaveVehicle = vehicleService.saveVehicle(vehicleDto , loginUserId);
            if (isSaveVehicle) {
				apiResponse.put("status", Boolean.TRUE);
				apiResponse.put("httpStatusCode", HttpStatus.CREATED.value());
				apiResponse.put("message", "Record successfully saved!!");
				return new ResponseEntity<Object>(apiResponse, new HttpHeaders(), HttpStatus.CREATED);
			} else {
				apiResponse.put("status", Boolean.FALSE);
				apiResponse.put("httpStatusCode", HttpStatus.OK.value());
				apiResponse.put("message", "Sorry, Vehicle Record data not saved !!");
				return new ResponseEntity<Object>(apiResponse, new HttpHeaders(), HttpStatus.OK);
			}

		} catch (Exception ex) {
			LOGGER.error("An error occurred during svaving data ::" + ex.getMessage());
			apiResponse.put("status", Boolean.FALSE);
			apiResponse.put("httpStatusCode", HttpStatus.INTERNAL_SERVER_ERROR.value());
			apiResponse.put("message", "Sorry, unable to save data !!");
			return new ResponseEntity<Object>(apiResponse, new HttpHeaders(), HttpStatus.INTERNAL_SERVER_ERROR);
		}
    }
    
    
    @PutMapping()
	ResponseEntity<?> updateInventoryType(@RequestBody VehicleDto vehicleDto,
			@RequestHeader(AppConstant.HEADER_CURRENT_LOGIN_USER_ID) Integer loginUserId) {
		LinkedHashMap<String, Object> apiResponse = new LinkedHashMap<>();
		apiResponse = new LinkedHashMap<String, Object>();
		try {
			if (vehicleDto == null || vehicleDto.getId() == null) {
				apiResponse.put("status", Boolean.FALSE);
				apiResponse.put("httpStatusCode", HttpStatus.BAD_REQUEST.value());
				apiResponse.put("message", "Request body empty !!");
				return new ResponseEntity<Object>(apiResponse, new HttpHeaders(), HttpStatus.BAD_REQUEST);
			}

			boolean isSaveInventoryType = vehicleService.saveVehicle(vehicleDto, loginUserId);
			if (isSaveInventoryType) {
				apiResponse.put("status", Boolean.TRUE);
				apiResponse.put("message", "Vehicle successfully updated !!");
				return new ResponseEntity<Object>(apiResponse, new HttpHeaders(), HttpStatus.OK);
			} else {
				apiResponse.put("status", Boolean.FALSE);
				apiResponse.put("httpStatusCode", HttpStatus.NOT_MODIFIED.value());
				apiResponse.put("message", "Sorry, Vehicle not updated !!");
				return new ResponseEntity<Object>(apiResponse, new HttpHeaders(), HttpStatus.NOT_MODIFIED);
			}

		} catch (Exception ex) {
			LOGGER.error("An error occurred during updating data ::" + ex.getMessage());
			apiResponse.put("status", Boolean.FALSE);
			apiResponse.put("httpStatusCode", HttpStatus.INTERNAL_SERVER_ERROR.value());
			apiResponse.put("message", "Sorry, unable to save data !!");
			return new ResponseEntity<Object>(apiResponse, new HttpHeaders(), HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
    
    @PostMapping("/autocomplete/list")
	ResponseEntity<?> getAllVehicleList(@RequestBody VehicleSearchDto vehicleSearchDto) {
		apiResponse = new LinkedHashMap<String, Object>();
		try {
			List<VehicleDto> list = vehicleService.getAllVehicleList(vehicleSearchDto);

			if (list == null || list.size() == 0) {
				apiResponse.put("status", Boolean.FALSE);
				apiResponse.put("httpStatusCode", HttpStatus.NOT_FOUND.value());
				apiResponse.put("message", "Vehicle list is empty !!");
				return new ResponseEntity<Object>(apiResponse, new HttpHeaders(), HttpStatus.NOT_FOUND);
			}
			return new ResponseEntity<Object>(list, new HttpHeaders(), HttpStatus.OK);

		} catch (Exception e) {
			LOGGER.info("An error occurred during retrieved data ::" + e);
			apiResponse.put("status", Boolean.FALSE);
			apiResponse.put("httpStatusCode", HttpStatus.INTERNAL_SERVER_ERROR.value());
			apiResponse.put("message", "Sorry, unable to retrieved data !!");
			return new ResponseEntity<Object>(apiResponse, new HttpHeaders(), HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
    
    @PostMapping("/pageable/list")
	ResponseEntity<?> getVehicleListWithPagination(@RequestBody VehicleSearchDto searchDto,
			@RequestParam(value = AppConstant.PAGINATION_CURRENT_PAGE) Integer currentPage,
			@RequestParam(value = AppConstant.PAGINATION_PAGE_SIZE) Integer itemPerPage,
			@RequestParam(value = AppConstant.PAGINATION_PAGE_SORTED_BY, required = false) String sortedBy) {
		apiResponse = new LinkedHashMap<String, Object>();
		try {
			Page<VehicleDto> list = vehicleService.getVehiclePaginationList(searchDto, currentPage,
					itemPerPage, sortedBy);
			if (list == null || list.getContent().size() == 0) {
				apiResponse.put("status", Boolean.FALSE);
				apiResponse.put("httpStatusCode", HttpStatus.NOT_FOUND.value());
				apiResponse.put("message", "InventoryType list is empty !!");
				return new ResponseEntity<Object>(apiResponse, new HttpHeaders(), HttpStatus.NOT_FOUND);
			}
			return new ResponseEntity<Object>(list, new HttpHeaders(), HttpStatus.OK);

		} catch (Exception e) {
			LOGGER.info("An error occurred during retrieved data ::" + e);
			apiResponse.put("status", Boolean.FALSE);
			apiResponse.put("httpStatusCode", HttpStatus.INTERNAL_SERVER_ERROR.value());
			apiResponse.put("message", "Sorry, unable to retrieved data !!");
			return new ResponseEntity<Object>(apiResponse, new HttpHeaders(), HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
    
    
    @GetMapping("/{id}")
	ResponseEntity<?> getVehicleById(@PathVariable(name = "id") Integer id) {
		apiResponse = new LinkedHashMap<String, Object>();
		try {
			if (id==null || StringUtils.isBlank(id.toString())) {
				apiResponse.put("status", Boolean.FALSE);
				apiResponse.put("httpStatusCode", HttpStatus.BAD_REQUEST.value());
				apiResponse.put("message", "Request body empty !!");
				return new ResponseEntity<Object>(apiResponse, new HttpHeaders(), HttpStatus.BAD_REQUEST);
			}
			VehicleDto vehicle = vehicleService.getVehicleById(id);
			
			if (vehicle == null) {
				apiResponse.put("status", Boolean.FALSE);
				apiResponse.put("httpStatusCode", HttpStatus.NOT_FOUND.value());
				apiResponse.put("message", "Vehicle is empty !!");
				return new ResponseEntity<Object>(apiResponse, new HttpHeaders(), HttpStatus.NOT_FOUND);
			}
			
			return new ResponseEntity<Object>(vehicle, new HttpHeaders(), HttpStatus.OK);

		} catch (Exception e) {
			LOGGER.info("An error occurred during retrieved data ::" + e);
			apiResponse.put("status", Boolean.FALSE);
			apiResponse.put("httpStatusCode", HttpStatus.INTERNAL_SERVER_ERROR.value());
			apiResponse.put("message", "Sorry, unable to retrieved data !!");
			return new ResponseEntity<Object>(apiResponse, new HttpHeaders(), HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@DeleteMapping("/{id}")
	ResponseEntity<?> deleteInventoryTypeById(@PathVariable(name = "id") Integer id) {
		apiResponse = new LinkedHashMap<String, Object>();
		try {
			if (id==null || StringUtils.isBlank(id.toString())) {
				apiResponse.put("status", Boolean.TRUE);
				apiResponse.put("httpStatusCode", HttpStatus.BAD_REQUEST.value());
				apiResponse.put("message", "Vehicle is null !!");
				return new ResponseEntity<Object>(apiResponse, new HttpHeaders(), HttpStatus.BAD_REQUEST);
			}
			boolean isInventoryType = vehicleService.deleteVehicleeById(id);
			if (isInventoryType) {
				apiResponse.put("status", Boolean.TRUE);
				apiResponse.put("message", "UserRole  record successfully deleted!!");
				return new ResponseEntity<Object>(apiResponse, new HttpHeaders(), HttpStatus.OK);
			} else {
				apiResponse.put("status", Boolean.FALSE);
				apiResponse.put("message", "Sorry, UserRole  record not deleted !!");
				return new ResponseEntity<Object>(apiResponse, new HttpHeaders(), HttpStatus.BAD_REQUEST);
			}

		} catch (Exception e) {
			LOGGER.info("An error occurred during delete data ::" + e);
			apiResponse.put("httpStatusCode", HttpStatus.INTERNAL_SERVER_ERROR.value());
			apiResponse.put("status", Boolean.FALSE);
			apiResponse.put("message", "Sorry, unable to delete data !!");
			return new ResponseEntity<Object>(apiResponse, new HttpHeaders(), HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
    

}
