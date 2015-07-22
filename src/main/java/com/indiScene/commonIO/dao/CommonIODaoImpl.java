package com.indiScene.commonIO.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.indiScene.commonIO.dto.CommonMusicDto;

@Component
public class CommonIODaoImpl implements CommonIODao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getCommonBoardCount(String folderName, String searchWord,
			String searchType) {
		Map<String,Object> hMap=new HashMap<String,Object>();
		hMap.put("folderName", folderName);
		hMap.put("searchWord", searchWord);
		hMap.put("searchType", searchType);
		
		return sqlSession.selectOne("dao.commonIOMapper.commonBoardCount",hMap);
	}

	@Override
	public Object getCommonBoardList(int startRow, int endRow,
			String searchWord, String searchType, String folderName) {
		// TODO Auto-generated method stub
		Map<String,Object> hMap=new HashMap<String,Object>();
		hMap.put("folderName", folderName);
		hMap.put("searchWord", searchWord);
		hMap.put("searchType", searchType);
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		if(folderName.equals("marketBoard")){
			return sqlSession.selectList("dao.commonIOMapper.marketBoardSearchList",hMap);
		}else if(folderName.equals("freeBoard")){
			return sqlSession.selectList("dao.commonIOMapper.freeBoardSearchList",hMap);
		}else if(folderName.equals("uploadBoard")){
			return sqlSession.selectList("dao.commonIOMapper.uploadBoardSearchList",hMap);
		}else{
			return null;
		}
		
	}

	@Override
	public List<CommonMusicDto> getUploadMusic(HashMap<String,Object> rowMap) {
		return sqlSession.selectList("dao.commonIOMapper.getUploadMusic",rowMap);
	}

	@Override
	public List<CommonMusicDto> getMuseMusic(HashMap<String,Object> rowMap) {
		return sqlSession.selectList("dao.commonIOMapper.getMuseMusic",rowMap);
	}

	@Override
	public List<CommonMusicDto> getLikeMusic(HashMap<String,Object> rowMap) {
		return sqlSession.selectList("dao.commonIOMapper.getLikeMusic",rowMap);
	}

	@Override
	public List<CommonMusicDto> getUploadCollabo(HashMap<String,Object> rowMap) {
		return sqlSession.selectList("dao.commonIOMapper.getUploadCollabo",rowMap);
	}

	@Override
	public List<CommonMusicDto> getMuseCollabo(HashMap<String,Object> rowMap) {
		return sqlSession.selectList("dao.commonIOMapper.getMuseCollabo",rowMap);
	}

	@Override
	public int getUploadCount(String artist_id) {
		int count =sqlSession.selectOne("dao.commonIOMapper.uploadMusicCount", artist_id);
		int count2=	sqlSession.selectOne("dao.commonIOMapper.museMusicCount", artist_id);
		return count+count2;
	}

	@Override
	public int getLikeCount(String artist_id) {
		return sqlSession.selectOne("dao.commonIOMapper.likeMusicCount", artist_id);
	}

	@Override
	public int getCollaboCount(String artist_id) {
		int count =sqlSession.selectOne("dao.commonIOMapper.uploadCollaboCount", artist_id);
		int count2=	sqlSession.selectOne("dao.commonIOMapper.museCollaboCount", artist_id);
		return count+count2;
	}
}
