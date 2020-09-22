package com.imran.uc.service.user.domain;

import lombok.Data;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.util.List;

@Entity
@Table(name = "user")
@Data
/**
 * Created by Md Amran Hossain
 */
@JsonIgnoreProperties(ignoreUnknown = true)
public class User {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Basic(optional = false)
	@Column(name = "id")
	private Long id;

	@Column(name = "username")
	private String username;

	@Basic(optional = false)
	@Column(name = "firstName")
	private String firstName;

	@Basic(optional = false)
	@Column(name = "lastName")
	private String lastName;

	@Basic(optional = false)
	@Column(name = "password")
	private String password;

	@Column(name = "primaryEmail", unique = true)
	private String primaryEmail;

	@Column(name = "primaryMobile", unique = true)
	private String primaryMobile;

	/**
	 * Roles are being eagerly loaded here because they are a fairly small
	 * collection of items for this example.
	 */
	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "role_user", joinColumns = {
			@JoinColumn(name = "user_id", referencedColumnName = "id") }, inverseJoinColumns = {
					@JoinColumn(name = "role_id", referencedColumnName = "id") })
	private List<Role> roles;

	@Column(name = "isEmailOtpActive")
	private boolean isEmailOtpActive = false;

	@Column(name = "isMobileOtpActive")
	private boolean isMobileOtpActive = false;

	@Column(name = "active")
	private boolean active = true;

	@Column(name = "accountNonExpired")
    private boolean accountNonExpired;
	
    @Column(name = "credentialsNonExpired")
    private boolean credentialsNonExpired;
    
    @Column(name = "accountNonLocked")
    private boolean accountNonLocked;
}
