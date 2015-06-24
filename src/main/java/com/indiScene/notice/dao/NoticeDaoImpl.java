package com.indiScene.notice.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.indiScene.notice.dto.NoticeDto;

@Component
public class NoticeDaoImpl implements NoticeDao {
@Autowired
SqlSessionTemplate sqlSession;

@Override
public int insert(NoticeDto noticeDto) {
	
	return sqlSession.insert("dao.NoticeMapper.noticeInsert",noticeDto);
	}

@Override

public int noticeGroupNumberUpdate(HashMap<String, Integer> hMap) {	
	 return sqlSession.update("dao.NoticeMapper.noticeGroupNumberUpdate",hMap);
}

@Override
public int noticeGroupNumberMax() {
	
	return sqlSession.selectOne("dao.NoticeMapper.noticeGroupNumberMax");
}

@Override
public int getCount() {
	
	return sqlSession.selectOne("dao.NoticeMapper.count");
}

@Override
public List<NoticeDto> getNoticeList(int startRow, int endRow){
	HashMap<String, Integer> hMap=new HashMap<String, Integer>();
	hMap.put("startRow", startRow);
	hMap.put("endRow", endRow);
	
	return sqlSession.selectList("dao.NoticeMapper.noticeList",hMap);
}



}
