package com.indiScene.museGuest.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Logger;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.indiScene.museGuest.dto.MuseGuestDto;

/**
 * @name:MuseGuestDaoImpl
 * @date :2015. 7. 7.
 * @author: 김정승
 * @description :	MuseGuestDao Interface를 상속받은 class
 */
@Component
public class MuseGuestDaoImpl implements MuseGuestDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final Logger logger = Logger.getLogger(this.getClass().getName());
	
	/**
	 * @name: write
	 * @date :2015. 7. 7.
	 * @author: 김정승
	 * @description :	방명록 작성을 위해 guestDto를  DB에 저장하는 method
	 */
	public int write(MuseGuestDto guestDto){
		return sqlSession.insert("dao.MuseGuestMapper.write", guestDto);
	}
	
	/**
	 * @name: getCount
	 * @date :2015. 7. 7.
	 * @author: 김정승
	 * @description :	방명록 list를 얻기위해 갯수를 가지고 오는 method
	 */
	public int getCount(String muse_name){
		return sqlSession.selectOne("dao.MuseGuestMapper.count", muse_name);
	}
	
	/**
	 * @name: getList
	 * @date :2015. 7. 7.
	 * @author: 김정승
	 * @description :	방명록 리스트를 DB로 부터 가져오는 method
	 */
	public List<MuseGuestDto> getList(HashMap<String, Object> hmap){
		logger.info("-- hmap check  : " + hmap.get("startpage") + hmap.get("endpage") + hmap.get("muse_name"));
		return sqlSession.selectList("dao.MuseGuestMapper.getlist", hmap);
	}
	
	/**
	 * @name: update
	 * @date :2015. 7. 7.
	 * @author: 김정승
	 * @description :	방명록의 내용을 수정하기 위해 DB에 수정된 내용을 저장하는 method
	 */
	public int update(String guest_num, String guest_content){
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("guest_num", guest_num);
		hmap.put("guest_content", guest_content);
		
		return sqlSession.update("dao.MuseGuestMapper.update", hmap);
	}
	
	/**
	 * @name: delete
	 * @date :2015. 7. 7.
	 * @author: 김정승
	 * @description :	작성된 방명록을 삭제하기 위해 DB에 query문을 전송하는 method
	 */
	public int delete(String guest_num){
		return sqlSession.delete("dao.MuseGuestMapper.delete", guest_num);
	}
	
	/**
	 * @name: createMuse
	 * @date :2015. 7. 7.
	 * @author: 김정승
	 * @description :	처음 muse개설시 해당 방명록에 첫글을 남겨주기 위한 method
	 */
	public int createMuse(String muse_name){
		MuseGuestDto guestDto = new MuseGuestDto();
		guestDto.setArtist_id("관리자");
		guestDto.setMuse_name(muse_name);
		guestDto.setGuest_content("뮤즈를 만들어 주셔서 감사합니다. 많은 뮤즈회원님들과 즐거운 시간 보내실수 있도록 노력하겠습니다.");
		guestDto.setGuest_date(new Date());
		
		return sqlSession.insert("dao.MuseGuestMapper.write", guestDto);
	}
}
