package me.yonghak.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import me.yonghak.service.HRService;
import me.yonghak.util.MD5;
import me.yonghak.util.MailSend;
import me.yonghak.view.DownloadView;
import me.yonghak.vo.DepartmentVO;
import me.yonghak.vo.EmployeeForm;
import me.yonghak.vo.EmployeeVO;
import me.yonghak.vo.LocationVO;
import me.yonghak.vo.Pagination;
import me.yonghak.vo.SearchForm;
import me.yonghak.vo.UserVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HRController {
	
	@Autowired
	private HRService hrService;
	
	@Autowired
	DownloadView downloadView;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/hr/hr", method = RequestMethod.GET)
	public String hrGet(SearchForm searchForm, Model m, UserVO user) {
		logger.info("SearchForm : " + searchForm);
		int rows = hrService.getRowCount(searchForm);
		
		List<EmployeeVO> employeeList = hrService.getEmployeeList(searchForm);
		m.addAttribute("employeeList", employeeList);
		
		Pagination pagination = null;
		if (searchForm.getDisplay() != 0) {
			pagination = new Pagination(searchForm.getDisplay(), searchForm.getPageNo(), rows);
		} else {
			pagination = new Pagination(10, searchForm.getPageNo(), rows);
		}
		m.addAttribute("pagination", pagination);
		m.addAttribute("searchform", searchForm);
		
		return "hr/hr";
	}
	
	@RequestMapping(value = "/hr/hr", method = RequestMethod.POST)
	public String hrPost(SearchForm searchForm, Model m) {
		logger.info("SearchForm : " + searchForm);
		int rows = hrService.getRowCount(searchForm);
		
		List<EmployeeVO> employeeList = hrService.getEmployeeList(searchForm);
		m.addAttribute("employeeList", employeeList);
		
		Pagination pagination = null;
		if (searchForm.getDisplay() != 0) {
			pagination = new Pagination(searchForm.getDisplay(), searchForm.getPageNo(), rows);
		} else {
			pagination = new Pagination(10, searchForm.getPageNo(), rows);
		}
		logger.info("pagination : " + pagination + " beginPage : " + pagination.getBeginPage() + " endPage : " + pagination.getEndPage());
		m.addAttribute("pagination", pagination);
		logger.info("searchform : " + searchForm);
		m.addAttribute("searchform", searchForm);
		
		return "hr/hr";
	}
	
	@RequestMapping(value = "/hr/register", method = RequestMethod.GET)
	public String registerGet(Model m, @ModelAttribute("user") UserVO user) {
		return "hr/register";
	}
	
	@RequestMapping(value = "/hr/register", method = RequestMethod.POST)
	public String registerPost(Model m, @ModelAttribute("user") UserVO user) {
		logger.info("user id : " + user);
		//MD5
		String pwd;
		try {
			pwd = MD5.hash(user.getPwd());
		} catch (Exception e) {
			throw new RuntimeException("Password Double Encryption Processing.");
		}
		user.setPwd(pwd);
		String confirmlink;
		try {
			confirmlink = MD5.hash(pwd+user.getEmail()+System.currentTimeMillis());
		} catch (Exception e) {
			throw new RuntimeException("Password Double Encryption Processing.");
		}
		user.setConfirmlink(confirmlink);
		hrService.addUser(user);
		MailSend mailsend = new MailSend();
		mailsend.sendmail("[Yonghak Yoon Portfolio Email Verification] Please, verify your email to complete register!", user.getEmail(), "http://yonghak.me/hr/verification/"+confirmlink);
		m.addAttribute("process", "registered");
		return "redirect:/hr/success";
	}
	
	@RequestMapping(value = "/hr/login", method = RequestMethod.GET)
	public String loginGet(Model m, @ModelAttribute("user") UserVO user) {
		return "hr/login";
	}
	
	@RequestMapping(value = "/hr/login", method = RequestMethod.POST)
	public String loginPost(Model m, @ModelAttribute("user") UserVO user, HttpSession session) {
		logger.info("login user info : : " + user);
		try {
			user.setPwd(MD5.hash(user.getPwd()));
		} catch(Exception e) {
			throw new RuntimeException("Password Double Encryption Processing.");
		}

		UserVO loginedUser = hrService.login(user);
		if (loginedUser==null) {
			m.addAttribute("process", "login-fail");	
			return "hr/login";
		}
		if ("N".equals(loginedUser.getVerified())) {
			m.addAttribute("process", "no-verified");	
			return "hr/login";
		}
		logger.info("LOGIN SUCCESS : : " + loginedUser);
		session.setAttribute("LOGINED_USER", loginedUser);
		return "redirect:/hr/hr";
	}
	
	@RequestMapping(value = "/hr/verification/{code}", method = RequestMethod.GET)
	public String verificationGet(Model m, @PathVariable("code") String code,  @ModelAttribute("user") UserVO user) {
		logger.info("verfication code : " + code);
		int verifier = hrService.verificationCheck(code);
		if (1==verifier) {
			m.addAttribute("process", "verified");	
		} else {
			m.addAttribute("process", "verified-fail");	
		}
		return "redirect:/hr/success";
	}
	
	@RequestMapping(value = "/hr/logout", method = RequestMethod.GET)
	public String logoutGet(Model m, HttpSession session) {
		try {
			session.invalidate();
		} catch (Exception e) {
			throw new RuntimeException("Log out processing.");
		}
		logger.info("Log Out Success : : ");
		return "redirect:/hr/hr";
	}
	
	@RequestMapping(value = "/hr/add/downloadform", method = RequestMethod.GET)
	public ModelAndView addFormDownload(Model m, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String directory = "type file directory here";
		String filename = "add_employee_form.xlsx";
		mav.addObject("directory", directory);
		mav.addObject("filename", filename);
		mav.setView(downloadView);
		
		return mav;
	}
	
	@RequestMapping(value = "/hr/add", method = RequestMethod.GET)
	public String addEmployeeGet(Model m, UserVO user) {
		logger.info("user : " + user);

		return "hr/add";
	}
	
	@RequestMapping(value="/hr/add", method=RequestMethod.POST)
	public String employeeUpload(Model m, @ModelAttribute("employeeform") EmployeeForm employeeform, UserVO user, HttpSession session) {
		logger.info("EMPLOYEE FORM  : : " + employeeform);
		user = (UserVO)session.getAttribute("LOGINED_USER");
		MultipartFile upfile = employeeform.getFile();
		EmployeeVO emp = new EmployeeVO();
		Map<Integer, String> map = new HashMap<Integer,String>();
		
		if (!upfile.isEmpty()) {
			try {
				XSSFWorkbook workbook = new XSSFWorkbook(upfile.getInputStream());
				XSSFSheet sheet = workbook.getSheetAt(0);
				int rowSize = sheet.getPhysicalNumberOfRows();
				for (int i=1; i<rowSize; i++) {
					XSSFRow row = sheet.getRow(i);
					map.put(i, row.getCell(1).getStringCellValue());
				}
				emp.setUser_no(user.getUser_no());
				emp.setFirst_name(map.get(1));
				emp.setLast_name(map.get(2));
				emp.setJob_id(map.get(3));
				emp.setSalary((Integer.parseInt(map.get(4))));
				emp.setManager_id((Integer.parseInt(map.get(5))));
				emp.setDepartment_id((Integer.parseInt(map.get(6))));
				emp.setUser_no(user.getUser_no());
				logger.info("EMPLOYEE INFO : : " + emp);
				hrService.addEmployee(emp);
			} catch (IOException e) {
				throw new RuntimeException("Invalid Format.");
			}
		}
		m.addAttribute("process", "added");
		return "redirect:/hr/success";
	}
	
	@RequestMapping(value="/hr/changepwd", method = RequestMethod.GET)
	public String changePwd(Model m, UserVO user) {
		logger.info("user : " + user);
		
		return "hr/changepwd";
	}
	
	@RequestMapping(value="/hr/changepwd", method = RequestMethod.POST)
	public String changePwdPost(Model m, UserVO user, HttpServletRequest req, HttpSession session) throws Exception {
		user = (UserVO)session.getAttribute("LOGINED_USER");
		logger.info(" Old User : " + user);
		String newpwd = (String)req.getParameter("new-pwd");
		user.setPwd(MD5.hash(newpwd));
		logger.info(" Recent User : " + user);
		hrService.updateUser(user);
		m.addAttribute("process", "pwd-changed");
		
		return "hr/changepwd";
	}
	
	@RequestMapping(value="/hr/forgotpwd", method = RequestMethod.GET)
	public String forgotPwd(Model m, HttpServletRequest req, HttpSession session) {
		
		return "hr/forgotpwd";
	}
	
	@RequestMapping(value="/hr/success", method = RequestMethod.GET)
	public String success(Model m, HttpServletRequest req, HttpSession session) {
		
		return "hr/success";
	}
	
	@RequestMapping(value="/hr/delete", method = RequestMethod.GET)
	public String deleteEmployee(Model m, HttpServletRequest req, HttpSession session, UserVO user) {
		user = (UserVO) session.getAttribute("LOGINED_USER");
		int empid = Integer.parseInt(req.getParameter("empid"));
		
		EmployeeVO emp = hrService.getEmpByEmpId(empid);
		if (user.getUser_no() != emp.getUser_no()) {
			m.addAttribute("process", "delete-noauth");
			return "hr";
		}
		hrService.deleteEmployeeByEmployeeVO(emp);
		
		return "redirect:/hr/success";
	}
	
}
