package com.indiScene.artist.service;

import java.util.HashMap;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.indiScene.artist.dao.ArtistDao;
import com.indiScene.artist.dto.ArtistDto;

@Component
public class ArtistServiceImpl implements ArtistService {
	private final Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private ArtistDao artistDao;
	
	@Override
	public void test(ModelAndView mav) {
		logger.info("-----test-----");
		mav.addObject("message", "-----Test-----");
		mav.setViewName("artist/testing");
	}
	
	@Override
	public void register(ModelAndView mav) {
		logger.info("Artist register-----");
		mav.setViewName("artist/register");
	}
	
	@Override
	public void registerOk(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		ArtistDto artistDto=(ArtistDto)map.get("artistDto");
		
		artistDto.setArtist_level(1);
		
		int check=artistDao.insert(artistDto);
		logger.info("artistRegisterOk check: "+check);
		
		mav.addObject("check",check);
		
		mav.setViewName("artist/registerOk");
	}

	@Override
	public void idCheck(ModelAndView mav) {
		//root+"/artist/idCheck.do?id="+form.id.value;
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		String id=request.getParameter("id");
		logger.info("artistIdCheck id: "+id);
		
		int check=artistDao.idCheck(id);
		logger.info("artistIdCheck check: "+check);	
		
		//check와 id를 idCheck.jsp로 넘겨주면 된다.
		mav.addObject("check",check);
		mav.addObject("id",id);
		
		mav.setViewName("artist/idCheck");
	}

	@Override
	public void nickCheck(ModelAndView mav) {
	//root+"/artist/nicknameCheck.do?nickname="+form.nickname.value;
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		String id=request.getParameter("id");
		logger.info("artistNicknameCheck id: "+id);
		
		int check=artistDao.idCheck(id);
		logger.info("artistNicknameCheck check: "+check);	
		
		//check와 nickname를 nicknameCheck.jsp로 넘겨주면 된다.
		mav.addObject("check",check);
		mav.addObject("id",id);
		
		mav.setViewName("artist/nicknameCheck");
	}

	@Override
	public void update(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		String id=request.getParameter("id");
		
		ArtistDto artist=artistDao.select(id);
		logger.info("artistUpdate artist:"+artist);
		
		//update.jsp에 member만 넘겨주면 된다.
		mav.addObject("artist",artist);
		
		mav.setViewName("artist/update");
	}

	@Override
	public void updateOk(ModelAndView mav) {
		/*
		Map<String,Object> map=mav.getModelMap();
		ArtistDto artistDto=(ArtistDto)map.get("ArtistDto");
		
		int check=ArtistDao.update(artistDto);
		logger.info("artistUpdateOk check: "+check);
		
		//updateOk.jsp에는 check만 넘겨주면 된다.
		mav.addObject("check",check);
		
		mav.setViewName("artist/updateOk");
		*/	
	}

	@Override
	public void delete(ModelAndView mav) {
		//id와 password를 가지고 넘어옴.
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		String id=request.getParameter("id");
		String password=request.getParameter("password");
		
		HashMap<String,String> hMap=new HashMap<String,String>();
		hMap.put("id",id);
		hMap.put("password", password);
		logger.info("artistDelete id: "+id+", password: "+password);
		
		int check=artistDao.delete(hMap);
		logger.info("artistDelete check: "+check);
		
		mav.addObject("check",check);
		
		mav.setViewName("artist/deleteOk");
	}

	@Override
	public void deleteOk(ModelAndView mav) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void login(ModelAndView mav) {
		//id와 password를 가지고 넘어옴
		/*
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		String id=request.getParameter("id");
		String password=request.getParameter("password");
		
		HashMap<String,String> hMap=new HashMap<String,String>();
		hMap.put("id", id);
		hMap.put("password", password);
		logger.info("artistLogin id: "+id+", password: "+password);
		
		ArtistDto artist=artistDao.login(hMap);
		logger.info("artistLogin artist: "+artist);
		//logger.info("memberLogin id: "+id);
		//logger.info("memberLogin memberLevel: "+member.getMemberLevel());
		
		//level과 id를 loginOk로 보냄
		if(artist!=null){
			mav.addObject("id",artist.getArtist_id());
			mav.addObject("memberLevel",artist.getArtist_level());
		}
		
		mav.setViewName("artist/loginOk");
		*/
	}

	@Override
	public void logout(ModelAndView mav) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void findZipcode(ModelAndView mav, String dong) {
		//root+"/artist/zipcode.do";
		/*
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		String dong=request.getParameter("dong");
		logger.info("memberZipcode dong: "+dong);
		
		List<ZipcodeDto> list=null;
		if(dong!=null){
			list=artistDao.zipcode(dong);
			logger.info("artistZipcode list size:"+list.size());
		}
		
		mav.addObject("list",list);
		
		mav.setViewName("artist/zipcode");
		*/
	}

}
