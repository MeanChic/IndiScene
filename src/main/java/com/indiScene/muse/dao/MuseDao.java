package com.indiScene.muse.dao;

import java.util.HashMap;
import java.util.List;

import com.indiScene.muse.dto.MuseDto;
import com.indiScene.performBoard.dto.PerformBoardDto;

/**
 * @name:MuseDao
 * @date :2015. 6. 25.
 * @author: 김정승
 * @description :	muse 동호회 개설 및 관리 가입을 위해 DB와 연결하는 class
 */
public interface MuseDao {
	
	public MuseDto nameCheck(String muse_name);
	
	public int logup(MuseDto museDto);
	
	public MuseDto museCheck(String artist_id);
	
	public List<HashMap<String, Object>> bestMuse(String artist_id);
	
	public List<HashMap<String, Object>> myMuse(String artist_id);
	
	public List<MuseDto> allMuse(String artist_id);
	
	public int museCancle(String artist_id, String muse_name);
	
	public int museSignup(String artist_id, String muse_name);
	
	public MuseDto masterCheck(String artist_id, String muse_name);
	
	public List<HashMap<String, Object>> joinMember(String muse_name);
	
	public List<HashMap<String, Object>> nonMember(String muse_name);
	
	public int inviteMember(String artist_id, String muse_name);
	
	public int outMember(String artist_id, String muse_name);
}
