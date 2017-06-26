package me.yonghak.vo;

public class HireYonghakForm {
	private String email;
	private String company;
	private String website;
	private String location;
	private String jobtype;
	private int salary;
	private String description;

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getJobtype() {
		return jobtype;
	}
	public void setJobtype(String jobtype) {
		this.jobtype = jobtype;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "HireYonghakForm [email=" + email + ", company=" + company + ", website=" + website + ", location="
				+ location + ", jobtype=" + jobtype + ", salary=" + salary + ", description=" + description + "]";
	}
}
