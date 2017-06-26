package me.yonghak.vo;

public class SearchForm {
	
	private Integer display = 10;
	private Integer pageNo = 1;
	private String opt;
	private Integer minSalary;
	private Integer maxSalary;
	private String sort = "asc";
	private String orderBy = "employee_id";
	private String keyword;
	
	public Integer getDisplay() {
		return display;
	}
	public void setDisplay(Integer display) {
		this.display = display;
	}
	public Integer getPageNo() {
		return pageNo;
	}
	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
	public String getOpt() {
		return opt;
	}
	public void setOpt(String opt) {
		this.opt = opt;
	}
	public Integer getMinSalary() {
		return minSalary;
	}
	public void setMinSalary(Integer minSalary) {
		this.minSalary = minSalary;
	}
	public Integer getMaxSalary() {
		return maxSalary;
	}
	public void setMaxSalary(Integer maxSalary) {
		this.maxSalary = maxSalary;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getOrderBy() {
		return orderBy;
	}
	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	@Override
	public String toString() {
		return "SearchForm [display=" + display + ", pageNo=" + pageNo + ", opt=" + opt + ", minSalary=" + minSalary
				+ ", maxSalary=" + maxSalary + ", sort=" + sort + ", orderBy=" + orderBy + ", keyword=" + keyword + "]";
	}
}
