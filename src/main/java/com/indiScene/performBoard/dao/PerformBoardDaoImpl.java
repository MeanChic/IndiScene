package com.indiScene.performBoard.dao;

import java.util.HashMap;
import java.util.List;
import java.util.logging.Logger;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.indiScene.performBoard.dto.PerformBoardDto;

@Component
public class PerformBoardDaoImpl implements PerformBoardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final Logger logger = Logger.getLogger(this.getClass().getName());
	
	public int boardGroupNumberMax(){
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
	}
}
