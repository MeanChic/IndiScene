package com.indiScene.uploadBoard.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.indiScene.uploadBoard.dto.UploadBoardDto;

@Component
public class UploadBoardDaoImpl implements UploadBoardDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int write(UploadBoardDto dto) {
		return sqlSession.insert("dao.UploadMapper.boardInsert", dto);
	}

	@Override
	public int boardGroupNumberMax() {
		return sqlSession.selectOne("dao.UploadMapper.GroupNumberMax");
	}

	@Override
	public void boardGroupNumberUpdate(HashMap<String,Integer> hMap) {
		sqlSession.update("dao.UploadMapper.GroupNumberUpdate",hMap);
	}
}
