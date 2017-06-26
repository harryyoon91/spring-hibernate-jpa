package me.yonghak.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import me.yonghak.service.HRService;
import me.yonghak.util.MD5;
import me.yonghak.util.MailSend;
import me.yonghak.vo.UserVO;

@RestController
public class HRRestController {
	
	@Autowired
	private HRService hrService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping("/hr/register/idduplicationcheck")
	public boolean idDuplicationCheck(@RequestParam("id") String id) {
		boolean isDuplicated = false;
		int checker = hrService.checkIdDuplication(id);
		if (1==checker) {
			isDuplicated = true;
		}
		return isDuplicated;
	}
	
	@RequestMapping("/hr/register/emailduplicationcheck")
	public boolean emailDuplicationCheck(@RequestParam("email") String email) {
		boolean isDuplicated = false;
		int checker = hrService.checkEmailDuplication(email);
		if (1==checker) {
			isDuplicated = true;
		}
		return isDuplicated;
	}
	
	@RequestMapping("/hr/changepwd/currentpwdcheck")
	public boolean currentPwdCheck(@RequestParam("pwd") String pwd) {
		boolean isCorrect = false;
		String hashedpwd = "";
		try {
			hashedpwd = MD5.hash(pwd);
		} catch(Exception e) {
			e.printStackTrace();
		}
		int checker = hrService.checkCurrentPwd(hashedpwd);
		if (1==checker) {
			isCorrect = true;
		}
		return isCorrect;
	}
	
	@RequestMapping("/hr/forgotpwd/temporarypwd")
	public boolean temporaryPwd(@RequestParam("id") String id, @RequestParam("email") String email) {
		logger.info("ID :: " + id + " Email :: " + email);
		boolean isSent = false;
		
		UserVO checker = hrService.findUserByIdAndEmail(id, email);
		if (null==checker) {
			return isSent;
		}
		logger.info("UserVO :: " + checker);
		String tempPwd;
		
		try {
			tempPwd = MD5.hash(System.currentTimeMillis()+checker.getConfirmlink()).substring(0, 4);
		} catch (Exception e) {
			throw new RuntimeException("Password Double Encryption Processing.");
		}
		logger.info("Temporary Password :: " + tempPwd);
		
		MailSend mailsend = new MailSend();
		mailsend.sendmail("[YONGHAK YOON PORTFOLIO TEMPORARY PWD] CHECK IT ", checker.getEmail(), "THIS IS YOUR TEMPORARY PWD : " + tempPwd + " || You can change your password on website.");

		try {
			checker.setPwd(MD5.hash(tempPwd));
		} catch (Exception e) {
			throw new RuntimeException("Password Double Encryption Processing.");
		}
		hrService.updateUser(checker);
		
		isSent = true;
		return isSent;
	}
	
}
