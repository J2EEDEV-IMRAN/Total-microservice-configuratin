package com.imran.allmodel.model.customer;

import lombok.Data;

import javax.persistence.*;

import com.imran.allmodel.model.auditable.Auditable;

import java.util.List;


/**
 * @author Md Amran Hossain
 */


@Entity
@Table(name = "customer")
@Data
public class Customer extends Auditable<Integer>{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;

    private String firstName;
    private String lastName;
    private String dlNumber;
    private String zipcode;
    @OneToMany(mappedBy = "customer")
    private List<Loyality> loyalities;


}
