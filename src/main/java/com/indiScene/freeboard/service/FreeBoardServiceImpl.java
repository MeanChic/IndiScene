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

import com.indiScene.commonIO.dao.CommonIODao;
import com.indiScene.freeboard.dao.FreeBoardDao;
import com.indiScene.freeboard.dto.FreeBoardDto;
import com.indiScene.reply.dao.ReplyDao;
import com.indiScene.reply.dto.ReplyDto;

/**
 * @name : FreeBoardServiceImpl
 * @date : 2015. 7. 31.
 * @author : 손유진
 * @description : 자유게시판 관련기능을 수행한다. 
 */
@Component
public class FreeBoardServiceImpl implements FreeBoardService {
	Logger logger=Logger.getLogger(this.getClass().getName());	

	@Autowired
	private FreeBoardDao freeBoardDao;
	
	@Autowired
	private ReplyDao replyDao;
	
	@Autowired
	private CommonIODao commonIODao;

	/**
	 * @name : FreeBoardServiceImpl
	 * @date : 2015. 7. 31.
	 * @author : 손유진
	 * @description : 글쓰기하는데에 필요한 정보를 넘겨준다. 
	 * -boardNumber,seqNumber,groupNumber,seq_level,pageNumber
	 * 					
	 */
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
	
	/**
	 * @name : FreeBoardServiceImpl
	 * @date : 2015. 7. 31.
	 * @author : 손유진
	 * @description : 글이 등록되었는지 등록실패되었는지 알려준다.
	 */
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
	/**
	 * @name : FreeBoardServiceImpl
	 * @date : 2015. 7. 31.
	 * @author : 손유진
	 * @description : 조회수 증가증가를 위한 메소드 
	 */
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
	
	/**
	 * @name : FreeBoardServiceImpl
	 * @date : 2015. 7. 31.
	 * @author : 손유진
	 * @description : 게시글을 순서대로 목록에 나타내기 위해   페이징기법을 사용한  메소드 
	 */
	@Override
	public void freeBoardList(ModelAndView mav) {
		
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		String pageNumber=request.getParameter("pageNumber");
		if(pageNumber==null) pageNumber="1";
		
		String searchWord=request.getParameter("searchWord");
		String searchType=request.getParameter("searchType"); //검색용 파라미터
		String folderName=request.getParameter("folderName");
		
		logger.info("pageNumber:" +pageNumber);
		logger.info("searchWord:" +searchWord);
		logger.info("searchType:" +searchType);
		logger.info("folderName:" +folderName);	
		
		int boardSize=10;
		int currentPage=Integer.parseInt(pageNumber);
		int startRow=(currentPage-1)*boardSize+1;
		int endRow=currentPage*boardSize;
		logger.info("boardList startRow: "+startRow+", endRow: "+endRow);
		
		int count=0;
		if(folderName==null){
			count=freeBoardDao.getFreeBoardCount();	
			logger.info("freeBoardList count: "+count);
		}else{
			count=commonIODao.getCommonBoardCount(folderName, searchWord, searchType);
			logger.info("freeBoardList count(search): "+count);
		}
		
		List<FreeBoardDto> freeBoardList=null;
		if(count>0){
			if(folderName==null){
				freeBoardList=freeBoardDao.getFreeBoardList(startRow,endRow);	
				
			}else{
				freeBoardList=(List<FreeBoardDto>) commonIODao.getCommonBoardList(startRow, endRow, searchWord, searchType, folderName);
				if(freeBoardList!=null)logger.info("freeBoardList size(search): "+freeBoardList.size());
			}		
		}
				mav.addObject("searchWord",searchWord);
		mav.addObject("searchType",searchType); //search를 반환시켜야 page이동간도 사용가능
		
		mav.addObject("freeBoardSize",boardSize);
		mav.addObject("currentPage",currentPage);
		mav.addObject("count",count);
		mav.addObject("freeBoardList",freeBoardList);
	
		mav.setViewName("freeBoard/list");
	}
	
	/**
	 * @name : FreeBoardServiceImpl
	 * @date : 2015. 7. 31.
	 * @author : 손유진
	 * @description : 자유게시판 읽기 메소드 
	 */
	@Override
	public void freeBoardRead(ModelAndView mav) {
		
		logger.info("freeboard ServerService-------------------------");
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
			
		/*	int board_num=Integer.parseInt(request.getParameter("board_num")); */
		String board_num=request.getParameter("board_num");
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));

		FreeBoardDto freeBoardDto= freeBoardDao.freeBoardRead(board_num);
		List<ReplyDto> replyList=replyDao.replyList(board_num);
		
		logger.info("freeBoardRead freeBoardDto: "+freeBoardDto);
		logger.info("ssfsdfsdfsdf:"+freeBoardDto.getContent());
		
		mav.addObject("freeBoard",freeBoardDto);
		mav.addObject("replyList",replyList);
		mav.addObject("pageNumber",pageNumber);
		mav.setViewName("freeBoard/read");
	}	

	/**
	 * @name : FreeBoardServiceImpl
	 * @date : 2015. 7. 31.
	 * @author : 손유진
	 * @description : 자유게시판 본인게시물 삭제하는 메소드 
	 */
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
	
	/**
	 * @name : FreeBoardServiceImpl
	 * @date : 2015. 7. 31.
	 * @author : 손유진
	 * @description : 게시물 삭제 확인 (실패,성공여부)을 위한 메소드  
	 */
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
	
	/**
	 * @name : FreeBoardServiceImpl
	 * @date : 2015. 7. 31.
	 * @author : 손유진
	 * @description : 자유게시판 수정 
	 */
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
		mav.addObject("board_num",board_num);
		
		mav.setViewName("freeBoard/update");
	}
	
	/**
	 * @name : FreeBoardServiceImpl
	 * @date : 2015. 7. 31.
	 * @author : 손유진
	 * @description : 자유게시판 수정 확인(실패,성공)하는 메소드 
	 */
	@Override
	public void freeBoardUpdateOk(ModelAndView mav) {

		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		FreeBoardDto freeBoardDto=(FreeBoardDto)map.get("freeBoardDto");
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		int check=freeBoardDao.freeBoardUpdate(freeBoardDto);

		//updateOk.jsp에는 check와 pageNumber를 넘겨줘야 한다.
		mav.addObject("check",check);
		mav.addObject("pageNumber",pageNumber);
			
		mav.setViewName("freeBoard/updateOk");		
		}
}
