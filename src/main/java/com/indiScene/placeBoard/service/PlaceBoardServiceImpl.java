package com.indiScene.placeBoard.service;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.indiScene.placeBoard.dao.PlaceBoardDao;
import com.indiScene.placeBoard.dto.PlaceBoardDto;
import com.indiScene.reply.dto.ReplyDto;
import com.indiScene.reply.dao.ReplyDao;


/**
@name  : MarketBoardServiceImpl
@date  : 2015. 6. 25.
@auther: 나혁진
@description :
 */
@Component
public class PlaceBoardServiceImpl implements PlaceBoardService {
	final Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private PlaceBoardDao marketBoardDao;
	
	@Autowired
	private ReplyDao replyDao;

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
		
		List<PlaceBoardDto> marketList=null;
		List<String> mainImageList=null;
		HashMap<String,PlaceBoardDto> hMap=null;
		List<HashMap<String,PlaceBoardDto>> mapList=null;
		
		if(count >0) {
			marketList=marketBoardDao.getMarketList(startRow,endRow);
			logger.info("marketList" + marketList.size());
			mainImageList=mainImageFind(marketList);
			hMap=new HashMap<String,PlaceBoardDto>();
			mapList = new ArrayList<HashMap<String,PlaceBoardDto>>();
			
		}
		
