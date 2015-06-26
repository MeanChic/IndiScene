package com.indiScene.performBoard.dao;

import java.util.HashMap;
import java.util.List;

import com.indiScene.performBoard.dto.PerformBoardDto;

/**
 * @name:PerformBoardDao
 * @date :2015. 6. 25.
 * @author: 김정승
 * @description :	공연 정보 게시판의 작성, 수정, 삭제를 하기위한 interface
 */
public interface PerformBoardDao {
	
	/**
	 * @name:boardGroupNumberMax
	 * @date :2015. 6. 26.
	 * @author: 김정승
	 * @description :	기존 개시글의 가장큰 group number를 검색하는 method
	 */
	public int boardGroupNumberMax();	
	
	/**
	 * @name:boardGroupNumberUpdate
	 * @date :2015. 6. 26.
	 * @author: 김정승
	 * @description :	자신의 group number와 일치하고 sequence넘버가 자신보다 큰 레코드의 sequence 값을 update하는 method
	 */
	public int boardGroupNumberUpdate(HashMap<String, Integer> hMap);
	
	/**
	 * @name:insert
	 * @date :2015. 6. 26.
	 * @author: 김정승
	 * @description :	공연 정보 게시판에 게시글을 DB에 저장하는 method
	 */
	public int insert(PerformBoardDto boardDto);
	
	/**
	 * @name:getBoardCount
	 * @date :2015. 6. 26.
	 * @author: 김정승
	 * @description :	총 게시글수를 반환하는 method
	 */
	
	public int getBoardCount();
	
	/**
	 * @name:getBoardList
	 * @date :2015. 6. 26.
	 * @author: 김정승
	 * @description :	startRow부터 endRow까지 게시글의 정보를 반환하는 method
	 */
	public List<PerformBoardDto> getBoardList(int startRow, int endRow);
	
	/**
	 * @name:read
	 * @date :2015. 6. 26.
	 * @author: 김정승
	 * @description :	board_number와 일치하는 게시글의 DTO를 반환하는 method
	 */
	public PerformBoardDto read(String board_num);
}
