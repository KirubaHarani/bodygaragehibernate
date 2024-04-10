package com.bg.entity;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity

public class Customer {
 
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name = "custno")
	private int custno;
	
	@Column(name = "custname")
	private String custname;
	
	@Column(name = "gender")
	private String gender;
	
	@Column(name = "doj", columnDefinition = "DATE")
	private Date doj;
	
	@Column(name = "dob", columnDefinition = "DATE")
	private Date dob;
	
	@Column(name="age")
	private int age;
	
	@Column(name = "packages")
	private String packages;
	
	@Column(name = "occupation")
	private String occupation;
	
	@Column(name = "bloodgrp")
	private String bloodgrp;
	
	@Column(name = "height")
	private int height;
	
	@Column(name = "weight")
	private int weight;
	
	@Column(name = "bmi")
	private double bmi;
	
	@Column(name = "phno")
	private long phno;
	
	@Column(name = "emphno")
	private long emphno;
	
	@Column(name = "address")
	private String address;
	
	@Column(name = "registeredby")
	private String registeredby;
		 
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCustno() {
		return custno;
	}
	public void setCustno(int custno) {
		this.custno = custno;
	}
	public String getCustname() {
		return custname;
	}
	public void setCustname(String custname) {
		this.custname = custname;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Date getDoj() {
		return doj;
	}
	public void setDoj(Date doj) {
		this.doj = doj;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	
	
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getPackages() {
		return packages;
	}
	public void setPackages(String packages) {
		this.packages = packages;
	}
	public String getOccupation() {
		return occupation;
	}
	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}
	public String getBloodgrp() {
		return bloodgrp;
	}
	public void setBloodgrp(String bloodgrp) {
		this.bloodgrp = bloodgrp;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	public double getBmi() {
		return bmi;
	}
	public void setBmi(double bmi) {
		this.bmi = bmi;
	}
	public long getPhno() {
		return phno;
	}
	public void setPhno(long phno) {
		this.phno = phno;
	}
	public long getEmphno() {
		return emphno;
	}
	public void setEmphno(long emphno) {
		this.emphno = emphno;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getRegisteredby() {
		return registeredby;
	}
	public void setRegisteredby(String registeredby) {
		this.registeredby = registeredby;
	}
	
	@Override
	public String toString() {
		return "Customer [Id=" + id + ", custno=" + custno + ", custname=" + custname + ", gender=" + gender + ", doj="
				+ doj + ", dob=" + dob + ",age="+ age +  "packages=" + packages + ", occupation=" + occupation + ", bloodgrp="
				+ bloodgrp + ", height=" + height + ", weight=" + weight + ", bmi=" + bmi + ", phno=" + phno
				+ ", emphno=" + emphno + ", address=" + address + ", registeredby=" + registeredby + "]";
	}
	
	
	
	public Customer(int custno, String custname, String gender, Date doj, Date dob, int age, String packages,
			String occupation, String bloodgrp, int height, int weight, double bmi, long phno, long emphno,
			String address, String registeredby) {
		super();
		this.custno = custno;
		this.custname = custname;
		this.gender = gender;
		this.doj = doj;
		this.dob = dob;
		this.age = age;
		this.packages = packages;
		this.occupation = occupation;
		this.bloodgrp = bloodgrp;
		this.height = height;
		this.weight = weight;
		this.bmi = bmi;
		this.phno = phno;
		this.emphno = emphno;
		this.address = address;
		this.registeredby = registeredby;
	}
	public Customer(int id,int custno, String custname, String gender, Date doj, Date dob, int age, String packages, String occupation,
			String bloodgrp, int height, int weight, double bmi, long phno, long emphno, String address,
			String registeredby) {
		super();
		
		this.id=id;
		this.custno = custno;
		this.custname = custname;
		this.gender = gender;
		this.doj = doj;
		this.dob = dob;
		this.age=age;
		this.packages = packages;
		this.occupation = occupation;
		this.bloodgrp = bloodgrp;
		this.height = height;
		this.weight = weight;
		this.bmi = bmi;
		this.phno = phno;
		this.emphno = emphno;
		this.address = address;
		this.registeredby = registeredby;
	}
	
	public Customer(String custname, String gender, Date doj, Date dob, int age, String packages, String occupation,
			String bloodgrp, int height, int weight, double bmi, long phno, long emphno, String address,
			String registeredby) {
		super();
		
		
		
		this.custname = custname;
		this.gender = gender;
		this.doj = doj;
		this.dob = dob;
		this.age=age;
		this.packages = packages;
		this.occupation = occupation;
		this.bloodgrp = bloodgrp;
		this.height = height;
		this.weight = weight;
		this.bmi = bmi;
		this.phno = phno;
		this.emphno = emphno;
		this.address = address;
		this.registeredby = registeredby;
	}
	public Customer() {
		super();
	}
	
	
}
