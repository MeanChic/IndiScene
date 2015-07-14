package com.indiScene.freeboard.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.indiScene.freeboard.dto.FreeBoardDto;

/**
 * @name : FreeBoardDaoImpl
 * @date : 2015. 6. 26.
 * @author : 손유진
 * @description :  sql문을 사용하기 위한 dao
 */
@Component
public class FreeBoardDaoImpl implements FreeBoardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int freeBoardGroupNumberMax() {
		return sqlSession.selectOne("dao.FreeBoardMapper.freeBoardGroupNumberMax");
	}
	@Override
	public int freeBoardGroupNumberUpdate(HashMap<String, Integer> hMap) {
		 return sqlSession.update("dao.FreeBoardMapper.freeBoardGroupNumberUpdate",hMap);
		
	}
	@Override
	public int insert(FreeBoardDto freeBoardDto) {
		return sqlSession.insert("dao.FreeBoardMapper.freeBoardInsert",freeBoardDto);
	}

	@Override
	public int getFreeBoardCount() {
		return sqlSession.selectOne("dao.FreeBoardMapper.freeBoardCount");
	}

	@Override
	public List<FreeBoardDto> getFreeBoardList(int startRow, int endRow) {
		
		HashMap<String, Integer> hMap=new HashMap<String, Integer>();
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		
		return sqlSession.selectList("dao.FreeBoardMapper.freeBoardList",hMap);
	}

	@Override
	public FreeBoardDto freeBoardRead(String board_num) {
		FreeBoardDto board =null;
		sqlSession.update("dao.FreeBoardMapper.count",board_num);//조회수 증가 
		board = sqlSession.selectOne("dao.FreeBoardMapper.read",board_num);	//해당 게시물을 가져옴.
		return board;
	}

	@Override
	public int freeBoardDelete(String board_num) {
		return sqlSession.delete("dao.FreeBoardMapper.delete",board_num);
	}
	
	
	@Override
	public FreeBoardDto freeBoardUpdateSelect(String board_num) {
		
		return sqlSession.selectOne("dao.FreeBoardMapper.updateSelect",board_num);
	}

	@Override
	public int freeBoardUpdate(FreeBoardDto freeBoardDto) {
		
		return sqlSession.update("dao.FreeBoardMapper.update",freeBoardDto);
	}
	

}
