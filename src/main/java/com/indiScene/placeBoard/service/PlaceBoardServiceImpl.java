package com.indiScene.placeBoard.service;


import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.indiScene.commonIO.service.CommonIOService;
import com.indiScene.placeBoard.dao.PlaceBoardDao;
import com.indiScene.placeBoard.dto.PlaceBoardDto;
import com.indiScene.reply.dao.ReplyDao;
import com.indiScene.reply.dto.ReplyDto;

/**
@name  : PlaceBoardServiceImpl
@date  : 2015. 6. 25.
@auther: 김정승
@description : 대관 게시판 서비스 클래스
 */
@Component
public class PlaceBoardServiceImpl implements PlaceBoardService {
	final Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private PlaceBoardDao marketBoardDao;
	
	@Autowired
	private ReplyDao replyDao;
	
	@Autowired
	private CommonIOService commonIOService; //mainImgFind를 위해

	/**
	@name  : enterBoard
	@date  : 2015. 6. 25.
	@auther: 김정승
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

		int boardSize=9;
		int startRow=(currentPage-1) * boardSize +1;
		int endRow=currentPage*boardSize;
		logger.info("startRow:" + startRow + ",endRow" + endRow);
		
		List<PlaceBoardDto> marketList=null;
		List<String> mainImageList=null;
//		HashMap<String,MarketBoardDto> hMap=null;
//		List<HashMap<String,MarketBoardDto>> mapList=null;
		
		if(count >0) {
			marketList=marketBoardDao.getMarketList(startRow,endRow);
			logger.info("marketList" + marketList.size());
			
			mainImageList=commonIOService.mainImageFind(marketList); //첫번째 이미지를 뽑아오는 메소드
			//hMap=new HashMap<String,MarketBoardDto>();
			
		}
		
		mav.addObject("list", marketList);
		mav.addObject("count", count);
		mav.addObject("boardSize", boardSize);
		mav.addObject("pageNumber",currentPage);
		mav.addObject("mainImageList",mainImageList);
		mav.setViewName("placeBoard/enterBoard");
	}
	
//	@Override   //CommonIOService로 독립함
//	public List<String> mainImageFind(List<MarketBoardDto> marketList) {
//		List<String> mainImageList=new ArrayList<String>();
//		String contentForImg=null;
//		for(int i=0;i<marketList.size();i++){
//			contentForImg=marketList.get(i).getContent();
//			//System.out.println(contentForImg);
//			//logger.info("내용추출" +contentForImg);
//			Pattern p=Pattern.compile("src=\".*.\" style"); //표준정규식 만듬
//			Matcher pM=p.matcher(contentForImg);//이미지 Path가 있는 content불러와 표준정규식과 비교
//			if(pM.find()){
//				String imagePath=pM.group();
//				
//				imagePath = imagePath.replaceAll("src=\"", "").replaceAll("\" style", "");
//				//logger.info("이미지 경로추출" +imagePath);
//				mainImageList.add(imagePath);	
//			}
//		}
//		
//		return mainImageList;
//		// TODO Auto-generated method stub
//	}

	/**
	@name  : write
	@date  : 2015. 6. 25.
	@auther: 김정승
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
		
		commonIOService.multiFileUpload(request,marketBoardDto); //뒤에 Dto는 CommonDto로 받는다
		
		//멀티파일 처리 시작  CommonIOService로 독립시킴
//		List<MultipartFile> upFileList=request.getFiles("file[]"); //넘어오는 다중파일을 List형태로 받는다
//		
//		if(upFileList!=null){
//			String folderName=request.getParameter("folderName");
//			
//			String dir = request.getSession().getServletContext().getRealPath("/resources/"+folderName+"Resources/file");
//			File folderMake=new File(dir);
//			if(!folderMake.exists()) folderMake.mkdirs();//폴더없을때 만드는 처리
//			logger.info(dir);
//			String fileName="";
//			String timeName="";
//			String fileNameForDto="";
//			String filePathForDto="";
//			
//			System.out.println(upFileList.size()); //dto에 들어갈 path를 만들기 위해 for문 돌림
//			for(int i=0;i<upFileList.size();i++){
//				MultipartFile upFile=upFileList.get(i);
//				
//				fileName=upFile.getOriginalFilename();
//				fileNameForDto+="<>";
//				fileNameForDto+=fileName;
//				
//				timeName=Long.toString(System.currentTimeMillis()) + "_"
//						+ upFile.getOriginalFilename();
//				try{
//					File file=new File(dir,timeName);
//					upFile.transferTo(file);
//					filePathForDto+="<>";   // <> 을 기준으로 중첩해서 dto에 들어간다
//					filePathForDto+=file.getAbsolutePath();
//					
//				}catch(Exception e){
//					logger.info("fileUploadError" + e);
//				}
//			}
//			marketBoardDto.setFile_name(fileNameForDto);
//			marketBoardDto.setFile_path(filePathForDto);
//			
//			logger.info("fileNameForDto:" + fileNameForDto);
//			logger.info("filePathForDto:" + filePathForDto);
//		
//		}
//		//멀티파일 처리 끝

		int check=marketBoardDao.insert(marketBoardDto);
		logger.info("check" + check);
		
		mav.addObject("check", check);
		mav.setViewName("placeBoard/writeOk");
	}
	
	/**
	@name  : read
	@date  : 2015. 6. 25.
	@auther: 김정승
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
		System.out.println("sdf"+boardNumber);
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

//	/** commonIO로 뺐음
//	@name  : imageUpload
//	@date  : 2015. 6. 25.
//	@auther: 김정승
//	@description :게시판에 이미지를 첨부하기 위해 저장위치에 파일을 저장시키고 위치를 반환한다
//	 */
//	@Override
//	public void imageUpload(ModelAndView mav) {
//		Map<String,Object> map=mav.getModelMap();
//		HttpServletRequest request = (HttpServletRequest) map.get("request");
//		MultipartFile upFile=(MultipartFile) map.get("upFile");
////	    HttpSession session = request.getSession();
////	    String root_path = session.getServletContext().getRealPath("/"); 
////	    logger.info(root_path);
////	    String attach_path = "resources/files/attach/";
//        
//		String fileName = upFile.getOriginalFilename();
//		String timeName = Long.toString(System.currentTimeMillis()) + "_"
//				+ fileName;
//		long fileSize = upFile.getSize();
//		
//		logger.info("fileName:" + fileName); //이미지 경로에 들어가고 CKEditor 콜백에 들어간다
//		logger.info("fileSize:" + fileSize); //일단 이미지에선 쓰지 않는다
//		logger.info("timeName:" + timeName); //실제 이미지 경로에 들어가고 콜백에 들어간다.
//		String rootDir=request.getSession().getServletContext().getRealPath("/");
//		//System.out.println("rootDir" + rootDir);
//		
//		String[] simpleClassName=this.getClass().getSimpleName().split("Service");
//		String folderName=simpleClassName[0];
//		System.out.println(folderName);
//		
//		String attachDir="resources/marketResources/img/"; //콜백으로 넘길용도+실제 파일 들어갈 용도
//		String CKEditorFuncNum=request.getParameter("CKEditorFuncNum");
//		if(fileSize !=0){
//			try{
//				File file= new File(rootDir+ attachDir + timeName ); //실제 파일이 들어갈 용도
//				upFile.transferTo(file);  //img 새성된 File위치에 파일을 넣는다
//				logger.info(file.toString()); 
//				mav.addObject("CKEditorFuncNum",CKEditorFuncNum); //CkEditor 내부의 function 번호지정
//				mav.addObject("filePath",file.toString()); //콜백에서 처리할 최초 이미지 경로
//			}catch (Exception e){
//				logger.info("ImageUploadError" + e);
//			}
//		}
//		String filePath="/indiscene/" +attachDir+timeName;   //콜백으로 넘길 위치용도
//		mav.addObject("CKEditorFuncNum",CKEditorFuncNum);
//		mav.addObject("filePath" , filePath);
//		mav.setViewName("common/imgUpCheck");
//		
//	}

