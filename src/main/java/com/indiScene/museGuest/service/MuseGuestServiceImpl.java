package com.indiScene.museGuest.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.indiScene.museGuest.dao.MuseGuestDaoImpl;
import com.indiScene.museGuest.dto.MuseGuestDto;

@Component
public class MuseGuestServiceImpl implements MuseGuestService {
	
	@Autowired
	private MuseGuestDaoImpl guestDao;
	private final Logger logger = Logger.getLogger(this.getClass().getName());
	
	public void write(ModelAndView mav){
		Map<String, Object>	map = mav.getModelMap();
		MuseGuestDto guestDto = (MuseGuestDto) map.get("guestDto");
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");
		
		guestDto.setGuest_date(new Date());
		
		int check = guestDao.write(guestDto);
		//logger.info("-- check : " + check);
		
		try {
			PrintWriter out = response.getWriter();
			out.print(check);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public ModelAndView getList(ModelAndView mav){
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		int count = 0;
		String muse_name = request.getParameter("muse_name");
		String pagenum = request.getParameter("pagenum");
		if(pagenum == null)pagenum = "1";
		int boardnum = 5;
		count = guestDao.getCount(muse_name);
		
		
		//logger.info("-- count : " + count + "pagenum : " + pagenum);
		int startpage = boardnum * (Integer.parseInt(pagenum)-1);
		int endpage = boardnum * Integer.parseInt(pagenum);
		if(endpage > count) endpage=count;
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("startpage", startpage);
		hmap.put("endpage", endpage);
		hmap.put("muse_name", muse_name);
		List<MuseGuestDto> list = guestDao.getList(hmap);
		response.setCharacterEncoding("utf-8");
		
		//logger.info("-- pagenum : " + pagenum);
		
		if(pagenum == "1"){
			
			//logger.info("-- pagenum 1 : " + pagenum);
			//count = guestDao.getCount(muse_name);
			
			
			
			mav.addObject("muse_name", muse_name);
			mav.addObject("count", count);
			mav.addObject("list", list);
			mav.addObject("listsize", list.size());
			mav.addObject("boardnum", boardnum);
			mav.addObject("pagenum", pagenum);
			mav.setViewName("museGuest/guest");
			return mav;
		}else{
			try {
				PrintWriter out = response.getWriter();
				
				for(int i = 0; i < list.size(); i++){
					MuseGuestDto guest = list.get(i);
					out.print(guest.getGuest_num() +","+guest.getArtist_id() + "," + guest.getGuest_date() + "," + guest.getMuse_name() +","+guest.getGuest_content() + "/" );
					
					/*String[] k = guest.getGuest_content().split("/");
					k.*/
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return null;
		}
	}
	
	public void update(ModelAndView mav){
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		String guest_num = request.getParameter("guest_num");
		String guest_content = request.getParameter("guest_content");
		
		//logger.info("-- guest num + guest_content : " + guest_num + " ,, " + guest_content);
		int check = guestDao.update(guest_num, guest_content);
		logger.info("-- guestupdate check : " + check );
		try {
			PrintWriter out = response.getWriter();
			out.print(check);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void delete(ModelAndView mav){
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		String guest_num = request.getParameter("guest_num");
		
		logger.info("-- guest num : " + guest_num);
		int check = guestDao.delete(guest_num);
		logger.info("-- g check : " + check );
		try {
			PrintWriter out = response.getWriter();
			out.print(check);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
