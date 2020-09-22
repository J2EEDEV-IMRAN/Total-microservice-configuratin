package com.imran.rentservice.hystrix;

import com.imran.allmodel.model.vehicle.Vehicle;
import com.netflix.hystrix.HystrixCommand;
import com.netflix.hystrix.HystrixCommandGroupKey;

import static org.springframework.http.HttpHeaders.AUTHORIZATION;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.client.RestTemplate;
import org.springframework.web.reactive.function.client.WebClient;

/**
 * @author Md Amran Hossain
 */
public class VehicleCommand extends HystrixCommand<Vehicle> {


    WebClient webClient;
    int vehicleId;
    HttpServletRequest request;



    public VehicleCommand(WebClient webClient, int vehicleId,HttpServletRequest request){

        super(HystrixCommandGroupKey.Factory.asKey("default"));
        this.webClient=webClient;
        this.vehicleId=vehicleId;
        this.request=request;
    }


    @Override
    protected Vehicle run() throws Exception {
        //return restTemplate.getForObject("http://vehicle/services/vehicles/"+vehicleId,Vehicle.class);
    	return webClient
    			.get()
    			.uri("http://localhost:8064/services/vehicles/" + vehicleId)
		        .header("Authorization", request.getHeader(AUTHORIZATION))
		        .retrieve()
		        .bodyToMono(Vehicle.class)
		        .block();
    }

    @Override
    protected Vehicle getFallback() {
        System.out.println("hit on fallback");
        return new Vehicle();
    }
}
