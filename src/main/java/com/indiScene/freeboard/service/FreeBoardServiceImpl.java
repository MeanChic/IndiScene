package com.indiScene.freeboard.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.indiScene.freeboard.dao.FreeBoardDao;
import com.indiScene.freeboard.dto.FreeBoardDto;

@Component
public class FreeBoardServiceImpl implements FreeBoardService {
	Logger logger=Logger.getLogger(this.getClass().getName());	

	@Autowired
	private FreeBoardDao freeBoardDao;
	
	@Override
	public void freeBoardWrite(ModelAndView mav) {
		
		Map<String,Object>map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int board_num=0;
		int group_num=1;
		int seq_num=0;
		int seq_level=0;
		
		if(request.getParameter("board_num")!=null){
			board_num=Integer.parseInt(request.getParameter("board_num"));
			group_num=Integer.parseInt(request.getParameter("group_num"));
			seq_num=Integer.parseInt(request.getParameter("seq_num"));
			seq_level=Integer.parseInt(request.getParameter("seq_level"));
		}
		
		logger.info("board_num:"+board_num);
		logger.info("group_num:"+group_num);
		logger.info("seq_num:"+seq_num);
		logger.info("seq_level:"+seq_level);
		
		String pageNumber=request.getParameter("pageNumber");
		if(pageNumber==null) pageNumber="1";
		
		mav.addObject("board_num", board_num);
		mav.addObject("group_num", group_num);
		mav.addObject("seq_num", seq_num);
		mav.addObject("seq_level", seq_level);
		mav.addObject("pageNumber",pageNumber);
		
		mav.setViewName("freeBoard/write");
	}
	
	@Override
	public void freeBoardWriteOk(ModelAndView mav) {
		Map<String,Object>map=mav.getModel();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		FreeBoardDto freeBoardDto=(FreeBoardDto)map.get("freeBoardDto");
		
		freeBoardWriteNumber(freeBoardDto);//그룹번호, 시퀀스번호, 시퀀스넘버, 보드넘버를 넘김.
		freeBoardDto.setRegister_date(new Date());
		freeBoardDto.setCount(0);
		
		int check = freeBoardDao.insert(freeBoardDto);
		logger.info("check:"+check);
		
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		mav.addObject("pageNumber",pageNumber);
		mav.addObject("check",check);
		mav.setViewName("freeBoard/writeOk");
		
	}
	
	private void freeBoardWriteNumber(FreeBoardDto freeBoardDto) {
		String board_num=freeBoardDto.getBoard_num();
		int group_num=freeBoardDto.getGroup_num();
		int seq_num=freeBoardDto.getSeq_num();
		int seq_level=freeBoardDto.getSeq_level();
		
		logger.info("-----boardNumber:" + board_num);
		logger.info("groupNumber:"+ group_num);
		logger.info("sequenceNumber:"+seq_num);
		logger.info("sequenceLevel:"+seq_level);
	
		int max=0;
	
		if(board_num.equals("0")){
			
			max=freeBoardDao.freeBoardGroupNumberMax();
			if(max!=0){
				max=max+1;
			}else{
				max=freeBoardDto.getGroup_num();
			}
			logger.info("max:"+max);
			
			group_num=max;
			seq_num=freeBoardDto.getSeq_num();
			seq_level=freeBoardDto.getSeq_level();
		}else{
			//답글 sequenceNumber와 level이 수정되야함.
			HashMap<String, Integer> hMap=new HashMap<String, Integer>();
			hMap.put("groupNumber", group_num);
			hMap.put("sequenceNumber", seq_num);
			hMap.put("sequenceLevel", seq_level);
			
			freeBoardDao.freeBoardGroupNumberUpdate(hMap);
			seq_num=seq_num+1;
			seq_level=seq_level+1;
		}
		freeBoardDto.setGroup_num(group_num);
		freeBoardDto.setSeq_num(seq_num);
		freeBoardDto.setSeq_level(seq_level);	
		
	}
	
