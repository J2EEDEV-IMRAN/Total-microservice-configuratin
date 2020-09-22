package com.imran.uc.service.user.domain;

import lombok.Data;

import javax.persistence.*;
/**
 * Created by jDuke
 */
@Entity
@Table(name="role")
@Data
public class Role {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "description")
	private String description;

	@Column(name = "name")
	private String name;


}
