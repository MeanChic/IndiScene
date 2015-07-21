package com.indiScene.marketBoard.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.indiScene.marketBoard.dto.MarketBoardDto;

/**
@name  : MarketBoardDaoImpl
@date  : 2015. 6. 25.
@auther: 나혁진
@description : 거래게시판 비지니스 로직에 접근하기위한 dao
 */
@Component
public class MarketBoardDaoImpl implements MarketBoardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	                          
	@Override
	public int getCount(String searchWord, String searchType) {
		Map<String,Object> hMap=new HashMap<String,Object>();
		hMap.put("searchWord", searchWord);
		hMap.put("searchType", searchType);
		System.out.println("daoImpl");
		return sqlSession.selectOne("dao.marketBoardMapper.boardCount",hMap);
	}

	@Override
	public List<MarketBoardDto> getMarketList(int startRow, int endRow, String searchWord, String searchType) {
		HashMap<String, Object> hMap=new HashMap<String,Object>();
		hMap.put("startRow",startRow);
		hMap.put("endRow", endRow);
		hMap.put("searchWord", searchWord);
		hMap.put("searchType", searchType);
		
		return sqlSession.selectList("dao.marketBoardMapper.boardList", hMap); //SelectList Dto瑜� �옄�룞�쑝濡� 諛쏆븘�꽌 �젮二쇰뒗 �뿭�븷  
	}

	@Override
	public int insert(MarketBoardDto marketBoardDto) {
		return sqlSession.insert("dao.marketBoardMapper.boardInsert", marketBoardDto);
	}

	@Override
	public MarketBoardDto read(String boardNumber) {
		return sqlSession.selectOne("dao.marketBoardMapper.boardRead", boardNumber);
	}

	@Override
	public int count(String boardNumber) {
		return sqlSession.insert("dao.marketBoardMapper.readCount", boardNumber);
	}

	@Override
	public String passCheck(String artist_id) {
		return sqlSession.selectOne("dao.marketBoardMapper.passCheck",artist_id);
	}

	@Override
	public int delete(String board_num) {
		return sqlSession.delete("dao.marketBoardMapper.delete",board_num);
	}

	@Override
	public MarketBoardDto update(String board_num) {
		return sqlSession.selectOne("dao.marketBoardMapper.boardRead", board_num);
	}

	@Override
	public int updateOk(MarketBoardDto marketBoardDto) {
		return sqlSession.update("dao.marketBoardMapper.update", marketBoardDto);
	}

//	@Override
//	public int searchGetCount(String searchType, String searchWord) {
//		
//		
//		
//		return 0;
//	}
	
	
}
