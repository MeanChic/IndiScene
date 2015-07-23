package com.indiScene.artist.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
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
	
	/**
	 * @name : register
	 * @date : 2015. 6. 26.
	 * @author : 오경선
	 * @description : 회원가입 요청을 받아 Service 클래스에 register메소드를 호출한다.
	 */
	@RequestMapping(value="/artist/register.do", method=RequestMethod.GET)
	public String register(HttpServletRequest request, HttpServletResponse response){
		logger.info("-----Controller artistRegister----------------------");

		return "artist/register";
	}

	/**
	 * @name : register
	 * @date : 2015. 6. 26.
	 * @author : 오경선
	 * @description : 회원가입 정보를 받아 Service 클래스에 registerOk 메소드로 Dto를 보낸다.
	 */
	@RequestMapping(value="/artist/register.do", method=RequestMethod.POST)
	public ModelAndView register(MultipartHttpServletRequest request, HttpServletResponse response, ArtistDto artistDto){
		logger.info("-----Controller artistRegisterOk----------------------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("artistDto",artistDto);
		mav.addObject("request",request);
		artistService.registerOk(mav);
		
		return mav;
	}
	
	/**
	 * @name : idCheck
	 * @date : 2015. 6. 26.
	 * @author : 오경선
	 * @description : ID 중복체크 요청을 받아 Service클래스 idCheck 함수 호출
	 */
	@RequestMapping(value="/artist/idCheck.do", method=RequestMethod.GET)
	public ModelAndView idCheck(HttpServletRequest request, HttpServletResponse response){
		logger.info("-----Controller artistIdCheck----------------------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		artistService.idCheck(mav);
		
		return mav;
	}
	
	/**
	 * @name : nickCheck
	 * @date : 2015. 6. 26.
	 * @author : 오경선
	 * @description : 닉네임 중복체크 요청을 받아 Service클래스 nickCheck 함수 호출
	 */
	@RequestMapping(value="/artist/nicknameCheck.do", method=RequestMethod.GET)
	public ModelAndView nickCheck(HttpServletRequest request, HttpServletResponse response){
		logger.info("-----Controller nicknameCheck----------------------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		artistService.nicknameCheck(mav);
		
		return mav;
	}
	
	/**
	 * @name : updatelogin
	 * @date : 2015. 6. 26.
	 * @author : 오경선
	 * @description : update로그인 페이지를 불러온다.
	 */
	@RequestMapping(value="/artist/updatelogin.do", method=RequestMethod.GET)
	public String updatelogin(HttpServletRequest request, HttpServletResponse response){
		logger.info("-----Controller Update artistLogin----------------------");
		return "artist/updatelogin";
	}
	
	/**
	 * @name : update
	 * @date : 2015. 6. 26.
	 * @author : 오경선
	 * @description : 회원정보 수정 요청을 입력받아 Service클래스 update 함수 호출
	 */
	@RequestMapping(value="/artist/update.do", method=RequestMethod.GET)
	public ModelAndView update(HttpServletRequest request, HttpServletResponse response){
		logger.info("-----Controller artistUpdate----------------------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		artistService.update(mav);
		
		return mav;
	}
	
	/**
	 * @name : update
	 * @date : 2015. 6. 26.
	 * @author : 오경선
	 * @description : 회원 수정 정보를 받아 Service 클래스 updateOk 메소드에 Dto를 보낸다.
	 */
	@RequestMapping(value="/artist/update.do", method=RequestMethod.POST)
	public ModelAndView update(MultipartHttpServletRequest request, HttpServletResponse response, ArtistDto artistDto){
		logger.info("-----Controller artistUpdateOk----------------------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("artistDto",artistDto);
		mav.addObject("request",request);
		artistService.updateOk(mav);
		
		return mav;
	}
	
	/**
	 * @name : delete
	 * @date : 2015. 6. 26.
	 * @author : 오경선
	 * @description : 회원탈퇴 요청을 받아 Service클래스 delete메소드를 호출
	 */
	@RequestMapping(value="/artist/delete.do", method=RequestMethod.GET)
	public String delete(HttpServletRequest request, HttpServletResponse response){
		logger.info("-----Controller artistDelete----------------------");
		return "artist/delete";
	}
	
	/**
	 * @name : delete
	 * @date : 2015. 6. 26.
	 * @author : 오경선
	 * @description : 회원 탈퇴페이지에서 회원 비밀번호를 입력받아 Service클래스 deleteOk 메소드 호출
	 */
	@RequestMapping(value="/artist/delete.do", method=RequestMethod.POST)
	public ModelAndView delete(HttpServletRequest request, HttpServletResponse response, ArtistDto artistDto){
		logger.info("-----Controller artistDeleteOk----------------------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		artistService.deleteOk(mav);
		
		return mav;
	}
	
	/**
	 * @name : login
	 * @date : 2015. 6. 26.
	 * @author : 오경선
	 * @description : 로그인 페이지를 불러온다.
	 */
	@RequestMapping(value="/artist/login.do", method=RequestMethod.GET)
	public String login(HttpServletRequest request, HttpServletResponse response){
		logger.info("-----Controller artistLogin----------------------");
		return "artist/login";
	}
	
	/**
	 * @name : login
	 * @date : 2015. 6. 26.
	 * @author : 오경선
	 * @description : 로그인 요청을 받아 Service 클래스 login 메소드 호출
	 */
	@RequestMapping(value="/artist/login.do", method=RequestMethod.POST)
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response, ArtistDto artistDto){
		logger.info("-----Controller artistLoginOk----------------------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		artistService.loginOk(mav);
		
		return mav;
	}
	
	/**
	 * @name : logout
	 * @date : 2015. 6. 26.
	 * @author : 오경선
	 * @description : 로그아웃 요청을 받아 Service 클래스 logout 메소드 호출
	 */
	@RequestMapping(value="/artist/logout.do", method=RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response){
		logger.info("-----Controller artistLogout----------------------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		artistService.logout(mav);
		
		return mav;
	}
	
	/**
	 * @name : Zipcode
	 * @date : 2015. 6. 26.
	 * @author : 오경선
	 * @description : 우편번호 검색창을 열어준다.
	 */
	@RequestMapping(value="/artist/zipcode.do", method=RequestMethod.GET)
		public String Zipcode(HttpServletRequest request, HttpServletResponse response){
		logger.info("-----Controller Zipcode page----------------------");
		return "artist/zipcode";
	}
	
	/**
	 * @name : Zipcode
	 * @date : 2015. 6. 26.
	 * @author : 오경선
	 * @description : 주소의 '동' 정보를 입력받아 Service 클래스의 findZipcode메소드 호출
	 */
	@RequestMapping(value="/artist/zipcode.do", method=RequestMethod.POST)
	public ModelAndView Zipcode(HttpServletRequest request, HttpServletResponse response, String dong){
		logger.info("-----Controller find Zipcode----------------------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		artistService.findZipcode(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/mainPage.do", method=RequestMethod.GET)
	public ModelAndView moveToMain(HttpServletRequest request, HttpServletResponse response, String dong){
		logger.info("-----MoveToMainPage----------------------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("response",response);
		artistService.moveToMain(mav);
		
		return null;
	}
}
