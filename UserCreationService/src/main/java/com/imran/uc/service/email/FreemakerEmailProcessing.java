package com.imran.uc.service.email;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.CompletableFuture;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateNotFoundException;

@Component
public class FreemakerEmailProcessing {
    private static final Logger LOGGER = LoggerFactory.getLogger(FreemakerEmailProcessing.class);
    @Autowired
    GenerateTargetURL generateTargetURL;
    @Autowired
    private Configuration freemarkerConfig;
@Async
    public CompletableFuture<String> registrationConfirmationEmail(
            String fullName,
            String email,
            String hash) throws IOException, TemplateException {
        String htmlEmailBody = null;
        try {
            //Create Data Model
            Map<String, String> dataModelMap = new HashMap<String, String>();
            dataModelMap.put("name", fullName);
           dataModelMap.put("signInEmail", email);
           dataModelMap.put("registrationConfirmationLink", generateTargetURL.registrationConfirmationLink(hash));

            Template template = freemarkerConfig.getTemplate("registration-confirmation-email.ftl");
            htmlEmailBody = FreeMarkerTemplateUtils.processTemplateIntoString(template,dataModelMap);
            
        } catch (TemplateNotFoundException e) {
            LOGGER.info("Start process for Data Model" + e.getMessage());

        }
        return CompletableFuture.completedFuture(htmlEmailBody);
    }

    @Async
    public CompletableFuture<String> resetPasswordEmail(
            String fullName,
            String email,
            String token) throws IOException, TemplateException {
        String htmlEmailBody = null;
        try {
            //Create Data Model
            Map<String, String> dataModelMap = new HashMap<String, String>();
            dataModelMap.put("name", fullName);
            dataModelMap.put("resetUrl", generateTargetURL.passwordForgotUrl(token));

            Template template = freemarkerConfig.getTemplate("reset-password.ftl");
            htmlEmailBody = FreeMarkerTemplateUtils.processTemplateIntoString(template,dataModelMap);

        } catch (TemplateNotFoundException e) {
            LOGGER.info("Start process for Data Model" + e.getMessage());

        }
        return CompletableFuture.completedFuture(htmlEmailBody);
    }
}
