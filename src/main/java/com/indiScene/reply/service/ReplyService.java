package com.indiScene.reply.service;

import java.io.IOException;

import org.springframework.web.servlet.ModelAndView;

public interface ReplyService {

	public void replyList(String board_num);
	
	public void write(ModelAndView mav) throws IOException;
	
	
}
