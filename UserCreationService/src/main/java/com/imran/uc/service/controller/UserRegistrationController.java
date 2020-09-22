package com.imran.uc.service.controller;

import com.imran.uc.service.constant.AppConstant;
import com.imran.uc.service.user.dto.UserRegistrationDto;
import com.imran.uc.service.user.service.IUserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.util.LinkedHashMap;

/**
 * Created by jDuke
 */

@RestController
@RequestMapping(path = "/api" + AppConstant.API_VERSION +"/users", produces = { "application/json" })
public class UserRegistrationController {
    private static final Logger logger = LoggerFactory.getLogger(UserRegistrationController.class);
    private LinkedHashMap<String, Object> apiResponse;
    @Autowired
    IUserService iUserService;

    @PostMapping()
    ResponseEntity<?> saveUser(@RequestBody UserRegistrationDto userRegistrationDto) {
        LinkedHashMap<String, Object> apiResponse = new LinkedHashMap<>();
        apiResponse = new LinkedHashMap<String, Object>();
        try {
        	   boolean existsUserByPrimaryEmail = iUserService.isExistsUserByPrimaryEmail(userRegistrationDto.getPrimaryEmail());
        	 if (existsUserByPrimaryEmail) {
                 apiResponse.put("status", Boolean.TRUE);
                 apiResponse.put("message", "Username already exists!!");
                 return new ResponseEntity<Object>(apiResponse, new HttpHeaders(), HttpStatus.OK);
             }
            boolean isSavePatientVitals = iUserService.saveUser(userRegistrationDto);
            if (isSavePatientVitals) {
                apiResponse.put("status", Boolean.TRUE);
                apiResponse.put("message", "User record successfully saved!!");
                return new ResponseEntity<Object>(apiResponse, new HttpHeaders(), HttpStatus.OK);
            } else {
                apiResponse.put("status", Boolean.FALSE);
                apiResponse.put("message", "Sorry, User record not saved !!");
                return new ResponseEntity<Object>(apiResponse, new HttpHeaders(), HttpStatus.BAD_REQUEST);
            }

        } catch (Exception e) {
            logger.error("An error occurred during retrieved data ::" + e);
            apiResponse.put("status", Boolean.FALSE);
            apiResponse.put("message", "Sorry, unable to save data !!");
            return new ResponseEntity<Object>(apiResponse, new HttpHeaders(), HttpStatus.BAD_REQUEST);
        }
    }

}
