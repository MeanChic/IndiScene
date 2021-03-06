package com.indiScene.uploadBoard.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
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

import com.indiScene.audioProcessing.KOSTAAudio;
import com.indiScene.commonIO.dao.CommonIODao;
import com.indiScene.reply.dao.ReplyDao;
import com.indiScene.reply.dto.ReplyDto;
import com.indiScene.uploadBoard.dao.UploadBoardDao;
import com.indiScene.uploadBoard.dto.UploadBoardDto;

/**
 * @type : UploadBoardServiceImpl
 * @date : 2015. 7. 13.
 * @author : Kim MinSic
 * @description : Process Indi's Music board's request
 */
@Controller
public class UploadBoardServiceImpl implements UploadBoardService {
	public static String dir = "C:/SPB_Data/git/IndiScene/src/main/webapp/resources/";
	//private String dir="C:/KMS_MavenSpring/apache-tomcat-7.0.59/wtpwebapps/IndiScene/resources/";
	//private String dir="C:/mavenspring/apache-tomcat-7.0.59/wtpwebapps/IndiScene/resources/"; //나혁진용
	
	@Autowired
	private ReplyDao replyDao;
	
	@Autowired
	private UploadBoardDao dao;
	
	@Autowired
	private CommonIODao commonIODao;
	private Logger logger = Logger.getLogger(this.getClass().getName());
	
	/**
	 * @name : write
	 * @date : 2015. 7. 13.
	 * @author : Kim MinSic
	 * @description : call write page of upload Board
	 */
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
			
			mav.setViewName("uploadBoard/collabo");
		}else{
			String pageNumber = request.getParameter("pageNumber");
			
			UploadBoardDto board = dao.read(board_num);
			
			mav.addObject("pageNumber",pageNumber);
			mav.addObject("board",board);
			mav.setViewName("uploadBoard/write");
		}
		
		mav.addObject("board_num" , board_num);
		mav.addObject("group_num" , group_num);
		mav.addObject("seq_num" , seq_num);
		mav.addObject("seq_level" , seq_level);
	}

	/**
	 * @name : writeOk
	 * @date : 2015. 7. 15.
	 * @author : Kim MinSic
	 * @description : Process write OK service of upload board each situation 
	 */
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
//			System.out.println(fileStr +"\t"+ mf.getOriginalFilename());
		}
		
		uploadBoardDto.setRegister_date(new java.util.Date());
		uploadBoardDto.setCount(0);
		
		String coverImage=null;
		if(!request.getFile("coverImage").isEmpty()){
			coverImage= uploadBoardDto.getArtist_id()+"_"+System.currentTimeMillis()+"_"+fileList.get(0).getOriginalFilename();
		}else{
			coverImage="d2.jpg";
		}
		String musicFile = null;
		
		if(!request.getFile("musicFile").isEmpty()){		// 녹음파일일 경우.
			musicFile =uploadBoardDto.getArtist_id()+"_"+System.currentTimeMillis()+"_"+request.getFile("musicFile").getOriginalFilename();
		}
		
