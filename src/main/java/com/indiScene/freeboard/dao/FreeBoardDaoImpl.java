package com.indiScene.freeboard.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.indiScene.freeboard.dto.FreeBoardDto;

@Component
public class FreeBoardDaoImpl implements FreeBoardDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int insert(FreeBoardDto freeBoardDto) {
		return sqlSession.insert("dao.FreeBoardMapper.freeBoardInsert",freeBoardDto);
	}

	@Override
	public int freeBoardGroupNumberUpdate(HashMap<String, Integer> hMap) {
		 return sqlSession.update("dao.FMapper.freeBoardGroupNumberUpdate",hMap);
		
	}

	@Override
	public int freeBoardGroupNumberMax() {
		
		return sqlSession.selectOne("dao.FreeBoardMapper.freeBoardGroupNumberMax");
	}

	@Override
	public int getCount() {
		return sqlSession.selectOne("dao.freeBoardMapper.count");
	}

	@Override
	public List<FreeBoardDto> getFreeBoardList(int startRow, int endRow) {
		
		HashMap<String, Integer> hMap=new HashMap<String, Integer>();
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		
		return sqlSession.selectList("dao.FreeBoardMapper.freeBoardList",hMap);
	}
	
	/*
	
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
	
	@Override
	public NoticeDto noticeRead(int board_num) {
		
		NoticeDto notice=null;
		
		try{
		
			sqlSession.update("dao.NoticeMapper.count",board_num);		//조회수 1증가
			notice=sqlSession.selectOne("dao.NoticeMapper.read",board_num);	//해당 게시물을 가져옴.
		
		}catch(Exception e){
			
			sqlSession.rollback();
			
		}
			return notice;
		}
	
	@Override
	public int noticeDelete(int board_num) {
		
		return sqlSession.delete("dao.NoticeMapper.delete",board_num);
		
		}
	@Override
	public NoticeDto noticeUpdateSelect(int board_num) {
		
		return sqlSession.selectOne("dao.NoticeMapper.updateSelect",board_num);
	}

	@Override
	public int noticeUpdate(NoticeDto noticeDto) {
		
		return sqlSession.update("dao.NoticeMapper.update",noticeDto);
	}
	*/

}
