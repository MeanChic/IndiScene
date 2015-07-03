package com.indiScene.muse.service;

import java.io.File;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.indiScene.muse.dao.MuseDaoImpl;
import com.indiScene.muse.dto.MuseDto;
import com.indiScene.performBoard.dao.PerformBoardDaoImpl;
import com.indiScene.performBoard.dto.PerformBoardDto;

/**
 * @name:MuseServiceImpl
 * @date :2015. 6. 25.
 * @author: 김정승
 * @description :	MuseService를 상속받은 클래스
 */
@Component
public class MuseServiceImpl implements MuseService {
	String rootpath = "C:/Users/kosta/git/IndiScene/src/main/webapp/";
	@Autowired
	private MuseDaoImpl museDao;
	private final Logger logger = Logger.getLogger(this.getClass().getName());
	
	public void nameCheck(ModelAndView mav){
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		String muse_name = request.getParameter("muse_name");
		
		MuseDto museDto = museDao.nameCheck(muse_name);
		logger.info("--" + museDto);
		try{
			if(museDto == null){
				PrintWriter out = response.getWriter();
				out.print("0");
			}else if(museDto != null){
				PrintWriter out = response.getWriter();
				out.print("1");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void logup(ModelAndView mav){
		Map<String, Object> map = mav.getModelMap();
		MultipartHttpServletRequest request = (MultipartHttpServletRequest)map.get("request");
		logger.info("--" +request.getParameter("check"));
		MuseDto museDto = (MuseDto)map.get("museDto");
		
		museDto.setMuse_date(new Date());
		
		MultipartFile upFile = request.getFile("file");
		String fileName = upFile.getOriginalFilename();
		
		String timeName = System.currentTimeMillis() + "_" + fileName ;
		long fileSize = upFile.getSize();
		
		logger.info("-- fileName : " + fileName);
		logger.info("-- timeName : " + timeName);
		logger.info("-- fileSize : " + fileSize);
		
		if(fileSize != 0){
			try{
				String dir="C:\\Users\\kosta\\git\\IndiScene\\src\\main\\webapp\\resources\\museResources";
				
				logger.info("ch dir : " + dir);
				
				File file = new File(dir, timeName);
				upFile.transferTo(file);	
				
				museDto.setMuse_filepath(file.getAbsolutePath());
				
			}catch(Exception e){
				logger.info("ch File Input Ouput Error");
			}
		}
		
		int check = museDao.logup(museDto);
		logger.info("-- muselogup check:" + check);
	}
	
	public void museCheck(ModelAndView mav){
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		String artist_id = request.getParameter("artist_id");
		
		MuseDto museDto = museDao.museCheck(artist_id);
		
		try{
			if(museDto == null){
				PrintWriter out = response.getWriter();
				out.print("0");
			}else if(museDto != null){
				PrintWriter out = response.getWriter();
				out.print(museDto.getMuse_name());
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void museMain(ModelAndView mav){
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String artist_id = request.getParameter("artist_id");
		List<HashMap<String, Object>> bestMuse = museDao.bestMuse(artist_id);
		List<HashMap<String, Object>> myMuse = museDao.myMuse(artist_id);
		List<MuseDto> allMuse = museDao.allMuse(artist_id);
		
		
		
		mav.addObject("bestMuse", bestMuse);
		mav.addObject("myMuse", myMuse);
		mav.addObject("allMuse", allMuse);
		
		mav.setViewName("museCreate/musemain");
		
		logger.info("--" + bestMuse.size() + myMuse.size() + allMuse.size());
	}
	
	public void museCancle(ModelAndView mav){
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		String artist_id = request.getParameter("artist_id");
		String muse_name = request.getParameter("muse_name");
		
		int check = museDao.museCancle(artist_id, muse_name);
		try{
			
				PrintWriter out = response.getWriter();
				out.print(check);
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void museSignup(ModelAndView mav){
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		String artist_id = request.getParameter("artist_id");
		String muse_name = request.getParameter("muse_name");
		
		int check = museDao.museSignup(artist_id, muse_name);
		try{
			
				PrintWriter out = response.getWriter();
				out.print(check);
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void masterCheck(ModelAndView mav){
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		String artist_id = request.getParameter("artist_id");
		String muse_name = request.getParameter("muse_name");
		logger.info("-- " + artist_id + "," + muse_name);
		MuseDto museDto = museDao.masterCheck(artist_id, muse_name);
		
		try{
			
			PrintWriter out = response.getWriter();
			if(museDto != null){
				out.print("1");
			}else{
				out.print("0");
			}
			logger.info("--museDto" + museDto);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void museMember(ModelAndView mav){
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String muse_name = request.getParameter("muse_name");
		
		List<HashMap<String, Object>> joinMember = museDao.joinMember(muse_name);
		List<HashMap<String, Object>> nonMember = museDao.nonMember(muse_name);
		
		logger.info("--" + joinMember.size() + " , " + nonMember.size());
		
		mav.addObject("joinMember", joinMember);
		mav.addObject("nonMember", nonMember);
		mav.addObject("muse_name", muse_name);
		mav.setViewName("museCreate/member");
	}
	
	
	public void inviteMember(ModelAndView mav){
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		String artist_id = request.getParameter("artist_id");
		String muse_name = request.getParameter("muse_name");
		logger.info("-- " + artist_id + "," + muse_name);
		
		int check = museDao.inviteMember(artist_id, muse_name);
		try{
			
				PrintWriter out = response.getWriter();
				out.print(check);
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void outMember(ModelAndView mav){
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		String artist_id = request.getParameter("artist_id");
		String muse_name = request.getParameter("muse_name");
		logger.info("-- " + artist_id + "," + muse_name);
		
		int check = museDao.outMember(artist_id, muse_name);
		try{
			
				PrintWriter out = response.getWriter();
				out.print(check);
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}


