package com.imran.allmodel.model.customer;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QLoyality is a Querydsl query type for Loyality
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QLoyality extends EntityPathBase<Loyality> {

    private static final long serialVersionUID = -1708307950L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QLoyality loyality = new QLoyality("loyality");

    public final com.imran.allmodel.model.auditable.QAuditable _super = new com.imran.allmodel.model.auditable.QAuditable(this);

    public final NumberPath<Integer> createdBy = createNumber("createdBy", Integer.class);

    //inherited
    public final DateTimePath<java.util.Date> createdOn = _super.createdOn;

    public final QCustomer customer;

    public final DateTimePath<java.time.LocalDateTime> expireDate = createDateTime("expireDate", java.time.LocalDateTime.class);

    public final NumberPath<Integer> point = createNumber("point", Integer.class);

    public final NumberPath<Integer> transactionId = createNumber("transactionId", Integer.class);

    public final NumberPath<Integer> updatedBy = createNumber("updatedBy", Integer.class);

    //inherited
    public final DateTimePath<java.util.Date> updatedOn = _super.updatedOn;

    public QLoyality(String variable) {
        this(Loyality.class, forVariable(variable), INITS);
    }

    public QLoyality(Path<? extends Loyality> path) {
        this(path.getType(), path.getMetadata(), path.getMetadata().isRoot() ? INITS : PathInits.DEFAULT);
    }

    public QLoyality(PathMetadata metadata) {
        this(metadata, metadata.isRoot() ? INITS : PathInits.DEFAULT);
    }

    public QLoyality(PathMetadata metadata, PathInits inits) {
        this(Loyality.class, metadata, inits);
    }

    public QLoyality(Class<? extends Loyality> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.customer = inits.isInitialized("customer") ? new QCustomer(forProperty("customer")) : null;
    }

}

