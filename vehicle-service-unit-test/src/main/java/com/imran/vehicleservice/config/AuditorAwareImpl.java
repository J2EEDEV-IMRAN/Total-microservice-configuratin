package com.imran.vehicleservice.config;

import org.apache.commons.lang3.StringUtils;
import org.springframework.data.domain.AuditorAware;
//import org.springframework.security.core.context.SecurityContextHolder;

import com.imran.vehicleservice.constant.AppConstant;

import java.util.Optional;

public class AuditorAwareImpl implements AuditorAware<Integer> {

    @Override
    public Optional<Integer> getCurrentAuditor(){

			return Optional.of((Integer)AppConstant.SYSTEM_DEFAULT_INTEGER);
	 
    }
}