		mav.addObject("list", marketList);
		mav.addObject("count", count);
		mav.addObject("boardSize", boardSize);
		mav.addObject("pageNumber",currentPage);
		mav.addObject("mainImageList",mainImageList);
		mav.setViewName("placeBoard/enterBoard");
	}
	
	
	@Override
	public List<String> mainImageFind(List<PlaceBoardDto> marketList) {
		List<String> mainImageList=new ArrayList<String>();
		String contentForImg=null;
		for(int i=0;i<marketList.size();i++){
			contentForImg=marketList.get(i).getContent();
			//System.out.println(contentForImg);
			//logger.info("내용추출" +contentForImg);
			Pattern p=Pattern.compile("src=\".*.\" style"); //표준정규식 만듬
			Matcher pM=p.matcher(contentForImg);//이미지 Path가 있는 content불러와 표준정규식과 비교
			if(pM.find()){
				String imagePath=pM.group();
				
				imagePath = imagePath.replaceAll("src=\"", "").replaceAll("\" style", "");
				//logger.info("이미지 경로추출" +imagePath);
				mainImageList.add(imagePath);	
			}
		}
		
		return mainImageList;
		// TODO Auto-generated method stub
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
		PlaceBoardDto marketBoardDto=(PlaceBoardDto)map.get("marketBoardDto");
		MultipartHttpServletRequest request=(MultipartHttpServletRequest)map.get("request"); 
		Date date=new Date();
		marketBoardDto.setRegister_date(date);
		
		
		List<MultipartFile> upFileList=request.getFiles("file[]");
		
		if(upFileList!=null){
			String dir = request.getSession().getServletContext().getRealPath("/resources/marketResources/file");
			logger.info(dir);
			String fileName="";
			String timeName="";
			String fileNameForDto="";
			String filePathForDto="";
			
			System.out.println(upFileList.size());
			for(int i=0;i<upFileList.size();i++){
				MultipartFile upFile=upFileList.get(i);
				
				fileName=upFile.getOriginalFilename();
				fileNameForDto+=";";
				fileNameForDto+=fileName;
				
				timeName=Long.toString(System.currentTimeMillis()) + "_"
						+ upFile.getOriginalFilename();
				try{
					File file=new File(dir,timeName);
					upFile.transferTo(file);
					filePathForDto+=";";
					filePathForDto+=file.getAbsolutePath();
					
				}catch(Exception e){
					logger.info("fileUploadError" + e);
				}
			}
			marketBoardDto.setFile_name(fileNameForDto);
			marketBoardDto.setFile_path(filePathForDto);
			
			logger.info("fileNameForDto:" + fileNameForDto);
			logger.info("filePathForDto:" + filePathForDto);
		
		}
		
		int check=marketBoardDao.insert(marketBoardDto);
		logger.info("check" + check);
		
		mav.addObject("check", check);
		mav.setViewName("placeBoard/writeOk");
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
		PlaceBoardDto marketBoardDto=marketBoardDao.read(boardNumber);
		
		//한줄댓글을 불러온다
		List<ReplyDto> replyList=replyDao.replyList(boardNumber);
		
		int countCheck=0;
		if(marketBoardDto !=null){
			countCheck=marketBoardDao.count(boardNumber);
		}		
		
		logger.info("marketBoardDto:" + marketBoardDto);
		logger.info("countCheck" + countCheck);
		//logger.info("replyContent" +replyDto.getReply_content());
		
		//한줄댓글을 mav에 집어 넣는다.
		mav.addObject("replyList",replyList);
		
		mav.addObject("marketBoard",marketBoardDto);
		mav.addObject("pageNumber",currentPage);
		
		mav.setViewName("placeBoard/read");
	}

	/**
	@name  : imageUpload
	@date  : 2015. 6. 25.
	@auther: 나혁진
	@description :게시판에 이미지를 첨부하기 위해 저장위치에 파일을 저장시키고 위치를 반환한다
	 */
	@Override
	public void imageUpload(ModelAndView mav) {
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
		
		logger.info("fileName:" + fileName); //이미지 경로에 들어가고 CKEditor 콜백에 들어간다
		logger.info("fileSize:" + fileSize); //일단 이미지에선 쓰지 않는다
		logger.info("timeName:" + timeName); //실제 이미지 경로에 들어가고 콜백에 들어간다.
		String rootDir=request.getSession().getServletContext().getRealPath("/");
		System.out.println("rootDir" + rootDir);
		String attachDir="resources/marketResources/img/"; //콜백으로 넘길용도+실제 파일 들어갈 용도
		String CKEditorFuncNum=request.getParameter("CKEditorFuncNum");
		if(fileSize !=0){
			try{
				File file= new File(rootDir+ attachDir + timeName ); //실제 파일이 들어갈 용도
				System.out.println("++" + rootDir+ attachDir + timeName);
				upFile.transferTo(file); 
				logger.info(file.toString());
				mav.addObject("CKEditorFuncNum",CKEditorFuncNum);
				mav.addObject("filePath",file.toString());
			}catch (Exception e){
				logger.info("ImageUploadError" + e);
			}
		}
		String filePath="/indiscene/" +attachDir+timeName;   //콜백으로 넘길용도
		mav.addObject("CKEditorFuncNum",CKEditorFuncNum);
		mav.addObject("filePath" , filePath);
		
		mav.setViewName("placeBoard/ImgUpCheck");
	}


	@Override
	public void delete(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String,Object> map= mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		String board_num=request.getParameter("board_num");
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		String artist_id=request.getParameter("artist_id");
				
		mav.addObject("board_num",board_num);
		mav.addObject("pageNumber",pageNumber);
		mav.addObject("artist_id",artist_id);
		
		mav.setViewName("placeBoard/delete");
		
	}


	@Override
	public void deleteOk(ModelAndView mav) {
		// TODO Auto-generated method stub
		
		Map<String,Object> map= mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		String board_num=request.getParameter("board_num");
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		String artist_id=request.getParameter("artist_id");
		String password=request.getParameter("password");		
		
		String realPass=marketBoardDao.passCheck(artist_id);
		logger.info("realPass:" +realPass);
		logger.info("TypedPass:"+password);
		int delCheck=0;
		
		if(password.equals(realPass)){
			
			PlaceBoardDto marketBoardDto=marketBoardDao.read(board_num);
			logger.info("==" + marketBoardDto.getFile_name());
			if(marketBoardDto.getFile_name()!=null || !(marketBoardDto.getFile_name().equals(";"))){
				logger.info("==" + marketBoardDto.getFile_name());
				File file=null;
				String fileNameForDto=marketBoardDto.getFile_name();
				String filePathForDto=marketBoardDto.getFile_path();
				String file_name=null;
				String file_path=null;
				
				StringTokenizer pathToken=new StringTokenizer(filePathForDto,";");
				StringTokenizer nameToken=new StringTokenizer(fileNameForDto,";");
				
				while(nameToken.hasMoreTokens() && pathToken.hasMoreTokens()){
					file_path=pathToken.nextToken();
					logger.info("deleteTokenCheck:" +file_path );
					file=new File(file_path);
					if(file.exists() && file.isFile()) file.delete();
				}
				
			}

			delCheck=marketBoardDao.delete(board_num);
					
		}else{
			delCheck=2;
		}
		
		mav.addObject("board_num",board_num);
		mav.addObject("pageNumber",pageNumber);
		mav.addObject("artist_id",artist_id);
		mav.addObject("check",delCheck);
		
		mav.setViewName("placeBoard/deleteOk");
		
	}


	@Override
	public void update(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String,Object> map=mav.getModelMap();

		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String board_num=request.getParameter("board_num");
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		
		PlaceBoardDto marketBoardDto=marketBoardDao.update(board_num);
//		logger.info(marketBoardDto.toString());
//		logger.info(marketBoardDto.getContent());
		mav.addObject("board",marketBoardDto);
		mav.addObject("pageNumber",pageNumber);
		mav.setViewName("placeBoard/update");
		
	}
	
	public void updateOk(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String,Object> map=mav.getModelMap();

		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String board_num=request.getParameter("board_num");
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		
		PlaceBoardDto marketBoardDto=(PlaceBoardDto) map.get("marketBoardDto");
		
		if(marketBoardDto.getFile_name()!=null){
			
		}
		
		int check=marketBoardDao.updateOk(marketBoardDto);
//		System.out.println(updateCheck);
		mav.addObject("check",check);
		mav.addObject("pageNumber",pageNumber);
		mav.setViewName("placeBoard/updateOk");
		
	}


	@Override
	public void download(ModelAndView mav) throws Throwable{
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");
		String boardNumber =request.getParameter("board_num"); // 필요없음 확인되면 지울것
		
		//파일정보를 뽑아냄
		String file_name=request.getParameter("file_name");
		String file_path=request.getParameter("file_path");
		
		String fileName = new String(file_name.getBytes("UTF-8"),
				"ISO-8859-1");
		response.setHeader("Content-Disposition", "attachment;filename="
				+ fileName);
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setContentType("application/octet-stream");
		
		//file_size가 없으므로 클릭한 file을 File에 객체 생성후 사이즈를 뽑아낸다
		File file=new File(file_path);
		
		int file_size=(int)file.length();
		response.setContentLength(file_size);
		
		logger.info("filePath" +file.toString() +"\t"+"fileSize"+ file_size);
		
		BufferedInputStream fis = null;
		BufferedOutputStream fos = null;
		

		try {
			fis = new BufferedInputStream(new FileInputStream(file_path));
			fos = new BufferedOutputStream(response.getOutputStream());
			byte[] by = new byte[(int) file_size];
			int count = fis.read(by);
			for (int i = 0; i < count; i++) {
				fos.write(by[i]);
			}
			fos.flush();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Download Error");
		} finally {
			if (fis != null)
				fis.close();
			if (fos != null)
				fos.close();
		}
		mav.setViewName("");
		
		
	}
	
}
