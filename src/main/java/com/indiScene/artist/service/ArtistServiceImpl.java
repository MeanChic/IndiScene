package com.indiScene.artist.service;

import java.util.Date;
import java.util.Map;
import java.util.logging.Logger;

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
	public void artistRegisterOk(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		ArtistDto artistDto=(ArtistDto)map.get("artistDto");
		
		artistDto.setArtist_level(1);
		
		int check=artistDao.register(artistDto);
		logger.info("memberRegisterOk check: "+check);
		
		mav.addObject("check",check);
		
		mav.setViewName("member/registerOk");
	}

}
