package com.indiScene.uploadBoard.service;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.indiScene.uploadBoard.dao.UploadBoardDao;
import com.indiScene.uploadBoard.dto.UploadBoardDto;

@Controller
public class UploadBoardServiceImpl implements UploadBoardService {
	private String dir = "C:/SPB_Data/git/IndiScene/src/main/webapp/resources/";
	
	@Autowired
	private UploadBoardDao dao;
	private Logger logger = Logger.getLogger(this.getClass().getName());
	
	@Override
	public void write(ModelAndView mav) {
		logger.info("UploadBoard Write Service");
		
		Map<String, Object> map = mav.getModel();
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
		
		mav.setViewName("uploadBoard/write");
	}

	@Override
	public void writeOk(ModelAndView mav) {
		logger.info("UploadBoard WriteOk Service");
		Map<String, Object> map = mav.getModel();
		MultipartHttpServletRequest request = (MultipartHttpServletRequest) map.get("request");
		UploadBoardDto uploadBoardDto = (UploadBoardDto) map.get("uploadBoardDto");
		
		Iterator<String> iter = request.getFileNames();
		
		List<MultipartFile> fileList = new ArrayList<MultipartFile>();
		while(iter.hasNext()){
			String fileStr = iter.next();
			MultipartFile mf = request.getFile(fileStr);
			fileList.add(mf);
//			
			System.out.println(fileStr +"\t"+ mf.getOriginalFilename());
		}
		
		uploadBoardDto.setRegister_date(new java.util.Date());
		uploadBoardDto.setCount(0);
		
		String coverImage = uploadBoardDto.getArtist_id()+"_"+System.currentTimeMillis()+"_"+fileList.get(0).getOriginalFilename();
		String musicFile = uploadBoardDto.getArtist_id()+"_"+System.currentTimeMillis()+"_"+fileList.get(1).getOriginalFilename();
		
//		String dirCover = request.getSession().getServletContext().getRealPath("/resources/uploadBoard/cover");
//		String dirMusic = request.getSession().getServletContext().getRealPath("/resources/uploadBoard/music");
		
		File coverImageFile = new File(dir+"/uploadBoard/cover/",coverImage);
		File uploadMusicFile = new File(dir+"/uploadBoard/music/",musicFile);
		
		uploadBoardDto.setFile_name(fileList.get(1).getOriginalFilename());
		uploadBoardDto.setFile_path(uploadMusicFile.getAbsolutePath());
		uploadBoardDto.setImage_path(coverImageFile.getAbsolutePath());
		uploadBoardDto.setBoard_like(0);
		
		try {
			fileList.get(0).transferTo(coverImageFile);
			fileList.get(1).transferTo(uploadMusicFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		uploadBoardDto.setFile_path(uploadBoardDto.getFile_path().substring(uploadBoardDto.getFile_path().indexOf("\\resources")).replace('\\', '/'));
		uploadBoardDto.setImage_path(uploadBoardDto.getImage_path().substring(uploadBoardDto.getImage_path().indexOf("\\resources")).replace('\\','/'));
		
		uploadBoardWriteNumber(uploadBoardDto);
//		uploadBoardDto.setContent(uploadBoardDto.getContent().substring(1));
		int check = dao.write(uploadBoardDto);
		mav.addObject("check", check);
		
		mav.setViewName("uploadBoard/writeOk");
	}
	
	@Override
	public void uploadBoardWriteNumber(UploadBoardDto boardDto){
		String board_num = boardDto.getBoard_num();
		int group_num = boardDto.getGroup_num();
		int seq_num = boardDto.getSeq_num();
		int seq_level = boardDto.getSeq_level();
		
		//logger.info("ch boardWriteNumber =>" + boardNumber + "||" + groupNumber + "||" + sequenceNumber + "||" + sequenceLevel);
		
		int max = 0;
		if(board_num.equals("0")){
			//Root
			max=dao.boardGroupNumberMax();
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
			
			dao.boardGroupNumberUpdate(hMap);
			seq_level+=1;
			seq_num+=1;
		}
		
		boardDto.setGroup_num(group_num);
		boardDto.setSeq_num(seq_num);
		boardDto.setSeq_level(seq_level);
		
		logger.info("--"+group_num + "," + seq_num + "," + seq_level);
	}

	@Override
	public void record(MultipartHttpServletRequest request,
			HttpServletResponse response) {
		logger.info("upload Record Service Start");
		
		String artistId= request.getParameter("artist_id");
		Iterator<String> iter = request.getFileNames();
		MultipartFile mpf = request.getFile(iter.next());
	    String recordFile = artistId+"_"+System.currentTimeMillis()+"_"+"RecordingFile.wav";
		
//	    String dir =request.getSession().getServletContext().getRealPath("/resources/TemporaryMusic");
	    
	    File record =new File(dir+"/TemporaryMusic/",recordFile);
	    try {
			mpf.transferTo(record);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	    
	    PrintWriter pw=null;
		try {
			pw = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
	    pw.write(recordFile);
//		System.out.println("artist id = " +request.getParameter("artist_id"));
	}

	@Override
	public void list(ModelAndView mav) {
		logger.info("upload List Service Start");
		
		Map<String,Object> hMap = mav.getModel();
		HttpServletRequest request=(HttpServletRequest)hMap.get("request");
		
		int boardSize =10;
		String pageNumber = request.getParameter("pageNumber");
		if(pageNumber == null) pageNumber ="1";
		
		int currentPage = Integer.parseInt(pageNumber);
		int startRow = (currentPage - 1) * boardSize +1;
		int endRow = currentPage*boardSize;
		
		int count = dao.getBoardCount();
		
		HashMap<String,Integer> rowMap = new HashMap<String,Integer>();
		rowMap.put("startRow", startRow);
		rowMap.put("endRow", endRow);
		
		List<UploadBoardDto> list= dao.getBoardList(rowMap);
		
	/*	for(UploadBoardDto dto:list){
//			System.out.println(dto.getFile_path());
			dto.setFile_path(dto.getFile_path().substring(dto.getFile_path().indexOf("\\resources")).replace('\\', '/'));
			dto.setImage_path(dto.getImage_path().substring(dto.getImage_path().indexOf("\\resources")).replace('\\','/'));
		}*/
		
		mav.addObject("boardList",list);
		mav.addObject("count",count);
		mav.addObject("boardSize",boardSize);
		mav.addObject("currentPage",currentPage);
		
		mav.setViewName("uploadBoard/list");
	}

	@Override
	public void read(ModelAndView mav) {
		Map<String, Object> map=mav.getModel();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String board_num = request.getParameter("boardNum");
		String pageNumber = request.getParameter("pageNumber");
		
		UploadBoardDto boardDto = dao.read(board_num);
		dao.readCount(board_num);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		String date= sdf.format(boardDto.getRegister_date());
		
		mav.addObject("date",date);
		mav.addObject("pageNumber",pageNumber);
		mav.addObject("board_num",board_num);
		mav.addObject("boardDto",boardDto);
		
		mav.setViewName("uploadBoard/read");
	}

	@Override
	public void update(ModelAndView mav) {
		Map<String, Object> map=mav.getModel();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String board_num = request.getParameter("boardNum");
		String pageNumber = request.getParameter("pageNumber");
		
		UploadBoardDto board = dao.read(board_num);
//		System.out.println(board);
		
		mav.addObject("pageNumber",pageNumber);
		mav.addObject("board",board);

		mav.setViewName("uploadBoard/update");
	}

	@Override
	public void updateOk(ModelAndView mav) {
		logger.info("UploadBoard WriteOk Service");
		Map<String, Object> map = mav.getModel();
		MultipartHttpServletRequest request = (MultipartHttpServletRequest) map.get("request");
		UploadBoardDto uploadBoardDto = (UploadBoardDto) map.get("uploadBoardDto");
		
		Iterator<String> iter = request.getFileNames();
		
		Map<String, MultipartFile> fileList = new HashMap<String, MultipartFile>();
		while(iter.hasNext()){
			String fileStr = iter.next();
			MultipartFile mf = request.getFile(fileStr);
			if(mf!=null){
				fileList.put(fileStr, mf);
				
			}
			
			System.out.println(fileStr +"\t"+ mf.getOriginalFilename());
		}
		
	}

	@Override
	public void delete(ModelAndView mav) {
		logger.info("UploadBoard Delete Service");
		
		Map<String, Object> map = mav.getModel();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		String board_num = request.getParameter("boardNum");
		String pageNumber = request.getParameter("pageNumber");
		
		int check = dao.delete(board_num);
		
		mav.addObject("pageNumber",pageNumber);
		mav.addObject("check",check);

		mav.setViewName("uploadBoard/delete");
	}
}
