package com.indiScene.muse.dao;

import java.util.HashMap;
import java.util.List;
import java.util.logging.Logger;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.indiScene.muse.dto.MuseDto;
import com.indiScene.performBoard.dto.PerformBoardDto;

/**
 * @name:MuseDaoImpl
 * @date :2015. 6. 25.
 * @author: 김정승
 * @description :	MuseDao interface를 상속받은 class
 */
@Component
public class MuseDaoImpl implements MuseDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final Logger logger = Logger.getLogger(this.getClass().getName());
	
	public MuseDto nameCheck(String muse_name){
		return sqlSession.selectOne("dao.MuseMapper.nameCheck",muse_name);
	}
	
	public int logup(MuseDto museDto){
		int check = sqlSession.insert("dao.MuseMapper.logup", museDto);
		if(check > 0){
			sqlSession.insert("dao.MuseMapper.in", museDto);
		}
		return check;
	}
	
	public MuseDto museCheck(String artist_id){
		
		return sqlSession.selectOne("dao.MuseMapper.museCheck",artist_id);
	}
	
	public List<HashMap<String, Object>> bestMuse(String artist_id){
		return sqlSession.selectList("dao.MuseMapper.bestMuse", artist_id);
	}
	
	public List<HashMap<String, Object>> myMuse(String artist_id){
		return sqlSession.selectList("dao.MuseMapper.myMuse", artist_id);		
	}
	
	public List<MuseDto> allMuse(String artist_id){
		return sqlSession.selectList("dao.MuseMapper.allMuse", artist_id);
	}
	
	public int museCancle(String artist_id, String muse_name){
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("artist_id", artist_id);
		hMap.put("muse_name", muse_name);
		
		return sqlSession.delete("dao.MuseMapper.cancle", hMap);
	}
	
	public int museSignup(String artist_id, String muse_name){
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("artist_id", artist_id);
		hMap.put("muse_name", muse_name);
		
		return sqlSession.insert("dao.MuseMapper.signup", hMap);
	}
	
	public MuseDto masterCheck(String artist_id, String muse_name){
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("artist_id", artist_id);
		hMap.put("muse_name", muse_name);
		
		return sqlSession.selectOne("dao.MuseMapper.masterCheck", hMap);
		
	}
	
	public List<HashMap<String, Object>> joinMember(String muse_name){
		return sqlSession.selectList("dao.MuseMapper.joinMember", muse_name);
	}
	
	public List<HashMap<String, Object>> nonMember(String muse_name){
		return sqlSession.selectList("dao.MuseMapper.nonMember", muse_name);	
	}
	
	public int inviteMember(String artist_id, String muse_name){
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("artist_id", artist_id);
		hMap.put("muse_name", muse_name);
		
		return sqlSession.update("dao.MuseMapper.inviteMember", hMap);
	}
	
	public int outMember(String artist_id, String muse_name){
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("artist_id", artist_id);
		hMap.put("muse_name", muse_name);
		
		return sqlSession.delete("dao.MuseMapper.cancle", hMap);
	}
}
