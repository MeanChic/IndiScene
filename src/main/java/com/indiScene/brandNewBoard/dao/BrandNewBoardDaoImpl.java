package com.indiScene.brandNewBoard.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.indiScene.brandNewBoard.dto.BrandNewBoardDto;

@Component
public class BrandNewBoardDaoImpl implements BrandNewBoardDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<BrandNewBoardDto> getBrandNewList(HashMap<String, Integer> rowMap) {
		return sqlSession.selectList("dao.BrandNewMapper.getBrandNewList",rowMap);
	}

	@Override
	public int getBrandNewCount() {
		return sqlSession.selectOne("dao.BrandNewMapper.getBrandNewCount");
	}
	
	@Override
	public BrandNewBoardDto read(String board_num) {
		return sqlSession.selectOne("dao.BrandNewMapper.read", board_num);
	}

	@Override
	public void readCount(String board_num) {
		sqlSession.update("dao.BrandNewMapper.readCount",board_num);
	}
}
