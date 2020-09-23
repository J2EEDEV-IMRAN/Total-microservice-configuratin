package com.imran.allmodel.model.customer;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QCustomer is a Querydsl query type for Customer
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QCustomer extends EntityPathBase<Customer> {

    private static final long serialVersionUID = 662187747L;

    public static final QCustomer customer = new QCustomer("customer");

    public final com.imran.allmodel.model.auditable.QAuditable _super = new com.imran.allmodel.model.auditable.QAuditable(this);

    public final NumberPath<Integer> createdBy = createNumber("createdBy", Integer.class);

    //inherited
    public final DateTimePath<java.util.Date> createdOn = _super.createdOn;

    public final StringPath dlNumber = createString("dlNumber");

    public final StringPath firstName = createString("firstName");

    public final NumberPath<Integer> id = createNumber("id", Integer.class);

    public final StringPath lastName = createString("lastName");

    public final ListPath<Loyality, QLoyality> loyalities = this.<Loyality, QLoyality>createList("loyalities", Loyality.class, QLoyality.class, PathInits.DIRECT2);

    public final NumberPath<Integer> updatedBy = createNumber("updatedBy", Integer.class);

    //inherited
    public final DateTimePath<java.util.Date> updatedOn = _super.updatedOn;

    public final StringPath zipcode = createString("zipcode");

    public QCustomer(String variable) {
        super(Customer.class, forVariable(variable));
    }

    public QCustomer(Path<? extends Customer> path) {
        super(path.getType(), path.getMetadata());
    }

    public QCustomer(PathMetadata metadata) {
        super(Customer.class, metadata);
    }

}

