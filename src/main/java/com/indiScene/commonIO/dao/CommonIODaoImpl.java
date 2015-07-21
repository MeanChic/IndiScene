package com.indiScene.commonIO.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.indiScene.marketBoard.dto.MarketBoardDto;



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
		}else{
			return null;
		}
		
	}
}
