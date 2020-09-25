package com.imran.vehicleservice.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.imran.allmodel.model.vehicle.Vehicle;
import com.imran.vehicleservice.constant.AppConstant;
import com.imran.vehicleservice.dto.VehicleDto;
import com.imran.vehicleservice.dto.VehicleSearchDto;
import com.imran.vehicleservice.service.VehicleService;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.zalando.problem.ProblemModule;
import org.zalando.problem.violations.ConstraintViolationProblemModule;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static org.hamcrest.Matchers.hasSize;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.BDDMockito.given;
import static org.mockito.Mockito.doNothing;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;
import static org.hamcrest.CoreMatchers.is;

/***
 * @ Md Amran Hossain
 */

@WebMvcTest(controllers = VehicleController.class)
@ActiveProfiles("test")
class VehicleControllerTest {
	private static final Logger LOGGER = LoggerFactory.getLogger(VehicleControllerTest.class);
	@Autowired
	private MockMvc mockMvc;

	@MockBean
	private VehicleService vehicleService;

	private ObjectMapper objectMapper = new ObjectMapper();

	private List<VehicleDto> vehicleDtoList;

	@BeforeEach
	void setUp() {
		this.vehicleDtoList = new ArrayList<>();
		this.vehicleDtoList.add(new VehicleDto(1, "make1", "model1", "type1", 2020, 2020, "color1",true));
		this.vehicleDtoList.add(new VehicleDto(2, "make1", "model1", "type1", 2020, 2020, "color1",true));
		this.vehicleDtoList.add(new VehicleDto(3, "make1", "model1", "type1", 2020, 2020, "color1",true));

		/**
		 * private Integer id;
		 * private String make; private String model; private String type; private
		 * Integer year; private Integer odometerValueOnRegister; private String color;
		 * private boolean isActive;
		 */

		objectMapper.registerModule(new ProblemModule());
		objectMapper.registerModule(new ConstraintViolationProblemModule());
	}

	@Test
	void saveVehicleBadRequestTest() throws Exception {
		final VehicleDto vehicleDto = new VehicleDto(1, "make1", "model1", "type1", 2020, 2020, "color1",true);

		mockMvc.perform(MockMvcRequestBuilders.post("/api/v1/vehicles")
				.header(AppConstant.HEADER_CURRENT_LOGIN_USER_ID, AppConstant.SYSTEM_DEFAULT_UUID)
				.contentType(MediaType.APPLICATION_JSON).content("")).andExpect(status().isBadRequest());

	}

	@Test
	void saveVehicleTest() throws Exception {
		ObjectMapper objectMapper = new ObjectMapper();
		final VehicleDto vehicleDto = new VehicleDto("make1", "model1", "type1", 2020, 2020, "color1",true);
		given(vehicleService.saveVehicle(any(VehicleDto.class), any(Integer.class))).willReturn(true);

		mockMvc.perform(MockMvcRequestBuilders.post("/api/v1/vehicles")
				.header(AppConstant.HEADER_CURRENT_LOGIN_USER_ID, AppConstant.SYSTEM_DEFAULT_INTEGER)
				.contentType(MediaType.APPLICATION_JSON).content(objectMapper.writeValueAsString(vehicleDto)))
				.andExpect(status().isCreated()).andExpect(content().contentType(MediaType.APPLICATION_JSON));
	}

