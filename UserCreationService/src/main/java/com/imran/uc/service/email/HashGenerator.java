package com.imran.uc.service.email;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.UUID;
@Component
public class HashGenerator {
    public String getUserNameFromHash(String username) {
        return Jwts.parser()
                .setSigningKey("userRegistration")
                .parseClaimsJws(username)
                .getBody().getSubject();
    }

    public String generateHash(String username) {


        Claims claims = Jwts.claims().setSubject(username);

        return Jwts.builder()
                .setClaims(claims)
                .setIssuedAt(new Date())
                .setExpiration(new Date((new Date()).getTime() + 604800000L))//after 7 days
                .signWith(SignatureAlgorithm.HS512, "userRegistration")
                .compact();
    }
    
}
