package com.indiScene.museBoard.service;

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
import com.indiScene.museBoard.dao.MuseBoardDao;
import com.indiScene.museBoard.dto.MuseBoardDto;

@Controller
public class MuseBoardServiceImpl implements MuseBoardService {
	private String dir = "C:/SPB_Data/git/IndiScene/src/main/webapp/resources/";
//	private String dir="C:/KMS_MavenSpring/apache-tomcat-7.0.59/wtpwebapps/IndiScene/resources/";
	
	@Autowired
	private MuseBoardDao dao;
	private Logger logger = Logger.getLogger(this.getClass().getName());
	
	@Override
	public void write(ModelAndView mav) {
		logger.info("MuseBoard Write Service");
		
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
			
			mav.setViewName("museBoard/collabo");
		}else{
			String pageNumber = request.getParameter("pageNumber");
			
			MuseBoardDto board = dao.read(board_num);
			
			mav.addObject("pageNumber",pageNumber);
			mav.addObject("board",board);
			mav.setViewName("museBoard/write");
		}
		
		String muse_name=request.getParameter("muse_name");
		
		mav.addObject("muse_name",muse_name);
		mav.addObject("board_num" , board_num);
		mav.addObject("group_num" , group_num);
		mav.addObject("seq_num" , seq_num);
		mav.addObject("seq_level" , seq_level);
	}

	@Override
	public void writeOk(ModelAndView mav) {
		logger.info("MuseBoard WriteOk Service");
		Map<String, Object> map = mav.getModel();
		MultipartHttpServletRequest request = (MultipartHttpServletRequest) map.get("request");
		MuseBoardDto MuseBoardDto = (MuseBoardDto) map.get("MuseBoardDto");
		
		Iterator<String> iter = request.getFileNames();
		
		List<MultipartFile> fileList = new ArrayList<MultipartFile>();
		while(iter.hasNext()){
			String fileStr = iter.next();
			MultipartFile mf = request.getFile(fileStr);
			fileList.add(mf);
//			
			System.out.println(fileStr +"\t"+ mf.getOriginalFilename());
		}
		
		MuseBoardDto.setRegister_date(new java.util.Date());
		MuseBoardDto.setCount(0);
		
		String coverImage=null;
		if(!request.getFile("coverImage").isEmpty()){
			coverImage= MuseBoardDto.getArtist_id()+"_"+System.currentTimeMillis()+"_"+fileList.get(0).getOriginalFilename();
		}else{
			coverImage="d2.jpg";
		}
		String musicFile = null;
		
		if(fileList.size() == 2){		// 녹음파일일 경우.
			musicFile =MuseBoardDto.getArtist_id()+"_"+System.currentTimeMillis()+"_"+fileList.get(1).getOriginalFilename();
		}
		
//		String dirCover = request.getSession().getServletContext().getRealPath("/resources/museBoard/cover");
//		String dirMusic = request.getSession().getServletContext().getRealPath("/resources/museBoard/music");
		
		File coverImageFile = new File(dir+"/uploadBoard/cover/",coverImage);
		File uploadMusicFile = null;
		File recordFile=null;
		
		if(musicFile !=null){		// 녹음파일일 경우.
			uploadMusicFile = new File(dir+"/uploadBoard/music/",musicFile);
		}else{
			uploadMusicFile = new File(dir+"/uploadBoard/music/",request.getParameter("recordFile").substring(request.getParameter("recordFile").lastIndexOf("/")+1));
			recordFile = new File(dir+"/TemporaryMusic/",request.getParameter("recordFile").substring(request.getParameter("recordFile").lastIndexOf("/")+1));
		}
		MuseBoardDto.setFile_name(uploadMusicFile.getName());
		MuseBoardDto.setFile_path(uploadMusicFile.getAbsolutePath());
		MuseBoardDto.setImage_path(coverImageFile.getAbsolutePath());
		MuseBoardDto.setBoard_like(0);
		
		try {
			fileList.get(0).transferTo(coverImageFile);
			if(fileList.size()==2){
				fileList.get(1).transferTo(uploadMusicFile);
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
		
		MuseBoardDto.setFile_path(MuseBoardDto.getFile_path().substring(MuseBoardDto.getFile_path().indexOf("\\resources")).replace('\\', '/'));
		MuseBoardDto.setImage_path(MuseBoardDto.getImage_path().substring(MuseBoardDto.getImage_path().indexOf("\\resources")).replace('\\','/'));
		
		MuseBoardWriteNumber(MuseBoardDto);
		int check = dao.write(MuseBoardDto);
		mav.addObject("check", check);
		mav.addObject("board", MuseBoardDto);
		
		mav.setViewName("museBoard/writeOk");
	}
	
	@Override
	public void MuseBoardWriteNumber(MuseBoardDto boardDto){
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

/*	@Override
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
	}*/

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
		
		List<MuseBoardDto> list= dao.getBoardList(rowMap);
		
	/*	for(MuseBoardDto dto:list){
//			System.out.println(dto.getFile_path());
			dto.setFile_path(dto.getFile_path().substring(dto.getFile_path().indexOf("\\resources")).replace('\\', '/'));
			dto.setImage_path(dto.getImage_path().substring(dto.getImage_path().indexOf("\\resources")).replace('\\','/'));
		}*/
		String muse_name=request.getParameter("muse_name");
		
		mav.addObject("muse_name",muse_name);
		mav.addObject("boardList",list);
		mav.addObject("count",count);
		mav.addObject("boardSize",boardSize);
		mav.addObject("currentPage",currentPage);
		
		mav.setViewName("museBoard/list");
	}

	@Override
	public void read(ModelAndView mav) {
		Map<String, Object> map=mav.getModel();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String board_num = request.getParameter("boardNum");
		String pageNumber = request.getParameter("pageNumber");
		
		MuseBoardDto boardDto = dao.read(board_num);
		dao.readCount(board_num);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		String date= sdf.format(boardDto.getRegister_date());
		String muse_name=request.getParameter("muse_name");
		
		mav.addObject("muse_name",muse_name);
		mav.addObject("date",date);
		mav.addObject("pageNumber",pageNumber);
		mav.addObject("board_num",board_num);
		mav.addObject("boardDto",boardDto);
		
		mav.setViewName("museBoard/read");
	}

	@Override
	public void update(ModelAndView mav) {
		Map<String, Object> map=mav.getModel();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String board_num = request.getParameter("boardNum");
		String pageNumber = request.getParameter("pageNumber");
		
		MuseBoardDto board = dao.read(board_num);
//		System.out.println(board);
		
		String muse_name=request.getParameter("muse_name");
		
		mav.addObject("muse_name",muse_name);
		mav.addObject("pageNumber",pageNumber);
		mav.addObject("board",board);

		mav.setViewName("museBoard/update");
	}

	@Override
	public void updateOk(ModelAndView mav) {
		logger.info("MuseBoard UpdateOk Service");
		Map<String, Object> map = mav.getModel();
		MultipartHttpServletRequest request = (MultipartHttpServletRequest) map.get("request");
		MuseBoardDto MuseBoardDto = (MuseBoardDto) map.get("MuseBoard");
		MuseBoardDto originalDto = dao.read(MuseBoardDto.getBoard_num());
		
		String coverImage = null;
		String musicFile = null;
		
		Iterator<String> iter = request.getFileNames();
		
		while(iter.hasNext()){
			String fileStr = iter.next();
			MultipartFile mf = request.getFile(fileStr);
			if(!mf.isEmpty()){
				if(fileStr.equals("coverImage")){
					coverImage=MuseBoardDto.getArtist_id()+"_"+System.currentTimeMillis()+"_"+mf.getOriginalFilename();
					
					File oldFile = new File(dir+"/uploadBoard/cover/",originalDto.getImage_path().substring(originalDto.getImage_path().lastIndexOf("/")+1));
					oldFile.delete();
					File newFile = new File(dir+"/uploadBoard/cover/",coverImage);
					MuseBoardDto.setImage_path(newFile.getAbsolutePath().substring(newFile.getAbsolutePath().indexOf("\\resources")).replace('\\','/'));

					try {
						mf.transferTo(newFile);
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}else if(fileStr.equals("musicFile")){
					musicFile = MuseBoardDto.getArtist_id()+"_"+System.currentTimeMillis()+"_"+mf.getOriginalFilename();
					File oldFile = new File(dir+"/uploadBoard/cover/",originalDto.getFile_path().substring(originalDto.getFile_path().lastIndexOf("/")+1));
					oldFile.delete();
					File newFile = new File(dir+"/uploadBoard/cover/",musicFile);
					
					MuseBoardDto.setFile_name(mf.getOriginalFilename());
					MuseBoardDto.setFile_path(newFile.getAbsolutePath().substring(newFile.getAbsolutePath().indexOf("\\resources")).replace('\\', '/'));
					
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
					MuseBoardDto.setImage_path(originalDto.getImage_path());
				}else if(fileStr.equals("musicFile")){
				}	MuseBoardDto.setFile_path(originalDto.getFile_path());
			}
			
			System.out.println(fileStr +"\t"+ mf.getOriginalFilename());
		}
		
		dao.update(MuseBoardDto);
	}

	@Override
	public void delete(ModelAndView mav) {
		logger.info("MuseBoard Delete Service");
		
		Map<String, Object> map = mav.getModel();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		String board_num = request.getParameter("boardNum");
		String pageNumber = request.getParameter("pageNumber");
		
		MuseBoardDto originalDto = dao.read(board_num);
		
		File oldImg = new File(dir+"/uploadBoard/cover/",originalDto.getImage_path().substring(originalDto.getImage_path().lastIndexOf("/")+1));
		File oldMusic = new File(dir+"/uploadBoard/cover/",originalDto.getFile_path().substring(originalDto.getFile_path().lastIndexOf("/")+1));
		
		oldImg.delete();
		oldMusic.delete();
		
		int check = dao.delete(board_num);
		
		String muse_name=request.getParameter("muse_name");
		
		mav.addObject("muse_name",muse_name);
		mav.addObject("pageNumber",pageNumber);
		mav.addObject("check",check);

		mav.setViewName("museBoard/delete");
	}
/*	
	@Override
	public void like(ModelAndView mav) {
		logger.info("MuseBoard like Service");

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
*/
	@Override
	public void collabo(ModelAndView mav) {
		logger.info("MuseBoard Collabo Service");
		
		Map<String, Object> map = mav.getModel();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		String board_num = request.getParameter("boardNum");
		String pageNumber = request.getParameter("pageNumber");
		
		MuseBoardDto board = dao.read(board_num);
		
		String muse_name=request.getParameter("muse_name");
		
		mav.addObject("muse_name",muse_name);
		mav.addObject("pageNumber",pageNumber);
		mav.addObject("board",board);

		mav.setViewName("museBoard/collabo");
	}

	@Override
	public void collaboAdopt(ModelAndView mav) {
		logger.info("MuseBoard collaboAdopt Service");
		Map<String, Object> map = mav.getModel();
		MultipartHttpServletRequest request = (MultipartHttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");
		MuseBoardDto MuseBoardDto = (MuseBoardDto) map.get("MuseBoard");
		
		Iterator<String> iter = request.getFileNames();
		MultipartFile mf = null;
		
		while(iter.hasNext()){
			String fileStr = iter.next();
			if(fileStr.equals("musicFile")){
				mf = request.getFile(fileStr);
				System.out.println(fileStr+"\t"+mf.getOriginalFilename());
			}
			System.out.println(fileStr +"\t"+ request.getFile(fileStr));
		}
		
		String musicFile = null;
		
		if(mf!=null){		// 음악파일일 경우.
			musicFile =MuseBoardDto.getArtist_id()+"_"+System.currentTimeMillis()+"_"+mf.getOriginalFilename();
		}
		
		File uploadMusicFile = null;
		File recordFile=null;
		
		if(musicFile !=null){		// 음악파일일 경우.
			uploadMusicFile = new File(dir+"/uploadBoard/music/",musicFile);
		}else{
			uploadMusicFile = new File(dir+"/uploadBoard/music/",request.getParameter("recordFile").substring(request.getParameter("recordFile").lastIndexOf("/")+1));
			recordFile = new File(dir+"/TemporaryMusic/",request.getParameter("recordFile").substring(request.getParameter("recordFile").lastIndexOf("/")+1));
		}
		
		try {
			if(mf!=null){
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
		
		String mergeFile = kostaAudio.mergeAudio(originalFile.getAbsolutePath(), uploadMusicFile.getAbsolutePath(), MuseBoardDto.getArtist_id(), Double.parseDouble(request.getParameter("sync")));
		
		try {
			PrintWriter pw = response.getWriter();
			pw.write(mergeFile.substring(mergeFile.indexOf("/resources")));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		MuseBoardDto.setFile_path(uploadMusicFile.getAbsolutePath().substring(uploadMusicFile.getAbsolutePath().indexOf("\\resources")).replace('\\', '/'));
		
//		MuseBoardWriteNumber(MuseBoardDto);
//		int check = dao.write(MuseBoardDto);
//		mav.addObject("check", check);
//		mav.addObject("board", MuseBoardDto);
	}

	@Override
	public void collaboOk(ModelAndView mav) {
		logger.info("MuseBoard CollaboOk Service");
		Map<String, Object> map = mav.getModel();
		MultipartHttpServletRequest request = (MultipartHttpServletRequest) map.get("request");
		MuseBoardDto MuseBoardDto = (MuseBoardDto) map.get("MuseBoardDto");
		
		MuseBoardDto.setRegister_date(new java.util.Date());
		MuseBoardDto.setCount(0);
		
		String coverImage=null;
		if(!request.getFile("coverImage").isEmpty()){
			coverImage= MuseBoardDto.getArtist_id()+"_"+System.currentTimeMillis()+"_"+request.getFile("coverImage").getOriginalFilename();
		}else{
			coverImage="d2.jpg";
		}
		
		File coverImageFile = new File(dir+"/uploadBoard/cover/",coverImage);
		File uploadMusicFile = new File(dir+request.getParameter("mergeFile").substring(request.getParameter("mergeFile").indexOf("/resources")));
		
		MuseBoardDto.setFile_name(uploadMusicFile.getName());
		MuseBoardDto.setFile_path(request.getParameter("mergeFile").substring(request.getParameter("mergeFile").indexOf("/resources")));
		MuseBoardDto.setImage_path(coverImageFile.getAbsolutePath());
		MuseBoardDto.setBoard_like(0);
		
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
			MuseBoardDto.setImage_path(MuseBoardDto.getImage_path().substring(MuseBoardDto.getImage_path().indexOf("\\resources")).replace('\\','/'));
		}else{
			MuseBoardDto.setImage_path(request.getParameter("image_path"));
		}
		
		MuseBoardWriteNumber(MuseBoardDto);
		int check = dao.write(MuseBoardDto);
		
		String muse_name=request.getParameter("muse_name");
		
		mav.addObject("muse_name",muse_name);
		mav.addObject("check", check);
		mav.addObject("board", MuseBoardDto);
		
		mav.setViewName("museBoard/writeOk");
	}

	@Override
	public void museToUpload(ModelAndView mav) {
		logger.info("MuseBoard museToUpload Service");
		
		Map<String, Object> map = mav.getModel();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");
		
		String board_num = request.getParameter("boardNum");

		String muse_name=request.getParameter("muse_name");
		
		MuseBoardDto board = dao.read(board_num);
		board.setArtist_id("["+muse_name+"]"+board.getArtist_id());
		int check = dao.museToUpload(board);
		
		if(check > 0){
			try {
				PrintWriter out = response.getWriter();
				out.write("게시물 작성이 완료되었습니다.");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		mav.addObject("muse_name",muse_name);
	}
}
