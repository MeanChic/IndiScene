package com.indiScene.museGuest.dao;

import java.util.Date;
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
	
	public int update(String guest_num, String guest_content){
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("guest_num", guest_num);
		hmap.put("guest_content", guest_content);
		
		return sqlSession.update("dao.MuseGuestMapper.update", hmap);
	}
	
	public int delete(String guest_num){
		return sqlSession.delete("dao.MuseGuestMapper.delete", guest_num);
	}
	
	public int createMuse(String muse_name){
		MuseGuestDto guestDto = new MuseGuestDto();
		guestDto.setArtist_id("관리자");
		guestDto.setMuse_name(muse_name);
		guestDto.setGuest_content("뮤즈를 만들어 주셔서 감사합니다. 많은 뮤즈회원님들과 즐거운 시간 보내실수 있도록 노력하겠습니다.");
		guestDto.setGuest_date(new Date());
		return sqlSession.insert("dao.MuseGuestMapper.write", guestDto);
	}
}
