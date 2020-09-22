package com.imran.authorizationserver.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.imran.authorizationserver.model.User;

import java.util.Optional;

public interface UserDetailRepository extends JpaRepository<User,Integer> {


    Optional<User> findByUsername(String name);

}
