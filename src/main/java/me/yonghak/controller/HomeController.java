package me.yonghak.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import me.yonghak.util.MailSend;
import me.yonghak.view.DownloadView;
import me.yonghak.vo.HireYonghakForm;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	DownloadView downloadView;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest request) {
	     String ip = request.getRemoteAddr(); 
	     
		logger.info("Welcome home! The client locale is {}. IP : {} ", locale, ip);
		
		/* You can try if you want to check ExceptionHandler.
		throw new RuntimeException("Hello ! !");
		*/
		return "index";
	}
	
	@RequestMapping(value = "/home/hireyonghak", method = RequestMethod.GET)
	public String hireyonghak() {
		
		return "home/hireyonghak";
	}
	
	@RequestMapping(value = "/home/hireyonghak", method = RequestMethod.POST)
	public String hireyonghakPost(@ModelAttribute("hire") HireYonghakForm hire) {
		logger.info("HIRE INFO :: " + hire);
		MailSend mailsend = new MailSend();
		mailsend.sendmail("[HIRING FROM YONGHAK YOON PORTFOLIO] "+hire.getCompany()+" |||| "+hire.getJobtype(), 
							"harryyoon91@gmail.com", 
							"Company :: " + hire.getCompany() + " |||| " +
							"Location :: " + hire.getLocation() + " |||| " +
							"Job-Type :: " + hire.getJobtype() + " |||| " +
							"Salary :: $" + hire.getLocation() + " |||| " +
							"Description :: " + hire.getDescription() + " |||| " +
							"Website :: " + hire.getWebsite() + " |||| " +
							"Email :: " + hire.getEmail() + " |||| ");
		return "home/mailsent";
	}
	
	@RequestMapping(value = "/home/about", method = RequestMethod.GET)
	public String about() {
		
		return "home/about";
	}
	
	@RequestMapping(value = "/home/portfolio", method = RequestMethod.GET)
	public String portfolio() {
		
		return "home/portfolio";
	}
	
	@RequestMapping(value = "/home/portfolio/pdfresumetdownload", method = RequestMethod.GET)
	public ModelAndView pdfResumeDownload(Model m, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String directory = "C:\\Users\\Yonghak\\Documents\\project\\workspace\\spring-hibernate-jpa\\src\\main\\webapp\\resources\\file";
		String filename = "YonghakYoon-Resume.pdf";
		mav.addObject("directory", directory);
		mav.addObject("filename", filename);
		mav.setView(downloadView);
		
		return mav;
	}
	
	@RequestMapping(value = "/home/portfolio/wordresumetdownload", method = RequestMethod.GET)
	public ModelAndView wordResumeDownload(Model m, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String directory = "C:\\Users\\Yonghak\\Documents\\project\\workspace\\spring-hibernate-jpa\\src\\main\\webapp\\resources\\file";
		String filename = "YonghakYoon-Resume.docx";
		mav.addObject("directory", directory);
		mav.addObject("filename", filename);
		mav.setView(downloadView);
		
		return mav;
	}
	
}
