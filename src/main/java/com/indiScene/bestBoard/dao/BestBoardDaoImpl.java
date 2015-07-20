package com.indiScene.bestBoard.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.indiScene.bestBoard.dto.BestBoardDto;

@Component
public class BestBoardDaoImpl implements BestBoardDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	@Override
	public List<BestBoardDto> getBestList(HashMap<String, Integer> rowMap) {
		return sqlSession.selectList("dao.BestMapper.getBestList",rowMap);
	}

	@Override
	public int getBestCount() {
		return sqlSession.selectOne("dao.BestMapper.getBestCount");
	}
	
	@Override
	public BestBoardDto read(String board_num) {
		return sqlSession.selectOne("dao.BestMapper.read", board_num);
	}

	@Override
	public void readCount(String board_num) {
		sqlSession.update("dao.BestMapper.readCount",board_num);
	}
}
