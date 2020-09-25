package com.imran.allmodel.model.vehicle;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

import com.imran.allmodel.model.auditable.Auditable;


/**
 * @author Md Amran Hossain
 */

@Entity
@Table(name="vehicle")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Vehicle extends Auditable<Integer>{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String make;
    private String model;
    private String type;
    private Integer year;
    private Integer odometerValueOnRegister;
    private String color;
    private boolean isActive;



}
