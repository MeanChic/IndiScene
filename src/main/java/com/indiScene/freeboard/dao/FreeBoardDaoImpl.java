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
	public int insert(FreeBoardDto freeBoardDto) {
		return sqlSession.insert("dao.FreeBoardMapper.freeBoardInsert",freeBoardDto);
	}

	@Override
	public int freeBoardGroupNumberUpdate(HashMap<String, Integer> hMap) {
		 return sqlSession.update("dao.FreeBoardMapper.freeBoardGroupNumberUpdate",hMap);
		
	}

	@Override
	public int freeBoardGroupNumberMax() {
		
		return sqlSession.selectOne("dao.FreeBoardMapper.freeBoardGroupNumberMax");
	}

	@Override
	public int getCount() {
		return sqlSession.selectOne("dao.FreeBoardMapper.count");
	}

	@Override
	public List<FreeBoardDto> getFreeBoardList(int startRow, int endRow) {
		
		HashMap<String, Integer> hMap=new HashMap<String, Integer>();
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		
		return sqlSession.selectList("dao.FreeBoardMapper.freeBoardList",hMap);
	}

	@Override
	public FreeBoardDto freeBoardRead(int board_num) {
		return sqlSession.selectOne("dao.FreeBoardMapper.read",board_num);	//해당 게시물을 가져옴.
	}

	@Override
	public int count(int board_num) {
		return sqlSession.insert("dao.FreeBoardMapper.readCount",board_num);//조회수 1증가
	}

	@Override
	public int freeBoardDelete(int board_num) {
		return sqlSession.delete("dao.FreeBoardMapper.delete",board_num);
	}
	
	
	@Override
	public FreeBoardDto freeBoardUpdateSelect(int board_num) {
		
		return sqlSession.selectOne("dao.FreeBoardMapper.updateSelect",board_num);
	}

	@Override
	public int freeBoardUpdate(FreeBoardDto freeBoardDto) {
		
		return sqlSession.update("dao.FreeBoardMapper.update",freeBoardDto);
	}
	

}