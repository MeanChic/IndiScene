package com.indiScene.notice.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.indiScene.notice.dao.NoticeDao;
import com.indiScene.notice.dto.NoticeDto;

@Component
public class NoticeServiceImple implements NoticeService {
	@Autowired
	private NoticeDao noticeDao;
	private Logger logger=Logger.getLogger(this.getClass().getName());	

	@Override
	public void test(ModelAndView mav) {
		mav.addObject("message","member 시작입니다.");	
		mav.setViewName("home");
	}

	@Override
	public void noticeWrite(ModelAndView mav) {
		
		Map<String,Object>map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		// 넘어온 값이 없기 때문에 초기값을 잡아주고 
		int board_num=0;
		int group_num=1;
		int seq_num=0;
		int seq_level=0;
		//null이아니면 초기값을 잡아줄 필요가 없다. 
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
		
		String page_num=request.getParameter("page_num");
		if(page_num==null) page_num="1";
		
		mav.addObject("board_num", board_num);
		mav.addObject("group_num", group_num);
		mav.addObject("seq_num", seq_num);
		mav.addObject("seq_level", seq_level);
		mav.addObject("page_num",page_num);
		
		mav.setViewName("notice/write");
	}
	@Override
	public void noticeWriteOk(ModelAndView mav) {
		
		Map<String,Object>map=mav.getModel();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		NoticeDto noticeDto=(NoticeDto)map.get("noticeDto");
		
		noticeWriteNumber(noticeDto);//그룹번호, 시퀀스번호, 시퀀스넘버, 보드넘버를 넘김.
		noticeDto.setRegister_date(new Date());
		noticeDto.setCount(0);
		
		int check = noticeDao.insert(noticeDto);
		logger.info("check:"+check);
		
		int page_num=Integer.parseInt(request.getParameter("page_num"));
		System.out.println("이것만 해결되면 "+page_num);
		mav.addObject("page_num",page_num);
		mav.addObject("check",check);
		mav.setViewName("notice/writeOk");

	}
	
	public void noticeWriteNumber(NoticeDto noticeDto){
		String board_num=noticeDto.getBoard_num();
		int group_num=noticeDto.getGroup_num();
		int seq_num=noticeDto.getSeq_num();
		int seq_level=noticeDto.getSeq_level();
		
		logger.info("boardNumber:" + board_num);
		logger.info("groupNumber:"+ group_num);
		logger.info("sequenceNumber:"+seq_num);
		logger.info("sequenceLevel:"+seq_level);
	
		int max=0;
	
		if(board_num.equals("0")){
			
			max=noticeDao.noticeGroupNumberMax();
			if(max!=0){
				max=max+1;
			}else{
				max=noticeDto.getGroup_num();
			}
			logger.info("max:"+max);
			
			group_num=max;
			seq_num=noticeDto.getSeq_num();
			seq_level=noticeDto.getSeq_level();
		}else{
			//답글 sequenceNumber와 level이 수정되야함.
			HashMap<String, Integer> hMap=new HashMap<String, Integer>();
			hMap.put("groupNumber", group_num);
			hMap.put("sequenceNumber", seq_num);
			hMap.put("sequenceLevel", seq_level);
			
			noticeDao.noticeGroupNumberUpdate(hMap);
			seq_num=seq_num+1;
			seq_level=seq_level+1;
		}
		noticeDto.setGroup_num(group_num);
		noticeDto.setSeq_num(seq_num);
		noticeDto.setSeq_level(seq_level);
			
	}

	@Override
	public void noticeList(ModelAndView mav) {
		Map<String , Object>map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");

		String pageNumber=request.getParameter("pageNumber");
		if(pageNumber==null) pageNumber="1";
		
		int boardSize=10;
		int currentPage=Integer.parseInt(pageNumber);
		int startRow=(currentPage-1)*boardSize+1;
		int endRow=currentPage*boardSize;
		logger.info("noticeList startRow: "+startRow+", endRow: "+endRow);
		
		int count=noticeDao.getCount();
		logger.info("noticeList count: "+count);
		
		List<NoticeDto> noticeList=null;
		if(count>0){
			noticeList=noticeDao.getNoticeList(startRow, endRow);
		}
		logger.info("noticeList size: "+noticeList.size());
		
	  /*list.jsp에서 필요한 변수 -> 여기서 넘겨줘야하는 아이들
	    count
		boardList
		boardSize
		currentPage*/
		mav.addObject("boardSize",boardSize);
		mav.addObject("currentPage",currentPage);
		mav.addObject("count",count);
		mav.addObject("noticeList",noticeList);
	
		mav.setViewName("notice/list");
	}



}