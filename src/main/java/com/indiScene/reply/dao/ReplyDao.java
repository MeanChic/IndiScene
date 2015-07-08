package com.indiScene.reply.dao;

import java.util.List;

import com.indiScene.reply.dto.ReplyDto;

public interface ReplyDao {

	public List<ReplyDto> replyList(String boardNumber);
	
	public int replyInsert(ReplyDto replyDto);
	
	public int getReplyNum(String board_num);
}
