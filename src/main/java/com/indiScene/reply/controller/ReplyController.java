package com.indiScene.reply.controller;

import java.io.IOException;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.indiScene.reply.dto.ReplyDto;
import com.indiScene.reply.service.ReplyService;

/**
@name  : ReplyController
@date  : 2015. 7. 8.
@auther: 나혁진
@description :한줄댓글 작성을 위한 컨트롤러이다
 */
@Controller
public class ReplyController {
	final Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private ReplyService replyService;
	
	/**
	@name  : write
	@date  : 2015. 7. 8.
	@auther: 나혁진
	@description :한줄댓글 작정을 누르면 내용을 mav에 담아 replyService로 보낸다
	 */
	@RequestMapping(value="/replyWrite.do", method=RequestMethod.POST)
	public ModelAndView write(HttpServletRequest request,HttpServletResponse response,ReplyDto replyDto) throws IOException{
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("response",response);
		replyService.write(mav);
		
		return null;
		
	}
}
