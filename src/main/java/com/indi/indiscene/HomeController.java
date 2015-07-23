package com.indi.indiscene;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.indiScene.commonIO.service.CommonIOService;
import com.indiScene.performBoard.dao.PerformBoardDaoImpl;
import com.indiScene.performBoard.dto.PerformBoardDto;
import com.indiScene.placeBoard.dao.PlaceBoardDaoImpl;
import com.indiScene.placeBoard.dto.PlaceBoardDto;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private PerformBoardDaoImpl performdao;
	
	@Autowired
	private CommonIOService commonIOService;
	
	@Autowired
	private PlaceBoardDaoImpl placedao;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value="/KOSTA")
	public String mainPage(){
		return "Main";
	}
	
	@RequestMapping(value="/perform/enter.do", method=RequestMethod.GET)
	public ModelAndView enterBoard(HttpServletRequest request, HttpServletResponse response){
		logger.info("MarketBoardWrite------------------------------");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		List<String> performImageList = null;
		List<String> placeImageList = null;
		
		List<PerformBoardDto> performList = performdao.getMarketList(0, 6);
		List<PlaceBoardDto> placeList = placedao.getMarketList(0, 6);
		performImageList=commonIOService.mainImageFind(performList); 
		placeImageList=commonIOService.mainImageFind(placeList); 
		
		mav.addObject("performList", performList);
		mav.addObject("placeList", placeList);
		mav.addObject("performImageList", performImageList);
		mav.addObject("placeImageList", placeImageList);
		mav.setViewName("homepage/performplace");
		return mav;
	}
	
	@RequestMapping(value="/myMusic/uploadMusic.do",method=RequestMethod.GET)
	public ModelAndView myUploadMusic (HttpServletRequest request){
		logger.info("MyMusic Upload Music------------------------------");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		
		commonIOService.myUploadMusic(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/myMusic/likeMusic.do",method=RequestMethod.GET)
	public ModelAndView myLikeMusic(HttpServletRequest request){
		logger.info("MyMusic Upload Music------------------------------");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		
		commonIOService.myLikeMusic(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/myMusic/collaboMusic.do",method=RequestMethod.GET)
	public ModelAndView myCollaboMusic (HttpServletRequest request){
		logger.info("MyMusic Upload Music------------------------------");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		
		commonIOService.myCollaboMusic(mav);
		
		return mav;
	}
}
