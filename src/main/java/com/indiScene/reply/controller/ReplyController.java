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
	public void write(HttpServletRequest request,HttpServletResponse response,ReplyDto replyDto) throws IOException{
		logger.info("replyWrite--------------------------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("response",response);
		replyService.write(mav);
		
	}
	
	/**
	@name  : write
	@date  : 2015. 7. 8.
	@auther: 나혁진
	@description :한줄댓글 삭제를 누르면 댓글번호와 게시물 번호를 담아 replyService로 보낸다
	 */
	@RequestMapping(value="/replyDelete.do", method=RequestMethod.GET)
	public void delete(HttpServletRequest request,HttpServletResponse response) throws IOException{
		logger.info("replyDelete--------------------------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("response",response);
		replyService.delete(mav);
	}
	
	/**
	@name  : write
	@date  : 2015. 7. 8.
	@auther: 나혁진
	@description :한줄댓글 수정을 누르면 원래 내용을 불러오기 위해 replyService를 호출한다.
	 */
	@RequestMapping(value="/replySelect.do", method=RequestMethod.GET)
	public void upSelect(HttpServletRequest request, HttpServletResponse response) throws Throwable{
		logger.info("replyUpSelect-------------------------------");
		
		replyService.upSelect(request,response);
	}
	
	
	/**
	@name  : write
	@date  : 2015. 7. 8.
	@auther: 나혁진
	@description :수정된 내용을 mav에 담아 replyService로 보낸다
	 */
	@RequestMapping(value="/replyUpdate.do", method=RequestMethod.GET)
	public void update(HttpServletRequest request,HttpServletResponse response) throws Throwable{
		logger.info("replyUpdate-----------------------------");
		
		replyService.update(request, response);
	}
}
