package com.imran.vehicleservice.security;

import java.util.List;

import org.springframework.security.core.GrantedAuthority;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;

@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class TokenInfoDto {
	
	private String user_name;
	private List<String> authorities;

}
