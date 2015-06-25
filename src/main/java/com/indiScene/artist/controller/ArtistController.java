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
	
	/* Test
	@RequestMapping(value="/artist/test.do", method=RequestMethod.GET)
	public ModelAndView test(HttpServletRequest req, HttpServletResponse resp, ModelAndView mav){
		logger.info("---------test---------");
		artistService.test(mav);
		return mav;
	}
	*/
	
//	회원가입
	@RequestMapping(value="/artist/register.do", method=RequestMethod.GET)
	public String register(HttpServletRequest request, HttpServletResponse response){
		logger.info("artistRegister----------------------");

		return "artist/register";
	}
	@RequestMapping(value="/artist/register.do", method=RequestMethod.POST)
	public ModelAndView register(HttpServletRequest request, HttpServletResponse response, ArtistDto artistDto){
		logger.info("artistRegisterOk----------------------");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("ArtistDto",artistDto);
		artistService.registerOk(mav);
		
		return mav;
	}
	
//	아이디 중복체크
	@RequestMapping(value="/artist/idCheck.do", method=RequestMethod.GET)
	public ModelAndView idCheck(HttpServletRequest request, HttpServletResponse response){
		logger.info("artistIdCheck----------------------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		artistService.idCheck(mav);
		
		return mav;
	}
	
//	닉네임 중복체크
	@RequestMapping(value="/artist/nicknameCheck.do", method=RequestMethod.GET)
	public ModelAndView nickCheck(HttpServletRequest request, HttpServletResponse response){
		logger.info("nicknameCheck----------------------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		artistService.nicknameCheck(mav);
		
		return mav;
	}
	
//	회원정보 수정
	@RequestMapping(value="/artist/update.do", method=RequestMethod.GET)
	public ModelAndView update(HttpServletRequest request, HttpServletResponse response){
		logger.info("artistUpdate----------------------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		artistService.update(mav);
		
		return mav;
	}
	@RequestMapping(value="/artist/update.do", method=RequestMethod.POST)
	public ModelAndView update(HttpServletRequest request, HttpServletResponse response, ArtistDto artistDto){
		logger.info("artistUpdateOk----------------------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("artistDto",artistDto);
		artistService.updateOk(mav);
		
		return mav;
	}
	
//	회원탈퇴
	@RequestMapping(value="/artist/delete.do", method=RequestMethod.GET)
	public ModelAndView delete(HttpServletRequest request, HttpServletResponse response){
		logger.info("artistDelete----------------------");
		
		return null;
	}
	@RequestMapping(value="/artist/delete.do", method=RequestMethod.POST)
	public ModelAndView delete(HttpServletRequest request, HttpServletResponse response, ArtistDto artistDto){
		logger.info("artistDeleteOk----------------------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		artistService.delete(mav);
		
		return mav;
	}
	
//	로그인
	@RequestMapping(value="/artist/login.do", method=RequestMethod.GET)
	public String login(HttpServletRequest request, HttpServletResponse response){
		logger.info("artistLogin----------------------");
		return "artist/login";
	}
	@RequestMapping(value="/artist/login.do", method=RequestMethod.POST)
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response, ArtistDto artistDto){
		logger.info("artistLoginOk----------------------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		artistService.login(mav);
		
		return mav;
	}
	
//	로그아웃
	@RequestMapping(value="/artist/logout.do", method=RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response){
		logger.info("artistLogout----------------------");
		
		return null;
	}
	
//	우편번호
	@RequestMapping(value="/artist/Zipcode.do", method=RequestMethod.GET)
	public ModelAndView Zipcode(HttpServletRequest request, HttpServletResponse response){
		return null;
	}
	@RequestMapping(value="/artist/Zipcode.do", method=RequestMethod.POST)
	public ModelAndView Zipcode(HttpServletRequest request, HttpServletResponse response, String dong){
		logger.info("artistZipcode----------------------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		artistService.findZipcode(mav, dong);
		
		return mav;
	}
}
