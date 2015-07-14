package com.indiScene.reply.dao;

import java.util.List;

import com.indiScene.reply.dto.ReplyDto;

public interface ReplyDao {

	public List<ReplyDto> replyList(String boardNumber);
	
	public int replyInsert(ReplyDto replyDto);
	
	public int getReplyNum(String board_num);
	
	public int delete(String board_num, int reply_num);

	public ReplyDto upSelect(String board_num, int reply_num);
	
	public int update(ReplyDto replyDto);
}
