package com.imran.uc.service.user.dto;

import java.util.List;

import com.imran.uc.service.user.domain.Role;

import lombok.Data;

/**
 * Created by jDuke
 */
@Data
public class UserDto {

	private Long id;

	private String firstName;

	private String lastName;

	private String username;

	private List<Role> roles;

	private boolean isEmailOtpActive;

	private boolean isMobileOtpActive;

}
