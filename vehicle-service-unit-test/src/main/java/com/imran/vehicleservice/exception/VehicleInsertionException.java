package com.imran.vehicleservice.exception;

/***
 *@author amran
 */

public class VehicleInsertionException extends RuntimeException {
    public VehicleInsertionException(String message) {
        super(message);
    }

    public VehicleInsertionException(String message, Throwable cause) {
        super(message, cause);
    }
}