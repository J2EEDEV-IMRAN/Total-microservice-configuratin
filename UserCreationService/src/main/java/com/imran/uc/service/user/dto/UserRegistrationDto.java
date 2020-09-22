package com.imran.uc.service.user.dto;

import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;

/**
 * Created by jDuke
 */
@JsonIgnoreProperties(ignoreUnknown = true)
@Data
public class UserRegistrationDto {
	
	private String username;
	
	private String firstName;

	private String lastName;

	private String password;

	private String primaryEmail;

	private String primaryMobile;
	
	private List<Long> roleIds=new ArrayList();

}
