package me.yonghak.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import me.yonghak.dao.HRDAO;
import me.yonghak.vo.EmployeeVO;
import me.yonghak.vo.SearchForm;
import me.yonghak.vo.UserVO;

@Service
public class HRServiceImpl implements HRService {

	private HRDAO hrDAO;
	public void setHrDAO(HRDAO hrDAO) {
		this.hrDAO = hrDAO;
	}

	@Override
	@Transactional
	public void addEmployee(EmployeeVO emp) {
		hrDAO.addEmployee(emp);
	}

	@Override
	@Transactional
	public void updateEmployee(EmployeeVO e) {
		//check the original exists
		EmployeeVO employee = hrDAO.getEmployeeByUserno(e.getEmployee_id());
		if (0 != employee.getEmployee_id()) {
			hrDAO.updateEmployee(e);
		}	
	}

	@Override
	@Transactional
	public List<EmployeeVO> getEmployeeList(SearchForm form) {
		List<EmployeeVO> lists = hrDAO.getEmployeeList(form);
		return lists;
	}

	@Override
	@Transactional
	public EmployeeVO getEmployeeByUserno(int userno) {
		EmployeeVO employee = hrDAO.getEmployeeByUserno(userno);
		return employee;
	}

	@Override
	@Transactional
	public void deleteEmployeeByUserno(int userno) {
		//check the original exists
		EmployeeVO employee = hrDAO.getEmployeeByUserno(userno);
		if (0 != employee.getEmployee_id()) {
			hrDAO.deleteEmployeeByUserno(userno);
		}		
	}

	@Override
	@Transactional
	public int getRowCount(SearchForm searchForm) {
		int rows = hrDAO.getAllRows(searchForm);
		return rows;
	}

	@Override
	@Transactional
	public void addUser(UserVO user) {
		hrDAO.addUser(user);
	}

	@Override
	@Transactional
	public int checkIdDuplication(String id) {
		int checker = hrDAO.checkIdDuplication(id);
		return checker;
	}

	@Override
	@Transactional
	public int checkEmailDuplication(String email) {
		int checker = hrDAO.checkEmailDuplication(email);
		return checker;
	}

	@Override
	@Transactional
	public int verificationCheck(String code) {
		int verifier = hrDAO.verificationCheck(code);
		if (1==verifier) {
			UserVO user = hrDAO.getUserByVericationCode(code);
			user.setVerified("Y");
			hrDAO.verifiedYes(user);
			return verifier;
		}
		return 0;
	}

	@Override
	@Transactional
	public UserVO login(UserVO user) {
		UserVO loginedUser = hrDAO.login(user);
		return loginedUser;
	}

	@Override
	@Transactional
	public int checkCurrentPwd(String pwd) {
		int checker = hrDAO.checkCurrentPwd(pwd);
		return checker;
	}

	@Override
	@Transactional
	public void updateUser(UserVO user) {
		hrDAO.updateUser(user);
	}

	@Override
	@Transactional
	public UserVO findUserByIdAndEmail(String id, String email) {
		UserVO checker = hrDAO.findUserByIdAndEmail(id, email);
		return checker;
	}

	@Override
	@Transactional
	public EmployeeVO getEmpByEmpId(int empid) {
		EmployeeVO emp = hrDAO.getEmpByEmpId(empid);
		return emp;
	}

	@Override
	@Transactional
	public void deleteEmployeeByEmployeeVO(EmployeeVO emp) {
		hrDAO.deleteEmployeeByEmployeeVO(emp);
	}
}
