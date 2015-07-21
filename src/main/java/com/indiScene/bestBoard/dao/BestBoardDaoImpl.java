package com.indiScene.bestBoard.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.indiScene.bestBoard.dto.BestBoardDto;
import com.indiScene.commonIO.dto.CommonMusicDto;
import com.indiScene.museBoard.dto.MuseBoardDto;
import com.indiScene.uploadBoard.dto.UploadBoardDto;

@Component
public class BestBoardDaoImpl implements BestBoardDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	@Override
	public List<BestBoardDto> getBestList(HashMap<String, Integer> rowMap) {
		return sqlSession.selectList("dao.BestMapper.getBestList",rowMap);
	}

	@Override
	public int getBestCount() {
		return sqlSession.selectOne("dao.BestMapper.getBestCount");
	}
	
	@Override
	public BestBoardDto read(String board_num) {
		return sqlSession.selectOne("dao.BestMapper.read", board_num);
	}

	@Override
	public void readCount(String board_num) {
		sqlSession.update("dao.BestMapper.readCount",board_num);
	}

	@Override
	public int musicAppend(HashMap<String, String> hMap) {
		int check=0;
		int value = sqlSession.selectOne("dao.BestMapper.duplicateCheck",hMap);
		if(value==0){
			check = sqlSession.insert("dao.BestMapper.musicAppend", hMap);
		}
		return check;
	}

	@Override
	public List<CommonMusicDto> getMusicList(String artist_id) {
		return sqlSession.selectList("dao.BestMapper.getMusicList",artist_id);
	}
	
	@Override
	public List<CommonMusicDto> getMusicListMuse(String artist_id) {
		return sqlSession.selectList("dao.BestMapper.getMusicListMuse",artist_id);
	}

	@Override
	public UploadBoardDto getAppendMusic(String board_num) {
		return sqlSession.selectOne("dao.BestMapper.getAppendMusic",board_num);
	}

	@Override
	public int musicListDelete(HashMap<String, String> hMap) {
		return sqlSession.delete("dao.BestMapper.musicListDelete",hMap);
	}

	@Override
	public MuseBoardDto getAppendMusicMuse(String board_num) {
		return sqlSession.selectOne("dao.BestMapper.getAppendMusicMuse", board_num);
	}
}
