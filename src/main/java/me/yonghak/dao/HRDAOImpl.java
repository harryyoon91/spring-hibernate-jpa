package me.yonghak.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import me.yonghak.vo.EmployeeVO;
import me.yonghak.vo.SearchForm;
import me.yonghak.vo.UserVO;

@Repository
public class HRDAOImpl implements HRDAO {

	private static final Logger logger = LoggerFactory.getLogger(HRDAOImpl.class);
	
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}
	
	@Override
	public void addEmployee(EmployeeVO emp) {
		Session session = sessionFactory.getCurrentSession();
		session.save(emp);
		logger.info("Emplyoee saved successfully, Employee Detail : " + emp);
	}

	@Override
	public void updateEmployee(EmployeeVO e) {
		Session session = sessionFactory.getCurrentSession();
		session.update(e);
		logger.info("Emplyoee updated successfully, Employee Detail : " + e);
	}

	@Override
	public List<EmployeeVO> getEmployeeList(SearchForm searchForm) {
		logger.info("SearchForm Detail :: "+searchForm);
		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(EmployeeVO.class, "employee");
		criteria.createAlias("employee.department", "department");
		criteria.createAlias("employee.department.location", "location");
		
		/*
		criteria.setProjection(Projections.projectionList());
		criteria.setFetchMode("employee.employee_id", FetchMode.JOIN);
		criteria.setFetchMode("employee.department.location_id", FetchMode.JOIN);
		Criteria departmentCriteria = session.createCriteria(DepartmentVO.class);
		Criteria locationCriteria = session.createCriteria(LocationVO.class);

		ProjectionList properties = Projections.projectionList();
		properties.add(Projections.property("employee_id"));
		properties.add(Projections.property("first_name"));
		properties.add(Projections.property("last_name"));
		properties.add(Projections.property("job_id"));
		properties.add(Projections.property("phone_number"));
		properties.add(Projections.property("salary"));
		properties.add(Projections.property("manager_id"));
		properties.add(Projections.property("user_id"));
		properties.add(Projections.property("department_id"));
		properties.add(Projections.property("department.department_id"));
		properties.add(Projections.property("department.department_name"));
		properties.add(Projections.property("department.location_id"));
		properties.add(Projections.property("location.location_id"));
		properties.add(Projections.property("location.city"));
		properties.add(Projections.property("location.country_id"));
		criteria.setProjection(properties);
		criteria.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);*/
		if (null != searchForm.getOpt()) {
			if (!"".equals(searchForm.getOpt())) {
				if ("employee_id".equals(searchForm.getOpt())) {
					criteria.add(Restrictions.eq(searchForm.getOpt(), Integer.parseInt(searchForm.getKeyword())));
				} else {
					criteria.add(Restrictions.like(searchForm.getOpt(), "%"+searchForm.getKeyword()+"%"));
				}
			}
		}
		if (null != searchForm.getMaxSalary()) {
			criteria.add(Restrictions.lt("salary", searchForm.getMaxSalary()));			
		}
		if (null != searchForm.getMinSalary()) {
			criteria.add(Restrictions.gt("salary", searchForm.getMinSalary()));
		}
		if (null != searchForm.getSort() || !"".equals(searchForm.getSort())) {
			if ("asc".equals(searchForm.getSort())) {
				criteria.addOrder(Order.asc(searchForm.getOrderBy()));
			} else if ("desc".equals(searchForm.getSort())) {
				criteria.addOrder(Order.desc(searchForm.getOrderBy()));
			}
		}
		criteria.setFirstResult((searchForm.getPageNo()-1)*searchForm.getDisplay());
		criteria.setMaxResults(searchForm.getDisplay());
		
		List<EmployeeVO> employeeList = criteria.list();
		logger.info("Employee List Size :: "+employeeList.size());
		return employeeList;
	}

	@Override
	public EmployeeVO getEmployeeByUserno(int userno) {
		Session session = this.sessionFactory.getCurrentSession();	
		Criteria criteria = session.createCriteria(EmployeeVO.class);
		criteria.add(Restrictions.eq("user_no", userno));
		EmployeeVO e = (EmployeeVO) criteria.uniqueResult();
		logger.info("Employee loaded successfully, Employee details = "+e);
		return e;
	}

	@Override
	public void deleteEmployeeByUserno(int userno) {
		Session session = this.sessionFactory.getCurrentSession();
		EmployeeVO e = (EmployeeVO) session.load(EmployeeVO.class, userno);
		if(null != e){
			session.delete(e);
		}
		logger.info("Employee deleted successfully, person details="+e);	
	}

	@Override
	public int getAllRows(SearchForm searchForm) {
		logger.info("SearchForm Detail :: " + searchForm);
		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(EmployeeVO.class);
		if (searchForm.getOpt() != null) {
			if (!"".equals(searchForm.getOpt())) {
				if ("employee_id".equals(searchForm.getOpt())) {
					criteria.add(Restrictions.eq(searchForm.getOpt(), Integer.parseInt(searchForm.getKeyword())));
				} else {
					criteria.add(Restrictions.like(searchForm.getOpt(), "%"+searchForm.getKeyword()+"%"));
				}
				//criteria.add(Property.forName(searchForm.getOpt()).like("%"+searchForm.getKeyword()+"%"));
			}
		}
		if (searchForm.getMaxSalary() != null) {
			criteria.add(Restrictions.lt("salary", searchForm.getMaxSalary()));			
		}
		if (searchForm.getMinSalary() != null) {
			criteria.add(Restrictions.gt("salary", searchForm.getMinSalary()));
		}
		
		criteria.setProjection(Projections.rowCount());
		long rows = (Long)criteria.uniqueResult();
		logger.info("Number of Rows :: " + rows);
		return (int)rows;
	}

	@Override
	public void addUser(UserVO user) {
		logger.info("SearchForm Detail :: " + user);
		Session session = this.sessionFactory.getCurrentSession();
		session.save(user);
	}

	@Override
	public int checkIdDuplication(String id) {
		logger.info("Checking ID :: " + id);
		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(UserVO.class);

		criteria.add(Restrictions.eq("id", id));				
		criteria.setProjection(Projections.rowCount());
		long checker = (Long)criteria.uniqueResult();
		logger.info("checker value :: " + checker + " id duplication :: " + (checker==0 ? "no duplication" : "duplicated") );
		return (int)checker;
	}

	@Override
	public int checkEmailDuplication(String email) {
		logger.info("Checking email :: " + email);
		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(UserVO.class);

		criteria.add(Restrictions.eq("email", email));				
		criteria.setProjection(Projections.rowCount());
		long checker = (Long)criteria.uniqueResult();
		logger.info("checker value :: " + checker + " email duplication :: " + (checker==0 ? "no duplication" : "duplicated") );
		return (int)checker;
	}

	@Override
	public int verificationCheck(String code) {
		logger.info("Checking code :: " + code);
		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(UserVO.class);

		criteria.add(Restrictions.eq("confirmlink", code));				
		criteria.setProjection(Projections.rowCount());
		long verifier = (Long)criteria.uniqueResult();
		logger.info("verification code value :: " + verifier + " code verfication :: " + (verifier==0 ? "wrong access" : "verified ! !") );
		return (int)verifier;
	}

	@Override
	public void verifiedYes(UserVO user) {
		logger.info("SearchForm Detail :: " + user);
		Session session = this.sessionFactory.getCurrentSession();
		session.update(user);
	}

	@Override
	public UserVO getUserByVericationCode(String code) {
		logger.info("Checking code :: " + code);
		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(UserVO.class);
		criteria.add(Restrictions.eq("confirmlink", code));	
		UserVO user = (UserVO)criteria.uniqueResult();
		logger.info("Searched User :: " + user);
		return user;
	}

	@Override
	public UserVO login(UserVO user) {
		logger.info("Accessing User : : " + user);
		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(UserVO.class);
		criteria.add(Restrictions.eq("id", user.getId()));
		criteria.add(Restrictions.eq("pwd", user.getPwd()));
		UserVO loginedUser= (UserVO) criteria.uniqueResult();
		logger.info("Logined User : : " + loginedUser);
		return loginedUser;
	}

	@Override
	public int checkCurrentPwd(String pwd) {
		logger.info("Checking pwd :: " + pwd);
		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(UserVO.class);

		criteria.add(Restrictions.eq("pwd", pwd));				
		criteria.setProjection(Projections.rowCount());
		long checker = (Long)criteria.uniqueResult();
		logger.info("checker value :: " + checker + " pwd correction :: " + (checker==0 ? "incorrect" : "correct") );
		return (int)checker;
	}

	@Override
	public void updateUser(UserVO user) {
		logger.info("User :: " + user);
		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(UserVO.class);
		criteria.add(Restrictions.eq("id", user.getId()));
		criteria.add(Restrictions.eq("email", user.getEmail()));
		criteria.add(Restrictions.eq("user_no", user.getUser_no()));
		session.update(user);
	}

	@Override
	public UserVO findUserByIdAndEmail(String id, String email) {
		logger.info("ID :: " + id + "  Email :: " + email);
		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(UserVO.class);
		criteria.add(Restrictions.eq("id", id));
		criteria.add(Restrictions.eq("email", email));
		
		UserVO checker = (UserVO)criteria.uniqueResult();
		logger.info("checker value :: " + checker + " user existence :: " + (checker==null ? "Not Exist" : "Exist") );
		
		return checker;
	}

	@Override
	public EmployeeVO getEmpByEmpId(int empid) {
		logger.info("Emp ID :: " + empid);
		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(EmployeeVO.class);
		criteria.add(Restrictions.eq("employee_id", empid));
		
		EmployeeVO emp = (EmployeeVO)criteria.uniqueResult();
		logger.info("emp value :: " + emp + " emp existence :: " + (emp==null ? "Not Exist" : "Exist") );
		return emp;
	}

	@Override
	public void deleteEmployeeByEmployeeVO(EmployeeVO emp) {
		logger.info("Employee :: " + emp);
		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(EmployeeVO.class);
		criteria.add(Restrictions.eq("user_no", emp.getUser_no()));
		session.delete(emp);
		logger.info("Employee :: Deleted");
	}

}
