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
		return sqlSession.insert("dao.MuseMapper.logup", museDto);
	}
	
	public MuseDto museCheck(String artist_id){
		
		return sqlSession.selectOne("dao.MuseMapper.museCheck",artist_id);
	}
	
	public List<MuseDto> bestMuse(){
		return sqlSession.selectList("dao.MuseMapper.bestMuse");
	}
	
	public List<HashMap<String, Object>> myMuse(String artist_id){
		return sqlSession.selectList("dao.MuseMapper.myMuse", artist_id);		
	}
	
	public List<MuseDto> allMuse(String artist_id){
		return sqlSession.selectList("dao.MuseMapper.allMuse", artist_id);
	}
}