	@Test
	void updateVehicleTest() throws Exception {
		ObjectMapper objectMapper = new ObjectMapper();
		//final Vehicle vehicle = new Vehicle(1, "make1", "model1", "type1", 2020, 2020, "color1", true);
		final VehicleDto vehicleDto = new VehicleDto(1, "make1", "model1", "type1", 2020, 2020, "color1",true);
		given(vehicleService.saveVehicle(any(VehicleDto.class), any(Integer.class))).willReturn(true);

		mockMvc.perform(MockMvcRequestBuilders.put("/api/v1/vehicles")
				.header(AppConstant.HEADER_CURRENT_LOGIN_USER_ID, AppConstant.SYSTEM_DEFAULT_INTEGER)
				.contentType(MediaType.APPLICATION_JSON).content(objectMapper.writeValueAsString(vehicleDto)))
				.andExpect(status().isOk()).andExpect(content().contentType(MediaType.APPLICATION_JSON));
	}
	@Test
	void updateVehicleBadRequestTest() throws Exception {
		ObjectMapper objectMapper = new ObjectMapper();
		given(vehicleService.saveVehicle(any(VehicleDto.class), any(Integer.class))).willReturn(true);

		mockMvc.perform(MockMvcRequestBuilders.put("/api/v1/vehicles")
				.header(AppConstant.HEADER_CURRENT_LOGIN_USER_ID, AppConstant.SYSTEM_DEFAULT_INTEGER)
				.contentType(MediaType.APPLICATION_JSON).content("")).andExpect(status().isBadRequest());
	}

	@Test
	void getAllVehicleList() throws Exception {

		ObjectMapper objectMapper = new ObjectMapper();
		VehicleSearchDto searchDto = new VehicleSearchDto();
		searchDto.setModel("BKH1213");
		LOGGER.info("***********Vehicle DTO IS " + vehicleDtoList);

		given(vehicleService.getAllVehicleList(any(VehicleSearchDto.class))).willReturn(vehicleDtoList);

		mockMvc.perform(MockMvcRequestBuilders.post("/api/v1/vehicles/autocomplete/list")
				.contentType(MediaType.APPLICATION_JSON).content(objectMapper.writeValueAsString(searchDto)))
				.andExpect(status().isOk());

	}

	@Test
	void getVehicleListWithPagination() throws Exception {

		ObjectMapper objectMapper = new ObjectMapper();

		LOGGER.info("***********Vehicle DTO IS " + vehicleDtoList);
		VehicleSearchDto searchDto = new VehicleSearchDto();
		searchDto.setModel("BKH1213");
		given(vehicleService.getAllVehicleList(any(VehicleSearchDto.class))).willReturn(vehicleDtoList);

		LOGGER.info("End Point::/api/v1/users/pageable/list?currentPage=0&itemPerPage=10");
		LOGGER.info("Method:POST");
		LOGGER.info("*************Start Calling----");
		mockMvc.perform(MockMvcRequestBuilders.post("/api/v1/vehicles/pageable/list")
				.header(AppConstant.HEADER_CURRENT_LOGIN_USER_ID, AppConstant.SYSTEM_DEFAULT_UUID)
				.param(AppConstant.PAGINATION_CURRENT_PAGE, "0").param(AppConstant.PAGINATION_PAGE_SIZE, "10")
				.param(AppConstant.PAGINATION_PAGE_SORTED_BY, "").contentType(MediaType.APPLICATION_JSON)
				.content(objectMapper.writeValueAsString(searchDto)))

				.andExpect(status().isOk()).andExpect(content().contentType(MediaType.APPLICATION_JSON));

	}

	@Test
	void getVehicleByIdTest() throws Exception {
		final Integer id = 1;
		final VehicleDto vehicleDto = new VehicleDto(1, "make1", "model1", "type1", 2020, 2020, "color1",true);

		given(vehicleService.getVehicleById(id)).willReturn(vehicleDto);
		mockMvc.perform(MockMvcRequestBuilders.get("/api/v1/vehicles/{id}", id).contentType(MediaType.APPLICATION_JSON))
				.andExpect(status().isOk()).andExpect(content().contentType(MediaType.APPLICATION_JSON));

	}

	@Test
	void DeleteVehicleTest() throws Exception {
		Integer id = 1;
		given(vehicleService.deleteVehicleeById(id)).willReturn(true);

		mockMvc.perform(MockMvcRequestBuilders.delete("/api/v1/vehicles/{id}", id)
				.header(AppConstant.HEADER_CURRENT_LOGIN_USER_ID, AppConstant.SYSTEM_DEFAULT_INTEGER)
				.contentType(MediaType.APPLICATION_JSON)).andExpect(status().isOk())
				.andExpect(content().contentType(MediaType.APPLICATION_JSON));

	}
	
	@Test
	void DeleteVehicleBadRequestTest() throws Exception {

	}

}