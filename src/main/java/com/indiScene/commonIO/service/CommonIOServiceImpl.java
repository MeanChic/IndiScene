package com.indiScene.commonIO.service;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
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

import com.indiScene.commonIO.dao.CommonIODao;
import com.indiScene.commonIO.dto.CommonDto;
import com.indiScene.commonIO.dto.CommonMusicDto;

@Component
public class CommonIOServiceImpl implements CommonIOService {
	final Logger logger=Logger.getLogger(this.getClass().getName());

	@Autowired
	private CommonIODao commonIODao;
	
	@Override
	public void imageUpload(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		MultipartFile upFile=(MultipartFile) map.get("upFile");
		String folderName=request.getParameter("folderName"); //요청하는 jsp에서 뽑아낸 servletPath로 게시판 명을 뽑아냈다 그걸 받음
		
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
		
//		String[] simpleClassName=this.getClass().getSimpleName().split("Service");
//		String folderName=simpleClassName[0];
		
		String attachDir="resources/"+folderName.trim()+"Resources/img/"; //콜백으로 넘길용도+실제 파일 들어갈 용도, jsp에서 뽑아낸 폴더 이름을 넣는다 
		String CKEditorFuncNum=request.getParameter("CKEditorFuncNum");
		if(fileSize !=0){
			try{
				File dirMake=new File(rootDir+attachDir);
				if(!dirMake.exists()){ //처음에 폴더 없을때 생성
					dirMake.mkdirs();
					logger.info("folderMakeSuccess");
				}
				File file= new File(rootDir+ attachDir + timeName ); //실제 파일이 들어갈 용도
				upFile.transferTo(file);  //img 새성된 File위치에 파일을 넣는다
				logger.info(file.toString()); 
				mav.addObject("CKEditorFuncNum",CKEditorFuncNum); //CkEditor 내부의 function 번호지정
				mav.addObject("filePath",file.toString()); //콜백에서 처리할 최초 이미지 경로
			}catch (Exception e){
				logger.info("ImageUploadError" + e);
			}
		}
		String filePath="/indiscene/" +attachDir+timeName;   //콜백으로 넘길 위치용도
		mav.addObject("CKEditorFuncNum",CKEditorFuncNum);
		mav.addObject("filePath" , filePath);
		mav.setViewName("common/imgUpCheck");
		
	}


