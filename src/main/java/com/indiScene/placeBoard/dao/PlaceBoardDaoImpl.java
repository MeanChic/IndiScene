package com.indiScene.placeBoard.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.indiScene.placeBoard.dto.PlaceBoardDto;

/**
@name  : MarketBoardDaoImpl
@date  : 2015. 6. 25.
@auther: 나혁진
@description : 거래게시판 비지니스 로직에 접근하기위한 dao
 */
@Component
public class PlaceBoardDaoImpl implements PlaceBoardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	                          
	@Override
	public int getCount() {
		System.out.println("daoImpl");
		return sqlSession.selectOne("dao.placeBoardMapper.boardCount");
	}

	@Override
	public List<PlaceBoardDto> getMarketList(int startRow, int endRow) {
		HashMap<String, Integer> hMap=new HashMap<String,Integer>();
		hMap.put("startRow",startRow);
		hMap.put("endRow", endRow);
		
		return sqlSession.selectList("dao.placeBoardMapper.boardList", hMap); //SelectList Dto瑜� �옄�룞�쑝濡� 諛쏆븘�꽌 �젮二쇰뒗 �뿭�븷  
	}

	@Override
	public int insert(PlaceBoardDto marketBoardDto) {
		return sqlSession.insert("dao.placeBoardMapper.boardInsert", marketBoardDto);
	}

	@Override
	public PlaceBoardDto read(String boardNumber) {
		return sqlSession.selectOne("dao.placeBoardMapper.boardRead", boardNumber);
	}

	@Override
	public int count(String boardNumber) {
		return sqlSession.insert("dao.placeBoardMapper.readCount", boardNumber);
	}

	@Override
	public String passCheck(String artist_id) {
		return sqlSession.selectOne("dao.placeBoardMapper.passCheck",artist_id);
	}

	@Override
	public int delete(String board_num) {
		return sqlSession.delete("dao.placeBoardMapper.delete",board_num);
	}

	@Override
	public PlaceBoardDto update(String board_num) {
		return sqlSession.selectOne("dao.placeBoardMapper.boardRead", board_num);
	}

	@Override
	public int updateOk(PlaceBoardDto marketBoardDto) {
		return sqlSession.update("dao.placeBoardMapper.update", marketBoardDto);
	}
	
	
}
