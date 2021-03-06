package com.indiScene.uploadBoard.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.indiScene.uploadBoard.dto.UploadBoardDto;

/**
 * @type : UploadBoardDaoImpl
 * @date : 2015. 7. 13.
 * @author : Kim MinSic
 * @description : manage database class
 */
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
	public int delete(HashMap<String,String> hMap) {
//		System.out.println(hMap.get("board_num")+"\t" + hMap.get("artist_id")+"\t"+hMap.get("password"));
		int check = sqlSession.delete("dao.UploadMapper.delete",hMap);
		sqlSession.delete("dao.BestMapper.deleteOnList",hMap);
		return check;
	}

	@Override
	public int update(UploadBoardDto upload) {
		return sqlSession.update("dao.UploadMapper.update",upload);
	}

	@Override
	public int likeCheck(HashMap<String, String> hMap) {
		return sqlSession.selectOne("dao.UploadMapper.likeCheck",hMap);
	}

	@Override
	public int like(HashMap<String, String> hMap) {
		return sqlSession.insert("dao.UploadMapper.like",hMap);
	}

	@Override
	public int likeUpdate(HashMap<String, String> hMap) {
		sqlSession.update("dao.UploadMapper.bestLikeUpdate",hMap);
		return sqlSession.update("dao.UploadMapper.likeUpdate",hMap);
	}

	@Override
	public int checkLike(HashMap<String, String> hMap) {
		return sqlSession.selectOne("dao.UploadMapper.checkLike",hMap);
	}

	@Override
	public void copyBest(String board_num) {
		sqlSession.insert("dao.UploadMapper.copyBest",board_num);
	}
}
