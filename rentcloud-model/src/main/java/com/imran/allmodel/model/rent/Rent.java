package com.imran.allmodel.model.rent;

import lombok.Data;

import javax.persistence.*;

import com.imran.allmodel.model.auditable.Auditable;

import java.time.LocalDateTime;

/**
 * @author Md Amran Hossain
 */
@Entity
@Table(name = "rent")
@Data
public class Rent extends Auditable<Integer> {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int rentId;
    private int customerId;
    private int vehicleId;
    private LocalDateTime rentFrom;
    private LocalDateTime rentTill;
    private int currentOdometer;
    private String returnLocation;

}
