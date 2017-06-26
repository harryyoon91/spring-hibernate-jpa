package me.yonghak.dao;

import java.util.List;

import me.yonghak.vo.EmployeeVO;
import me.yonghak.vo.SearchForm;
import me.yonghak.vo.UserVO;


public interface HRDAO {
	public void addEmployee(EmployeeVO e);
	public void updateEmployee(EmployeeVO e);
	public List<EmployeeVO> getEmployeeList(SearchForm form);
	public EmployeeVO getEmployeeByUserno(int userno);
	public void deleteEmployeeByUserno(int userno);
	public int getAllRows(SearchForm searchForm);
	public void addUser(UserVO user);
	public int checkIdDuplication(String id);
	public int checkEmailDuplication(String email);
	public int verificationCheck(String code);
	public void verifiedYes(UserVO user);
	public UserVO getUserByVericationCode(String code);
	public UserVO login(UserVO user);
	public int checkCurrentPwd(String pwd);
	public void updateUser(UserVO user);
	public UserVO findUserByIdAndEmail(String id, String email);
	public EmployeeVO getEmpByEmpId(int empid);
	public void deleteEmployeeByEmployeeVO(EmployeeVO emp);
}
