package com.imran.vehicleservice.constant;

/**
 * Created by jDuke
 */
public class AppConstant {
    public static final String API_VERSION = "/v1";
    public static final String API_REVISION = "1.0";
    public static final String ROLE_GUEST_USER = "ADMIN_USER".trim();
    public static final String QUESTION_MARK ="?";
    
    public static String WELCOME_EMAIL_SUBJECT = "Welcome to =?utf-8?q?Choukash=E2=84=A2?= Please confirm your e-mail address";
    public static String RESET_PWD_EMAIL_SUBJECT = "Welcome to =?utf-8?q?Choukash=E2=84=A2?= Please reset your password";
    
    public static final int RESET_PASSWORD_TOKEN_EXP_IN_DAYS = 30;
    
    public static final Integer SYSTEM_DEFAULT_INTEGER = 111111;

    public static final String HEADER_CURRENT_LOGIN_USER_ID = "LOGIN_USER_ID";

    public static final String PAGINATION_CURRENT_PAGE = "currentPage";

    public static final String PAGINATION_PAGE_SIZE = "itemPerPage";

    public static final String PAGINATION_PAGE_SORTED_BY = "sortedBy";
}
