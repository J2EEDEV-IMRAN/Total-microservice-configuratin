package com.imran.uc.service.email;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import java.util.Properties;
import java.util.concurrent.CompletableFuture;

/**
 * Created by jDuke.
 */
@Service
public class AmazonSESService {

    static final Logger LOGGER = LoggerFactory.getLogger(AmazonSESService.class);

    @Value("${spring.mail.sender.email.address}")
    private String senderEmailAddress;

    @Value("${spring.mail.host}")
    private String HOST;

    @Value("${spring.mail.port}")
    private String PORT;

    @Value("${spring.mail.smtp.username}")
    private String SMTP_USERNAME;

    @Value("${spring.mail.smtp.password}")
    private String SMTP_PASSWORD;



    @Async
    public  CompletableFuture<Boolean> sendEmail(String recipientEmailAddress, String subject, String body) throws Exception {

       Boolean isMailSend=Boolean.FALSE;

       if(recipientEmailAddress==null)
       {
           LOGGER.info("Sending email to: " + null);
           return CompletableFuture.completedFuture(isMailSend);
       }

        LOGGER.debug("From: {}", senderEmailAddress);
        LOGGER.debug("TO: {}", recipientEmailAddress);

        // sandbox, this address must be verified.
        // Create a Properties object to contain connection configuration information.
        LOGGER.info("Attaching mail properties.");
        Properties props = System.getProperties();
        props.put("mail.transport.protocol", "smtps");
        props.put("mail.smtp.port", PORT);

        // Set properties indicating that we want to use STARTTLS to encrypt the connection.
        // The SMTP session will begin on an unencrypted connection, and then the client
        // will issue a STARTTLS command to upgrade to an encrypted connection.
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.ssl.enable", "true");
        props.put("mail.smtp.starttls.required", "true");

        // Set properties indicating that we want to use STARTTLS to encrypt the connection.
        // The SMTP session will begin on an unencrypted connection, and then the client
        // will issue a STARTTLS command to upgrade to an encrypted connection.
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.starttls.required", "true");


        // Set properties indicating that we want to use STARTTLS to encrypt the connection.
        // The SMTP session will begin on an unencrypted connection, and then the client
        // will issue a STARTTLS command to upgrade to an encrypted connection.
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.starttls.required", "true");
        LOGGER.info("Attached.");

        // Create a Session object to represent a mail session with the specified properties.
        LOGGER.info("Creating mail session.");
        Session session = Session.getDefaultInstance(props);

        // Create a message with the specified information.
        LOGGER.info("Attaching MIME message.");
        MimeMessage msg = new MimeMessage(session);


        LOGGER.info("Sending email to: " + recipientEmailAddress);

        msg.setFrom(new InternetAddress(senderEmailAddress));
        msg.setRecipient(Message.RecipientType.TO, new InternetAddress(recipientEmailAddress));
        msg.setSubject(MimeUtility.encodeText(subject, "utf-8", null));
        msg.setContent(body, "text/html");

        // Create a transport.
        LOGGER.info("Creating email transport.");
        Transport transport = session.getTransport();

        // Send the message.
        try {
            LOGGER.info("Attempting to send an email through the Amazon SES SMTP interface...");

            // Connect to Amazon SES using the SMTP username and password you specified above.
            LOGGER.info("Connecting to {} Amazon SES...", HOST);
            transport.connect(HOST, SMTP_USERNAME, SMTP_PASSWORD);

            // Send the email.
            LOGGER.info("Sending email...");
            transport.sendMessage(msg, msg.getAllRecipients());
            LOGGER.info("Emails sent to '{}'!", recipientEmailAddress);
            isMailSend=Boolean.TRUE;
        } catch (Exception ex) {
            LOGGER.info("The email was not sent to '{}'.", recipientEmailAddress);
            LOGGER.error("An error occurred while attempting to send email to '{}'. \n The possible causes of the error are: ", recipientEmailAddress, ex);
        } finally {
            // Close and terminate the connection.
            transport.close();
        }
        return CompletableFuture.completedFuture(isMailSend);
    }
}