	@Override
	public List<String> mainImageFind(Object list) {
		List<String> mainImageList=new ArrayList<String>();
		String contentForImg=null;
		List<CommonDto> realDto=(List<CommonDto>) list;
		for(int i=0;i<realDto.size();i++){
			
			contentForImg=realDto.get(i).getContent();
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
	
	public void multiFileUpload(MultipartHttpServletRequest request,CommonDto dto){
		List<MultipartFile> upFileList=request.getFiles("file[]"); //넘어오는 다중파일을 List형태로 받는다

		if(upFileList!=null){
			String folderName=request.getParameter("folderName");
			
			String dir = request.getSession().getServletContext().getRealPath("/resources/"+folderName+"Resources/file");
			File folderMake=new File(dir);
			if(!folderMake.exists()) folderMake.mkdirs();//폴더없을때 만드는 처리
			logger.info(dir);
			String fileName="";
			String timeName="";
			String fileNameForDto="";
			String filePathForDto="";
			
			for(int i=0;i<upFileList.size();i++){
				MultipartFile upFile=upFileList.get(i);
				
				fileName=upFile.getOriginalFilename();
				fileNameForDto+="<>";
				fileNameForDto+=fileName;
				
				timeName=Long.toString(System.currentTimeMillis()) + "_"
						+ upFile.getOriginalFilename();
				try{
					File file=new File(dir,timeName);
					upFile.transferTo(file);
					filePathForDto+="<>";   // <> 을 기준으로 중첩해서 dto에 들어간다
					filePathForDto+=file.getAbsolutePath();
					
				}catch(Exception e){
					logger.info("fileUploadError" + e);
				}
			}
			dto.setFile_name(fileNameForDto);
			dto.setFile_path(filePathForDto);
			
			logger.info("fileNameForDto:" + fileNameForDto);
			logger.info("filePathForDto:" + filePathForDto);
		
		}
		//멀티파일 처리 끝
	}

	@Override
	public void multiFileDelete(CommonDto dto) {
			// TODO Auto-generated method stub
			
			if(dto.getFile_name()!=null){
			File file=null;
			String fileNameForDto=dto.getFile_name();
			String filePathForDto=dto.getFile_path();
			String file_name=null;
			String file_path=null;
			
			StringTokenizer pathToken=new StringTokenizer(filePathForDto,"<>");
			StringTokenizer nameToken=new StringTokenizer(fileNameForDto,"<>");
			
			while(nameToken.hasMoreTokens() && pathToken.hasMoreTokens()){
				file_path=pathToken.nextToken();
				logger.info("deleteTokenCheck:" +file_path );
				file=new File(file_path);
				if(file.exists() && file.isFile()) file.delete();
			}
		}
	}

	@Override
	public void download(ModelAndView mav) throws IOException {
		// TODO Auto-generated method stub
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
		} finally {
			if (fis != null)
				fis.close();
			if (fos != null)
				fos.close();
		}
		mav.setViewName("");
	}

	@Override
	public void myUploadMusic(ModelAndView mav) {
		logger.info("myUpload Music Service");
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int boardSize =10;
		String pageNumber = request.getParameter("pageNumber");
		if(pageNumber == null) pageNumber ="1";
		
		int currentPage = Integer.parseInt(pageNumber);
		int startRow = (currentPage - 1) * boardSize +1;
		int endRow = currentPage*boardSize;
		
		String artist_id = request.getParameter("artist_id");
		int count=commonIODao.getUploadCount(artist_id);
		
		HashMap<String,Object> rowMap = new HashMap<String,Object>();
		rowMap.put("startRow", startRow);
		rowMap.put("endRow", endRow);
		rowMap.put("artist_id", artist_id);
		
		List<CommonMusicDto> myUploadMusic = commonIODao.getUploadMusic(rowMap);
		myUploadMusic.addAll(commonIODao.getMuseMusic(rowMap));
		
		myUploadMusic.sort(new RecentDateComparator());
		
		mav.addObject("boardList",myUploadMusic);
		mav.addObject("count",count);
		mav.addObject("boardSize",boardSize);
		mav.addObject("currentPage",currentPage);
		
		mav.setViewName("myMusic/upload");
	}
	
	@Override
	public void myLikeMusic(ModelAndView mav) {
		logger.info("myLike Music Service");
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String artist_id = request.getParameter("artist_id");
		int boardSize =10;
		String pageNumber = request.getParameter("pageNumber");
		if(pageNumber == null) pageNumber ="1";
		
		int count=commonIODao.getLikeCount(artist_id);
		int currentPage = Integer.parseInt(pageNumber);
		int startRow = (currentPage - 1) * boardSize +1;
		int endRow = currentPage*boardSize;
		
		HashMap<String,Object> rowMap = new HashMap<String,Object>();
		rowMap.put("startRow", startRow);
		rowMap.put("endRow", endRow);
		rowMap.put("artist_id", artist_id);
		
		List<CommonMusicDto> myLikeMusic = commonIODao.getLikeMusic(rowMap);
		myLikeMusic.sort(new RecentDateComparator());
		
		mav.addObject("boardList",myLikeMusic);
		mav.addObject("count",count);
		mav.addObject("boardSize",boardSize);
		mav.addObject("currentPage",currentPage);
		
		mav.setViewName("myMusic/like");
	}

	@Override
	public void myCollaboMusic(ModelAndView mav) {
		logger.info("myCollabo Music Service");
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int boardSize =10;
		String pageNumber = request.getParameter("pageNumber");
		if(pageNumber == null) pageNumber ="1";
		
		int currentPage = Integer.parseInt(pageNumber);
		int startRow = (currentPage - 1) * boardSize +1;
		int endRow = currentPage*boardSize;
		String artist_id = request.getParameter("artist_id");
		int count=commonIODao.getCollaboCount(artist_id);
		
		HashMap<String,Object> rowMap = new HashMap<String,Object>();
		rowMap.put("startRow", startRow);
		rowMap.put("endRow", endRow);
		rowMap.put("artist_id", artist_id);
		
		List<CommonMusicDto> myCollaboMusic = commonIODao.getUploadCollabo(rowMap);
		myCollaboMusic.addAll(commonIODao.getMuseCollabo(rowMap));
		
		myCollaboMusic.sort(new RecentDateComparator());
		
		mav.addObject("boardList",myCollaboMusic);
		mav.addObject("count",count);
		mav.addObject("boardSize",boardSize);
		mav.addObject("currentPage",currentPage);
		
		mav.setViewName("myMusic/collabo");
	}
	
	class RecentDateComparator implements Comparator<Object>{
		@Override
		public int compare(Object o1, Object o2) {
			java.util.Date d1 = ((CommonMusicDto)o1).getRegister_date();
			java.util.Date d2 = ((CommonMusicDto)o2).getRegister_date();
			
			int compare = d1.compareTo(d2);
			
			return compare>0 ? -1 : (compare==0?0:1);
		}
	}

}
