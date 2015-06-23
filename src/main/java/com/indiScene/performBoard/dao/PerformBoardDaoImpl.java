package com.indiScene.performBoard.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class PerformBoardDaoImpl implements PerformBoardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int boardGroupNumberMax(){
		return sqlSession.selectOne("dao.PerformMapper.boardGroupNumberMax");
	}
	
	public int boardGroupNumberUpdate(HashMap<String, Integer> hMap){
		
		return sqlSession.update("dao.PerformMapper.boardGroupNumberUpdate",hMap );
	}
	
}
