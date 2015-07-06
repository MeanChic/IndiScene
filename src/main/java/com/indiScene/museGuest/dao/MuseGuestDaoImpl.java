package com.indiScene.museGuest.dao;

import java.util.HashMap;
import java.util.List;
import java.util.logging.Logger;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.indiScene.museGuest.dto.MuseGuestDto;

@Component
public class MuseGuestDaoImpl implements MuseGuestDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final Logger logger = Logger.getLogger(this.getClass().getName());
	
	public int write(MuseGuestDto guestDto){
		
		return sqlSession.insert("dao.MuseGuestMapper.write", guestDto);
	}
	
	public int getCount(String muse_name){
		return sqlSession.selectOne("dao.MuseGuestMapper.count", muse_name);
	}
	
	public List<MuseGuestDto> getList(HashMap<String, Object> hmap){
		logger.info("-- hmap check  : " + hmap.get("startpage") + hmap.get("endpage") + hmap.get("muse_name"));
		return sqlSession.selectList("dao.MuseGuestMapper.getlist", hmap);
	}
}
