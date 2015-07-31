package com.indiScene.performBoard.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.indiScene.artist.dto.ZipcodeDto;
import com.indiScene.performBoard.dto.PerformBoardDto;

/**
@name  : MarketBoardDaoImpl
@date  : 2015. 6. 25.
@auther: 오정승
@description : 공연게시판 비지니스 로직에 접근하기위한 dao
 */
@Component
public class PerformBoardDaoImpl implements PerformBoardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<ZipcodeDto> ZipcodeList(String dong) {
		return sqlSession.selectList("dao.ArtistMapper.zipcode",dong);
	}
	
	@Override
	public int getCount() {
		System.out.println("daoImpl");
		return sqlSession.selectOne("dao.performBoardMapper.boardCount");
	}

	@Override
	public List<PerformBoardDto> getMarketList(int startRow, int endRow) {
		HashMap<String, Integer> hMap=new HashMap<String,Integer>();
		hMap.put("startRow",startRow);
		hMap.put("endRow", endRow);
		
		return sqlSession.selectList("dao.performBoardMapper.boardList", hMap); //SelectList Dto瑜� �옄�룞�쑝濡� 諛쏆븘�꽌 �젮二쇰뒗 �뿭�븷  
	}

	@Override
	public int insert(PerformBoardDto marketBoardDto) {
		return sqlSession.insert("dao.performBoardMapper.boardInsert", marketBoardDto);
	}

	@Override
	public PerformBoardDto read(String boardNumber) {
		return sqlSession.selectOne("dao.performBoardMapper.boardRead", boardNumber);
	}

	@Override
	public int count(String boardNumber) {
		return sqlSession.insert("dao.performBoardMapper.readCount", boardNumber);
	}

	@Override
	public String passCheck(String artist_id) {
		return sqlSession.selectOne("dao.performBoardMapper.passCheck",artist_id);
	}

	@Override
	public int delete(String board_num) {
		return sqlSession.delete("dao.performBoardMapper.delete",board_num);
	}

	@Override
	public PerformBoardDto update(String board_num) {
		return sqlSession.selectOne("dao.performBoardMapper.boardRead", board_num);
	}

	@Override
	public int updateOk(PerformBoardDto marketBoardDto) {
		return sqlSession.update("dao.performBoardMapper.update", marketBoardDto);
	}
	
	
}
