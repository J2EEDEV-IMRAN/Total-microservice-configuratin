package com.imran.uc.service.user.service;

import com.imran.uc.service.constant.AppConstant;
import com.imran.uc.service.email.AmazonSESService;
import com.imran.uc.service.email.FreemakerEmailProcessing;
import com.imran.uc.service.email.HashGenerator;
import com.imran.uc.service.user.domain.User;
import com.imran.uc.service.user.domain.Role;
import com.imran.uc.service.user.dto.UserRegistrationDto;
import com.imran.uc.service.user.repository.UserRepository;
import com.imran.uc.service.user.repository.UserRoleRepository;

import org.modelmapper.ModelMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CompletableFuture;

/**
 * @author JDuke
 */
@Service
public class UserServiceImpl implements IUserService {

    private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

    @Autowired
    UserRepository userRepository;

    @Autowired
    UserRoleRepository userRoleRepository;

    ModelMapper modelMapper;
    
    @Autowired
    FreemakerEmailProcessing freemakerEmailProcessing;
    
    @Autowired
    HashGenerator hashGenerator;

    @Autowired
    PasswordEncoder passwordEncoder;
    @Autowired
    AmazonSESService amazonSESService;
    @Override
    public boolean saveUser(UserRegistrationDto userDto) {

        modelMapper = new ModelMapper();
        boolean isUserCreated = false;
        try {


            logger.info("***********Start user creation*********");


            if (userDto == null || userDto.getPrimaryEmail() == null) {
                logger.info("***********User creation object null*********");
                return isUserCreated;
            }
            User userEntity = modelMapper.map(userDto, User.class);

            logger.info("***********Start set user role*********");
            List<Role> roles = new ArrayList<>();
            List<Long> roleIds = new ArrayList();
            for (Long roleId : roleIds) {
                Role userRole = userRoleRepository.findById(roleId).orElse(null);
                if (userRole != null) {
                    roles.add(userRole);
                }
            }
            userEntity.setRoles(roles);
            if (userEntity.getRoles().size() == 0) {
                logger.info("***********start set user default role as a *********");

                Role userRole = userRoleRepository.findByNameEquals(AppConstant.ROLE_GUEST_USER);
                if (userRole == null) {
                    logger.info("***********Guest User Role Not Found*********");
                    return isUserCreated;
                }
                roles.add(userRole);
                userEntity.setRoles(roles);
            }
            String encodePassword = "{bcrypt}" + passwordEncoder.encode(userEntity.getPassword());
            userEntity.setPassword(encodePassword);
            logger.info("***********Start saving user into db*********");
            User saveUser = userRepository.save(userEntity);
            logger.info("***********done*********");
            if (saveUser == null) {
                logger.info("***********User Not created*********");
                return isUserCreated;
            }
            logger.info("***********Start Sending email To User Primary Email*********");
            String toAddress=saveUser.getPrimaryEmail();
            String subject="USER REGISTRATION CONFIRMATION EMAIL";
            String body=freemakerEmailProcessing.registrationConfirmationEmail(saveUser.getFirstName() + " " + saveUser.getLastName(), saveUser.getPrimaryEmail(), hashGenerator.generateHash(saveUser.getPrimaryEmail())).get();
            CompletableFuture<Boolean> isMailSend= amazonSESService.sendEmail(toAddress,subject,body);
            isUserCreated = true;
        } catch (Exception ex) {
            logger.error("An error occurred while saving user data" + ex.getMessage());

        }
        return isUserCreated;
    }

    @Override
    public boolean isExistsUserByPrimaryEmail(String primaryEmail) {
        try {

            boolean isExsist = userRepository.existsByPrimaryEmailEquals(primaryEmail);
            return isExsist;

        } catch (Exception ex) {
            logger.error("An error occurred while retrieved user data" + ex.getMessage());

        }
        return false;
    }


    @Override
    public void delete(long id) {

    }
}
