package com.indiScene.museBoard.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.indiScene.museBoard.dto.MuseBoardDto;

@Component
public class MuseBoardDaoImpl implements MuseBoardDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int write(MuseBoardDto dto) {
		return sqlSession.insert("dao.MuseBoardMapper.boardInsert", dto);
	}

	@Override
	public int boardGroupNumberMax() {
		return sqlSession.selectOne("dao.MuseBoardMapper.GroupNumberMax");
	}

	@Override
	public void boardGroupNumberUpdate(HashMap<String,Integer> hMap) {
		sqlSession.update("dao.MuseBoardMapper.GroupNumberUpdate",hMap);
	}

	@Override
	public int getBoardCount() {
		return sqlSession.selectOne("dao.MuseBoardMapper.getBoardCount");
	}

	@Override
	public List<MuseBoardDto> getBoardList(HashMap<String,Integer> rowMap) {
		return sqlSession.selectList("dao.MuseBoardMapper.getBoardList", rowMap);
	}

	@Override
	public MuseBoardDto read(String board_num) {
		return sqlSession.selectOne("dao.MuseBoardMapper.read", board_num);
	}

	@Override
	public void readCount(String board_num) {
		sqlSession.update("dao.MuseBoardMapper.readCount",board_num);
	}

	@Override
	public int delete(HashMap<String, String> hMap) {
		return sqlSession.delete("dao.MuseBoardMapper.delete",hMap);
	}

	@Override
	public int update(MuseBoardDto upload) {
		return sqlSession.update("dao.MuseBoardMapper.update",upload);
	}
/*
	@Override
	public int likeCheck(HashMap<String, String> hMap) {
		return sqlSession.selectOne("dao.MuseBoardMapper.likeCheck",hMap);
	}

	@Override
	public int like(HashMap<String, String> hMap) {
		return sqlSession.insert("dao.MuseBoardMapper.like",hMap);
	}

	@Override
	public int likeUpdate(HashMap<String, String> hMap) {
		return sqlSession.update("dao.MuseBoardMapper.likeUpdate",hMap);
	}

	@Override
	public int checkLike(HashMap<String, String> hMap) {
		return sqlSession.selectOne("dao.MuseBoardMapper.checkLike",hMap);
	}

	@Override
	public void copyBest(String board_num) {
		sqlSession.insert("dao.MuseBoardMapper.copyBest",board_num);
	}*/

	@Override
	public int museToUpload(MuseBoardDto board) {
		return sqlSession.insert("dao.MuseBoardMapper.museToUpload", board);
	}
}
