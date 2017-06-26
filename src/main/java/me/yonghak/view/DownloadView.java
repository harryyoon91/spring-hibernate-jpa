package me.yonghak.view;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

@Component
public class DownloadView extends AbstractView {

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest req, HttpServletResponse res) throws Exception {
	
		String directory = (String) model.get("directory");
		String filename = (String) model.get("filename");
		
		res.setContentType("application/octet-stream");
		res.setHeader("Content-Disposition", "attachment;filename='"+URLEncoder.encode(filename, "utf-8")+"'");
		
		FileCopyUtils.copy(new FileInputStream(new File(directory, filename)), res.getOutputStream());
		
	}
}
