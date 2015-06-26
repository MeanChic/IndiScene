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
	/**
	 * @name:nameCheck
	 * @date :2015. 6. 26.
	 * @author: 김정승
	 * @description :	muse 이름이 기존에 존재하는지 확인하는 method
	 */
	public MuseDto nameCheck(String muse_name);
	/**
	 * @name:logup
	 * @date :2015. 6. 26.
	 * @author: 김정승
	 * @description :	muse를 개설하기 위해 insert하는 method
	 */
	public int logup(MuseDto museDto);
	/**
	 * @name:museCheck
	 * @date :2015. 6. 26.
	 * @author: 김정승
	 * @description :	회원이 기존에 muse를 개설했는지 확인하는 method
	 */
	public MuseDto museCheck(String artist_id);
	
	/**
	 * @name:bestMuse
	 * @date :2015. 6. 26.
	 * @author: 김정승
	 * @description :	가입된 회원수가 많은 순으로 보여진다.
	 */
	public List<MuseDto> bestMuse();
	
	/**
	 * @name:myMuse
	 * @date :2015. 6. 26.
	 * @author: 김정승
	 * @description :	내가 가입한 muse가 보여진다.
	 */
	public List<HashMap<String, Object>> myMuse(String artist_id);
	
	public List<MuseDto> allMuse(String artist_id);
}
