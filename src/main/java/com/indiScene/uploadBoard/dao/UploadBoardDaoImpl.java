package com.indiScene.uploadBoard.dao;

import java.util.HashMap;
import java.util.List;

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

	@Override
	public int getBoardCount() {
		return sqlSession.selectOne("dao.UploadMapper.getBoardCount");
	}

	@Override
	public List<UploadBoardDto> getBoardList(HashMap<String,Integer> rowMap) {
		return sqlSession.selectList("dao.UploadMapper.getBoardList", rowMap);
	}

	@Override
	public UploadBoardDto read(String board_num) {
		return sqlSession.selectOne("dao.UploadMapper.read", board_num);
	}

	@Override
	public void readCount(String board_num) {
		sqlSession.update("dao.UploadMapper.readCount",board_num);
	}

	@Override
	public int delete(String board_num) {
		return sqlSession.delete("dao.UploadMapper.delete",board_num);
	}
}
