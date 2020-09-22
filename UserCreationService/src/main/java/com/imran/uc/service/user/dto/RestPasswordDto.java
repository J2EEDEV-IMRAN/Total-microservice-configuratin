package com.imran.uc.service.user.dto;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;

@JsonIgnoreProperties(ignoreUnknown = true)
@Data
public class RestPasswordDto {
	
	private String resetPassword;

}
