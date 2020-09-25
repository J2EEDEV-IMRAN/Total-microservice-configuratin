
package com.imran.vehicleservice.service;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import com.imran.allmodel.model.vehicle.Vehicle;
import com.imran.vehicleservice.constant.AppConstant;
import com.imran.vehicleservice.dto.VehicleDto;
import com.imran.vehicleservice.dto.VehicleSearchDto;
import com.imran.vehicleservice.exception.VehicleInsertionException;
import com.imran.vehicleservice.repository.VehicleRepository;



import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.BDDMockito.given;
import static org.mockito.Mockito.*;

/***
 * @author amran
 */

@ExtendWith(MockitoExtension.class)
class VehicleServiceTest {

	@Mock
	private VehicleService vehicleService;

	@Mock
	private VehicleRepository vehicleRepository;

	@Test
	void shouldSavedUserSuccessFully() {
		final Vehicle vehicle = new Vehicle(1, "make1", "model1", "type1", 2020, 2020, "color1", true);
		final VehicleDto vehicleDto = new VehicleDto(1, "make1", "model1", "type1", 2020, 2020, "color1", true);

		given(vehicleRepository.findById(vehicle.getId())).willReturn(Optional.empty());
		given(vehicleRepository.save(vehicle)).willAnswer(invocation -> invocation.getArgument(0));

		boolean savedVehicle = vehicleService.saveVehicle(vehicleDto, AppConstant.SYSTEM_DEFAULT_INTEGER);

		assertThat(savedVehicle).isTrue();

		verify(vehicleRepository).save(any(Vehicle.class));

	}

	@Test
	void shouldThrowErrorWhenSaveUserWithExistingModel() {
		final Vehicle vehicle = new Vehicle(1, "make1", "model1", "type1", 2020, 2020, "color1", true);
		final VehicleDto vehicleDto = new VehicleDto(1, "make1", "model1", "type1", 2020, 2020, "color1", true);
		given(vehicleRepository.findByModel(vehicle.getModel())).willReturn(Optional.of(vehicle));

		assertThrows(VehicleInsertionException.class, () -> {
			vehicleService.saveVehicle(vehicleDto, AppConstant.SYSTEM_DEFAULT_INTEGER);
		});

		verify(vehicleRepository, never()).save(any(Vehicle.class));
	}

	@Test
	void updateVehicle() {
		final Vehicle vehicle = new Vehicle(1, "make1", "model1", "type1", 2020, 2020, "color1", true);
		final VehicleDto vehicleDto = new VehicleDto(1, "make1", "model1", "type1", 2020, 2020, "color1", true);
		given(vehicleRepository.save(vehicle)).willReturn(vehicle);

		final boolean expected = vehicleService.saveVehicle(vehicleDto, AppConstant.SYSTEM_DEFAULT_INTEGER);

		assertThat(expected).isTrue();

		verify(vehicleRepository).save(any(Vehicle.class));
	}

	@Test
	void shouldReturnFindAll() {
		VehicleSearchDto vehicleSearchDto = new VehicleSearchDto();
		List<Vehicle> vehicleList = new ArrayList();
		vehicleList.add(new Vehicle(1, "make1", "model1", "type1", 2020, 2020, "color1", true));
		vehicleList.add(new Vehicle(2, "make1", "model1", "type1", 2020, 2020, "color1", true));
		vehicleList.add(new Vehicle(3, "make1", "model1", "type1", 2020, 2020, "color1", true));

		given(vehicleRepository.findAll()).willReturn(vehicleList);

		List<VehicleDto> expected = vehicleService.getAllVehicleList(vehicleSearchDto);

		assertEquals(expected, vehicleList);
	}

	@Test
	void findVehicleById() {
		final Integer id = 1;
		final Vehicle vehicle = new Vehicle(1, "make1", "model1", "type1", 2020, 2020, "color1", true);

		given(vehicleRepository.findById(id)).willReturn(Optional.of(vehicle));

		final VehicleDto expected = vehicleService.getVehicleById(id);

		assertThat(expected).isNotNull();

	}

	@Test
	void shouldBeDelete() {
		final Integer vehicleId = 1;

		vehicleService.deleteVehicleeById(vehicleId);
		vehicleService.deleteVehicleeById(vehicleId);

		verify(vehicleRepository, times(2)).deleteById(vehicleId);
	}

}
