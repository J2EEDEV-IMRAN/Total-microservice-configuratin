package com.imran.uc.service.controller;

import com.imran.uc.service.constant.AppConstant;
import com.imran.uc.service.email.HashGenerator;
import com.imran.uc.service.user.dto.RestPasswordDto;
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
import java.util.UUID;

/**
 * Created by Md Amran Hossain
 */

@RestController
@RequestMapping(path = "/api" + AppConstant.API_VERSION +"/users", produces = { "application/json" })
public class UserRegistrationController {
    private static final Logger logger = LoggerFactory.getLogger(UserRegistrationController.class);
    private LinkedHashMap<String, Object> apiResponse;
    @Autowired
    IUserService iUserService;
    
    @Autowired
    HashGenerator hashGenerator;

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
    
    @PutMapping()
    ResponseEntity<?> emailOfRegistrationConfirmation(@RequestParam String token) {
        LinkedHashMap<String, Object> apiResponse = new LinkedHashMap<>();
        apiResponse = new LinkedHashMap<String, Object>();
        try {
        	   logger.info("********* token**********" + token);
        	   String emailFromToken= hashGenerator.getUserNameFromHash(token);
        	   logger.info("*********Email from token**********" + emailFromToken);
        	   boolean existsUserByPrimaryEmail = iUserService.isExistsUserByPrimaryEmail(emailFromToken);
        	 if (existsUserByPrimaryEmail == false) {
                 apiResponse.put("status", Boolean.FALSE);
                 apiResponse.put("message", "Username does not exists!!");
                 return new ResponseEntity<Object>(apiResponse, new HttpHeaders(), HttpStatus.BAD_REQUEST);
             }
            boolean isSavePatientVitals = iUserService.confirmRegistrationByEmail(emailFromToken);
            if (isSavePatientVitals) {
                apiResponse.put("status", Boolean.TRUE);
                apiResponse.put("message", "User record successfully updated!!");
                return new ResponseEntity<Object>(apiResponse, new HttpHeaders(), HttpStatus.OK);
            } else {
                apiResponse.put("status", Boolean.FALSE);
                apiResponse.put("message", "Sorry, User record not updated !!");
                return new ResponseEntity<Object>(apiResponse, new HttpHeaders(), HttpStatus.BAD_REQUEST);
            }

        } catch (Exception e) {
            logger.error("An error occurred while updating data ::" + e);
            apiResponse.put("status", Boolean.FALSE);
            apiResponse.put("message", "Sorry, unable to save data !!");
            return new ResponseEntity<Object>(apiResponse, new HttpHeaders(), HttpStatus.BAD_REQUEST);
        }
    }
    
    @GetMapping()
    ResponseEntity<?> getPasswordResetEmail(@RequestParam String primaryEmail) {
        LinkedHashMap<String, Object> apiResponse = new LinkedHashMap<>();
        apiResponse = new LinkedHashMap<String, Object>();
        try {
        	   logger.info("********* primaryEmail**********" + primaryEmail);
        	   boolean existsUserByPrimaryEmail = iUserService.isExistsUserByPrimaryEmail(primaryEmail);
        	 if (existsUserByPrimaryEmail == false) {
                 apiResponse.put("status", Boolean.FALSE);
                 apiResponse.put("message", "Username does not exists!!");
                 return new ResponseEntity<Object>(apiResponse, new HttpHeaders(), HttpStatus.BAD_REQUEST);
             }
            boolean  isEmailGenerated = iUserService.generatePasswordResetEmail(primaryEmail);
            if (isEmailGenerated) {
                apiResponse.put("status", Boolean.TRUE);
                apiResponse.put("message", "Password reset email successfully generated!!");
                return new ResponseEntity<Object>(apiResponse, new HttpHeaders(), HttpStatus.OK);
            } else {
                apiResponse.put("status", Boolean.FALSE);
                apiResponse.put("message", "Sorry, Password reset eamil not generated !!");
                return new ResponseEntity<Object>(apiResponse, new HttpHeaders(), HttpStatus.BAD_REQUEST);
            }

        } catch (Exception e) {
            logger.error("An error occurred while generating password reset email ::" + e);
            apiResponse.put("status", Boolean.FALSE);
            apiResponse.put("message", "Sorry, unable to send password reset email !!");
            return new ResponseEntity<Object>(apiResponse, new HttpHeaders(), HttpStatus.BAD_REQUEST);
        }
    }
    
    @PutMapping("/passwordreset")
    ResponseEntity<?> passwordResetFromEmail(@RequestParam String hash , @RequestBody RestPasswordDto restPasswordDto) {
        LinkedHashMap<String, Object> apiResponse = new LinkedHashMap<>();
        apiResponse = new LinkedHashMap<String, Object>();
        try {
        	
        	   logger.info("********* token**********" + hash);
        	   String emailFromToken= hashGenerator.getUserNameFromHash(hash);
        	   logger.info("*********Email from token**********" + emailFromToken);
        	   boolean existsUserByPrimaryEmail = iUserService.isExistsUserByPrimaryEmail(emailFromToken);
        	 if (existsUserByPrimaryEmail == false) {
                 apiResponse.put("status", Boolean.FALSE);
                 apiResponse.put("message", "Username does not exists!!");
                 return new ResponseEntity<Object>(apiResponse, new HttpHeaders(), HttpStatus.BAD_REQUEST);
             }
            boolean isUserUpdated = iUserService.passwordRestByEmail(emailFromToken,restPasswordDto.getResetPassword());
            if (isUserUpdated) {
                apiResponse.put("status", Boolean.TRUE);
                apiResponse.put("message", "User record successfully updated!!");
                return new ResponseEntity<Object>(apiResponse, new HttpHeaders(), HttpStatus.OK);
            } else {
                apiResponse.put("status", Boolean.FALSE);
                apiResponse.put("message", "Sorry, User record not updated !!");
                return new ResponseEntity<Object>(apiResponse, new HttpHeaders(), HttpStatus.BAD_REQUEST);
            }

        } catch (Exception e) {
            logger.error("An error occurred while updating data ::" + e);
            apiResponse.put("status", Boolean.FALSE);
            apiResponse.put("message", "Sorry, unable to save data !!");
            return new ResponseEntity<Object>(apiResponse, new HttpHeaders(), HttpStatus.BAD_REQUEST);
        }
    }

}
