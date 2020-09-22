package com.imran.uc.service.user.service;


import com.imran.uc.service.user.dto.UserRegistrationDto;

/**
 * Created by jDuke
 */
public interface IUserService {

    boolean saveUser(UserRegistrationDto userRegistrationDto);

    boolean isExistsUserByPrimaryEmail(String primaryEmail);

    void delete(long id);

	boolean confirmRegistrationByEmail(String emailFromToken);

	boolean generatePasswordResetEmail(String primaryEmail);

	boolean passwordRestByEmail(String emailFromToken,String resetPassword);
}
