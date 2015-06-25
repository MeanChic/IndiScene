package com.indiScene.artist.service;

import org.springframework.web.servlet.ModelAndView;

public interface ArtistService {
	public void test(ModelAndView mav);
	public void register(ModelAndView mav);
	public void registerOk(ModelAndView mav);
	public void idCheck(ModelAndView mav);
	public void nickCheck(ModelAndView mav);
	public void update(ModelAndView mav);
	public void updateOk(ModelAndView mav);
	public void delete(ModelAndView mav);
	public void deleteOk(ModelAndView mav);
	public void login(ModelAndView mav);
	public void logout(ModelAndView mav);
	public void findZipcode(ModelAndView mav, String dong);
}
