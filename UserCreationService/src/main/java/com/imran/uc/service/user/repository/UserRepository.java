package com.imran.uc.service.user.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.imran.uc.service.user.domain.User;
/**
 * Created by jDuke
 */
public interface UserRepository extends JpaRepository<User, Long> {
	
boolean existsByPrimaryEmailEquals(String primaryEmail);
	
}
