package com.imran.uc.service.user.repository;


import org.springframework.data.jpa.repository.JpaRepository;

import com.imran.uc.service.user.domain.Role;
/**
 * Created by jDuke
 */
public interface UserRoleRepository extends JpaRepository<Role, Long> {

	Role findByNameEquals(String name);
	
}
