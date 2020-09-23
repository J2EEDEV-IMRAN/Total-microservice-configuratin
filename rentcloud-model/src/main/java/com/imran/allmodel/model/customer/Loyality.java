package com.imran.allmodel.model.customer;

import lombok.Data;

import javax.persistence.*;

import com.imran.allmodel.model.auditable.Auditable;

import java.time.LocalDateTime;

/**
 * @author Md Amran Hossain
 */

@Entity
@Table(name = "loyalityPoint")
@Data
public class Loyality extends Auditable<Integer> {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int transactionId;
    @ManyToOne
    @JoinColumn
    private Customer customer;
    private int point;
    private LocalDateTime expireDate;
}
