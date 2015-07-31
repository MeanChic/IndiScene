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
import com.indiScene.reply.dao.ReplyDao;
import com.indiScene.reply.dto.ReplyDto;


/**
 * @name : NoticeServiceImple
 * @date : 2015. 6. 26.
 * @author : 손유진
 */
@Component
public class NoticeServiceImple implements NoticeService {
	@Autowired
	private NoticeDao noticeDao;
	private Logger logger=Logger.getLogger(this.getClass().getName());	
	
	@Autowired
	private ReplyDao replyDao;
	
	@Override
	public void test(ModelAndView mav) {
		mav.addObject("message","member 시작입니다.");	
		mav.setViewName("home");
	}
	
	/**
	 * @name : NoticeServiceImple
	 * @date : 2015. 7. 31.
	 * @author : 손유진
	 * @description : 공지사항을 쓰기위한 메소드
	 */
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
		
		String pageNumber=request.getParameter("pageNumber");
		if(pageNumber==null) pageNumber="1";
		
		mav.addObject("board_num", board_num);
		mav.addObject("group_num", group_num);
		mav.addObject("seq_num", seq_num);
		mav.addObject("seq_level", seq_level);
		mav.addObject("pageNumber",pageNumber);
		
		mav.setViewName("notice/write");
	}
	
	/**
	 * @name : NoticeServiceImple
	 * @date : 2015. 7. 31.
	 * @author : 손유진
	 * @description : 공지사항쓰기 완료(실패,성공 여부)확인을 위한 메소드
	 */
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
		
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		mav.addObject("pageNumber",pageNumber);
		mav.addObject("check",check);
		mav.setViewName("notice/writeOk");
	}
	
	/**
	 * @name : NoticeServiceImple
	 * @date : 2015. 7. 31.
	 * @author : 손유진
	 * @description : 공지사항을 읽을때마다 조회수가 증가하게하는 메소드 */
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

	/**
	 * @name : NoticeServiceImple
	 * @date : 2015. 7. 31.
	 * @author : 손유진
	 * @description : 공지사항 목록 로직  메소드 
	 */
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
		
		int count=noticeDao.getNoticeCount();
		logger.info("noticeList count: "+count);
		
		List<NoticeDto> noticeList=null;
		if(count>0){
			noticeList=noticeDao.getNoticeList(startRow, endRow);
		}
		
		if(noticeList!=null) logger.info("noticeList size: "+noticeList.size());
		
		mav.addObject("noticeSize",boardSize);
		mav.addObject("currentPage",currentPage);
		mav.addObject("count",count);
		mav.addObject("noticeList",noticeList);
	
		mav.setViewName("notice/list");
	}
	
	/**
	 * @name : NoticeServiceImple
	 * @date : 2015. 7. 31.
	 * @author : 손유진
	 * @description : 공지사항글을 읽는 메소드 
	 */
	@Override
	public void noticeRead(ModelAndView mav) {
		
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		/*int board_num=Integer.parseInt(request.getParameter("board_num"));*/
		String board_num=request.getParameter("board_num");
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		logger.info("noticeRead board_num: "+board_num+", pageNumber: "+pageNumber);
		
		//넘겨받은 해당 boardNumber의 조회수를 1증가시킨 뒤 (BoardDaoImpl에서 처리)
		//해당 boardNumber의 데이터들을 noticeDto로 반환받는다.
		NoticeDto noticeDto=noticeDao.noticeRead(board_num);
		List<ReplyDto> replyList=replyDao.replyList(board_num);
		
		logger.info("noticeRead noticeDto: "+noticeDto);
		
		mav.addObject("notice",noticeDto);
		mav.addObject("pageNumber",pageNumber);
		mav.addObject("replyList",replyList);
		//read.jsp에서는 board와 pageNumber만 필요 
		mav.setViewName("notice/read");
	}
	
	/**
	 * @name : NoticeServiceImple
	 * @date : 2015. 7. 31.
	 * @author : 손유진
	 * @description :공지사항을 삭제하는 메소드 
	 */
	@Override
	public void noticeDelete(ModelAndView mav) {

		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		String board_num=request.getParameter("board_num");
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		logger.info("noticeDelete board_num: "+board_num+", pageNumber: "+pageNumber);
		
		mav.addObject("board_num",board_num);
		mav.addObject("pageNumber",pageNumber);
		
		mav.setViewName("notice/delete");	
	}
	
	/**
	 * @name : NoticeServiceImple
	 * @date : 2015. 7. 31.
	 * @author : 손유진
	 * @description :공지사항 삭제 확인(실패,성공여부)을 위한 메소드 
	 */
	@Override
	public void noticeDeleteOk(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		String board_num=request.getParameter("board_num");
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		logger.info("noticeDeleteOk board_num: "+board_num+", pageNumber: "+pageNumber);
		
		int check=noticeDao.noticeDelete(board_num);
		logger.info("noticeDeleteOk check: "+check);
		
		mav.addObject("pageNumber",pageNumber);
		mav.addObject("check",check);
		
		mav.setViewName("notice/deleteOk");
	}

	/**
	 * @name : NoticeServiceImple
	 * @date : 2015. 7. 31.
	 * @author : 손유진
	 * @description :공지사항글 수정 
	 */
	@Override
	public void noticeUpdate(ModelAndView mav) {
				// root + "/board/update.do?boardNumber="+boardNumber+"&pageNumber="+pageNumber
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
			
		String board_num=request.getParameter("board_num");
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		
		NoticeDto notice=noticeDao.noticeUpdateSelect(board_num);
		logger.info("noticeUpdate notice:"+notice);
		
		//board와 pageNumber를 updateOk.jsp에 넘겨줘야한다.
		mav.addObject("notice",notice);
		mav.addObject("pageNumber",pageNumber);
		
		mav.setViewName("notice/update");
	}

	/**
	 * @name : NoticeServiceImple
	 * @date : 2015. 7. 31.
	 * @author : 손유진
	 * @description :공지사항 수정확인 메소드 
	 */
	@Override
	public void noticeUpdateOk(ModelAndView mav) {
		
		//boardNumber, pageNumber, writer, subject, email, content, password
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		NoticeDto noticeDto=(NoticeDto)map.get("noticeDto");
		
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		logger.info("noticeUpdateOk noticeDto: "+noticeDto+", pageNumber: "+pageNumber);		
		
		int check=noticeDao.noticeUpdate(noticeDto);
		logger.info("noticeUpdateOk check: "+check);
	
		//updateOk.jsp에는 check와 pageNumber를 넘겨줘야 한다.
		mav.addObject("check",check);
		mav.addObject("pageNumber",pageNumber);
		
		mav.setViewName("notice/updateOk");		
	}
}