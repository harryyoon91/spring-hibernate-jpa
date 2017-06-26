package me.yonghak.vo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="LOCATIONS")
public class LocationVO {
	@Id
	@GeneratedValue
	private Integer location_id;
	private String city;
	private String country_id;
	
	public Integer getLocation_id() {
		return location_id;
	}
	public void setLocation_id(Integer location_id) {
		this.location_id = location_id;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCountry_id() {
		return country_id;
	}
	public void setCountry_id(String country_id) {
		this.country_id = country_id;
	}

	@Override
	public String toString() {
		return "LocationVO [location_id=" + location_id + ", city=" + city + ", country_id=" + country_id + "]";
	}
}
