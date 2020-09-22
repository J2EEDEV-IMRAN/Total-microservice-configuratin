package com.imran.uc.service.email;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.imran.uc.service.constant.AppConstant;



/**
 * Created by jDuke.
 */
@Component
public class GenerateTargetURL {
    private static final Logger LOGGER = LoggerFactory.getLogger(GenerateTargetURL.class);

    @Value("${uer.registration.confirmation.base.url}")
    private String uerRegistrationConfirmationBaseUrl;

    @Value("${uer.password.reset.base.url}")
    private String uerPasswordResetBaseUrl;

    public String registrationConfirmationLink(String token) {
        String url = null;
        if (token != null) {
            url = uerRegistrationConfirmationBaseUrl + AppConstant.QUESTION_MARK + "token=" + token;
        }
        return url;
    }

    public String passwordForgotUrl(String hash) {
        String url = null;
        if (hash != null) {
            url = uerPasswordResetBaseUrl + AppConstant.QUESTION_MARK + "hash=" + hash;
        }
        return url;
    }
}
