package com.indiScene.museGuest.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.indiScene.museGuest.dao.MuseGuestDaoImpl;

@Component
public class MuseGuestServiceImpl implements MuseGuestService {
	
	@Autowired
	private MuseGuestDaoImpl guestDao;
}