	@Override
	public void freeBoardList(ModelAndView mav) {
		
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		String pageNumber=request.getParameter("pageNumber");
		if(pageNumber==null) pageNumber="1";
		
		int boardSize=10;
		int currentPage=Integer.parseInt(pageNumber);
		int startRow=(currentPage-1)*boardSize+1;
		int endRow=currentPage*boardSize;
		logger.info("boardList startRow: "+startRow+", endRow: "+endRow);
		
		int count=freeBoardDao.getFreeBoardCount();
		
		logger.info("freeBoardList count: "+count);
		
		List<FreeBoardDto> freeBoardList=null;
		if(count>0){
			freeBoardList=freeBoardDao.getFreeBoardList(startRow, endRow);
		}
		if(freeBoardList!=null)logger.info("freeBoardList size: "+freeBoardList.size());
		
	  
		mav.addObject("freeBoardSize",boardSize);
		mav.addObject("currentPage",currentPage);
		mav.addObject("count",count);
		mav.addObject("freeBoardList",freeBoardList);
	
		mav.setViewName("freeBoard/list");
	}
	
	@Override
	public void freeBoardRead(ModelAndView mav) {
		
		logger.info("freeboard ServerService-------------------------");
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
			
		/*	int board_num=Integer.parseInt(request.getParameter("board_num")); */
		String board_num=request.getParameter("board_num");
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));

		FreeBoardDto freeBoardDto= freeBoardDao.freeBoardRead(board_num);
		logger.info("freeBoardRead freeBoardDto: "+freeBoardDto);
		logger.info("ssfsdfsdfsdf:"+freeBoardDto.getContent());
		mav.addObject("freeBoard",freeBoardDto);
		
		mav.addObject("pageNumber",pageNumber);
		mav.setViewName("freeBoard/read");
		
	}	

	@Override
	public void freeBoardDelete(ModelAndView mav) {

		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		String board_num=request.getParameter("board_num");
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		logger.info("freeBoardDelete board_num: "+board_num+", pageNumber: "+pageNumber);
		
		mav.addObject("board_num",board_num);
		mav.addObject("pageNumber",pageNumber);
		
		mav.setViewName("freeBoard/delete");	
		
	}
	@Override
	public void freeBoardDeleteOk(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
	/*	int board_num=Integer.parseInt(request.getParameter("board_num"));*/
		String board_num=request.getParameter("board_num");
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		logger.info("freeBoardDeleteOk board_num: "+board_num+", pageNumber: "+pageNumber);
		
		int check=freeBoardDao.freeBoardDelete(board_num);
		logger.info("freeBoardDeleteOk check: "+check);
		
		mav.addObject("pageNumber",pageNumber);
		mav.addObject("check",check);
		
		mav.setViewName("freeBoard/deleteOk");
	}
	@Override
	public void freeBoardUpdate(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
			
		/*int board_num=Integer.parseInt(request.getParameter("board_num"));*/
		String board_num=request.getParameter("board_num");
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
	
		FreeBoardDto freeBoard=freeBoardDao.freeBoardUpdateSelect(board_num);
	/*	freeBoard=freeBoardDao.freeBoardUpdateSelect(pageNumber);*/
		logger.info("freeBoardUpdate freeBoard:"+freeBoard);
		
		//board와 pageNumber를 updateOk.jsp에 넘겨줘야한다.
		mav.addObject("freeBoard",freeBoard);
		mav.addObject("pageNumber",pageNumber);
		
		mav.setViewName("freeBoard/update");
		
	}
	@Override
	public void freeBoardUpdateOk(ModelAndView mav) {

		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		FreeBoardDto freeBoardDto=(FreeBoardDto)map.get("freeBoardDto");
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		logger.info("freeBoardUpdateOk freeBoardDto: "+freeBoardDto+", pageNumber: "+pageNumber);		
		
		int check=freeBoardDao.freeBoardUpdate(freeBoardDto);
		logger.info("freeBoardUpdateOk check: "+check);
	
		//updateOk.jsp에는 check와 pageNumber를 넘겨줘야 한다.
		mav.addObject("check",check);
		mav.addObject("pageNumber",pageNumber);
			
		mav.setViewName("freeBoard/updateOk");		
		}
}
