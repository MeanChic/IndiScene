package com.indiScene.brandNewBoard.service;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.indiScene.brandNewBoard.dao.BrandNewBoardDao;
import com.indiScene.brandNewBoard.dto.BrandNewBoardDto;

@Component
public class BrandNewBoardServiceImpl implements BrandNewBoardService {
//	private String dir = "C:/SPB_Data/git/IndiScene/src/main/webapp/resources/";
//	private String dir="C:/KMS_MavenSpring/apache-tomcat-7.0.59/wtpwebapps/IndiScene/resources/";
	
	@Autowired
	private BrandNewBoardDao dao;
	private Logger logger = Logger.getLogger(this.getClass().getName());
	
	
	@Override
	public void brandNewList(ModelAndView mav) {
		logger.info("brandNew List Service Start");
		
		Map<String,Object> hMap = mav.getModel();
		HttpServletRequest request=(HttpServletRequest)hMap.get("request");
		
		int boardSize =10;
		String pageNumber = request.getParameter("pageNumber");
		if(pageNumber == null) pageNumber ="1";
		
		int currentPage = Integer.parseInt(pageNumber);
		int startRow = (currentPage - 1) * boardSize +1;
		int endRow = currentPage*boardSize;
		
		int count = dao.getBrandNewCount();
		
		HashMap<String,Integer> rowMap = new HashMap<String,Integer>();
		rowMap.put("startRow", startRow);
		rowMap.put("endRow", endRow);
		
		List<BrandNewBoardDto> list= dao.getBrandNewList(rowMap);
		
		mav.addObject("boardList",list);
		mav.addObject("count",count);
		mav.addObject("boardSize",boardSize);
		mav.addObject("currentPage",currentPage);
		
		mav.setViewName("brandNewBoard/list");
	}
	
	@Override
	public void read(ModelAndView mav) {
		Map<String, Object> map=mav.getModel();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String board_num = request.getParameter("boardNum");
		String pageNumber = request.getParameter("pageNumber");
		
		BrandNewBoardDto boardDto = dao.read(board_num);
		dao.readCount(board_num);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		String date= sdf.format(boardDto.getRegister_date());
		
		mav.addObject("date",date);
		mav.addObject("pageNumber",pageNumber);
		mav.addObject("board_num",board_num);
		mav.addObject("boardDto",boardDto);
		
		mav.setViewName("brandNewBoard/read");
	}
}
