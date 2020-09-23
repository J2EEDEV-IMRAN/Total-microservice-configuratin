package com.imran.vehicleservice.webrest;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.imran.allmodel.model.vehicle.Vehicle;
import com.imran.vehicleservice.VehicleServiceApplicationTests;
import com.imran.vehicleservice.dto.VehicleDto;
import com.imran.vehicleservice.repository.VehicleRepository;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.modelmapper.ModelMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.http.MediaType;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

@RunWith(SpringRunner.class)
@AutoConfigureMockMvc
public class InventoryTypeResourceTest extends VehicleServiceApplicationTests {
    private static final Logger LOGGER = LoggerFactory.getLogger(InventoryTypeResourceTest.class);

    @Autowired
    MockMvc mockMvc;
    @Autowired
    ModelMapper modelMapper;
    @Autowired
    VehicleRepository vehicleRepository;

    String json;

    Vehicle vehicleDto;

    @Before
    public void init() throws Exception {
        LOGGER.info("Start initialized mock json ");
        json = readJsonType("mocking-json/InventoryType.json");
        vehicleDto = new ObjectMapper().readValue(json, Vehicle.class);
        LOGGER.info("Done");
    }

    @Test
    public void TestInventoryTypeResource() throws Exception {
        ObjectMapper mapper = new ObjectMapper();

        LOGGER.info("************Start saving InventoryType entity data ****************");
        InventoryType saveInventoryType = inventoryTypeRepository.save(inventoryTypeDto);
        LOGGER.info("************Start saving InventoryType entity data ****************");

        LOGGER.info("*************Start testing inventoryType creation  api************");
        LOGGER.info("End Point::/api/v1/inventoryTypes");
        LOGGER.info("Method:POST");
        LOGGER.info("Call With Blank request body");

        mockMvc.perform(MockMvcRequestBuilders.post("/api/v1/inventoryTypes")
                .header(AppConstant.HEADER_CURRENT_LOGIN_USER_ID, AppConstant.SYSTEM_DEFAULT_UUID)
                .contentType(MediaType.APPLICATION_JSON).content(""))
                .andExpect(status().isBadRequest());

        LOGGER.info("retrun expected return");
        LOGGER.info("*************successfully inventoryType creation api*********");


        LOGGER.info("*************Start testing inventoryType creation api with valid request************");
        LOGGER.info("Call with valid request body");
        mockMvc.perform(MockMvcRequestBuilders.post("/api/v1/inventoryTypes")
                .header(AppConstant.HEADER_CURRENT_LOGIN_USER_ID, AppConstant.SYSTEM_DEFAULT_UUID)
                .contentType(MediaType.APPLICATION_JSON).content(mapper.writeValueAsString(saveInventoryType)))
                .andExpect(status().isCreated())
                .andExpect(content().contentType(MediaType.APPLICATION_JSON_UTF8));

        LOGGER.info("retrun expected return");
        LOGGER.info("*************successfully tested update api*********");
        LOGGER.info("*************successfully inventoryType creation api*********");


        LOGGER.info("*************Start testing inventoryType update  api************");
        LOGGER.info("End Point::/api/v1/inventoryTypes");
        LOGGER.info("Method:PUT");

        mockMvc.perform(MockMvcRequestBuilders.put("/api/v1/inventoryTypes")
                .header(AppConstant.HEADER_CURRENT_LOGIN_USER_ID, AppConstant.SYSTEM_DEFAULT_UUID)
                .contentType(MediaType.APPLICATION_JSON).content(mapper.writeValueAsString(saveInventoryType)))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_JSON_UTF8));
        LOGGER.info("retrun expected return");
        LOGGER.info("*************successfully inventoryType update api*********");

        LOGGER.info("End Point::/api/v1/inventoryTypes/{id}");
        LOGGER.info("Method:GET");
        LOGGER.info("*************Start Calling----");
        mockMvc.perform(
                MockMvcRequestBuilders.get("/api/v1/inventoryTypes/{id}", inventoryTypeDto.getInventoryTypeId())
                        .header(AppConstant.HEADER_CURRENT_LOGIN_USER_ID, AppConstant.SYSTEM_DEFAULT_UUID)
                        .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_JSON_UTF8));
        LOGGER.info("retrun expected return");
        LOGGER.info("*************successfully tested detele api*********");

        LOGGER.info("*************Start testing pageable List api----");
        LOGGER.info("*************Start generating search criteria request body *******---");

        InventoryTypeSearchDto searchDto = new InventoryTypeSearchDto();

        LOGGER.info("End Point::/api/v1/users/pageable/list?currentPage=0&itemPerPage=10");
        LOGGER.info("Method:POST");
        LOGGER.info("*************Start Calling----");
        mockMvc.perform(
                MockMvcRequestBuilders.post("/api/v1/inventoryTypes/pageable/list", inventoryTypeDto.getInventoryTypeId())
                        .header(AppConstant.HEADER_CURRENT_LOGIN_USER_ID, AppConstant.SYSTEM_DEFAULT_UUID)
                        .param(AppConstant.PAGINATION_CURRENT_PAGE, "0")
                        .param(AppConstant.PAGINATION_PAGE_SIZE, "10")
                        .param(AppConstant.PAGINATION_PAGE_SORTED_BY, "")
                        .contentType(MediaType.APPLICATION_JSON).content(mapper.writeValueAsString(searchDto)))

                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_JSON_UTF8));

        LOGGER.info("retrun expected return");
        LOGGER.info("*************successfully pageable List api*********");

        LOGGER.info("*************Start testing autocomplete list api ***********");
        LOGGER.info("End Point::/api/v1/users/autocomplete/list");
        LOGGER.info("Method:POST");
        LOGGER.info("*************Start Calling----");
        mockMvc.perform(
                MockMvcRequestBuilders.post("/api/v1/inventoryTypes/autocomplete/list", inventoryTypeDto.getInventoryTypeId())
                        .header(AppConstant.HEADER_CURRENT_LOGIN_USER_ID, AppConstant.SYSTEM_DEFAULT_UUID)
                        .contentType(MediaType.APPLICATION_JSON).content(mapper.writeValueAsString(searchDto)))
                .andExpect(status().isOk());
        LOGGER.info("retrun expected return");
        LOGGER.info("*************successfully tested autocomplete list api*********");

        LOGGER.info("*************Start Test inventoryType delete  api----");
        LOGGER.info("End Point::/api/v1/inventoryTypes/{id}");
        LOGGER.info("Method:DELETE");

        mockMvc.perform(
                MockMvcRequestBuilders.delete("/api/v1/inventoryTypes/{id}", inventoryTypeDto.getInventoryTypeId())
                        .header(AppConstant.HEADER_CURRENT_LOGIN_USER_ID, AppConstant.SYSTEM_DEFAULT_UUID)
                        .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_JSON_UTF8));
        LOGGER.info("retrun expected return");
        LOGGER.info("*************successfully tested detele api*********");
    }

}
