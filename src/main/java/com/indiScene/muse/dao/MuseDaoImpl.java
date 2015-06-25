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
 * @description :	
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
		return sqlSession.selectOne("dao.MuseMapper.nameCheck",artist_id);
	}
	/*public int boardGroupNumberMax(){
		return sqlSession.selectOne("dao.PerformMapper.boardGroupNumberMax");
	}
	
	public int boardGroupNumberUpdate(HashMap<String, Integer> hMap){
		
		return sqlSession.update("dao.PerformMapper.boardGroupNumberUpdate",hMap );
	}
	
	public int insert(PerformBoardDto boardDto){
		int check = 0;
		
		if(boardDto.getFile_name() == null){
			logger.info("-- no File=================");
			check = sqlSession.insert("dao.PerformMapper.boardInsert", boardDto);
		}else{
			logger.info("-- File=================");
			check = sqlSession.insert("dao.PerformMapper.boardInsertAll", boardDto);
		}
		logger.info("-- DAo Check" + check);
		
		return check;	
	}
	
	public int getBoardCount(){
		return sqlSession.selectOne("dao.PerformMapper.boardCount");
	}
	
	public List<PerformBoardDto> getBoardList(int startRow, int endRow){
		HashMap<String, Integer> hMap = new HashMap<String, Integer>();
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		
		return sqlSession.selectList("dao.PerformMapper.getBoardList", hMap);
	}
	
	public PerformBoardDto read(String board_num){
		
		PerformBoardDto board = null;
		int check = 0;
		
		try{
			check = sqlSession.update("readCount" , board_num);
			logger.info("ch Dao check : " + check);
			if(check == 1){
				board = sqlSession.selectOne("dao.PerformMapper.read", board_num);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return board;
	}*/
}
