package com.imran.rentservice.service;

import com.imran.allmodel.model.customer.Customer;
import com.imran.allmodel.model.rent.Rent;
import com.imran.allmodel.model.vehicle.Vehicle;
import com.imran.rentservice.hystrix.CommonHysctrixCommand;
import com.imran.rentservice.hystrix.VehicleCommand;
import com.imran.rentservice.model.DetailResponse;
import com.imran.rentservice.repository.RentRepository;
import com.netflix.discovery.converters.Auto;
import com.netflix.hystrix.HystrixCommand;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.reactive.function.client.WebClient;

import static org.springframework.http.HttpHeaders.AUTHORIZATION;

import java.util.List;
import java.util.Optional;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

/**
 * @author Md Amran Hossain
 *         https://github.com/lokeshgupta1981/SpringExamples/blob/master/spring-reactive/src/main/java/com/howtodoinjava/reactive/demo/service/EmployeeService.java
 */
@Service
public class RentServiceImpl implements RentService {

	@Autowired
	RentRepository rentRepository;

	@Autowired
	HystrixCommand.Setter setter;

	// @LoadBalanced
	@Bean
	RestTemplate getRestTemplate(RestTemplateBuilder builder) {
		return builder.build();
	}

	@Autowired
	RestTemplate restTemplate;

	@Autowired
	WebClient webClient;

	@Override
	public Rent save(Rent customer) {
		return rentRepository.save(customer);
	}

	@Override
	public Rent findById(int id) {
		Optional<Rent> rent = rentRepository.findById(id);

		if (rent.isPresent())
			return rent.get();
		else
			return new Rent();

	}

	@Override
	public List<Rent> findAll() {
		return rentRepository.findAll();
	}

	public DetailResponse findDetailResponse(int id, HttpServletRequest request)
			throws ExecutionException, InterruptedException {

		Rent rent = findById(id);
		Customer customer = getCustomer(rent.getCustomerId(), request);
		Vehicle vehicle = getVehicle(rent.getVehicleId(), request);

		return new DetailResponse(rent, customer, vehicle);

	}

	public DetailResponse findDetailResponsefallback(int id) {
		return new DetailResponse(new Rent(), new Customer(), new Vehicle());
	}

	private Customer getCustomer(int customerId, HttpServletRequest request)
			throws ExecutionException, InterruptedException {

		CommonHysctrixCommand<Customer> customerCommonHysctrixCommand = new CommonHysctrixCommand<Customer>(setter,
				() -> {
					return webClient
							.get().uri("http://localhost:8062/services/customers/" + customerId)
							.header("Authorization", request.getHeader(AUTHORIZATION))
							.retrieve()
							.bodyToMono(Customer.class).block();
				}, () -> {
					return new Customer();
				});

		Future<Customer> customerFuture = customerCommonHysctrixCommand.queue();
		return customerFuture.get();

		// return restTemplate.getForObject("http://profileserver/services/customers/"+customerId,Customer.class);
		// return restTemplate.getForObject("http://localhost:8062/services/customers/"+customerId,Customer.class);
		// return webClient.get().uri("http://localhost:8062/services/customers/" +
		// customerId).header("Authorization",
		// request.getHeader(AUTHORIZATION)).retrieve().bodyToMono(Customer.class).block();
	}

	private Vehicle getVehicle(int vehicleId, HttpServletRequest request) {

		VehicleCommand vehicleCommand = new VehicleCommand(webClient, vehicleId,request);
		return vehicleCommand.execute();

		// return restTemplate.getForObject("http://localhost:8064/services/vehicles/"+vehicleId,Vehicle.class);

		//return webClient.get().uri("http://localhost:8064/services/vehicles/" + vehicleId).header("Authorization", request.getHeader(AUTHORIZATION)).retrieve().bodyToMono(Vehicle.class).block();

		// return
		// restTemplate.getForObject("http://vehicle/services/vehicles/"+vehicleId,Vehicle.class);

	}
}
