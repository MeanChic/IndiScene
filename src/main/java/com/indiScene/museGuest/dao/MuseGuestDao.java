package com.indiScene.museGuest.dao;

import java.util.HashMap;
import java.util.List;

import com.indiScene.museGuest.dto.MuseGuestDto;

/**
 * @name:MuseGuestDao
 * @date :2015. 7. 7.
 * @author: 김정승
 * @description :muse 동호회 개설 및 관리 가입을 위해 DB와 연결하는 class	
 */
public interface MuseGuestDao {
	
	public int write(MuseGuestDto guestDto);
	
	public int getCount(String muse_name);
	
	public List<MuseGuestDto> getList(HashMap<String, Object> hmap);
	
	public int update(String guest_num, String guest_content);
	
	public int delete(String guest_num);
	
	public int createMuse(String muse_name);
}
