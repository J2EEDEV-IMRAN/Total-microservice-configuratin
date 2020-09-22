package com.imran.rentservice.service;



import java.util.List;
import java.util.concurrent.ExecutionException;

import javax.servlet.http.HttpServletRequest;

import com.imran.allmodel.model.rent.Rent;
import com.imran.rentservice.model.DetailResponse;


/**
 * @author Md Amran Hossain
 */
public interface RentService {
    Rent save(Rent customer);

    Rent findById(int id);

    List<Rent> findAll();

    DetailResponse findDetailResponse(int id,HttpServletRequest request) throws ExecutionException, InterruptedException;
}
