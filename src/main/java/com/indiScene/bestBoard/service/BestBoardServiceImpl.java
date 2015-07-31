package com.indiScene.bestBoard.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.indiScene.bestBoard.dao.BestBoardDao;
import com.indiScene.bestBoard.dto.BestBoardDto;
import com.indiScene.commonIO.dto.CommonMusicDto;

/**
 * @type : BestBoardServiceImpl
 * @date : 2015. 7. 20.
 * @author : Kim MinSic
 * @description : 전반적인 BestBoard와 PlayList의 기능을 구현한 클래스
 */
@Component
public class BestBoardServiceImpl implements BestBoardService {
//	private String dir = "C:/SPB_Data/git/IndiScene/src/main/webapp/resources/";
//	private String dir="C:/KMS_MavenSpring/apache-tomcat-7.0.59/wtpwebapps/IndiScene/resources/";
	
	@Autowired
	private BestBoardDao dao;
	private Logger logger = Logger.getLogger(this.getClass().getName());
	
	
	/**
	 * @name : bestList
	 * @date : 2015. 7. 20.
	 * @author : Kim MinSic
	 * @description : bestboard의 Database를 불러와준다.
	 */
	@Override
	public void bestList(ModelAndView mav) {
		logger.info("best List Service Start");
		
		Map<String,Object> hMap = mav.getModel();
		HttpServletRequest request=(HttpServletRequest)hMap.get("request");
		
		int boardSize =10;
		String pageNumber = request.getParameter("pageNumber");
		if(pageNumber == null) pageNumber ="1";
		
		int currentPage = Integer.parseInt(pageNumber);
		int startRow = (currentPage - 1) * boardSize +1;
		int endRow = currentPage*boardSize;
		
		int count = dao.getBestCount();
		
		HashMap<String,Integer> rowMap = new HashMap<String,Integer>();
		rowMap.put("startRow", startRow);
		rowMap.put("endRow", endRow);
		
		List<BestBoardDto> list= dao.getBestList(rowMap);
		mav.addObject("boardList",list);
		mav.addObject("count",count);
		mav.addObject("boardSize",boardSize);
		mav.addObject("currentPage",currentPage);
		
		mav.setViewName("bestBoard/list");
	}
	
	/**
	 * @name : read
	 * @date : 2015. 7. 23.
	 * @author : Kim MinSic
	 * @description : Best 게시판의 게시글을 읽는다.
	 */
	@Override
	public void read(ModelAndView mav) {
		Map<String, Object> map=mav.getModel();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String board_num = request.getParameter("boardNum");
		String pageNumber = request.getParameter("pageNumber");
		
		BestBoardDto boardDto = dao.read(board_num);
		dao.readCount(board_num);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		String date= sdf.format(boardDto.getRegister_date());
		
		mav.addObject("date",date);
		mav.addObject("pageNumber",pageNumber);
		mav.addObject("board_num",board_num);
		mav.addObject("boardDto",boardDto);
		
		mav.setViewName("bestBoard/read");
	}

	/**
	 * @name : musicListAppend
	 * @date : 2015. 7. 22.
	 * @author : Kim MinSic
	 * @description : 선택된 게시물 번호와 사용자 아이디를 Database에 저장한다.
	 */
	@Override
	public void musicListAppend(ModelAndView mav) {
		Map<String, Object> map=mav.getModel();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");
		
		String[] musicList = request.getParameter("musicList").split(",");
		String id =request.getParameter("artist_id");
		
		int check = 0;
		
		List<CommonMusicDto> dtoList = new ArrayList<CommonMusicDto>();
		for(int i =0; i<musicList.length; i++){
			HashMap<String, String> hMap = new HashMap<String,String>();
			hMap.put("artist_id",id);
			hMap.put("board_num", musicList[i]);
			int value=0;
			value=dao.musicAppend(hMap);
			System.out.println(value);
			check+= value;
			
			if(value>0){
				if(musicList[i].charAt(0)=='u')
					dtoList.add(dao.getAppendMusic(musicList[i]));
				else if(musicList[i].charAt(0)=='m')
					dtoList.add(dao.getAppendMusicMuse(musicList[i]));
			}
		}
		
		response.setContentType("text/html; charset=UTF-8");
		try {
			PrintWriter out = response.getWriter();
			out.write(check+"곡이 추가되었습니다.<end>");
			for(CommonMusicDto dto : dtoList){
				out.write(dto.getSubject()+ "<cut>" + dto.getArtist_id() + "<cut>" + dto.getFile_path()+"<cut>"+dto.getImage_path()+"<cut>"+dto.getBoard_num()+"<end>");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * @name : getMusicList
	 * @date : 2015. 7. 23.
	 * @author : Kim MinSic
	 * @description : 사용자 아이디에 저장된 음악 게시물 번호를 가져온다.
	 */
	@Override
	public void getMusicList(ModelAndView mav){
		Map<String, Object> map=mav.getModel();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");
		response.setContentType("text/html; charset=UTF-8");
		
		String id =request.getParameter("artist_id");
		
		List<CommonMusicDto> dtoList = dao.getMusicList(id);
//		System.out.println(dtoList.size());
		dtoList.addAll(dao.getMusicListMuse(id));
//		System.out.println(dtoList.size());
		
		try{
			PrintWriter out=response.getWriter();
			for(CommonMusicDto dto : dtoList){
//				out.write(dto.getSubject()+ "\t" + dto.getArtist_id() + "\t" + dto.getFile_path()+"\t"+dto.getImage_path()+"\n");
				out.write(dto.getSubject()+ "<cut>" + dto.getArtist_id() + "<cut>" + dto.getFile_path()+"<cut>"+dto.getImage_path()+"<cut>"+dto.getBoard_num()+"<end>");
//				System.out.println(dto.getSubject()+ "\t" + dto.getArtist_id() + "\t" + dto.getFile_path()+"\t"+dto.getImage_path()+"\t"+dto.getBoard_num());
			}
		}catch(IOException e){
			e.printStackTrace();
		}
	}

	/**
	 * @name : musicListDelete
	 * @date : 2015. 7. 23.
	 * @author : Kim MinSic
	 * @description : 플레이리스트를 Database에서 삭제한다.
	 */
	@Override
	public void musicListDelete(ModelAndView mav) {
		Map<String, Object> map=mav.getModel();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");
		response.setContentType("text/html; charset=UTF-8");
		
		String id =request.getParameter("artist_id");
		String board_num =request.getParameter("boardNum");
		
		HashMap<String, String> hMap = new HashMap<String,String>();
		hMap.put("artist_id",id);
		hMap.put("board_num", board_num);
		
		int check =dao.musicListDelete(hMap);
		
		if(check > 0){
			try {
				PrintWriter out = response.getWriter();
				out.write("해당 곡이 목록에서 삭제되었습니다.");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
