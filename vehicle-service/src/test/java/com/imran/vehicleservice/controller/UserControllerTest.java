package com.imran.vehicleservice.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.imran.allmodel.model.vehicle.Vehicle;
import com.imran.vehicleservice.constant.AppConstant;
import com.imran.vehicleservice.dto.VehicleDto;
import com.imran.vehicleservice.dto.VehicleSearchDto;
import com.imran.vehicleservice.service.VehicleService;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
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
class UserControllerTest {

	@Autowired
	private MockMvc mockMvc;

	@MockBean
	private VehicleService vehicleService;

	private ObjectMapper objectMapper = new ObjectMapper();

	private List<VehicleDto> vehicleDtoList;

	@BeforeEach void setUp() { this.vehicleDtoList = new ArrayList<>();
	  this.vehicleDtoList.add(new VehicleDto(1,"make1","model1","type1",2020,2020,"color1"));
	  this.vehicleDtoList.add(new VehicleDto(2,"make1","model1","type1",2020,2020,"color1"));
	  this.vehicleDtoList.add(new VehicleDto(3,"make1","model1","type1",2020,2020,"color1"));
	  
	  /**
	   * private Integer id;

    private String make;
    private String model;
    private String type;
    private Integer year;
    private Integer odometerValueOnRegister;
    private String color;
    private boolean isActive;
	   */
	  
	  objectMapper.registerModule(new ProblemModule());
	  objectMapper.registerModule(new ConstraintViolationProblemModule()); }

	@Test
	void shouldFetchAllUsers() throws Exception {
		ObjectMapper objectMapper = new ObjectMapper();
        VehicleSearchDto searchDto=new VehicleSearchDto();
		
		given(vehicleService.getAllVehicleList(searchDto)).willReturn(vehicleDtoList);
		
		mockMvc.perform(
                MockMvcRequestBuilders.post("/api/v1/vehicles/autocomplete/list", vehicleDtoList.get(1).getId())
                        .header(AppConstant.HEADER_CURRENT_LOGIN_USER_ID, AppConstant.SYSTEM_DEFAULT_UUID)
                        .contentType(MediaType.APPLICATION_JSON).content(objectMapper.writeValueAsString(searchDto)))
                .andExpect(status().isOk());
		
		
	}

	/*
	 * @Test void shouldFetchOneUserById() throws Exception { final Long userId =
	 * 1L; final User user = new User(1L, "ten@mail.com", "teten", "teten");
	 * 
	 * given(userService.findUserById(userId)).willReturn(Optional.of(user));
	 * 
	 * this.mockMvc.perform(get("/api/users/{id}",
	 * userId)).andExpect(status().isOk()) .andExpect(jsonPath("$.email",
	 * is(user.getEmail()))).andExpect(jsonPath("$.name", is(user.getName()))); }
	 * 
	 * @Test void shouldReturn404WhenFindUserById() throws Exception { final Long
	 * userId = 1L;
	 * given(userService.findUserById(userId)).willReturn(Optional.empty());
	 * 
	 * this.mockMvc.perform(get("/api/user/{id}",
	 * userId)).andExpect(status().isNotFound()); }
	 * 
	 * @Test void shouldCreateNewUser() throws Exception {
	 * given(userService.createUser(any(User.class))).willAnswer((invocation) ->
	 * invocation.getArgument(0));
	 * 
	 * User user = new User(null, "newuser1@gmail.com", "pwd", "Name");
	 * 
	 * this.mockMvc
	 * .perform(post("/api/users").contentType(MediaType.APPLICATION_JSON_UTF8)
	 * .content(objectMapper.writeValueAsString(user)))
	 * .andExpect(status().isCreated()).andExpect(jsonPath("$.email",
	 * is(user.getEmail()))) .andExpect(jsonPath("$.password",
	 * is(user.getPassword()))) .andExpect(jsonPath("$.name", is(user.getName())));
	 * }
	 * 
	 * @Test void shouldReturn400WhenCreateNewUserWithoutEmail() throws Exception {
	 * User user = new User(null, null, "pwd", "Name");
	 * 
	 * this.mockMvc
	 * .perform(post("/api/users").contentType(MediaType.APPLICATION_JSON_UTF8)
	 * .content(objectMapper.writeValueAsString(user)))
	 * .andExpect(status().isBadRequest())
	 * .andExpect(header().string("Content-Type", is("application/problem+json")))
	 * .andExpect(jsonPath("$.type",
	 * is("https://zalando.github.io/problem/constraint-violation")))
	 * .andExpect(jsonPath("$.title",
	 * is("Constraint Violation"))).andExpect(jsonPath("$.status", is(400)))
	 * .andExpect(jsonPath("$.violations", hasSize(1)))
	 * .andExpect(jsonPath("$.violations[0].field", is("email")))
	 * .andExpect(jsonPath("$.violations[0].message",
	 * is("Email should not be empty"))).andReturn(); }
	 * 
	 * @Test void shouldUpdateUser() throws Exception { Long userId = 1L; User user
	 * = new User(userId, "user1@gmail.com", "pwd", "Name");
	 * given(userService.findUserById(userId)).willReturn(Optional.of(user));
	 * given(userService.updateUser(any(User.class))).willAnswer((invocation) ->
	 * invocation.getArgument(0));
	 * 
	 * this.mockMvc .perform(put("/api/users/{id}",
	 * user.getId()).contentType(MediaType.APPLICATION_JSON_UTF8)
	 * .content(objectMapper.writeValueAsString(user)))
	 * .andExpect(status().isOk()).andExpect(jsonPath("$.email",
	 * is(user.getEmail()))) .andExpect(jsonPath("$.password",
	 * is(user.getPassword()))) .andExpect(jsonPath("$.name", is(user.getName())));
	 * 
	 * }
	 * 
	 * @Test void shouldReturn404WhenUpdatingNonExistingUser() throws Exception {
	 * Long userId = 1L;
	 * given(userService.findUserById(userId)).willReturn(Optional.empty()); User
	 * user = new User(userId, "user1@gmail.com", "pwd", "Name");
	 * 
	 * this.mockMvc.perform(put("/api/users/{id}",
	 * userId).contentType(MediaType.APPLICATION_JSON_UTF8)
	 * .content(objectMapper.writeValueAsString(user))).andExpect(status().
	 * isNotFound());
	 * 
	 * }
	 * 
	 * @Test void shouldDeleteUser() throws Exception { Long userId = 1L; User user
	 * = new User(userId, "user1@gmail.com", "pwd", "Name");
	 * given(userService.findUserById(userId)).willReturn(Optional.of(user));
	 * doNothing().when(userService).deleteUserById(user.getId());
	 * 
	 * this.mockMvc.perform(delete("/api/users/{id}",
	 * user.getId())).andExpect(status().isOk()) .andExpect(jsonPath("$.email",
	 * is(user.getEmail()))) .andExpect(jsonPath("$.password",
	 * is(user.getPassword()))) .andExpect(jsonPath("$.name", is(user.getName())));
	 * 
	 * }
	 * 
	 * @Test void shouldReturn404WhenDeletingNonExistingUser() throws Exception {
	 * Long userId = 1L;
	 * given(userService.findUserById(userId)).willReturn(Optional.empty());
	 * 
	 * this.mockMvc.perform(delete("/api/users/{id}",
	 * userId)).andExpect(status().isNotFound());
	 * 
	 * }
	 */

}