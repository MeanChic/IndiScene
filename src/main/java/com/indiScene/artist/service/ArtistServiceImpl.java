package com.indiScene.artist.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.indiScene.artist.dao.ArtistDao;
import com.indiScene.artist.dto.ArtistDto;
import com.indiScene.artist.dto.ZipcodeDto;

/**
 * @type : ArtistServiceImpl
 * @date : 2015. 6. 26.
 * @author : 오경선
 * @description : 요청된 페이지에 따라 실질적인 회원 관리 기능을 수행한다.
 */
@Component
public class ArtistServiceImpl implements ArtistService {
	private final Logger logger=Logger.getLogger(this.getClass().getName());
	private String dir = "C:/SPB_Data/git/IndiScene/src/main/webapp/resources/";
	
	@Autowired
	private ArtistDao artistDao;
	
	/* TestMethod
	@Override
	public void test(ModelAndView mav) {
		logger.info("-----test-----");
		mav.addObject("message", "-----Test-----");
		mav.setViewName("artist/testing");
	}
	*/
	
	@Override
	public void registerOk(ModelAndView mav){
		logger.info("-----Servlet artist registerOk-----");
		Map<String,Object> map=mav.getModelMap();
		ArtistDto artistDto=(ArtistDto)map.get("artistDto");
		MultipartHttpServletRequest request = (MultipartHttpServletRequest) map.get("request");
		
		MultipartFile mf = request.getFile("profileImage");
		if(!mf.isEmpty()){
			String timeName= artistDto.getArtist_id()+"_"+System.currentTimeMillis()+"_"+mf.getOriginalFilename();
			File imageFile = new File(dir+"artistResources/",timeName);
			try {
				mf.transferTo(imageFile);
				artistDto.setArtist_picture(imageFile.getAbsolutePath().substring(imageFile.getAbsolutePath().indexOf("\\resources")).replace('\\','/'));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		artistDto.setArtist_level(1);
		int check=artistDao.insert(artistDto);
		logger.info("artistRegisterOk check: "+check);
		
		mav.addObject("check",check);
		mav.setViewName("artist/registerOk");
	}

	@Override
	public void idCheck(ModelAndView mav) {
		logger.info("-----Servlet artist idCheck-----");
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		String artist_id=request.getParameter("artist_id");
		int check=artistDao.idCheck(artist_id);
		logger.info("artistIdCheck check: "+check);	
		
		mav.addObject("check",check);
		mav.addObject("artist_id",artist_id);
		
		mav.setViewName("artist/idCheck");
	}

	@Override
	public void nicknameCheck(ModelAndView mav) {
		logger.info("-----Servlet artist nicknameCheck-----");
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		String artist_nickname=request.getParameter("artist_nickname");
		int check=artistDao.nicknameCheck(artist_nickname);
		logger.info("artistNicknameCheck check: "+check);	
		
		mav.addObject("check",check);
		mav.addObject("artist_nickname",artist_nickname);
		
		mav.setViewName("artist/nicknameCheck");
	}
	
	@Override
	public void update(ModelAndView mav) {
		logger.info("-----Servlet artist update-----");
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");

		String artist_id=request.getParameter("artist_id");
		logger.info(artist_id);
		
		ArtistDto artist=artistDao.select(artist_id);
		logger.info("artistUpdate artist:"+artist);
		
		mav.addObject("artist",artist);
		
		mav.setViewName("artist/update");
	}

	@Override
	public void updateOk(ModelAndView mav) {
		logger.info("-----Servlet artist updateOk-----");
		Map<String,Object> map=mav.getModelMap();
		ArtistDto artistDto=(ArtistDto)map.get("artistDto");
		MultipartHttpServletRequest request = (MultipartHttpServletRequest) map.get("request");
		
		logger.info("artist_id : "+artistDto.getArtist_id());
		logger.info("artist_password : "+artistDto.getArtist_password());
		logger.info("artist_nickname : "+artistDto.getArtist_nickname());
		logger.info("artist_birth : "+artistDto.getArtist_birth());
		logger.info("artist_level : "+artistDto.getArtist_level());
		
		MultipartFile mf = request.getFile("artist_picture");
		if(!mf.isEmpty()){
			String timeName= artistDto.getArtist_id()+"_"+System.currentTimeMillis()+"_"+mf.getOriginalFilename();
			File imageFile = new File(dir+"artistResources/",timeName);
			try {
				mf.transferTo(imageFile);
				artistDto.setArtist_picture(imageFile.getAbsolutePath().substring(imageFile.getAbsolutePath().indexOf("\\resources")).replace('\\','/'));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else{
			ArtistDto artist=artistDao.select(artistDto.getArtist_id());
			artistDto.setArtist_picture(artist.getArtist_picture());
		}
		
		int check=artistDao.update(artistDto);
		logger.info("artistUpdateOk check: "+check);
		
		mav.addObject("check",check);
		
		mav.setViewName("artist/updateOk");
	}

	@Override
	public void delete(ModelAndView mav) {
		logger.info("-----Servlet artist delete-----");
		mav.setViewName("artist/delete");
	}
	
	@Override
	public void deleteOk(ModelAndView mav) {
		logger.info("-----Servlet artist deleteOk-----");
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		String artist_id=request.getParameter("artist_id");
		String artist_password=request.getParameter("artist_password");
		
		HashMap<String,String> hMap=new HashMap<String,String>();
		hMap.put("artist_id",artist_id);
		hMap.put("artist_password", artist_password);
		logger.info("artistDelete artist_id: "+artist_id+", artist_password: "+artist_password);
		
		int check=artistDao.delete(hMap);
		logger.info("artistDelete check: "+check);
		
		mav.addObject("check",check);
		
		mav.setViewName("artist/deleteOk");
	}
	
	@Override
	public void loginOk(ModelAndView mav) {
		logger.info("-----Servlet artist loginOk-----");
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		String artist_id=request.getParameter("artist_id");
		String artist_password=request.getParameter("artist_password");
		
		HashMap<String,String> hMap=new HashMap<String,String>();
		hMap.put("artist_id", artist_id);
		hMap.put("artist_password", artist_password);
		ArtistDto artist=artistDao.login(hMap);
		logger.info("-----Servlet LoginOk artist: "+artist);
		logger.info("-----Servlet LoginOk artist_id: "+artist_id+", artist_password : "+artist_password);
		 
		if(artist!=null){
			mav.addObject("artist_id",artist.getArtist_id());
			mav.addObject("artist_level",artist.getArtist_level());
		}
		
		mav.setViewName("artist/loginOk");
	}

	@Override
	public void logout(ModelAndView mav) {
		logger.info("-----Servlet artist logout-----");
		mav.setViewName("artist/logout");
	}

	@Override
	public void findZipcode(ModelAndView mav) {
		logger.info("-----Servlet artist findZipcode-----");
		//root+"/artist/zipcode.do";
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		String dong=request.getParameter("dong");
		logger.info("memberZipcode dong: "+dong);
		
		List<ZipcodeDto> list=null;
		if(dong!=null){
			list=artistDao.ZipcodeList(dong);
			logger.info("artistZipcode list size:"+list.size());
		}
		
		mav.addObject("list",list);
		
		mav.setViewName("artist/zipcode");
	}
}
