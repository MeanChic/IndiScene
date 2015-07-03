package com.indiScene.museGuest.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MuseGuestDaoImpl implements MuseGuestDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
}
