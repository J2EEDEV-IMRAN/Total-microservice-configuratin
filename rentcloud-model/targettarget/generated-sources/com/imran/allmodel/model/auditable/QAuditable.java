package com.imran.allmodel.model.auditable;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QAuditable is a Querydsl query type for Auditable
 */
@Generated("com.querydsl.codegen.SupertypeSerializer")
public class QAuditable extends EntityPathBase<Auditable<?>> {

    private static final long serialVersionUID = -1585239503L;

    public static final QAuditable auditable = new QAuditable("auditable");

    public final SimplePath<Object> createdBy = createSimple("createdBy", Object.class);

    public final DateTimePath<java.util.Date> createdOn = createDateTime("createdOn", java.util.Date.class);

    public final SimplePath<Object> updatedBy = createSimple("updatedBy", Object.class);

    public final DateTimePath<java.util.Date> updatedOn = createDateTime("updatedOn", java.util.Date.class);

    @SuppressWarnings({"all", "rawtypes", "unchecked"})
    public QAuditable(String variable) {
        super((Class) Auditable.class, forVariable(variable));
    }

    @SuppressWarnings({"all", "rawtypes", "unchecked"})
    public QAuditable(Path<? extends Auditable> path) {
        super((Class) path.getType(), path.getMetadata());
    }

    @SuppressWarnings({"all", "rawtypes", "unchecked"})
    public QAuditable(PathMetadata metadata) {
        super((Class) Auditable.class, metadata);
    }

}

