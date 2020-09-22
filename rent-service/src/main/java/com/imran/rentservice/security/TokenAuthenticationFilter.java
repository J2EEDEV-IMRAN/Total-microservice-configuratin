package com.imran.rentservice.security;

import org.modelmapper.ModelMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.http.*;
import org.springframework.http.client.reactive.ClientHttpConnector;
import org.springframework.http.client.reactive.ReactorClientHttpConnector;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.reactive.function.client.WebClient;

import io.netty.channel.ChannelOption;
import io.netty.handler.timeout.ReadTimeoutHandler;
import io.netty.handler.timeout.WriteTimeoutHandler;
import reactor.netty.http.client.HttpClient;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;

import static org.springframework.http.HttpHeaders.AUTHORIZATION;

/**
 * Created by MD Amran Hossain
 */
@Component
public class TokenAuthenticationFilter {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	RestTemplate restTemplate;

	@Value("${api.user-service.token.verify}")
	String tokenVerifyAPI;

	ModelMapper modelMapper = new ModelMapper();

	@Bean
	public RestTemplate restTemplate() {
		return new RestTemplate();
	}
	
	String token;

//    @Autowired
//    public TokenAuthenticationFilter(RestTemplate restTemplate) {
//        this.restTemplate = restTemplate;
//    }
	// https://www.programcreek.com/java-api-examples/?api=org.springframework.security.authentication.UsernamePasswordAuthenticationToken
	// https://www.baeldung.com/role-and-privilege-for-spring-security-registration
	public Authentication getAuthentication(HttpServletRequest request) {

		 token = request.getHeader(AUTHORIZATION);
		Object object = null;
		if (token != null) {

			Collection<? extends GrantedAuthority> authorities = new ArrayList<>();
			boolean validJWT = validateJWT(token);
			

			HashMap<String, String> dataMap = new HashMap<>();
			dataMap.put("token", token);

			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_JSON);
			headers.set(AUTHORIZATION, token);
			HttpEntity<Object> entity = new HttpEntity<>(dataMap, headers);
			String[] tokentstring = token.split(" ");
			try {

				ResponseEntity<TokenInfoDto> tokenInfo = restTemplate.exchange(
						tokenVerifyAPI + "?token=" + tokentstring[1], HttpMethod.POST, entity, TokenInfoDto.class);

				if (tokenInfo != null) {
					System.out.println("++++++++++++++++ object is " + tokenInfo.getBody().getAuthorities());

					List<GrantedAuthority> authoritiesOfUser = new ArrayList<>();
					for (String privilege : tokenInfo.getBody().getAuthorities()) {
						authoritiesOfUser.add(new SimpleGrantedAuthority(privilege));
					}

					authorities = authoritiesOfUser;
					System.out.println("++++++++++++++++TOKENT INFO object is " + authorities);

				}

			} catch (Exception e) {
				logger.info("API CALL EXCEPTION 1");
				logger.error(e.getMessage());
			}

			return (validJWT) ? new UsernamePasswordAuthenticationToken("", token, authorities) : null;
		}
		return null;
	}

	public boolean validateJWT(String jwt) {
		HashMap<String, String> dataMap = new HashMap<>();
		dataMap.put("token", jwt);

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.set(AUTHORIZATION, jwt);
		HttpEntity<Object> entity = new HttpEntity<>(dataMap, headers);
		HttpStatus status = null;
		String[] tokentstring = jwt.split(" ");
		try {
			System.out.println(tokenVerifyAPI + "?token=" + tokentstring[1]);

			status = restTemplate
					.exchange(tokenVerifyAPI + "?token=" + tokentstring[1], HttpMethod.POST, entity, String.class)
					.getStatusCode();
			System.out.println("STATUS IS" + status);
		} catch (Exception e) {
			logger.info("API CALL EXCEPTION 2");
			logger.error(e.getMessage());
		}
		return (status == HttpStatus.OK);
		// return (true);
	}
	

}