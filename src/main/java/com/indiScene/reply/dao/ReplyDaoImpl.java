package com.indiScene.reply.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.indiScene.reply.dto.ReplyDto;

/**
@name  : ReplyDaoImpl
@date  : 2015. 7. 8.
@auther: 나혁진
@description : 한줄댓글 db 처리를 위한 dao 클래스이다
 */
@Component
public class ReplyDaoImpl implements ReplyDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<ReplyDto> replyList(String board_num) {
		return sqlSession.selectList("dao.replyMapper.replyRead", board_num);
	}

	@Override
	public int replyInsert(ReplyDto replyDto) {
		return sqlSession.insert("dao.replyMapper.replyInsert",replyDto);
	}

	@Override
	public int getReplyNum(String board_num) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("dao.replyMapper.replyGetBunho", board_num);
	}
}
