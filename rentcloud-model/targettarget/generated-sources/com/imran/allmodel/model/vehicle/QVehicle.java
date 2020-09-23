package com.imran.allmodel.model.vehicle;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QVehicle is a Querydsl query type for Vehicle
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QVehicle extends EntityPathBase<Vehicle> {

    private static final long serialVersionUID = -1811912097L;

    public static final QVehicle vehicle = new QVehicle("vehicle");

    public final com.imran.allmodel.model.auditable.QAuditable _super = new com.imran.allmodel.model.auditable.QAuditable(this);

    public final StringPath color = createString("color");

    public final NumberPath<Integer> createdBy = createNumber("createdBy", Integer.class);

    //inherited
    public final DateTimePath<java.util.Date> createdOn = _super.createdOn;

    public final NumberPath<Integer> id = createNumber("id", Integer.class);

    public final BooleanPath isActive = createBoolean("isActive");

    public final StringPath make = createString("make");

    public final StringPath model = createString("model");

    public final NumberPath<Integer> odometerValueOnRegister = createNumber("odometerValueOnRegister", Integer.class);

    public final StringPath type = createString("type");

    public final NumberPath<Integer> updatedBy = createNumber("updatedBy", Integer.class);

    //inherited
    public final DateTimePath<java.util.Date> updatedOn = _super.updatedOn;

    public final NumberPath<Integer> year = createNumber("year", Integer.class);

    public QVehicle(String variable) {
        super(Vehicle.class, forVariable(variable));
    }

    public QVehicle(Path<? extends Vehicle> path) {
        super(path.getType(), path.getMetadata());
    }

    public QVehicle(PathMetadata metadata) {
        super(Vehicle.class, metadata);
    }

}

