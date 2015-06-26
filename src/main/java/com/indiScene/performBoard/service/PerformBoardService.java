package com.indiScene.performBoard.service;

import org.springframework.web.servlet.ModelAndView;

/**
 * @name:PerformBoardService
 * @date :2015. 6. 25.
 * @author: 김정승
 * @description : 공연정보 게시판의 작성, 수정, 삭제를 관리하는 class	
 */
public interface PerformBoardService {
	
	/**
	 * @name:boardWrite
	 * @date :2015. 6. 26.
	 * @author: 김정승
	 * @description :	게시글 작성을 위해 group_num, sequence_num, sequence_level을 초기화 하는 method
	 */
	public void boardWrite(ModelAndView mav);
	
	/**
	 * @name:writeOk
	 * @date :2015. 6. 26.
	 * @author: 김정승
	 * @description :	게시글 작성을 위해 dao를 호출하는 method
	 */
	public void writeOk(ModelAndView mav);
	/**
	 * @name:list
	 * @date :2015. 6. 26.
	 * @author: 김정승
	 * @description :	게시글 리스트 반환받기 위해 dao를 호출하는 method
	 */
	public void list(ModelAndView mav);
	
	/**
	 * @name:read
	 * @date :2015. 6. 26.
	 * @author: 김정승
	 * @description :	선택한 게시글의 정보를 반환받는 method
	 */
	public void read(ModelAndView mav);
}
