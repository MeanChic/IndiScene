package com.indiScene.reply.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.indiScene.reply.dao.ReplyDao;
import com.indiScene.reply.dto.ReplyDto;

/**
@name  : ReplyServiceImpl
@date  : 2015. 7. 8.
@auther: 나혁진
@description : 한줄닷글 관리를 위한 service 클래스이다
 */
@Component
public class ReplyServiceImpl implements ReplyService {
	final Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private ReplyDao replyDao;
	
	@Override
	public void replyList(String board_num) {
		//한줄댓글 리스트를 불러오는 행위는 각게시판에 귀속되기 때문에 replyService를 거치지 않는다 각 게시판의 Service에서해결
	}


	/**
	@name  : write
	@date  : 2015. 7. 8.
	@auther: 나혁진
	@description : request파라미터를 dto에 담아서 dao로 보낸다
	 */
	@Override
	public void write(ModelAndView mav) throws IOException {
		// TODO Auto-generated method stub
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		HttpServletResponse response=(HttpServletResponse) map.get("response");
		
		String artist_id=request.getParameter("artist_id");
		String board_num=request.getParameter("board_num");
		String reply_content=request.getParameter("reply_content");
		Date date=new Date();
		
		ReplyDto replyDto=new ReplyDto();
		
		replyDto.setArtist_id(artist_id);
		replyDto.setBoard_num(board_num);
		replyDto.setReply_content(reply_content);
		replyDto.setReply_date(date);
		
		int check=replyDao.replyInsert(replyDto);
		
		if(check>0){
			int reply_num=replyDao.getReplyNum(board_num);
			
			String str=reply_num+"," +artist_id + "," + reply_content+","+date+","+board_num;
			response.setContentType("application/html;charset=utf-8");
			
			PrintWriter out=response.getWriter();
			out.print(str);
		}
	}


	@Override
	public void delete(ModelAndView mav) throws IOException {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		HttpServletResponse response=(HttpServletResponse) map.get("response");
		
		String board_num=request.getParameter("board_num");
		int reply_num=Integer.parseInt(request.getParameter("reply_num"));
		
		int check=replyDao.delete(board_num,reply_num);
		
		if(check==1){
			response.setContentType("application/html;charset=utf-8");
			PrintWriter out=response.getWriter();
			out.print(reply_num+ ","+board_num);
		}else{
			
		}
		
	}


	@Override
	public void upSelect(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		String board_num=request.getParameter("board_num");
		int reply_num=Integer.parseInt(request.getParameter("reply_num"));
		
		ReplyDto replyDto=replyDao.upSelect(board_num,reply_num);
		
		if(replyDto!=null){
			response.setContentType("application/html;charset=utf-8");
			PrintWriter out=response.getWriter();
			out.print(replyDto.getReply_num()+ "," +replyDto.getReply_content());
		}else{
			
		}
	}
	
	public void update(HttpServletRequest request,
			HttpServletResponse response) throws Throwable{
		String board_num=request.getParameter("board_num");
		String reply_content=request.getParameter("reply_content");
		int reply_num=Integer.parseInt(request.getParameter("reply_num"));
		
		ReplyDto replyDto=new ReplyDto();
		replyDto.setBoard_num(board_num);
		replyDto.setReply_content(reply_content);
		replyDto.setReply_num(reply_num);
		
		int check=replyDao.update(replyDto);
		
		if(check>0){
			response.setContentType("application/html;charset=utf-8");
			PrintWriter out=response.getWriter();
			String str=reply_num+"," + reply_content;
			out.print(str);
		}
	}
	
	

}
