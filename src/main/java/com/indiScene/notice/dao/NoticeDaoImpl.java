package com.indiScene.notice.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.indiScene.notice.dto.NoticeDto;


/**
 * @name : NoticeDaoImpl
 * @date : 2015. 6. 26.
 * @author : 손유진
 * @description : 비지니스 로직에 접근하기위한 dao
 */
@Component
public class NoticeDaoImpl implements NoticeDao {
		
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int noticeGroupNumberMax() {
		return sqlSession.selectOne("dao.NoticeMapper.noticeGroupNumberMax");
	}
	@Override
	public int noticeGroupNumberUpdate(HashMap<String, Integer> hMap) {	
		 return sqlSession.update("dao.NoticeMapper.noticeGroupNumberUpdate",hMap);
	}
	@Override
	public int insert(NoticeDto noticeDto) {
		return sqlSession.insert("dao.NoticeMapper.noticeInsert",noticeDto);
	}
	
	@Override
	public int getNoticeCount() {
		return sqlSession.selectOne("dao.NoticeMapper.noticeCount"); 
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
		NoticeDto board =null;
		sqlSession.update("dao.NoticeMapper.count",board_num);//조회수 증가 
		board = sqlSession.selectOne("dao.NoticeMapper.read",board_num);	//해당 게시물을 가져옴.
		return board;
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
	
}