	/**
	@name  : delete
	@date  : 2015. 6. 25.
	@auther: 김정승
	@description : 게시물 삭제를 위해 계정비번 요구 페이지 반환
	 */
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

	/**
	@name  : deleteOk
	@date  : 2015. 6. 25.
	@auther: 김정승
	@description :대관게시판 글을 삭제하기 위한 서비스 메소드
	 */
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
		logger.info("board_num:"+board_num);
		logger.info("pageNumber:"+pageNumber);
		int delCheck=0;
		
		if(password.equals(realPass)){
			logger.info("--여기는 오니");
			PlaceBoardDto marketBoardDto=marketBoardDao.read(board_num);
			
			//commonIOService.multiFileDelete(marketBoardDto); //독립된 파일처리 과정을 호출
			//다중파일 삭제 처리 시작
//			if(marketBoardDto.getFile_name()!=null){    //CommonService로 독립
//				File file=null;
//				String fileNameForDto=marketBoardDto.getFile_name();
//				String filePathForDto=marketBoardDto.getFile_path();
//				String file_name=null;
//				String file_path=null;
//				
//				StringTokenizer pathToken=new StringTokenizer(filePathForDto,"<>");
//				StringTokenizer nameToken=new StringTokenizer(fileNameForDto,"<>");
//				
//				while(nameToken.hasMoreTokens() && pathToken.hasMoreTokens()){
//					file_path=pathToken.nextToken();
//					logger.info("deleteTokenCheck:" +file_path );
//					file=new File(file_path);
//					if(file.exists() && file.isFile()) file.delete();
//				}
//			}
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

	/**
	@name  : update
	@date  : 2015. 6. 25.
	@auther: 김정승
	@description :공연게시판 수정을위해 db내용을 불러오기 위한 service 메소드
	 */
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
	
	/**
	@name  : deleteOk
	@date  : 2015. 6. 25.
	@auther: 김정승
	@description :공연게시판 글을 수정하기 위한 서비스 메소드
	 */
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
		mav.addObject("check",check);
		mav.addObject("board_num",board_num);
		mav.addObject("pageNumber",pageNumber);
		mav.setViewName("placeBoard/updateOk");
	}

//	@Override  //CommonIO로 독립시킴
//	public void download(ModelAndView mav) throws Throwable{
//		Map<String, Object> map = mav.getModelMap();
//		HttpServletRequest request = (HttpServletRequest) map.get("request");
//		HttpServletResponse response = (HttpServletResponse) map.get("response");
//		String boardNumber =request.getParameter("board_num"); // 필요없음 확인되면 지울것
//		
//		//파일정보를 뽑아냄
//		String file_name=request.getParameter("file_name");
//		String file_path=request.getParameter("file_path");
//		
//		String fileName = new String(file_name.getBytes("UTF-8"),
//				"ISO-8859-1");
//		response.setHeader("Content-Disposition", "attachment;filename="
//				+ fileName);
//		response.setHeader("Content-Transfer-Encoding", "binary");
//		response.setContentType("application/octet-stream");
//		
//		//file_size가 없으므로 클릭한 file을 File에 객체 생성후 사이즈를 뽑아낸다
//		File file=new File(file_path);
//		
//		int file_size=(int)file.length();
//		response.setContentLength(file_size);
//		
//		logger.info("filePath" +file.toString() +"\t"+"fileSize"+ file_size);
//		
//		BufferedInputStream fis = null;
//		BufferedOutputStream fos = null;
//		
//
//		try {
//			fis = new BufferedInputStream(new FileInputStream(file_path));
//			fos = new BufferedOutputStream(response.getOutputStream());
//			byte[] by = new byte[(int) file_size];
//			int count = fis.read(by);
//			for (int i = 0; i < count; i++) {
//				fos.write(by[i]);
//			}
//			fos.flush();
//		} catch (Exception e) {
//			e.printStackTrace();
//			System.out.println("Download Error");
//		} finally {
//			if (fis != null)
//				fis.close();
//			if (fos != null)
//				fos.close();
//		}
//		mav.setViewName("");
//	}
	
}
