package me.yonghak.vo;

import org.springframework.web.multipart.MultipartFile;

public class EmployeeForm {
	private MultipartFile file;

	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}

	@Override
	public String toString() {
		return "EmployeeForm [file=" + file + "]";
	}
	
	
}