//		String dirCover = request.getSession().getServletContext().getRealPath("/resources/uploadBoard/cover");
//		String dirMusic = request.getSession().getServletContext().getRealPath("/resources/uploadBoard/music");
		
		//
		File coverFolder=new File(dir+"/uploadBoard/cover/");//이미지 저장경로가 없을경우 생성(나혁진)
		if(!coverFolder.exists()){
			coverFolder.mkdirs();
		}
		//
		
		File coverImageFile = new File(dir+"/uploadBoard/cover/",coverImage);
		File uploadMusicFile = null;
		File recordFile=null;
		
		if(musicFile !=null){		// 녹음파일일 경우.
			//
			File uploadFolder=new File(dir+"/uploadBoard/music/");//음악 저장경로가 없을경우 생성(나혁진)
			if(!uploadFolder.exists()){
				uploadFolder.mkdirs();
			}
			//
			
			uploadMusicFile = new File(dir+"/uploadBoard/music/",musicFile);
		}else{
			uploadMusicFile = new File(dir+"/uploadBoard/music/",request.getParameter("recordFile").substring(request.getParameter("recordFile").lastIndexOf("/")+1));
			
			//
			File tempFolder=new File(dir+"/TemporaryMusic/");//임시 저장경로가 없을경우 생성(나혁진)
			if(!tempFolder.exists()){
				tempFolder.mkdirs();
			}
			//
			recordFile = new File(dir+"/TemporaryMusic/",request.getParameter("recordFile").substring(request.getParameter("recordFile").lastIndexOf("/")+1));
		}
		uploadBoardDto.setFile_name(uploadMusicFile.getName());
		uploadBoardDto.setFile_path(uploadMusicFile.getAbsolutePath());
		uploadBoardDto.setImage_path(coverImageFile.getAbsolutePath());
		uploadBoardDto.setBoard_like(0);
		
		try {
			if(!request.getFile("coverImage").isEmpty()){
				request.getFile("coverImage").transferTo(coverImageFile);
			}
			if(!request.getFile("musicFile").isEmpty()){
				request.getFile("musicFile").transferTo(uploadMusicFile);
			}else{
				if(!recordFile.renameTo(uploadMusicFile)){
					byte[] buf= new byte[1024];
					FileInputStream fis = new FileInputStream(recordFile);
					FileOutputStream fos = new FileOutputStream(uploadMusicFile);
					
					int read= 0;
					while((read=fis.read(buf, 0, buf.length))!=-1){
						fos.write(buf,0,read);
					}
					
					fis.close();
					fos.close();
					recordFile.delete();
				}
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		uploadBoardDto.setFile_path(uploadBoardDto.getFile_path().substring(uploadBoardDto.getFile_path().indexOf("\\resources")).replace('\\', '/'));
		uploadBoardDto.setImage_path(uploadBoardDto.getImage_path().substring(uploadBoardDto.getImage_path().indexOf("\\resources")).replace('\\','/'));
		
		uploadBoardWriteNumber(uploadBoardDto);
		int check = dao.write(uploadBoardDto);
		mav.addObject("check", check);
		mav.addObject("board", uploadBoardDto);
		
		mav.setViewName("uploadBoard/writeOk");
	}
	
	/**
	 * @name : uploadBoardWriteNumber
	 * @date : 2015. 7. 15.
	 * @author : Kim MinSic
	 * @description : tunning numbers of upload board database
	 */
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

	/**
	 * @name : record
	 * @date : 2015. 7. 14.
	 * @author : Kim MinSic
	 * @description : save temporary record file
	 */
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

	/**
	 * @name : list
	 * @date : 2015. 7. 16.
	 * @author : Kim MinSic
	 * @description : get upload board list to client
	 */
	@Override
	public void list(ModelAndView mav) {
		logger.info("upload List Service Start");
		
		Map<String,Object> hMap = mav.getModel();
		HttpServletRequest request=(HttpServletRequest)hMap.get("request");
		
		dir= request.getSession().getServletContext().getRealPath("/").replace('\\', '/')+"resources/";
		
		int boardSize =10;
		String pageNumber = request.getParameter("pageNumber");
		String searchWord=request.getParameter("searchWord");
		String searchType=request.getParameter("searchType");
		
		
//		System.out.println("searchType!!!:"+searchType);
//		System.out.println("searchWord!!!:"+searchWord);
		
		if(pageNumber == null) pageNumber ="1";
//		System.out.println("pageNumber!!!:"+pageNumber);
		
		int currentPage = Integer.parseInt(pageNumber);
		int startRow = (currentPage - 1) * boardSize +1;
		int endRow = currentPage*boardSize;
		//검색을 위해서 추가함(나혁진)
		int count = 0;
		int countArtistSearch= 0;
		int countSubjectSearch=0;
		
		if(searchWord==null){
			count = dao.getBoardCount();	
		}else{
			if( searchType.equals("total")  || searchType.equals("subject")){
				countSubjectSearch=commonIODao.getCommonBoardCount("uploadBoard", searchWord, "subject");
//				System.out.println("subjectCheck");
			}
			
			if(searchType.equals("total")  || searchType.equals("artist")){
				countArtistSearch=commonIODao.getCommonBoardCount("uploadBoard", searchWord, "artist_id");
//				System.out.println("artistCheck");
			}
		}
		
		logger.info("count"+count);
		logger.info("countSubjectSearch"+countSubjectSearch);
		logger.info("countArtistSearch"+countArtistSearch);
		//
		HashMap<String,Integer> rowMap = new HashMap<String,Integer>();
		rowMap.put("startRow", startRow);
		rowMap.put("endRow", endRow);
		
		List<UploadBoardDto> list= null;
		List<UploadBoardDto> listArtistSearch=null; //검색될경우 쓰기위함
		List<UploadBoardDto> listSubjectSearch=null; 
		
		if(searchWord==null){
			list= dao.getBoardList(rowMap);	
			logger.info("list"+list.size());
		}else{
			listArtistSearch=(List<UploadBoardDto>) commonIODao.getCommonBoardList(startRow, endRow, searchWord, "artist_id", "uploadBoard");
			listSubjectSearch=(List<UploadBoardDto>) commonIODao.getCommonBoardList(startRow, endRow, searchWord, "subject", "uploadBoard");
		}
		
	/*	for(UploadBoardDto dto:list){
//			System.out.println(dto.getFile_path());
			dto.setFile_path(dto.getFile_path().substring(dto.getFile_path().indexOf("\\resources")).replace('\\', '/'));
			dto.setImage_path(dto.getImage_path().substring(dto.getImage_path().indexOf("\\resources")).replace('\\','/'));
		}*/
		if(list!=null){ //검색 아닐때
			mav.addObject("count",count);
			mav.addObject("boardList",list);
			mav.setViewName("uploadBoard/list");
		}
		
		if(listArtistSearch!=null){ //검색일때
			mav.addObject("countArtistSearch",countArtistSearch);
			mav.addObject("searchArtistList",listArtistSearch);
			mav.setViewName("uploadBoard/searchList"); //메인검색해씅ㄹ때
		}

		if(listSubjectSearch!=null){//검색일때
			mav.addObject("countSubjectSearch",countSubjectSearch);
			mav.addObject("searchSubjectList",listSubjectSearch);
			mav.setViewName("uploadBoard/searchList"); //메인검색해씅ㄹ때
		}
		
		mav.addObject("searchWord",searchWord);
		mav.addObject("boardSize",boardSize);
		mav.addObject("currentPage",currentPage);
		
	}

	/**
	 * @name : read
	 * @date : 2015. 7. 16.
	 * @author : Kim MinSic
	 * @description : get targeted upload board DTO 
	 */
	@Override
	public void read(ModelAndView mav) {
		Map<String, Object> map=mav.getModel();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String board_num = request.getParameter("boardNum");
		String pageNumber = request.getParameter("pageNumber");
		//한줄댓글을 불러온다
		List<ReplyDto> replyList=replyDao.replyList(board_num);
		UploadBoardDto boardDto = dao.read(board_num);
		dao.readCount(board_num);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		String date= sdf.format(boardDto.getRegister_date());
		//한줄댓글을 mav에 집어 넣는다.
		mav.addObject("replyList",replyList);
		mav.addObject("date",date);
		mav.addObject("pageNumber",pageNumber);
		mav.addObject("board_num",board_num);
		mav.addObject("boardDto",boardDto);
		
		mav.setViewName("uploadBoard/read");
	}

	/**
	 * @name : update
	 * @date : 2015. 7. 17.
	 * @author : Kim MinSic
	 * @description : call upload board update page
	 */
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

	/**
	 * @name : updateOk
	 * @date : 2015. 7. 17.
	 * @author : Kim MinSic
	 * @description : board information update
	 */
	@Override
	public void updateOk(ModelAndView mav) {
		logger.info("UploadBoard UpdateOk Service");
		Map<String, Object> map = mav.getModel();
		MultipartHttpServletRequest request = (MultipartHttpServletRequest) map.get("request");
		UploadBoardDto uploadBoardDto = (UploadBoardDto) map.get("uploadBoard");
		UploadBoardDto originalDto = dao.read(uploadBoardDto.getBoard_num());
		
		String coverImage = null;
		String musicFile = null;
		
		Iterator<String> iter = request.getFileNames();
		
		while(iter.hasNext()){
			String fileStr = iter.next();
			MultipartFile mf = request.getFile(fileStr);
			if(!mf.isEmpty()){
				if(fileStr.equals("coverImage")){
					coverImage=uploadBoardDto.getArtist_id()+"_"+System.currentTimeMillis()+"_"+mf.getOriginalFilename();
					
					File oldFile = new File(dir+"/uploadBoard/cover/",originalDto.getImage_path().substring(originalDto.getImage_path().lastIndexOf("/")+1));
					oldFile.delete();
					File newFile = new File(dir+"/uploadBoard/cover/",coverImage);
					uploadBoardDto.setImage_path(newFile.getAbsolutePath().substring(newFile.getAbsolutePath().indexOf("\\resources")).replace('\\','/'));

					try {
						mf.transferTo(newFile);
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}else if(fileStr.equals("musicFile")){
					musicFile = uploadBoardDto.getArtist_id()+"_"+System.currentTimeMillis()+"_"+mf.getOriginalFilename();
					File oldFile = new File(dir+"/uploadBoard/cover/",originalDto.getFile_path().substring(originalDto.getFile_path().lastIndexOf("/")+1));
					oldFile.delete();
					File newFile = new File(dir+"/uploadBoard/cover/",musicFile);
					
					uploadBoardDto.setFile_name(mf.getOriginalFilename());
					uploadBoardDto.setFile_path(newFile.getAbsolutePath().substring(newFile.getAbsolutePath().indexOf("\\resources")).replace('\\', '/'));
					
					try {
						mf.transferTo(newFile);
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}else{
				if(fileStr.equals("coverImage")){
					uploadBoardDto.setImage_path(originalDto.getImage_path());
				}else if(fileStr.equals("musicFile")){
				}	uploadBoardDto.setFile_path(originalDto.getFile_path());
			}
			
//			System.out.println(fileStr +"\t"+ mf.getOriginalFilename());
		}
		
		dao.update(uploadBoardDto);
	}

	/**
	 * @name : delete
	 * @date : 2015. 7. 18.
	 * @author : Kim MinSic
	 * @description : call upload board delete page
	 */
	@Override
	public void delete(ModelAndView mav){
		logger.info("UploadBoard Delete Service");
		
		Map<String, Object> map = mav.getModel();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		String board_num = request.getParameter("boardNum");
		String pageNumber = request.getParameter("pageNumber");
		
		mav.addObject("pageNumber",pageNumber);
		mav.addObject("board_num",board_num);

		mav.setViewName("uploadBoard/delete");
	}
	
	/**
	 * @name : deleteOk
	 * @date : 2015. 7. 18.
	 * @author : Kim MinSic
	 * @description : confirm password to delete board and linked file
	 */
	@Override
	public void deleteOk(ModelAndView mav) {
		logger.info("UploadBoard DeleteOk Service");
		
		Map<String, Object> map = mav.getModel();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		String board_num = request.getParameter("board_num");
		String pageNumber = request.getParameter("pageNumber");
		String password = request.getParameter("password");
		
		HashMap<String,String> hMap = new HashMap<String,String>();
		hMap.put("board_num", board_num);
		hMap.put("password", password);
		hMap.put("artist_id", request.getParameter("artist_id"));
		
		UploadBoardDto originalDto = dao.read(board_num);
		
		File oldImg = new File(dir+"/uploadBoard/cover/",originalDto.getImage_path().substring(originalDto.getImage_path().lastIndexOf("/")+1));
		File oldMusic = new File(dir+"/uploadBoard/cover/",originalDto.getFile_path().substring(originalDto.getFile_path().lastIndexOf("/")+1));
		
		if(!originalDto.getImage_path().substring(originalDto.getImage_path().lastIndexOf("/")+1).equals("d2.jpg"))
			oldImg.delete();
		oldMusic.delete();
		
		int check = dao.delete(hMap);
		
		mav.addObject("pageNumber",pageNumber);
		mav.addObject("check",check);

		mav.setViewName("uploadBoard/deleteOk");
	}
	
	/**
	 * @name : like
	 * @date : 2015. 7. 19.
	 * @author : Kim MinSic
	 * @description : recommend board
	 */
	@Override
	public void like(ModelAndView mav) {
		logger.info("UploadBoard like Service");

		Map<String, Object> map = mav.getModel();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");
		
		String board_num = request.getParameter("boardNum");
		String artist_id= request.getParameter("artist_id");
		
		HashMap <String, String> hMap = new HashMap<String,String>();
		hMap.put("board_num", board_num);
		hMap.put("artist_id", artist_id);
		
		int count = dao.likeCheck(hMap);
		PrintWriter pw = null;;
		response.setContentType("text/html; charset=UTF-8");
		try {
			pw = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		if(count>0){
			pw.write("이미 추천한 게시물입니다.");
		}else{
			int likeCheck = dao.likeUpdate(hMap);
			if(likeCheck ==0){
				pw.write("본인의 게시물은 추천할 수 없습니다.");
			}else{
				int check = dao.like(hMap);
				if(check>0){
					pw.write("추천되었습니다.");
					int likeCount = dao.checkLike(hMap);
					
					if(likeCount == 30){
						dao.copyBest(board_num);
					}
				}
			}
		}
	}

	/**
	 * @name : collabo
	 * @date : 2015. 7. 21.
	 * @author : Kim MinSic
	 * @description : call collabo page
	 */
	@Override
	public void collabo(ModelAndView mav) {
		logger.info("UploadBoard Collabo Service");
		
		Map<String, Object> map = mav.getModel();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		String board_num = request.getParameter("boardNum");
		String pageNumber = request.getParameter("pageNumber");
		
		UploadBoardDto board = dao.read(board_num);
		
		mav.addObject("pageNumber",pageNumber);
		mav.addObject("board",board);

		mav.setViewName("uploadBoard/collabo");
	}

	/**
	 * @name : collaboAdopt
	 * @date : 2015. 7. 25.
	 * @author : Kim MinSic
	 * @description : make collabo file between uploaded file and new file 
	 */
	@Override
	public void collaboAdopt(ModelAndView mav) {
		logger.info("UploadBoard collaboAdopt Service");
		Map<String, Object> map = mav.getModel();
		MultipartHttpServletRequest request = (MultipartHttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");
		UploadBoardDto uploadBoardDto = (UploadBoardDto) map.get("uploadBoard");
		
		Iterator<String> iter = request.getFileNames();
		MultipartFile mf = null;
		
		while(iter.hasNext()){
			String fileStr = iter.next();
			if(fileStr.equals("musicFile")){
				mf = request.getFile(fileStr);
//				System.out.println(fileStr+"\t"+mf.getOriginalFilename());
			}
//			System.out.println(fileStr +"\t"+ request.getFile(fileStr));
		}
		
		String musicFile = null;
		
		if(!mf.isEmpty()){		// 음악파일일 경우.
			musicFile =uploadBoardDto.getArtist_id()+"_"+System.currentTimeMillis()+"_"+mf.getOriginalFilename();
		}
		
		File uploadMusicFile = null;
		File recordFile=null;
		
		if(musicFile !=null){		// 음악파일일 경우.
			uploadMusicFile = new File(dir+"/uploadBoard/music/",musicFile);
		}else{
			uploadMusicFile = new File(dir+"/uploadBoard/music/",request.getParameter("recordFile").substring(request.getParameter("recordFile").lastIndexOf("/")+1));
			recordFile = new File(dir+"/TemporaryMusic/",request.getParameter("recordFile").substring(request.getParameter("recordFile").lastIndexOf("/")+1));
//			System.out.println("recordFileName : " +request.getParameter("recordFile"));
		}
		
		try {
			if(!mf.isEmpty()){
				mf.transferTo(uploadMusicFile);
			}else{
				if(!recordFile.renameTo(uploadMusicFile)){
					byte[] buf= new byte[1024];
					FileInputStream fis = new FileInputStream(recordFile);
					FileOutputStream fos = new FileOutputStream(uploadMusicFile);
					
					int read= 0;
					while((read=fis.read(buf, 0, buf.length))!=-1){
						fos.write(buf,0,read);
					}
					
					fis.close();
					fos.close();
					recordFile.delete();
				}
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		File originalFile = new File(dir+request.getParameter("originalFile").substring(request.getParameter("originalFile").indexOf("/resources")+10));
		
		KOSTAAudio kostaAudio = new KOSTAAudio();
//		System.out.println(originalFile.getAbsolutePath());
//		System.out.println(uploadMusicFile.getAbsolutePath());
//		System.out.println( uploadBoardDto.getArtist_id());
//		System.out.println(Double.parseDouble(request.getParameter("sync")));
		String mergeFile = kostaAudio.mergeAudio(originalFile.getAbsolutePath(), uploadMusicFile.getAbsolutePath(), uploadBoardDto.getArtist_id(), Double.parseDouble(request.getParameter("sync")));
		
		try {
			PrintWriter pw = response.getWriter();
			pw.write(mergeFile.substring(mergeFile.indexOf("/resources")));
		} catch (IOException e) {
			e.printStackTrace();
		}

		uploadBoardDto.setFile_path(uploadMusicFile.getAbsolutePath().substring(uploadMusicFile.getAbsolutePath().indexOf("\\resources")).replace('\\', '/'));
		
//		uploadBoardWriteNumber(uploadBoardDto);
//		int check = dao.write(uploadBoardDto);
//		mav.addObject("check", check);
//		mav.addObject("board", uploadBoardDto);
	}

	/**
	 * @name : collaboOk
	 * @date : 2015. 7. 26.
	 * @author : Kim MinSic
	 * @description : Process collabo OK service of each situation.
	 */
	@Override
	public void collaboOk(ModelAndView mav) {
		logger.info("UploadBoard CollaboOk Service");
		Map<String, Object> map = mav.getModel();
		MultipartHttpServletRequest request = (MultipartHttpServletRequest) map.get("request");
		UploadBoardDto uploadBoardDto = (UploadBoardDto) map.get("uploadBoardDto");
		
		uploadBoardDto.setRegister_date(new java.util.Date());
		uploadBoardDto.setCount(0);
		
		String coverImage=null;
		if(!request.getFile("coverImage").isEmpty()){
			coverImage= uploadBoardDto.getArtist_id()+"_"+System.currentTimeMillis()+"_"+request.getFile("coverImage").getOriginalFilename();
		}else{
			coverImage="d2.jpg";
		}
		
		File coverImageFile = new File(dir+"/uploadBoard/cover/",coverImage);
		File uploadMusicFile = new File(dir+request.getParameter("mergeFile").substring(request.getParameter("mergeFile").indexOf("/resources")));
		
		uploadBoardDto.setFile_name(uploadMusicFile.getName());
		uploadBoardDto.setFile_path(request.getParameter("mergeFile").substring(request.getParameter("mergeFile").indexOf("/resources")));
		uploadBoardDto.setImage_path(coverImageFile.getAbsolutePath());
		uploadBoardDto.setBoard_like(0);
		
		try {
			if(!request.getFile("coverImage").isEmpty()){
				request.getFile("coverImage").transferTo(coverImageFile);
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		if(!request.getFile("coverImage").isEmpty()){
			uploadBoardDto.setImage_path(uploadBoardDto.getImage_path().substring(uploadBoardDto.getImage_path().indexOf("\\resources")).replace('\\','/'));
		}else{
			uploadBoardDto.setImage_path(request.getParameter("image_path"));
		}
		
		uploadBoardWriteNumber(uploadBoardDto);
		int check = dao.write(uploadBoardDto);
		mav.addObject("check", check);
		mav.addObject("board", uploadBoardDto);
		
		mav.setViewName("uploadBoard/writeOk");
	}
}
