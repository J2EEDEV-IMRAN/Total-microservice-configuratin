package com.imran.customerservice.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.GenericFilterBean;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
/**
 * Created by MD Amran Hossain
 */
@Component
public class JWTAuthenticationFilter extends GenericFilterBean {

    final TokenAuthenticationFilter tokenAuthenticationFilter;

    @Autowired
    public JWTAuthenticationFilter(TokenAuthenticationFilter tokenAuthenticationFilter) {
        this.tokenAuthenticationFilter = tokenAuthenticationFilter;
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) throws IOException, ServletException {

        Authentication authentication = tokenAuthenticationFilter.getAuthentication((HttpServletRequest) request);

        SecurityContextHolder.getContext().setAuthentication(authentication);
        
        System.out.println("ALL AUTHORITIES AT LAST " + authentication.getAuthorities() + "-------------name "+authentication.getName()+"---------cerdential" + authentication.getCredentials());

        filterChain.doFilter(request, response);

    }

}