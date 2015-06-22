package com.indiScene.artist.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.indiScene.artist.dto.ArtistDto;
import com.indiScene.artist.service.ArtistService;

@Controller
public class ArtistController {
	private final Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private ArtistService artistService;
	
	@RequestMapping(value="/artist/test.do", method=RequestMethod.GET)
	public ModelAndView test(HttpServletRequest req, HttpServletResponse resp, ModelAndView mav){
		logger.info("---------test---------");
		artistService.test(mav);
		return mav;
	}
//	회원가입
	@RequestMapping(value="/artist/register.do", method=RequestMethod.GET)
	public String register(HttpServletRequest request){
		logger.info("artistRegister----------------------");

		return "artist/register";
	}
	@RequestMapping(value="/artist/register.do", method=RequestMethod.POST)
	public ModelAndView register(HttpServletRequest request, ArtistDto artistDto){
		logger.info("artistRegisterOk----------------------");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("memberDto",artistDto);
		artistService.artistRegisterOk(mav);
		
		return mav;
	}
/*
//	아이디 중복 체크
	@RequestMapping(value="/artist/idCheck.do", method=RequestMethod.GET)
	public ModelAndView idCheck(HttpServletRequest request){
		
	}
	@RequestMapping(value="/artist/idCheck.do", method=RequestMethod.POST)
	public ModelAndView nickCheck(HttpServletRequest request){
		
	}
//	정보수정
	@RequestMapping(value="/artist/update.do", method=RequestMethod.GET)
	public ModelAndView update(HttpServletRequest request){
		
	}
	@RequestMapping(value="/artist/update.do", method=RequestMethod.POST)
	public ModelAndView update(HttpServletRequest request, ArtistDto artistDto){
		
	}
//	삭제
	@RequestMapping(value="/artist/delete.do", method=RequestMethod.GET)
	public ModelAndView delete(HttpServletRequest request){
		
	}
	@RequestMapping(value="/artist/delete.do", method=RequestMethod.POST)
	public ModelAndView delete(HttpServletRequest request, ArtistDto artistDto){
		
	}
//	로그인
	@RequestMapping(value="/artist/login.do", method=RequestMethod.GET)
	public ModelAndView login(HttpServletRequest request){
		
	}
//	로그아웃
	@RequestMapping(value="/artist/logout.do", method=RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request){
		
	}
//	집주소
	@RequestMapping(value="/artist/Zipcode.do", method=RequestMethod.GET)
	public ModelAndView Zipcode(HttpServletRequest request){
		
	}
	@RequestMapping(value="/artist/Zipcode.do", method=RequestMethod.POST)
	public ModelAndView Zipcode(HttpServletRequest request, String dong){
		
	}
	*/
}
