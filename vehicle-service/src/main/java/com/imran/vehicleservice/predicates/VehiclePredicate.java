
package com.imran.vehicleservice.predicates;

import org.apache.commons.lang3.StringUtils;

import com.imran.allmodel.model.vehicle.QVehicle;
import com.imran.vehicleservice.dto.VehicleDto;
import com.imran.vehicleservice.dto.VehicleSearchDto;
import com.querydsl.core.BooleanBuilder;
import com.querydsl.core.types.Predicate;

public class VehiclePredicate {

	private final static QVehicle qVehicle = QVehicle.vehicle;

	public VehiclePredicate() {
		super();
	}

	public static Predicate vehicleSearch(VehicleSearchDto searchDto) {
		BooleanBuilder b = new BooleanBuilder();

		if (searchDto != null) {

			if (!StringUtils.isBlank(searchDto.getModel())) {
				BooleanBuilder vehicleModelBB = new BooleanBuilder();
				vehicleModelBB
						.and(qVehicle.model.containsIgnoreCase(searchDto.getModel()));
				b.and(vehicleModelBB);
			}

			// global search predicate

			if (!StringUtils.isBlank(searchDto.getSearchTerm())) {
				BooleanBuilder searchTermIdBooleanBuilder = new BooleanBuilder();
				final String[] parts = searchDto.getSearchTerm().split("\\s+");

				if (parts.length >= 2) {
					for (String string : parts) {
						searchTermIdBooleanBuilder = searchTermIdBooleanBuilder
								.or(qVehicle.model.containsIgnoreCase(string));
					}
				} else {
					searchTermIdBooleanBuilder = searchTermIdBooleanBuilder
							.or(qVehicle.model.containsIgnoreCase(searchDto.getSearchTerm()));
				}
				b = b.and(searchTermIdBooleanBuilder);
			}
		}
		return b;
	}

}
