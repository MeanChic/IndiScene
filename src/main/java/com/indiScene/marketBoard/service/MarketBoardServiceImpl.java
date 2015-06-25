package com.indiScene.marketBoard.service;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.indiScene.marketBoard.dao.MarketBoardDao;
import com.indiScene.marketBoard.dto.MarketBoardDto;


/**
@name  : MarketBoardServiceImpl
@date  : 2015. 6. 25.
@auther: 나혁진
@description :
 */
@Component
public class MarketBoardServiceImpl implements MarketBoardService {
	final Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private MarketBoardDao marketBoardDao;
	

	/**
	@name  : enterBoard
	@date  : 2015. 6. 25.
	@auther: 나혁진
	@description :전체 게시판 리스트를 호출하기 위해 해당페이지를 계산한뒤 dao를 호출한다
	 */
	@Override
	public void enterBoard(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		String pageNumber=request.getParameter("pageNumber");
		if(pageNumber==null) pageNumber="1";
		int currentPage=Integer.parseInt(pageNumber);
		logger.info("currentPage:" +currentPage);
		
		//전체 레코드수, 현재 번호의 시작번호, 끝번호 -->
		int count=marketBoardDao.getCount();
		logger.info("count:"+ count);

		int boardSize=3;
		int startRow=(currentPage-1) * boardSize +1;
		int endRow=currentPage*boardSize;
		logger.info("startRow:" + startRow + ",endRow" + endRow);
		
		List<MarketBoardDto> marketList=null;
		
		if(count >0) {
			marketList=marketBoardDao.getMarketList(startRow,endRow);
			logger.info("marketList" + marketList.size());
		}
		
		mav.addObject("list", marketList);
		mav.addObject("count", count);
		mav.addObject("boardSize", boardSize);
		mav.addObject("currentPage",currentPage);
		
		mav.setViewName("marketBoard/enterBoard");
	}


	/**
	@name  : write
	@date  : 2015. 6. 25.
	@auther: 나혁진
	@description :dto에 담겨있는 입력정보를 db에 삼입하기위해 dao를 호출한다
	 */
	@Override
	public void write(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map=mav.getModelMap();
		MarketBoardDto marketBoardDto=(MarketBoardDto)map.get("marketBoardDto");
		Date date=new Date();

		marketBoardDto.setRegister_date(date);
		System.out.println(marketBoardDto.getContent());
		System.out.println(marketBoardDto.getRegister_date());
		int check=marketBoardDao.insert(marketBoardDto);
		logger.info("check" + check);
		
		mav.addObject("check", check);
		mav.setViewName("marketBoard/writeOk");
	}
	
	/**
	@name  : read
	@date  : 2015. 6. 25.
	@auther: 나혁진
	@description : 클릭한 게시글을 읽기 위해 board_num을 담아 dao를 호출한다
	 */
	@Override
	public void read(ModelAndView mav) {
		// TODO Auto-generated method stub
		logger.info("readService----------------------");
		Map<String, Object>map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		String boardNumber=(request.getParameter("board_num"));
		String currentPage=(request.getParameter("pageNumber"));
		MarketBoardDto marketBoardDto=marketBoardDao.read(boardNumber);
		
		int countCheck=0;
		if(marketBoardDto !=null){
			countCheck=marketBoardDao.count(boardNumber);
		}
		
		logger.info("marketBoardDto:" + marketBoardDto);
		logger.info("countCheck" + countCheck);
		
		mav.addObject("marketBoard",marketBoardDto);
		mav.addObject("pageNumber",currentPage);
		
		mav.setViewName("marketBoard/read");
	}

	/**
	@name  : fileUpload
	@date  : 2015. 6. 25.
	@auther: 나혁진
	@description :게시판에 이미지를 첨부하기 위해 저장위치에 파일을 저장시키고 위치를 반환한다
	 */
	@Override
	public void fileUpload(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		MultipartFile upFile=(MultipartFile) map.get("upFile");
        
//	    HttpSession session = request.getSession();
//	    String root_path = session.getServletContext().getRealPath("/"); 
//	    logger.info(root_path);
//	    String attach_path = "resources/files/attach/";
        
		
		String fileName = upFile.getOriginalFilename();
		String timeName = Long.toString(System.currentTimeMillis()) + "_"
				+ fileName;
		long fileSize = upFile.getSize();

		logger.info("fileName:" + fileName);
		logger.info("fileSize:" + fileSize);
		logger.info("timeName:" + timeName);
		
		mav.setViewName("marketBoard/enterBoard");
		
//	    String filename = "";
//	    String CKEditorFuncNum = "";
//	    if (upload != null) {
//	        filename = upload.getOriginalFilename();
//	        fileBean.setFilename(filename);
//	        CKEditorFuncNum = fileBean.getCKEditorFuncNum();
//	        try {
//	            File file = new File(root_path + attach_path + filename);
//	            logger.info(root_path + attach_path + filename);
//	            upload.transferTo(file);
//	        } catch (IOException e) {
//	            e.printStackTrace();
//	        }
//	    }
//
//	    String file_path = "/bbs/" + attach_path + filename;
//	    model.addAttribute("file_path", file_path);
//	    model.addAttribute("CKEditorFuncNum", CKEditorFuncNum);
//
//	     return "bbs.fileupload";
	}
}
