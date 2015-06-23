package com.indiScene.performBoard.service;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.indiScene.performBoard.dao.PlaceBoardDaoImpl;
import com.indiScene.performBoard.dto.PlaceBoardDto;

@Component
public class PlaceBoardServiceImpl implements PlaceBoardService {
	
	@Autowired
	private PlaceBoardDaoImpl boardDao;
	
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
		
		//logger.info("ch =>" + boardNumber + "||" + groupNumber + "||" + sequenceNumber + "||" + sequenceLevel);
		
		mav.addObject("board_num" , board_num);
		mav.addObject("group_num" , group_num);
		mav.addObject("seq_num" , seq_num);
		mav.addObject("seq_level" , seq_level);
		
		mav.setViewName("board/write");
	}
	
	public void writeOk(ModelAndView mav){
		Map<String, Object> map = mav.getModelMap();
		MultipartHttpServletRequest request = (MultipartHttpServletRequest)map.get("request");
		PlaceBoardDto boardDto = (PlaceBoardDto) map.get("boardDto");
		
		boardDto.setRegister_date(new Date());
		boardDto.setCount(0);
		
		
		fileBoardWriteNumber(boardDto);
		
		/*MultipartFile upFile = request.getFile("file");
		String fileName = upFile.getOriginalFilename();
		String timeName = System.currentTimeMillis() + "_" + fileName ;
		long fileSize = upFile.getSize();
		
		logger.info("ch fileName : " + fileName);
		logger.info("ch timeName : " + timeName);
		logger.info("ch fileSize : " + fileSize);
		
		if(fileSize != 0){
			try{
				//?��??경로
				String dir="C:\\mavenSpring\\workspace\\mavenHomePage\\src\\main\\webapp\\resources";
				
				//?��??경로
				//String dir=request.getSession().getServletContext().getRealPath("/resources");
				
				logger.info("ch dir : " + dir);
				
				File file = new File(dir, timeName);
				upFile.transferTo(file);	//?��?��?��?��?�� ?��출력?�� ?��료됨
				
				fBDto.setPath(file.getAbsolutePath());
				fBDto.setFileName(fileName);
				fBDto.setFileSize(fileSize);
				
			}catch(Exception e){
				logger.info("ch File Input Ouput Error");
			}
		}
		int check = fileDao.insert(fBDto);
		logger.info("ch check : " + check);
		
		mav.addObject("check" , check);
		mav.setViewName("fileBoard/writeOk");*/
		
	}
	
	public void fileBoardWriteNumber(PlaceBoardDto boardDto){
	
		String board_num = boardDto.getBoard_num();
		int group_num = boardDto.getGroup_num();
		int seq_num = boardDto.getSeq_num();
		int seq_level = boardDto.getSeq_level();
		
		//logger.info("ch boardWriteNumber =>" + boardNumber + "||" + groupNumber + "||" + sequenceNumber + "||" + sequenceLevel);
		
		int max = 0;
		if(board_num == "0"){
			//Root
			max=boardDao.boardGroupNumberMax();
			//logger.info("ch max : " + max);
			if(max != 0){
				max = max+1;
			}else{
				max = boardDto.getGroup_num();
			}
			
			group_num=max;
			seq_num=boardDto.getSeq_num();
			seq_level = boardDto.getSeq_level();
		}else{
			//?���?
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
		
		System.out.println(group_num + "," + seq_num + "," + seq_level);
		
		//logger.info("ch max : " + max);
	}
}


