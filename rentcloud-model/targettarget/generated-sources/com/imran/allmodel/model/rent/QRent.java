package com.imran.allmodel.model.rent;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QRent is a Querydsl query type for Rent
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QRent extends EntityPathBase<Rent> {

    private static final long serialVersionUID = -1132180285L;

    public static final QRent rent = new QRent("rent");

    public final com.imran.allmodel.model.auditable.QAuditable _super = new com.imran.allmodel.model.auditable.QAuditable(this);

    public final NumberPath<Integer> createdBy = createNumber("createdBy", Integer.class);

    //inherited
    public final DateTimePath<java.util.Date> createdOn = _super.createdOn;

    public final NumberPath<Integer> currentOdometer = createNumber("currentOdometer", Integer.class);

    public final NumberPath<Integer> customerId = createNumber("customerId", Integer.class);

    public final DateTimePath<java.time.LocalDateTime> rentFrom = createDateTime("rentFrom", java.time.LocalDateTime.class);

    public final NumberPath<Integer> rentId = createNumber("rentId", Integer.class);

    public final DateTimePath<java.time.LocalDateTime> rentTill = createDateTime("rentTill", java.time.LocalDateTime.class);

    public final StringPath returnLocation = createString("returnLocation");

    public final NumberPath<Integer> updatedBy = createNumber("updatedBy", Integer.class);

    //inherited
    public final DateTimePath<java.util.Date> updatedOn = _super.updatedOn;

    public final NumberPath<Integer> vehicleId = createNumber("vehicleId", Integer.class);

    public QRent(String variable) {
        super(Rent.class, forVariable(variable));
    }

    public QRent(Path<? extends Rent> path) {
        super(path.getType(), path.getMetadata());
    }

    public QRent(PathMetadata metadata) {
        super(Rent.class, metadata);
    }

}

