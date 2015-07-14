package com.indiScene.reply.service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface ReplyService {

	public void replyList(String board_num);
	
	public void write(ModelAndView mav) throws IOException;
	
	public void delete(ModelAndView mav) throws IOException;

	public void upSelect(HttpServletRequest request,HttpServletResponse response) throws Throwable;
	
	public void update(HttpServletRequest request,HttpServletResponse response) throws Throwable;
	
}
