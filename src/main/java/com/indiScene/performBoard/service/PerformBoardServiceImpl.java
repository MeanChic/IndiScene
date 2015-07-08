package com.indiScene.performBoard.service;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.indiScene.performBoard.dao.PerformBoardDao;
import com.indiScene.performBoard.dao.PerformBoardDaoImpl;
import com.indiScene.performBoard.dto.PerformBoardDto;

/**
 * @name:PerformBoardServiceImpl
 * @date :2015. 6. 25.
 * @author: 김정승
 * @description :	PerformBoardService interface를 상속받은 method
 */
@Component
public class PerformBoardServiceImpl implements PerformBoardService {
	String rootpath = "C:/Users/kosta/git/IndiScene/src/main/webapp/";
	@Autowired
	private PerformBoardDao boardDao;
	private final Logger logger = Logger.getLogger(this.getClass().getName());
	
	public void boardWrite(ModelAndView mav){
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String board_num = "0";
		int group_num = 1;
		int seq_num = 0;
		int seq_level = 0;
	
		if(request.getParameter("board_num") != null){
			board_num = request.getParameter("board_num");
			group_num = Integer.parseInt(request.getParameter("group_num"));
			seq_num = Integer.parseInt(request.getParameter("seq_num"));
			seq_level = Integer.parseInt(request.getParameter("seq_level"));
		}
		
		mav.addObject("board_num" , board_num);
		mav.addObject("group_num" , group_num);
		mav.addObject("seq_num" , seq_num);
		mav.addObject("seq_level" , seq_level);
		
		mav.setViewName("board/write");
	}
	
	public void writeOk(ModelAndView mav){
		
		Map<String, Object> map = mav.getModelMap();
		MultipartHttpServletRequest request = (MultipartHttpServletRequest)map.get("request");
		PerformBoardDto boardDto = (PerformBoardDto) map.get("boardDto");
		
		boardDto.setRegister_date(new Date());
		boardDto.setCount(0);
	
		fileBoardWriteNumber(boardDto);
		String file_path="";
		String file_name="";
		
		for(int i = 1; i < 10; i++){
			MultipartFile upFile = request.getFile("file" + i);
			String fileName = upFile.getOriginalFilename();
			
			String timeName = System.currentTimeMillis() + "_" + fileName ;
			long fileSize = upFile.getSize();
			
			//logger.info("-- fileName : " + fileName);
			//logger.info("-- timeName : " + timeName);
			//logger.info("-- fileSize : " + fileSize);
			
			if(fileSize != 0){
				try{
					String dir="C:/SPB_Data/git/IndiScene/src/main/webapp/resources/performResource";
					
					//logger.info("ch dir : " + dir);
					
					File file = new File(dir, timeName);
					upFile.transferTo(file);	
					
					file_path += file.getAbsolutePath() + ",";
					file_name += fileName + ",";
				}catch(Exception e){
					logger.info("ch File Input Ouput Error");
				}
			}
		}
		
		boardDto.setFile_path(file_path);
		boardDto.setFile_name(file_name);
		
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy HH:mm");
		try {
			boardDto.setD_day(sdf.parse(request.getParameter("d_day1")));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		int check = boardDao.insert(boardDto);
		//logger.info("ch check : " + check);
		
		mav.addObject("check" , check);
		mav.setViewName("performBoard/list");	
	}
	
	public void fileBoardWriteNumber(PerformBoardDto boardDto){
	
		String board_num = boardDto.getBoard_num();
		int group_num = boardDto.getGroup_num();
		int seq_num = boardDto.getSeq_num();
		int seq_level = boardDto.getSeq_level();
		
		//logger.info("ch boardWriteNumber =>" + boardNumber + "||" + groupNumber + "||" + sequenceNumber + "||" + sequenceLevel);
		
		int max = 0;
		if(board_num.equals("0")){
			//Root
			max=boardDao.boardGroupNumberMax();
			if(max != 0){
				max = max+1;
			}else{
				max = boardDto.getGroup_num();
			}
			
			group_num=max;
			seq_num=boardDto.getSeq_num();
			seq_level = boardDto.getSeq_level();
		}else{
			HashMap<String, Integer> hMap = new HashMap<String, Integer>();
			hMap.put("group_num", group_num);
			hMap.put("seq_num", seq_num);
			
			boardDao.boardGroupNumberUpdate(hMap);
			seq_level+=1;
			seq_num+=1;
		}
		
		boardDto.setGroup_num(group_num);
		boardDto.setSeq_num(seq_num);
		boardDto.setSeq_level(seq_level);
		
		//logger.info("--"+group_num + "," + seq_num + "," + seq_level);
	}
	
	public void list(ModelAndView mav){
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int boardSize = 10;
		String pageNumber = request.getParameter("pageNumber");
		if(pageNumber == null) pageNumber = "1";
		
		int currentPage = Integer.parseInt(pageNumber);
		int startRow = (currentPage - 1)* boardSize + 1;
		int endRow = currentPage*boardSize;
		
		int count = boardDao.getBoardCount();
		//logger.info("ch count : " + count);
		
		List<PerformBoardDto> list = boardDao.getBoardList(startRow, endRow);
		//logger.info("ch list : " + list.size());
		
	
		for(int i = 0; i < list.size(); i++){
			if(!(list.get(i).getFile_name()==null)){
				list.get(i).setFile_path(list.get(i).getFile_path().split(",")[0].substring(rootpath.length()));
				list.get(i).setFile_name(list.get(i).getFile_name().split(",")[0]);
			}
		}
		
		mav.addObject("boardList", list);
		mav.addObject("count", count);
		mav.addObject("boardSize", boardSize);
		mav.addObject("currentPage", currentPage);
	
		mav.setViewName("performBoard/list");	
	}
	
	public void read(ModelAndView mav){
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String board_num = request.getParameter("board_num");
		int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		
		PerformBoardDto board = boardDao.read(board_num);
		String[] path = null;
		if(board.getFile_path() != null){
			path = board.getFile_path().split(",");
			for(int i = 0; i < path.length; i++){
				path[i] = path[i].substring(rootpath.length());
			}
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
		String date = sdf.format(board.getD_day());
		
		mav.addObject("date", date);
		mav.addObject("path", path);
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("board", board);
		
		mav.setViewName("performBoard/read");
	}
	
	public void update(ModelAndView mav){
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String board_num = request.getParameter("board_num");
		
		PerformBoardDto boardDto = boardDao.read(board_num);
		//logger.info("--" + boardDto.getBoard_num() + " ,, " + board_num);
		
		mav.addObject("board", boardDto);
		mav.setViewName("performBoard/update");
	}
}


