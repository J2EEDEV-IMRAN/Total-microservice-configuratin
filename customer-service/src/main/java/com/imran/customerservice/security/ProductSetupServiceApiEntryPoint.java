package com.imran.customerservice.security;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.http.MediaType;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Serializable;
import java.nio.charset.StandardCharsets;
import java.util.Date;
import java.util.HashMap;

import static org.springframework.http.HttpStatus.UNAUTHORIZED;
/**
 * Created by MD Amran Hossain
 */
@Component
public class ProductSetupServiceApiEntryPoint implements AuthenticationEntryPoint, Serializable {

    private static final long serialVersionUID = -8970718410437077606L;

    private ObjectMapper objectMapper = new ObjectMapper();


    @Override
    public void commence(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException {
        response.setStatus(UNAUTHORIZED.value());
        response.setContentType(MediaType.APPLICATION_JSON_VALUE);
        response.setCharacterEncoding(StandardCharsets.UTF_8.toString());
        HashMap<String, Object> errorMap = new HashMap<>();
        errorMap.put("error", UNAUTHORIZED.getReasonPhrase());
        errorMap.put("timestamp", new Date().toString());
        errorMap.put("status", UNAUTHORIZED.value());
        errorMap.put("url", request.getRequestURL().toString());
        String json = objectMapper.writeValueAsString(errorMap);
        response.getWriter().write(json);
    }
}