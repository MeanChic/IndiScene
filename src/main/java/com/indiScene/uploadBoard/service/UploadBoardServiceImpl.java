package com.indiScene.uploadBoard.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.indiScene.uploadBoard.dao.UploadBoardDaoImpl;
import com.indiScene.uploadBoard.dto.UploadBoardDto;

@Controller
public class UploadBoardServiceImpl implements UploadBoardService {

	@Autowired
	private UploadBoardDaoImpl dao;
	
	@Override
	public void write(ModelAndView mav) {
		Map<String, Object> map = mav.getModel();
		MultipartHttpServletRequest request = (MultipartHttpServletRequest) map.get("request");
		UploadBoardDto uploadBoardDto = (UploadBoardDto) map.get("uploadBoardDto");
		
		Iterator<String> iter = request.getFileNames();
		
		List<MultipartFile> fileList = new ArrayList<MultipartFile>();
		while(iter.hasNext()){
			String fileStr = iter.next();
			MultipartFile mf = request.getFile(fileStr);
			fileList.add(mf);
			
			System.out.println(fileStr +"\t"+ mf.getOriginalFilename());
		}
		
		uploadBoardDto.setRegister_date(new java.util.Date());
		
	}

}
