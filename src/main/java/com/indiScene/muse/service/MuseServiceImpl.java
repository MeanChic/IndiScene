package com.indiScene.muse.service;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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

import com.indiScene.muse.dao.MuseDao;
import com.indiScene.muse.dto.MuseDto;
import com.indiScene.museBoard.dao.MuseBoardDao;
import com.indiScene.museBoard.dto.MuseBoardDto;
import com.indiScene.museGuest.dao.MuseGuestDaoImpl;
import com.indiScene.museGuest.dto.MuseGuestDto;


/**
 * @name:MuseServiceImpl
 * @date :2015. 6. 25.
 * @author: 김정승
 * @description :	MuseService를 상속받은 클래스
 */
@Component
public class MuseServiceImpl implements MuseService {
	private String rootpath = "C:/SPB_Data/git/IndiScene/src/main/webapp/";
	@Autowired
	private MuseDao museDao;
	
	@Autowired
	private MuseGuestDaoImpl guestDao;
	
	@Autowired
	private MuseBoardDao boardDao;
	private final Logger logger = Logger.getLogger(this.getClass().getName());
	
	/**
	 * @name:nameCheck
	 * @date :2015. 6. 26.
	 * @author: 김정승
	 * @description :	muse 이름이 기존에 존재하는지 확인하는 method
	 */
	public void nameCheck(ModelAndView mav){
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		String muse_name = request.getParameter("muse_name");
		
		MuseDto museDto = museDao.nameCheck(muse_name);
		//logger.info("--" + museDto);
		
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
	
	/**
	 * @name:logup
	 * @date :2015. 6. 26.
	 * @author: 김정승
	 * @description :	muse 개설을 위한 method
	 */
	public void logup(ModelAndView mav){
		Map<String, Object> map = mav.getModelMap();
		MultipartHttpServletRequest request = (MultipartHttpServletRequest)map.get("request");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		logger.info("Request Prameter Check(museName) : " +request.getParameter("muse_name"));
		MuseDto museDto = (MuseDto)map.get("museDto");
		
		museDto.setMuse_date(new Date());
		
		MultipartFile upFile = request.getFile("file");
		String fileName = upFile.getOriginalFilename();
		String timeName = System.currentTimeMillis() + "_" + fileName ;
		long fileSize = upFile.getSize();
		
		logger.info("-- fileName : " + fileName);
		logger.info("-- timeName : " + timeName);
		logger.info("-- fileSize : " + fileSize);
		
		String dir= request.getSession().getServletContext().getRealPath("/").replace('\\', '/')+"resources/museResources";
		if(fileSize != 0){
			try{
//				String dir="C:/SPB_Data/git/IndiScene/src/main/webapp/resources/museResources";
				
				File file = new File(dir, timeName);
				upFile.transferTo(file);	
				
				museDto.setMuse_filepath(file.getAbsolutePath());
				
			}catch(Exception e){
				logger.info("ch File Input Ouput Error");
			}
		}else{
			museDto.setMuse_filepath(dir+"Koala.jpg");
		}
		//logger.info("ch dir : " + museDto.getMuse_filepath());
		
		PrintWriter out = null;
		response.setCharacterEncoding("utf-8");
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		int check = museDao.logup(museDto);
		if(check > 0){
			int musenew = guestDao.createMuse(museDto.getMuse_name());
			//logger.info("-- new create muse write : " + musenew);
			out.print("<script> "
					+ "alert('뮤즈가 개설되었습니다.');"
					+ "indimuse('"+museDto.getArtist_id()+"')"
					+ " </script> ");
		}else{
			
			//logger.info("-- new create muse write : " + musenew);
			out.print("<script> "
					+ "alert('뮤즈가 개설 될수 없습니다.');"
					+ "indimuse('"+museDto.getArtist_id()+"')"
					+ " </script> ");
		}
		
		//logger.info("-- muselogup check:" + check);
		/*mav.addObject("check",check);
		mav.setViewName("museCreate/logup");*/
		mav.setViewName("museCreate/musemain");
	}
	
	/**
	 * @name:museCheck
	 * @date :2015. 6. 26.
	 * @author: 김정승
	 * @description :	회원이 이전에 muse를 개설했는지 확인하는 method
	 */
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
	
	/**
	 * @name:museMain
	 * @date :2015. 6. 26.
	 * @author: 김정승
	 * @description : museMain페이지로 이동할때 	
	 */
	public void museMain(ModelAndView mav){
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String artist_id = request.getParameter("artist_id");
		List<HashMap<String, Object>> bestMuse = museDao.bestMuse(artist_id);
		List<HashMap<String, Object>> myMuse = museDao.myMuse(artist_id);
		List<MuseDto> allMuse = museDao.allMuse(artist_id);
		
		for(int i = 0; i < bestMuse.size(); i++){
			String path = (String)bestMuse.get(i).get("MUSE_FILEPATH");
			int su = request.getSession().getServletContext().getRealPath("/").length()-1;
			
			logger.info("--" + su + "   " + path + "    "  + path.substring(su));
			bestMuse.get(i).replace("MUSE_FILEPATH", path.substring(su));
		}
		
		for(int i = 0; i < myMuse.size(); i++){
			String path = (String)myMuse.get(i).get("MUSE_FILEPATH");
			int su = request.getSession().getServletContext().getRealPath("/").length()-1;
			
			logger.info("--" + su + "   " + path + "    "  + path.substring(su));
			myMuse.get(i).replace("MUSE_FILEPATH", path.substring(su));
		}
		
		for(int i = 0; i < allMuse.size(); i++){
			String path = (String)allMuse.get(i).getMuse_filepath();
			int su = request.getSession().getServletContext().getRealPath("/").length()-1;
			
			logger.info("--" + su + "   " + path + "    "  + path.substring(su));
			allMuse.get(i).setMuse_filepath(path.substring(su));
		}
		
		
		mav.addObject("bestMuse", bestMuse);
		mav.addObject("myMuse", myMuse);
		mav.addObject("allMuse", allMuse);
		
		mav.setViewName("museCreate/musemain");
		//logger.info("--" + bestMuse.size() + myMuse.size() + allMuse.size());
	}
	
	/**
	 * @name: museCancle
	 * @date :2015. 6. 26.
	 * @author: 김정승
	 * @description : 회원가입을 취소하기 위해  MuseDao class를 호출하는 method
	 */
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
	
	/**
	 * @name: museSignup
	 * @date :2015. 6. 26.
	 * @author: 김정승
	 * @description : muse가입을 위해 MuseDao class를 호출하는 method
	 */
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
	
	/**
	 * @name: masterCheck
	 * @date :2015. 6. 26.
	 * @author: 김정승
	 * @description : muse 개설자인지 확인하기 위해 MuseDao class를 호출하는 method 	
	 */
	public void masterCheck(ModelAndView mav){
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		String artist_id = request.getParameter("artist_id");
		String muse_name = request.getParameter("muse_name");
		
		//logger.info("-- " + artist_id + "," + muse_name);
		MuseDto museDto = museDao.masterCheck(artist_id, muse_name);
		
		try{
			PrintWriter out = response.getWriter();
			
			if(museDto != null){
				out.print("1");
			}else{
				out.print("0");
			}
			//logger.info("--museDto" + museDto);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * @name: museMember
	 * @date :2015. 6. 26.
	 * @author: 김정승
	 * @description : muse가입 맴버 확인을 위해 MuseDao class를 호출하는 method 	
	 */
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
	
	/**
	 * @name: inviteMember
	 * @date :2015. 6. 26.
	 * @author: 김정승
	 * @description : muse가입신청 맴버 승인을 위해 MuseDao class를 호출하는 method 	
	 */
	public void inviteMember(ModelAndView mav){
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		String artist_id = request.getParameter("artist_id");
		String muse_name = request.getParameter("muse_name");
		
		//logger.info("-- " + artist_id + "," + muse_name);
		
		int check = museDao.inviteMember(artist_id, muse_name);
		try{
			PrintWriter out = response.getWriter();
			out.print(check);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * @name: outMember
	 * @date :2015. 6. 26.
	 * @author: 김정승
	 * @description : muse가입 맴버 탈퇴를 위해 MuseDao class를 호출하는 method  	
	 */
	public void outMember(ModelAndView mav){
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		String artist_id = request.getParameter("artist_id");
		String muse_name = request.getParameter("muse_name");
		
		//logger.info("-- " + artist_id + "," + muse_name);
		
		int check = museDao.outMember(artist_id, muse_name);
		
		try{
			PrintWriter out = response.getWriter();
			out.print(check);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * @name: goin
	 * @date :2015. 6. 26.
	 * @author: 김정승
	 * @description : 가입된 muse로 이동하기 위해 MuseDao class를 호출하는 method  	
	 */
	public void goin(ModelAndView mav){
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		String muse_name = request.getParameter("muse_name");
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("startpage", 0);
		hmap.put("endpage", 4);
		hmap.put("muse_name", muse_name);
		hmap.put("startRow", 0);
		hmap.put("endRow", 4);
		
		List<MuseGuestDto> list = guestDao.getList(hmap);
		List<MuseBoardDto> boardlist = boardDao.getBoardList(hmap);
		//logger.info("-- list : " + list.size());
		
		mav.addObject("muse_name", muse_name);
		mav.addObject("list", list);
		mav.addObject("boardList",boardlist);
		
		mav.setViewName("museCreate/goin");
	}
	
	public void deleteMuse(ModelAndView mav){
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		String muse_name = request.getParameter("muse_name");
		String artist_id = request.getParameter("artist_id");
		PrintWriter out = null;
		response.setCharacterEncoding("utf-8");
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		int check = museDao.deleteMuse(muse_name);
		if(check > 0){
			int checkG = guestDao.deleteMuse(muse_name);
			if(checkG > 0){
				out.print("<script> "
						+ "alert('뮤즈가 삭제되었습니다.');"
						+ "indimuse('"+artist_id+"')"
						+ " </script> ");
			}
		}else{
			out.print("<script> "
					+ "alert('뮤즈가 개설될수 없습니다.');"
					+ "indimuse('"+artist_id+"')"
					+ " </script> ");
		}
	}
}


