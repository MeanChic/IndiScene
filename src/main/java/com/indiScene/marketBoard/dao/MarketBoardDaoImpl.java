package com.indiScene.marketBoard.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.indiScene.marketBoard.dto.MarketBoardDto;

@Component
public class MarketBoardDaoImpl implements MarketBoardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getCount() {
		System.out.println("daoImpl");
		return sqlSession.selectOne("marketBoardCount");
	}

	@Override
	public List<MarketBoardDto> getMarketList(int startRow, int endRow) {
		HashMap<String, Integer> hMap=new HashMap<String,Integer>();
		hMap.put("startRow",startRow);
		hMap.put("endRow", endRow);
		return sqlSession.selectList("marketBoardList", hMap); //SelectList Dto를 자동으로 받아서 ㅃ려주는 역할  
	}

}
