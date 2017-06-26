package me.yonghak.vo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="DEPARTMENTS")
public class DepartmentVO {
	@Id
	@GeneratedValue
	private Integer department_id;
	private String department_name;
	private Integer location_id;
	@OneToOne
	@JoinColumn(name="location_id", referencedColumnName="location_id", insertable=false, updatable=false)
	private LocationVO location;
	
	public Integer getDepartment_id() {
		return department_id;
	}
	public void setDepartment_id(Integer department_id) {
		this.department_id = department_id;
	}
	public String getDepartment_name() {
		return department_name;
	}
	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}
	public Integer getLocation_id() {
		return location_id;
	}
	public void setLocation_id(Integer location_id) {
		this.location_id = location_id;
	}
	public LocationVO getLocation() {
		return location;
	}
	public void setLocation(LocationVO location) {
		this.location = location;
	}
	@Override
	public String toString() {
		return "DepartmentVO [department_id=" + department_id + ", department_name=" + department_name
				+ ", location_id=" + location_id + ", location=" + location + "]";
	}
}
