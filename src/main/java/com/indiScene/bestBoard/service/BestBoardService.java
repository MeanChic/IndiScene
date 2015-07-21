package com.indiScene.bestBoard.service;

import org.springframework.web.servlet.ModelAndView;

public interface BestBoardService {
	public void bestList(ModelAndView mav);
	public void read(ModelAndView mav);
	public void musicListAppend(ModelAndView mav);
	public void getMusicList(ModelAndView mav);
	public void musicListDelete(ModelAndView mav);
}
