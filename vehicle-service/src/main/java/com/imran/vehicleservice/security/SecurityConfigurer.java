package com.imran.vehicleservice.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
/**
 * Created by MD Amran Hossain
 */
@Configuration
@EnableWebSecurity
public class SecurityConfigurer extends WebSecurityConfigurerAdapter {

    final JWTAuthenticationFilter jwtAuthenticationFilter;
    final ProductSetupServiceApiEntryPoint productSetupServiceApiEntryPoint;
    @Value("${config.security.securityEnabled:1}")
    private int securityEnabled;

    @Autowired
    public SecurityConfigurer(JWTAuthenticationFilter jwtAuthenticationFilter, ProductSetupServiceApiEntryPoint productSetupServiceApiEntryPoint) {
        this.jwtAuthenticationFilter = jwtAuthenticationFilter;
        this.productSetupServiceApiEntryPoint = productSetupServiceApiEntryPoint;
    }

    @Override
    protected void configure(HttpSecurity httpSecurity) throws Exception {

        if (securityEnabled == 1) {
            httpSecurity.authorizeRequests()
                    .antMatchers("/api/auth/**","/v2/api-docs", "/configuration/**", "/swagger*/**", "/webjars/**", "/api/v1/productVariant/**", "/api/v1/productVendor/**")
                    .permitAll()
                    .anyRequest().authenticated();
            httpSecurity.exceptionHandling().authenticationEntryPoint(productSetupServiceApiEntryPoint);
            httpSecurity.addFilterBefore(jwtAuthenticationFilter, UsernamePasswordAuthenticationFilter.class);
        } else {
            httpSecurity.authorizeRequests().anyRequest().permitAll();
        }
        httpSecurity.csrf().disable().sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS);

    }

    @Override
    public void configure(WebSecurity web) throws Exception {

        web.ignoring()
                .antMatchers("/resources/**", "/static/**", "/css/**", "/js/**", "/images/**", 
                		"/console/**",
                		"/v2/api-docs",
                        "/configuration/ui",
                        "/swagger-resources/**",
                        "/configuration/security",
                        "/swagger-ui.html",
                        "/webjars/**");
    }
}